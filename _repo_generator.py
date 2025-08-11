# coding=utf-8
"""
    Put this script in the root folder of your repo and it will
    zip up all addon folders, create a new zip in your zips folder
    and then update the sha256 and addons.xml file
"""

import hashlib
import os
import shutil
import sys
import zipfile
from pathlib import Path
from typing import List

from xml.etree import ElementTree

SCRIPT_VERSION = 5
KODI_VERSIONS = ["krypton", "leia", "matrix", "nexus", "repo"]
IGNORE = [
    ".git",
    ".github",
    ".gitignore",
    ".DS_Store",
    "thumbs.db",
    ".idea",
    "venv",
]
_COLOR_ESCAPE = "\x1b[{}m"
_COLORS = {
    "black": "30",
    "red": "31",
    "green": "4;32",
    "yellow": "3;33",
    "blue": "34",
    "magenta": "35",
    "cyan": "1;36",
    "grey": "37",
    "endc": "0",
}


def _setup_colors():
    """
    Return True if the running system's terminal supports color,
    and False otherwise.
    """

    def vt_codes_enabled_in_windows_registry():
        """
        Check the Windows registry to see if VT code handling has been enabled by default.
        """
        try:
            import winreg
        except:
            return False
        else:
            reg_key = winreg.OpenKey(
                winreg.HKEY_CURRENT_USER, "Console", access=winreg.KEY_ALL_ACCESS
            )
            try:
                reg_key_value, _ = winreg.QueryValueEx(reg_key, "VirtualTerminalLevel")
            except FileNotFoundError:
                try:
                    winreg.SetValueEx(
                        reg_key, "VirtualTerminalLevel", 0,
                            winreg.KEY_DWORD, 1
                    )
                except:
                    return False
                else:
                    reg_key_value, _ = winreg.QueryValueEx(
                        reg_key, "VirtualTerminalLevel"
                    )
            else:
                return reg_key_value == 1

    def is_a_tty():
        return hasattr(sys.stdout, "isatty") and sys.stdout.isatty()

    def legacy_support():
        console = 0
        color = 0
        if sys.platform in ["linux", "linux2", "darwin"]:
            pass
        elif sys.platform == "win32":
            color = os.system("color")

            from ctypes import windll

            k = windll.kernel32
            console = k.SetConsoleMode(k.GetStdHandle(-11), 7)

        return any([color == 1, console == 1])

    return any(
        [
            is_a_tty(),
            sys.platform != "win32",
            "ANSICON" in os.environ,
            "WT_SESSION" in os.environ,
            os.environ.get("TERM_PROGRAM") == "vscode",
            vt_codes_enabled_in_windows_registry(),
            legacy_support(),
        ]
    )


_SUPPORTS_COLOR = _setup_colors()


def color_text(text, color):
    """
    Return an ANSI-colored string, if supported.
    """

    return (
        '{}{}{}'.format(
            _COLOR_ESCAPE.format(_COLORS[color]),
            text,
            _COLOR_ESCAPE.format(_COLORS["endc"]),
        )
        if _SUPPORTS_COLOR
        else text
    )


def convert_bytes(num):
    """
    this function will convert bytes to MB.... GB... etc
    """
    for x in ['bytes', 'KB', 'MB', 'GB', 'TB']:
        if num < 1024.0:
            return "%3.1f %s" % (num, x)
        num /= 1024.0


class Generator:
    """
    Generates a new addons.xml file from each addons addon.xml file
    and a new addons.xml.sha256 hash file. Must be run from the root of
    the checked-out repo.
    """

    def __init__(self, release: Path):
        self.release_path: Path = release
        self.docs_path: Path = self.release_path
        self.zips_path: Path = self.docs_path / "zips"
        addons_xml_path: Path = self.zips_path / "addons.xml"
        sha256_path: Path = self.zips_path / "addons.xml.md5"

        self.zips_path.mkdir(parents=True, exist_ok=True)

        self._remove_binaries()

        if self._generate_addons_file(addons_xml_path):
            print(
                "Successfully updated {}".format(color_text(addons_xml_path, 'yellow'))
            )

            if self._generate_sha256_file(addons_xml_path, sha256_path):
                print(f"Successfully updated {color_text(sha256_path, 'yellow')}")

    def _remove_binaries(self):
        """
        Removes any and all compiled Python files before operations.
        """

        for parent, dirnames, filenames in self.release_path.walk():
            parent: Path
            dirnames: List[str]
            filenames: List[str]
            for fn in filenames:
                if fn.lower().endswith(".pyo") or fn.lower().endswith(".pyc"):
                    compiled_path: Path = parent / fn
                    try:
                        compiled_path.unlink(missing_ok=True)
                        print(
                            f'Removed compiled python file: '
                            '{color_text(compiled_path, "green")}')
                    except:
                        print(
                            f'Failed to remove compiled python file: '
                            '{color_text(compiled_path, "red")}')
            for dirname in dirnames:
                dirname: str
                if "pycache" in dirname.lower():
                    compiled: Path = parent / dirname
                    try:
                        shutil.rmtree(compiled)
                        print(
                            "Removed __pycache__ cache folder: {}".format(
                                color_text(compiled, 'green')
                            )
                        )
                    except:
                        print(
                            "Failed to remove __pycache__ cache folder:  {}".format(
                                color_text(compiled, 'red')
                            )
                        )

    def _create_zip(self, folder: str, addon_id: str, version: str):
        """
        Creates a zip file in the zips directory for the given addon.
        """
        addon_folder: Path = self.release_path / folder
        zip_folder: Path = self.zips_path / addon_id
        zip_folder.mkdir(parents=True, exist_ok=True)

        final_zip: Path = zip_folder / f"{addon_id}-{version}.zip"
        if not final_zip.exists():
            zip = zipfile.ZipFile(final_zip, "w", compression=zipfile.ZIP_DEFLATED)
            root_len: int = len(str(addon_folder.absolute().parent))

            for root, dirs, files in addon_folder.walk():
                root: Path
                dirs: List[str]
                files: List[str]
                # remove any unneeded artifacts
                for i in IGNORE:
                    i: str
                    if i in dirs:
                        try:
                            dirs.remove(i)
                        except:
                            pass
                    for f in files:
                        if f.startswith(i):
                            try:
                                files.remove(f)
                            except:
                                pass

                # archive_root is probably the same as zip_folder
                archive_root: Path = Path(str(root.absolute())[root_len:])

                for f in files:
                    f: str
                    fullpath: Path = root / f
                    archive_path: Path = archive_root / f
                    zip.write(fullpath, str(archive_path), zipfile.ZIP_DEFLATED)

            zip.close()
            size = convert_bytes(os.path.getsize(final_zip))
            print(f"Zip created for {color_text(addon_id, 'cyan')} ("
                  f"{color_text(version, 'green')}) - "
                  f"{color_text(size, 'yellow')}")

    def _copy_meta_files(self, addon_id: str, addon_folder: Path):
        """
        Copy the addon.xml and relevant art files into the relevant folders in the repository.
        """

        tree = ElementTree.parse(self.release_path / addon_id / "addon.xml")
        root = tree.getroot()

        copyfiles = ["addon.xml"]
        for ext in root.findall("extension"):
            if ext.get("point") in ["xbmc.addon.metadata", "kodi.addon.metadata"]:
                assets = ext.find("assets")
                if assets is None:
                    continue
                for art in [a for a in assets if a.text]:
                    copyfiles.append(os.path.normpath(art.text))

        src_folder: Path = self.release_path / addon_id
        for file in copyfiles:
            file: str
            addon_path: Path = src_folder / file
            if not addon_path.exists():
                continue

            zips_path: Path = addon_folder / file
            asset_path: Path = zips_path.parent
            asset_path.mkdir(parents=True, exist_ok=True)

            shutil.copy(addon_path, zips_path)

    def _generate_addons_file(self, addons_xml_path: Path):
        """
        Generates a zip for each found addon, and updates the addons.xml file accordingly.
        """
        if not addons_xml_path.exists():
            addons_root = ElementTree.Element('addons')
            addons_xml = ElementTree.ElementTree(addons_root)
        else:
            addons_xml = ElementTree.parse(addons_xml_path)
            addons_root = addons_xml.getroot()

        folders = [
            i
            for i in os.listdir(self.release_path)
            if os.path.isdir(os.path.join(self.release_path, i))
            and i != "zips"
            and not i.startswith(".")
            and os.path.exists(os.path.join(self.release_path, i, "addon.xml"))
        ]

        addon_xpath = "addon[@id='{}']"
        changed = False
        for addon in folders:
            try:
                addon_xml_path: Path = self.release_path / addon / "addon.xml"
                addon_xml = ElementTree.parse(str(addon_xml_path))
                addon_root = addon_xml.getroot()
                id = addon_root.get('id')
                print(f'addon_root.get(id): {id}')
                version = addon_root.get('version')

                updated: bool = False
                addon_entry = addons_root.find(addon_xpath.format(id))
                if addon_entry is not None and addon_entry.get('version') != version:
                    index = addons_root.findall('addon').index(addon_entry)
                    addons_root.remove(addon_entry)
                    addons_root.insert(index, addon_root)
                    updated = True
                    changed = True
                elif addon_entry is None:
                    addons_root.append(addon_root)
                    updated = True
                    changed = True

                if updated:
                    # Create the zip files
                    self._create_zip(addon, id, version)
                    self._copy_meta_files(addon, self.zips_path / id)
            except Exception as e:
                print(
                    f"Excluding {color_text(addon, 'yellow')}: {color_text(e, 'red')}")

        if changed:
            addons_root[:] = sorted(addons_root, key=lambda addon: addon.get('id'))
            try:
                addons_xml.write(
                    str(addons_xml_path), encoding="utf-8", xml_declaration=True
                )

                return changed
            except Exception as e:
                print(f"An error occurred updating "
                      f"{color_text(addons_xml_path, 'yellow')}!\n"
                      f"{color_text(e, 'red')}")

    def _generate_sha256_file(self, addons_xml_path: Path, sha256_path: Path):
        """
        Generates a new addons.xml.sha256 file.
        """
        try:
            with addons_xml_path.open("r", encoding="utf-8") as f:
                # m = hashlib.sha256(f.read().encode("utf-8")).hexdigest()
                m = hashlib.md5(f.read().encode("utf-8")).hexdigest()
                self._save_file(m, file=sha256_path)

            return True
        except Exception as e:
            print(f"An error occurred updating {color_text(sha256_path, 'yellow')}!\n"
                  f"{color_text(e, 'red')}")

    def _save_file(self, data, file: Path):
        """
        Saves a file.
        """
        try:
            with file.open("w") as f:
                f.write(data)
        except Exception as e:
            print(f"An error occurred saving {color_text(file, 'yellow')}!\n"
                  f"{color_text(e, 'red')}")


if __name__ == "__main__":
    for release in [r for r in KODI_VERSIONS if os.path.exists(r)]:
        Generator(Path(release))
