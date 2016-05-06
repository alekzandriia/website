#!/usr/bin/env bash

case "$1" in
  "depend" )
    cd _docs
    export CERTBOT_WEBSITE='True'
    ./letsencrypt-auto-source/letsencrypt-auto --os-packages-only
    ./tools/venv.sh
    ;;
  "install" )
    cd _docs
    source ./venv/bin/activate
    pip install --upgrade git+https://github.com/EFForg/sphinx_rtd_theme.git
    make -C docs clean html epub latex latexpdf
    ;;
esac