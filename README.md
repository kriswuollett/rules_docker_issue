# rules_docker_issue

Run container:

```console
$ docker build . -t rules_docker_issue
$ docker run -d --rm --name rules_docker_issue rules_docker_issue
```

Verify c++ app works:

```console
$ docker exec -it --env NAME=$USER rules_docker_issue /usr/local/bin/bazel run //:hello_name_cc

2021/11/19 22:30:56 Downloading https://releases.bazel.build/4.2.1/release/bazel-4.2.1-linux-x86_64...
Extracting Bazel installation...
Starting local Bazel server and connecting to it...
INFO: Analyzed target //:hello_name_cc (19 packages loaded, 140 targets configured).
INFO: Found 1 target...
Target //:hello_name_cc up-to-date:
  bazel-bin/hello_name_cc
INFO: Elapsed time: 19.905s, Critical Path: 0.32s
INFO: 6 processes: 4 internal, 2 processwrapper-sandbox.
INFO: Build completed successfully, 6 total actions
INFO: Build completed successfully, 6 total actions
hello kris
```

Verify python3 app works:

```console
$ docker exec -it --env NAME=$USER rules_docker_issue /usr/local/bin/bazel run //:hello_name_py
INFO: Analyzed target //:hello_name_py (0 packages loaded, 0 targets configured).
INFO: Found 1 target...
Target //:hello_name_py up-to-date:
  bazel-bin/hello_name_py
INFO: Elapsed time: 0.271s, Critical Path: 0.00s
INFO: 1 process: 1 internal.
INFO: Build completed successfully, 1 total action
INFO: Build completed successfully, 1 total action
hello kris from python 3.8.10 (default, Sep 28 2021, 16:10:42) 
[GCC 9.3.0]
```

Verify python3 image works:

```console
$ docker exec -it --env NAME=$USER rules_docker_issue /usr/local/bin/bazel build //:hello_name_py_image
INFO: Analyzed target //:hello_name_py_image (0 packages loaded, 0 targets configured).
INFO: Found 1 target...
Target //:hello_name_py_image up-to-date:
  bazel-bin/hello_name_py_image-layer.tar
INFO: Elapsed time: 0.314s, Critical Path: 0.00s
INFO: 1 process: 1 internal.
INFO: Build completed successfully, 1 total action
```

Run this to clean up:

```console
$ docker stop rules_docker_issue
```
