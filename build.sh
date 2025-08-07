#!/usr/bin/sh

cd repo/zips
rm -rf *
python3 ../../create_repository.py ../repository.fbacher  ../service.kodi.tts ../script.module.langcodes 
python3 ../../create_repository.py --compressed ../repository.fbacher  ../service.kodi.tts ../script.module.langcodes 
