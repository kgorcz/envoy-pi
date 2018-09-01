Included are two scripts: one to build Bazel, the build system used by envoy, and one to build envoy itself.

```
bazel.sh ; envoy.sh
```

After about 6 hours total, a successful build should end with something like this:
```
Target //source/exe:envoy-static up-to-date:
  bazel-bin/source/exe/envoy-static
INFO: Elapsed time: 8771.005s, Critical Path: 192.58s
INFO: 1438 processes: 1438 linux-sandbox.
INFO: Build completed successfully, 1849 total actions
INFO: Build completed successfully, 1849 total actions

./bazel-bin/source/exe/envoy-static  version: 4dd49d8809f7aaa580538b3c228dd99a2fae92a4/1.6.0/Modified/DEBUG

[2018-08-31 18:54:46.903][29904][info][main] source/server/server.cc:178] initializing epoch 0 (hot restart version=9.136.16384.127.options=capacity=16384, num_slots=8209 hash=228984379728933363)
[2018-08-31 18:54:46.905][29904][critical][main] source/server/server.cc:71] error initializing configuration '': unable to read file:
[2018-08-31 18:54:46.905][29904][info][main] source/server/server.cc:392] exiting
```

This was tested on a Model 3 B running Raspbian stretch.

