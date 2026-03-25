# dotfiles

[![ShellCheck](https://gitlab.com/trotro/dotfiles/badges/main/pipeline.svg)](https://gitlab.com/trotro/dotfiles/-/pipelines)

Just my dotfiles.

## to install

Fresh install (creates config dirs + deploys everything):

```shell
make bootstrap
```

To view all available targets:

```shell
make help
```

The setup will create the symlinks into your home folder.

## TODO

- [x] easy install: adding a makefile or a shell script
- [x] moving [dockerized apps](https://github.com/trotro/dockerized-apps) to a ~~.dockerfunc~~ docker.fish
