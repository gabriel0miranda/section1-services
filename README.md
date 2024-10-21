# My Hosted Services

This repository holds Dockerfiles, Docker Compose files and scripts that I use to setup some self-hosted services.

The directory structure is the following:

```
- dockerfiles: holds the Dockerfiles for the custom images
- data: holds data files like lists of git origins
- keys: holds key files like ssh public keys, usually empty because of .gitignore
- scripts: holds scripts that are used in containers or the server
- configs: holds configuration files (ex.: nginx.conf, php.ini, etc)
- supervisor: holds supervisord configuration files
```

The Docker Compose file is kept in the root directory of this repo.

## Services

This repository contains the following services:

- Git server (WIP)

- Baïkal (CalDav/CardDav) server (Done)

- Bind9 server (TODO)

