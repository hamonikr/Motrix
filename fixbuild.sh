#!/bin/bash

# yarn 빌드 후 실행 (yarn run build)
# 일렉트론 빌드에서 리눅스 패키지 빌드시 mime 아이콘을 추가, 변경하지 못해서 기본 mime 아이콘이 "x-office-document"이다.
# Motrix 폴더에서 스크립트 실행

# package.json에서 버전명을 가져오기 위해 jq 설치
sudo apt install -y jq

RELEASE=$(jq -r '.version' package.json)

cp -r Fix release/
cd release
mkdir hamonikr_release

dpkg-deb -R Motrix_${RELEASE}_amd64.deb Motrix
cp -r Fix/* Motrix/

dpkg-deb -b Motrix/ hamonikr_release/Motrix_${RELEASE}_amd64.deb

rm -r Motrix
