default["base"]["ejson"]["add"]    = []
default["base"]["ejson"]["remove"] = []

default["base"]["git"]["version"]  = "2.6.4"
default["base"]["git"]["checksum"] = "08e3ccdba87ca55140c8155a07e147f6c1cdd7b574690e960763b18474fd05ed"

default["base"]["packages"] = %w(
  curl
  zlib1g-dev
  libssl-dev
  libreadline-dev
  libyaml-dev
  libcurl4-openssl-dev
  libffi-dev
)

default["base"]["ruby"]["source"]   = "http://ftp.ruby-lang.org/pub/ruby/2.2/ruby-2.2.3.tar.gz"
default["base"]["ruby"]["checksum"] = "df795f2f99860745a416092a4004b016ccf77e8b82dec956b120f18bdc71edce"
