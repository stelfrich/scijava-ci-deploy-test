#!/bin/sh
curl -fsLO https://raw.githubusercontent.com/scijava/scijava-scripts/master/travis-build.sh
sh travis-build.sh $encrypted_fce06cd7fed4_key $encrypted_fce06cd7fed4_iv
