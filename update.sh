#!/bin/bash
version=`wget -q -O - https://raw.githubusercontent.com/john30/ebusd/master/VERSION`
if [ "x$1" = "x-r" ]; then
  reset=1
  shift
fi
if [ "x$1" = "x-R" ]; then
  reset=2
  shift
fi
if [ "x$1" = "x" ]; then
  echo "Usage: update.sh [-r|-R] releasesdir"
  echo "  with -r for rebuilding the conf files"
  echo "  and -R for dropping existing db files and stuff (hard reset)"
  exit 1
fi
releasesdir="$1"
if [ -n "$reset" ]; then
  dir=`pwd`
  echo "distributions:"
  for variant in default nomqtt; do
    for dist in buster bullseye bookworm; do
      mkdir -p "${variant}/${dist}/conf" 2>/dev/null
      if [[ "x$reset" = "x2" ]]; then
        (cd "${variant}/${dist}" && rm -rf db dists pool)
      fi
      cat >"${variant}/${dist}/conf/options" <<EOF
basedir ${dir}/${variant}/${dist}
EOF
      if [ "$variant" = "nomqtt" ]; then
        descr="Apt repository for ebusd (without MQTT support)."
        varsuffix="."
      else
        descr="Apt repository for ebusd including MQTT support."
        varsuffix="_mqtt"
      fi
      archs=`ls ${releasesdir}/ebusd-${version}_*-${dist}${varsuffix}*|sed -e 's#^.*ebusd-[^_]*_##' -e 's#-.*$##' -e 's#^386$#i386#' -e 's#^armv7$#armhf#'|egrep -v armv6l|sort|tr "\n" " "`
      rm -f "${variant}/${dist}/conf/sign.sh"
      cp -a sign.sh "${variant}/${dist}/conf/sign.sh"
      cat >"${variant}/${dist}/conf/distributions"<<EOF
Origin: https://github.com/john30/ebusd
Label: ebusd
Codename: $dist
Version: $version
Suite: stable
Architectures: $archs
Components: main
Description: $descr
SignWith: ! sign.sh
EOF
      signby=''
      if [ "$dist" = "bookworm" ]; then
        signby=' [signed-by=/etc/apt/keyrings/ebusd.gpg]'
      fi
      echo "deb${signby} https://repo.ebusd.eu/apt/${variant}/${dist} ${dist} main" > ebusd-${variant}-${dist}.list
      echo "${variant}/${dist}: $archs"
    done
  done
  exit
fi

echo -n "enter passphrase: "
read -s PASS
export PASS
for file in ${releasesdir}/ebusd-${version}_*; do
  if [ "${file#*armv6l}" != "$file" ]; then
    continue
  fi
  dist=`echo $file|sed -e 's#^.*-##' -e 's#\.deb$##' -e 's#_.*$##'`
  arch=`echo $file|sed -e 's#^.*ebusd-[^_]*_##' -e 's#-.*$##' -e 's#^386$#i386#' -e 's#^armv7$#armhf#'`
  if [ "${file##*mqtt}" = "$file" ]; then
    variant=nomqtt
  else
    variant=default
  fi
  echo "# executing: (cd ${variant}/${dist} && reprepro -C main -A $arch includedeb $dist $file)"
  (cd ${variant}/${dist} && reprepro -C main -A $arch includedeb $dist $file)
done
