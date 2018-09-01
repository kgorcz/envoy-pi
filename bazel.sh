#!/bin/bash

# Bazel dependencies
sudo apt-get -y install build-essential openjdk-8-jdk python zip unzip

# Bazel
wget -q https://github.com/bazelbuild/bazel/releases/download/0.16.0/bazel-0.16.0-dist.zip
unzip -q bazel-0.16.0-dist.zip -d bazel

pushd bazel

export EXTRA_BAZEL_ARGS="--jobs 1"
export BAZEL_JAVAC_OPTS="-J-Xmx500M"
./compile.sh 2>&1 | tee ../bazel.log
sudo cp output/bazel /usr/local/bin

popd


