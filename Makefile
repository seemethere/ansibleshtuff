DEFAULT_USER?=centos
VENV_DIRECTORY=$(CURDIR)/.venv
ANSIBLE_PLAYBOOK=$(VENV_DIRECTORY)/bin/ansible-playbook

all: python dotfiles neovim zsh docker

$(VENV_DIRECTORY):
	if [ ! -d  "$(VENV_DIRECTORY)" ];then \
		virtualenv "$(VENV_DIRECTORY)"; \
	fi

$(ANSIBLE_PLAYBOOK): $(VENV_DIRECTORY)
	if [ ! -f "$(ANSIBLE_PLAYBOOK)" ];then \
		$(VENV_DIRECTORY)/bin/pip install ansible; \
	fi

.PHONY: clean
clean:
	$(RM) *.retry

.PHONY: python
python: $(ANSIBLE_PLAYBOOK)
	$(ANSIBLE_PLAYBOOK) python.yml -u $(DEFAULT_USER)

.PHONY: dotfiles
dotfiles: $(ANSIBLE_PLAYBOOK)
	$(ANSIBLE_PLAYBOOK) dotfiles.yml -u $(DEFAULT_USER)

.PHONY: neovim
neovim: $(ANSIBLE_PLAYBOOK) python
	$(ANSIBLE_PLAYBOOK) neovim.yml -u $(DEFAULT_USER)

.PHONY: zsh
zsh: $(ANSIBLE_PLAYBOOK) dotfiles
	$(ANSIBLE_PLAYBOOK) zsh.yml -u $(DEFAULT_USER)

.PHONY: docker
docker: $(ANSIBLE_PLAYBOOK)
	$(ANSIBLE_PLAYBOOK) docker.yml -u $(DEFAULT_USER)
