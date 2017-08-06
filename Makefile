DEFAULT_USER?=centos

all: python dotfiles

.PHONY: python
python:
	ansible-playbook python.yml -u $(DEFAULT_USER)

.PHONY: dotfiles
dotfiles:
	ansible-playbook dotfiles.yml -u $(DEFAULT_USER)
