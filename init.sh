#!/usr/bin/env bash

mkdir -p ~/.homestead-plus

homesteadRoot=~/.homestead-plus

cp -i src/stubs/HomesteadPlus.yaml "$homesteadRoot/HomesteadPlus.yaml"
cp -i src/stubs/after.sh "$homesteadRoot/after.sh"
cp -i src/stubs/aliases "$homesteadRoot/aliases"

echo "Homestead Plus initialized!"
