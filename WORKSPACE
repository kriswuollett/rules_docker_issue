load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

###############################################################################
# PYTHON
###############################################################################

http_archive(
    name = "rules_python",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.5.0/rules_python-0.5.0.tar.gz",
    sha256 = "cd6730ed53a002c56ce4e2f396ba3b3be262fd7cb68339f0377a45e8227fe332",
)

# register_toolchains("//:my_toolchain")

load("@rules_python//python:pip.bzl", "pip_parse")
pip_parse(
   name = "pip_deps",
   requirements_lock = "//:requirements_lock.txt",
)
load("@pip_deps//:requirements.bzl", "install_deps")
install_deps()

###############################################################################
# OCI
###############################################################################

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "4349f2b0b45c860dd2ffe18802e9f79183806af93ce5921fb12cbd6c07ab69a8",
    strip_prefix = "rules_docker-0.21.0",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.21.0/rules_docker-v0.21.0.tar.gz"],
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)
container_repositories()

load("@io_bazel_rules_docker//python3:image.bzl", _py_image_repos = "repositories")
_py_image_repos()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")
container_deps()

load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
)

container_pull(
    name = "alpine_linux_amd64_tar",
    digest = "sha256:3eea5acfa729637baeedf1059a2a03d5a29356aac6baf65fea08762afa72321b",
    registry = "index.docker.io",
    repository = "library/alpine",
    tag = "3.15",
)
