#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://repo1.maven.org/maven2/org/slf4j/slf4j-reload4j

dl_ver() {
    local app=$1
    local ver=$2
    local file=${app}-${ver}.jar
    local lfile=$DIR/$file
    local url=$MIRROR/$ver/$file

    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi

    printf "  # %s\n" $url
    printf "  '%s': sha256:%s\n" $ver $(sha256sum $lfile | awk '{print $1}')
}

dl_ver slf4j-reload4j ${1:-1.7.36}
