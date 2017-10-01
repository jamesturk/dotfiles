#!/bin/sh
ansible-playbook ego.yml -i inventory/ --ask-become-pass
