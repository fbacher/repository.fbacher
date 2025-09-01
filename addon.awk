BEGIN {
  TTS_ZIP = "service.kodi.tts/service.kodi.tts"
  LANGCODES_ZIP = "script.module.langcodes/script.module.langcodes"
  REPO_ZIP_VERSION = "-1.0.0.zip"
  LANGCODES_ZIP_VERSION = "-3.4.0~alpha.zip"
  TTS_ZIP_VERSION = "-2.0.7~alpha.zip"
  URL_INSTALL_WINDOWS = "./INSTALL_WINDOWS.html"
  URL_INSTALL_LINUX = "./INSTALL_LINUX.html"

  if (SITE == "github")
   {
      URL_PREFIX = "https://fbacher.github.io/repository.fbacher"
      URL_LANGCODES_ZIP = "https://github.com/fbacher/repository.fbacher/blob/master/repo/zips/script.module.langcodes/script.module.langcodes-3.4.0~alpha.zip"
      URL_TTS_ZIP = "https://github.com/fbacher/repository.fbacher/blob/master/repo/zips/service.kodi.tts/service.kodi.tts-2.0.7~alpha.zip"
      URL_INSTALL_WINDOWS = "./INSTALL_WINDOWS"
      URL_INSTALL_LINUX = "./INSTALL_LINUX"
   }
  else if (SITE == "smeagol")
     {
      URL_PREFIX = "http://smeagol"
      URL_ZIPS = "http://smeagol/repo/zips"
      #  URL_LANGCODES_ZIP = "http://smeagol/repo/zips/script.module.langcodes/script.module.langcodes-3.4.0~alpha.zip"
      }
  else if (SITE == "feuerbacher")
     {
      URL_PREFIX = "https://feuerbacher.us"
      URL_ZIPS = "http://feuerbacher.us/repo/zips"
      TTS_ZIP_VERSION = "-2.0.7~alpha.zip"
      #  URL_LANGCODES_ZIP = "/script.module.langcodes/script.module.langcodes"
      }
}

END {}
/URL_PREFIX-/ {sub("URL_PREFIX-",URL_PREFIX); print($0); next}
/URL_ZIPS-/ {sub("URL_ZIPS-", URL_ZIPS); print($0); next}
/REPO_ZIP_VERSION/ {sub("REPO_ZIP_VERSION", REPO_ZIP_VERSION); print($0); next}
/TTS_ZIP_VERSION/ {sub("TTS_ZIP_VERSION", TTS_ZIP_VERSION); print($0); next}
/LANGCODES_ZIP_VERSION/ {sub("LANGCODES_ZIP_VERSION", LANGCODES_ZIP_VERSION); print($0); next}
/LANGCODES_ZIP-/ {sub("LANGCODES_ZIP-",LANGCODES_ZIP); print($0); next}
/TTS_ZIP-/ {sub("TTS_ZIP-",TTS_ZIP); print($0); next}
/URL_INSTALL_WINDOWS/ {sub("URL_INSTALL_WINDOWS", URL_INSTALL_WINDOWS); print($0); next}
/URL_INSTALL_LINUX/ {sub("URL_INSTALL_LINUX", URL_INSTALL_LINUX); print($0); next}
/URL_REPO_ZIP-/ {sub("URL_REPO_ZIP-",URL_REPO_ZIP); print($0); next}

{print($0); next;}
