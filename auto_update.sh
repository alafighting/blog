#!/bin/bash

git pull
JEKYLL_ENV=production jekyll build
