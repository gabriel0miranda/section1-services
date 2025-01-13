# Section 1

This repository holds scripts, configuration files and other stuff that I use to setup some self-hosted services.

The directory structure is the following:

- `[service name]/` for service specific files

    - `config/` for configuration files

    - `script/` for script files

    - `supervisor/` for supervisor units and configuration files

- `ansible/` for Ansible files
    - `inventory/` for inventory files (hosts and machines)
    - `playbooks/` for Ansible playbooks


## Services

This repository contains the following services:

- Gitea server (WIP)

- Baïkal (CalDav/CardDav) server (Done)

- Bind9 server (WIP)

