#!/usr/bin/sh

cd repo/zips
rm -rf *
python3 ../../create_repository.py ../repository.fbacher ../script.module.langcodes ../service.kodi.tts
python3 ../../create_repository.py --compressed ../repository.fbacher ../script.module.langcodes ../service.kodi.tts
