#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_website_files() {
  git checkout CI
  git add src/ codegen/slack-api-schemas
  git commit --message "Generated new code from schemas - Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin-pages "https://${GITHUB_TOKEN}@github.com/dvarum12/slack-api-schemas" > /dev/null 2>&1
  git push --quiet --set-upstream origin-pages CI
}

setup_git
commit_website_files
upload_files
