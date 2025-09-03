BEGIN {
  LANGCODES_ZIP = "script.module.langcodes/script.module.langcodes"
  LANGCODES_ZIP_VERSION = "-3.4.0~alpha.zip"
  REPO_ZIP = "repo.fbacher/repo.fbacher"
  REPO_ZIP_VERSION = "-1.0.0.zip"
  TTS_ZIP = "service.kodi.tts/service.kodi.tts"
  TTS_ZIP_VERSION = "-2.0.7~alpha.zip"

  if (SITE == "github")
   {
      URL_PREFIX = "https://fbacher.github.io/repository.fbacher"
      URL_ZIPS = URL_PREFIX "/blob/master/repo/zips"
   }
  else if (SITE == "smeagol")
     {
      URL_PREFIX = "http://smeagol/repo"
      URL_ZIPS = URL_PREFIX "/repo/zips"
      }
  else if (SITE == "feuerbacher")
     {
      URL_PREFIX = "https://feuerbacher.us/repo"
      URL_ZIPS = URL_PREFIX "/repo/zips"
      }
  else if (SITE == "localhost")
     {
      URL_PREFIX = "http://localhost:4000/repo"
      URL_ZIPS = URL_PREFIX "/repo/zips"
      }

  {
  URL_REPO = URL_PREFIX "/repo"
  REPO_TTS = URL_REPO "/service.kodi.tts"
  REPO_LANGCODES = URL_REPO "/script.module.langcodes"

  INSTALL_WINDOWS = URL_PREFIX "/INSTALL_WINDOWS"
  INSTALL_LINUX = URL_PREFIX "/INSTALL_LINUX"
  KEYBOARD_SHORTCUTS = URL_PREFIX "/KEYBOARD_SHORTCUTS.html"
  KEYMAP_TOOL = URL_PREFIX "/KEYMAP_TOOL.html"
  CONFIG_DIALOG = URL_PREFIX "/CONFIG_DIALOG.html"
  INSTALL_WINDOWS = URL_PREFIX "/INSTALL_WINDOWS.html"
  INSTALL_LINUX = URL_PREFIX "/INSTALL_LINUX.html"
  INSTALL_WIN_PROG = URL_PREFIX "/INSTALL_WINDOWS_PROG.html"
  INSTALL_LINX_PROG = URL_PREFIX "/INSTALL_LINUX_PROG.html"
  URL_README_INSTALL = URL_PREFIX "/README_INSTALL.html"
  MANUAL_INSTALLATION = URL_PREFIX "/MANUAL_INSTALLATION.html"
  KODI_TTS_README = REPO_TTS "/README.html"
  LANGCODES_README = REPO_LANGCODES "/README.html"
  RELEASE_NOTES = URL_PREFIX "/RELEASE_NOTES.html"
  KODI_TTS_LICENSE = REPO_TTS "/LICENSE.txt"
  LANGCODES_LICENSE = REPO_LANGCODES "/LICENSE.txt"
  CONTENTS = URL_PREFIX "/CONTENTS.html"
  REPO_README = URL_PREFIX "/README.html"
  README_BUILD = URL_PREFIX "/README_BUILD.html"
  README_FIRST = URL_PREFIX "/README_FIRST.html"

  URL_LANGCODES_ZIP = URL_ZIPS "/" LANGCODES_ZIP LANGCODES_ZIP_VERSION
  URL_TTS_ZIP = URL_ZIPS "/" TTS_ZIP TTS_ZIP_VERSION
  URL_REPO_ZIP = URL_ZIPS "/" REPO_ZIP REPO_ZIP_VERSION

  }
}

END {}
/URL_PREFIX/ {sub("URL_PREFIX", URL_PREFIX); print($0); next}
/URL_LANGCODES_ZIP/ {sub("URL_LANGCODES_ZIP", URL_LANGCODES_ZIP); print($0); next}
/URL_REPO_ZIP/ {sub("URL_REPO_ZIP", URL_REPO_ZIP); print($0); next}
/URL_TTS_ZIP/ {sub("URL_TTS_ZIP", URL_TTS_ZIP); print($0); next}

/INSTALL_WIN_PROG/ {sub("INSTALL_WIN_PROG", INSTALL_WIN_PROG); print($0); next}
/INSTALL_LINX_PROG/ {sub("INSTALL_LINX_PROG", INSTALL_LINX_PROG); print($0); next}
/INSTALL_WINDOWS/ {sub("INSTALL_WINDOWS", INSTALL_WINDOWS); print($0); next}
/INSTALL_LINUX/ {sub("INSTALL_LINUX", INSTALL_LINUX); print($0); next}
/URL_README_INSTALL/ {sub("URL_README_INSTALL", URL_README_INSTALL); print($0); next}
/MANUAL_INSTALLATION/ {sub("MANUAL_INSTALLATION", MANUAL_INSTALLATION); print($0); next}
/RELEASE_NOTES/ {sub("RELEASE_NOTES", RELEASE_NOTES); print($0); next}
/CONTENTS/ {sub("CONTENTS", CONTENTS); print($0); next;}
/REPO_README/ {sub("REPO_README", REPO_README); print($0); next}
/README_BUILD/ {sub("README_BUILD", README_BUILD); print($0); next}
/KODI_TTS_LICENSE/ {sub("KODI_TTS_LICENSE", KODI_TTS_LICENSE); print($0); next}
/LANGCODES_LICENSE/ {sub("LANGCODES_LICENSE", LANGCODES_LICENSE); print($0); next}
/README_FIRST/ {sub("README_FIRST", README_FIRST); print($0); next}
/KODI_TTS_README/ {sub("KODI_TTS_README", KODI_TTS_README); print($0); next}
/LANGCODES_README/ {sub("LANGCODES_README", LANGCODES_README); print($0); next}


/CONFIG_DIALOG/ {sub("CONFIG_DIALOG", CONFIG_DIALOG); print($0); next;}
/KEYBOARD_SHORTCUTS/ {sub("KEYBOARD_SHORTCUTS", KEYBOARD_SHORTCUTS); print($0); next;}
/KEYMAP_TOOL/ {sub("KEYMAP_TOOL", KEYMAP_TOOL); print($0); next;}


{print($0); next;}
