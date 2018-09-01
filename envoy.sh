#!/bin/bash

# Envoy dependencies
sudo apt-get -y install golang libtool cmake realpath clang-format-4.0 automake ninja-build curl

# Envoy
git clone https://github.com/envoyproxy/envoy
pushd envoy
git checkout -b pi 4dd49d8809f7aaa580538b3c228dd99a2fae92a4

cp ../envoy.patch .
git apply envoy.patch

export NUM_CPUS=1
export BUILD_CONCURRENCY=0

bazel fetch //source/exe:envoy-static

BAZEL_RULES_GO=$(bazel info output_base)/external/io_bazel_rules_go
cp ../bazel_rules_go.patch $BAZEL_RULES_GO
pushd $BAZEL_RULES_GO
git apply bazel_rules_go.patch
popd

bazel fetch //source/exe:envoy-static
while [ $? -ne 0 ]
do
	sleep 10m 
	echo "Retrying bazel fetch..."
	bazel fetch //source/exe:envoy-static
done

bazel build --worker_verbose --verbose_failures --jobs 1 //source/exe:envoy-static

./bazel-bin/source/exe/envoy-static --version
./bazel-bin/source/exe/envoy-static

popd
