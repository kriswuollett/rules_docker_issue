load("@io_bazel_rules_docker//python3:image.bzl", "py3_image")
load("@pip_deps//:requirements.bzl", "requirement")

py_binary(
    name = "hello_name_py",
    srcs = ["hello_name.py"],
    main = "hello_name.py",
    python_version = "PY3",
    srcs_version = "PY3",
    deps = [
        requirement("chevron"),
    ],
)

py3_image(
    name = "hello_name_py_image",
    srcs = ["hello_name.py"],
    layers = [
        requirement("chevron"),
    ],
    main = "hello_name.py",
)

cc_binary(
    name = "hello_name_cc",
    srcs = ["hello_name.cc"],
)
