#!/usr/bin/sh
#
# This script is responsible for substituting values in markdown files. The substitute
# values are mostly to update PATHS. The PATHS can be different for different SITES.
# github also changes the paths a bit. Some github files go into 'blob' directories,
# some have other differences.
#
# This script is run AFTER this project has had the 'repo files' updated to contain the
# appropriate Releases of the addons making up this repository. See build_repos.sh

current_dir=`pwd`
set -x
# SITE='feuerbacher'
#SITE='github'
SITE='smeagol'
# SITE="localhost"

mkdir -p repo/repo.fbacher
mkdir -p repo/zips
cd repo/repo.fbacher
cd -
cd repo/zips
rm -rf *
python3 ../../create_repository.py ../repo.fbacher  ../service.kodi.tts ../script.module.langcodes
python3 ../../create_repository.py --compressed ../repo.fbacher  ../service.kodi.tts ../script.module.langcodes
cd "${current_dir}"

awk -v SITE="${SITE}" -f addon.awk repo/repo.fbacher/addon_proto.xml  >repo/repo.fbacher/addon.xml
#  awk -v SITE="${SITE}" -f addon.awk repo/service.kodi.tts/CONFIG_DIALOG.mdp  >repo/service.kodi.tts/CONFIG_DIALOG.md

awk -v SITE="${SITE}" -f addon.awk repo/script.module.langcodes/README.mdp  >repo/script.module.langcodes/README.md
awk -v SITE="${SITE}" -f addon.awk INSTALL_WINDOWS.mdp >INSTALL_WINDOWS.md
awk -v SITE="${SITE}" -f addon.awk INSTALL_LINUX.mdp >INSTALL_LINUX.md
awk -v SITE="${SITE}" -f addon.awk INSTALL_WINDOWS_PROG.mdp > INSTALL_WINDOWS_PROG.md
awk -v SITE="${SITE}" -f addon.awk INSTALL_LINUX_PROG.mdp > INSTALL_LINUX_PROG.md
awk -v SITE="${SITE}" -f addon.awk README_INSTALL.mdp > README_INSTALL.md
awk -v SITE="${SITE}" -f addon.awk README_BUILD.mdp > README_BUILD.md

awk -v SITE="${SITE}" -f addon.awk MANUAL_INSTALLATION.mdp > MANUAL_INSTALLATION.md
awk -v SITE="${SITE}" -f addon.awk CONTENTS.mdp > CONTENTS.md
awk -v SITE="${SITE}" -f addon.awk RELEASE_NOTES.mdp > RELEASE_NOTES.md
awk -v SITE="${SITE}" -f addon.awk CONFIG_DIALOG.mdp > CONFIG_DIALOG.md

# awk -v SITE="${SITE}" -f addon.awk index.mdp >index.md
awk -v SITE="${SITE}" -f addon.awk README.mdp >README.md
awk -v SITE="${SITE}" -f addon.awk README_FIRST.mdp >README_FIRST.md
cp README_FIRST.md index.md
awk -v SITE="${SITE}" -f addon.awk KEYBOARD_SHORTCUTS.mdp >KEYBOARD_SHORTCUTS.md
awk -v SITE="${SITE}" -f addon.awk KEYMAP_TOOL.mdp >KEYMAP_TOOL.md
