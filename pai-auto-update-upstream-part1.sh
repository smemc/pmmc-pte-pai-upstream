#!/bin/sh

version=$1
filename=PAI-${version}.tar.gz
fileprefix=/tmp
filepath=${fileprefix}/${filename}
url=http://www.orientadores.pmmc.com.br/cae/pai/download/${filename}

wget -c ${url} -P ${fileprefix}
file_sha256sum=$(sha256sum ${filepath} | awk '{ print $1 }')

sed -i -e "s/VERSION = .*$/VERSION = ${version}/" -e "s/SHA256SUM = .*$/SHA256SUM = ${file_sha256sum}/" Makefile

#git add -A
#git commit -em "New upstream version ${version}"
#git tag -s -m "Upstream version ${version}" v${version}
#git archive --format=tar.gz --prefix=pai-${version}/ -o ~/pai-${version}.tar.gz v${version}
#git push
#git push --tags
