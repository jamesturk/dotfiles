#!/bin/sh
ansible-playbook ego.yml -i ../private-config/inventory/ --ask-become-pass
