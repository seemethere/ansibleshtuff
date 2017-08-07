DEFAULT_USER?=centos

all: python dotfiles neovim

.PHONY: clean
clean:
	$(RM) *.retry

.PHONY: python
python:
	ansible-playbook python.yml -u $(DEFAULT_USER)

.PHONY: dotfiles
dotfiles:
	ansible-playbook dotfiles.yml -u $(DEFAULT_USER)

.PHONY: neovim
neovim:
	ansible-playbook neovim.yml -u $(DEFAULT_USER)
