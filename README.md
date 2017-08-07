Ansible repo that I'm using to setup new dev environments.

Made because EC2 instances can get cleaned up anyday and
I don't want to have to through a 30 minute long setup
process anymore.

Includes things for:
- pyenv setup
  - 2.7.13 python install
  - 3.6.1 python install
  - virtualenv installation
- dotfiles setup
  - installs dotfiles from https://github.com/seemethere/dotfiles
- neovim setup
  - installs from source
  - sets up plugins and related virtualenvs
- zsh setup
  - installs zsh from package manager
  - changes the shell of the current user to zsh

## Pre-reqs:
- python
- virtualenv
- A pre-filled out ansible hosts file with a `dev` group

## To run:

```shell
make
```

The default user is configurable so you can use:

```shell
make DEFAULT_USER=ubuntu
```
