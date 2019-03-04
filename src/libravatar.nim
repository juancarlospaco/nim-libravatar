import httpclient
from strutils import toLowerAscii, strip
from md5 import getMD5

const
  libravatarApiUrl =
    when defined(ssl): "https://seccdn.libravatar.org/avatar/" ## Libravatar API URL by Default (SSL).
    else:              "http://cdn.libravatar.org/avatar/"     ## Libravatar API URL by Default (No SSL).
  validDefaults = ["", "https://seccdn.libravatar.org/static/img/nobody/250.png", "404", "mm", "mp",
                  "identicon", "monsterid", "wavatar", "retro", "robohash"]  ## Valid values for default.

proc getLibravatarUrl*(email: string, size: range[1..512] = 100, default="robohash",
    forceDefault=false, fallback="", baseUrl=libravatarApiUrl): string =
  ## https://wiki.libravatar.org/api & https://wiki.libravatar.org/features
  ## Federation supported passing ``baseUrl``, DNS server discovery is up to you.
  ## Nim being compiled, dont need a hardcoded DNS dig at Runtime in this function,
  ## you can do it compile-time for your needs, or just pass a string URL, KISS.
  ## 404 wont return 404,but a default image,use ``default="404"`` for 404 Error.
  ## Your users nor you dont need a Libravatar account if you dont want to,
  ## because if Libravatar cant find you it redirects you to your Gravatar,
  ## if you have no Gravatar then it returns a default autogenerated image.
  assert default in validDefaults, "Default must be one of " & $validDefaults & " but got: " & default
  let
    f = when defined(release): "" else: (if unlikely(forceDefault): "&f=y" else: "")
    d = if unlikely(default != ""): "&d=" & default else: ""
  var url = baseUrl & getMD5(email.strip.toLowerAscii) & "?s=" & $size & d & f
  if default == "404" and fallback != "":
    try:
      discard newHttpClient().getContent(url)
    except:
      url = fallback
  result = url

runnableExamples:
  echo getLibravatarUrl(email="me@aaronsw.com")
  echo getLibravatarUrl(email="me@aaronsw.com", size=512, default="monsterid")

when isMainModule and defined(ssl):
  {. passL: "-s", passC: "-flto -ffast-math -march=native" .}
  import httpclient
  from os import paramStr
  newHttpClient().downloadFile(getLibravatarUrl(paramStr(1), size=128, default="404"), paramStr(1) & ".jpg")
