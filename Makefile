DEFAULT_USER?=centos
VENV_DIRECTORY=$(CURDIR)/.venv
ANSIBLE_PLAYBOOK=$(VENV_DIRECTORY)/bin/ansible-playbook

all: python dotfiles neovim zsh

.venv:
	if [ ! -d  "$(VENV_DIRECTORY)" ];then \
		virtualenv "$(VENV_DIRECTORY)"; \
	fi
	if [ ! -f "$(ANSIBLE_PLAYBOOK)" ];then \
		$(VENV_DIRECTORY)/bin/pip install ansible; \
	fi

.PHONY: clean
clean:
	$(RM) *.retry

.PHONY: python
python: .venv
	$(ANSIBLE_PLAYBOOK) python.yml -u $(DEFAULT_USER)

.PHONY: dotfiles
dotfiles: .venv
	$(ANSIBLE_PLAYBOOK) dotfiles.yml -u $(DEFAULT_USER)

.PHONY: neovim
neovim: .venv python
	$(ANSIBLE_PLAYBOOK) neovim.yml -u $(DEFAULT_USER)

.PHONY: zsh
zsh: .venv dotfiles
	$(ANSIBLE_PLAYBOOK) zsh.yml -u $(DEFAULT_USER)
