# git-secrets

`Dockerfile` to create a [Docker](https://www.docker.com/) container image for [awslabs/git-secrets](https://github.com/awslabs/git-secrets).

# How to use

The main usage of `git-secrets` is scanning of directories for secrets(mainly git repo).  

This can be done by the following script:
```
git secrets --scan -r .
```
The `ENTRYPOINT` has not been implemented. This allows to easily configure the utility if required.

# CI/CD
This container image can be used as the stage in git CI/CD pipeline. By default the exit code of the process is `1`  and the pipeline job fails if secrets are found in the scanned directory.  
A sample `.gitlab-ci.yml`:

```
stages:
  - secrets

SecretsTest:
  image: izhar0407/git-secrets:latest
  stage: secrets
  script:
    - git secrets --scan -r .
```