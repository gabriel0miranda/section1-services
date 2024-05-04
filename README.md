# My Hosted Services

This repository holds Dockerfiles, Docker Compose files and scripts that I use to setup some self-hosted services.

The directory structure is the following:

```
- dockerfiles: holds the Dockerfiles for the custom images are stored
- data: holds data files like lists of git origins
- keys: holds key files like ssh public keys, usually empty because of .gitignore
- scripts: holds scripts that are used in containers or the server
```

The Docker Compose file is kept in the root directory of this repo.
