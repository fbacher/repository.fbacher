#!/usr/bin/sh
set -x
SITE='feuerbacher'
# SITE='github'
# SITE='smeagol'

awk -v SITE="${SITE}" -f addon.awk repo/repo.fbacher/addon_proto.xml  >repo/repo.fbacher/addon.xml
awk -v SITE="${SITE}" -f addon.awk repo/service.kodi.tts/SETUP_proto.md  >repo/service.kodi.tts/SETUP.md
awk -v SITE="${SITE}" -f addon.awk repo/service.kodi.tts/SETUP_proto.md  >repo/service.kodi.tts/SETUP.md

cd repo/repo.fbacher
cd -
cd repo/zips
rm -rf *
python3 ../../create_repository.py ../repo.fbacher  ../service.kodi.tts ../script.module.langcodes
python3 ../../create_repository.py --compressed ../repo.fbacher  ../service.kodi.tts ../script.module.langcodes
