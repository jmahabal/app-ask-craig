#!/usr/bin/env bash
set -ex

# Prime database
mongoimport \
  --verbose \
  --host=$DB_HOST \
  --db=app-ask-craig \
  --collection=jobs \
  --type=csv \
  --headerline \
  --file=./workflow/data/craigslistJobTitles.csv

pushd workflow
  ./install.sh
popd

pushd web
  ./install.sh
popd


