DEFAULT_USER?=centos

all: python

.PHONY: python
python:
	ansible-playbook python.yml -u centos
