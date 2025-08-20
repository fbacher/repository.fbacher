#!/usr/bin/sh

cd repo/zips
rm -rf *
python3 ../../create_repository.py ../repo.fbacher  ../service.kodi.tts ../script.module.langcodes 
python3 ../../create_repository.py --compressed ../repo.fbacher  ../service.kodi.tts ../script.module.langcodes 
