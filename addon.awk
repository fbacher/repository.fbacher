BEGIN {
  if (SITE == "github")
   {URL_PREFIX_REPLACE = "https://fbacher.github.io/repository.fbacher"
   URL_LANGCODES_ZIP_REPLACE = "https://github.com/fbacher/repository.fbacher/blob/master/repo/zips/script.module.langcodes/script.module.langcodes-3.4.0~alpha.zip"
   URL_TTS_ZIP_REPLACE = "https://github.com/fbacher/repository.fbacher/blob/master/repo/zips/service.kodi.tts/service.kodi.tts-2.0.7~alpha.zip}
  else if (SITE == "home")
     {URL_PREFIX_REPLACE = "http://smeagol/"
       URL_LANGCODES_ZIP_REPLACE = "https://smeagol/script.module.langcodes/archive/refs/tags/v0.0.1-alpha.zip"
       URL_TTS_ZIP_REPLACE = "https://github.com/fbacher/service.kodi.tts/tags"}
  else if (SITE == "feuerbacher")
     {URL_PREFIX_REPLACE = "https://feuerbacher.us/"
      URL_LANGCODES_ZIP_REPLACE = "https://github.com/fbacher/script.module.langcodes/archive/refs/tags/v0.0.1-alpha.zip"
      URL_TTS_ZIP_REPLACE = "https://github.com/fbacher/service.kodi.tts/tags"}
}

END {}
/URL_PREFIX/ {sub("URL_PREFIX",URL_PREFIX_REPLACE); print($0); next}
/URL_LANGCODES_ZIP/ {sub("URL_LANGCODES_ZIP",URL_PREFIX_REPLACE); print($0); next}
/URL_TTS_ZIP/ {sub("URL_TTS_ZIP",URL_TTS_ZIP_REPLACE); print($0); next}

{print($0); next;}
