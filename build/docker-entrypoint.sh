#!/bin/bash
set -euo pipefail

# 영카트 최신버전 자동설치 스크립트 시작
if [ ! -e youngcart ]; then
mkdir youngcart \
&& cd youngcart \
&& curl -o youngcart.tar.gz -fSL https://github.com/gnuboard/youngcart5/tarball/master \
&& tar -xf youngcart.tar.gz -C ./ --strip-components=1 \
&& rm youngcart.tar.gz && mkdir data \
&& chown -R www-data:www-data ./ \
&& chmod -R 777 data \
&& sed -i "s/'utf8'/'utf8mb4'/g" config.php \
&& cd ..
fi
# 그누보드 자동설치 스크립트 끝

exec "$@"
