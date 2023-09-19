# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:
This project will use semantic versioning for tagging
[semver.org](https://semver.org/)

The general format:

Given a version number **MAJOR.MINOR.PATCH**, eg. `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

## Installing the Terraform CLI

### Considerations with the Terraform CLI changes

The Terraform CLI installation instructions have changed due to gpg keyring changes. So we needed refer to the latest install CLI instructions via Terraform Documentation and change the scripting for install.

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Considerations for Linux Distribution
This project is built against Ubunutu distro. Please consider checking your Linux Distrubtion and change accordingly to distrubtion needs.

How To Check OS Version in Linux

[Checking The Linux Version](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

Example of checking OS Version:
```
$ cat /etc/os-release

PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
```

### Refactoring .tf Install to Bash

[Bash Syntax Info](https://en.wikipedia.org/wiki/Shebang_(Unix))

While investigating Terriform CLI gpg issues, we noticed the short form install commands for terraform were a bit out of date so we got theupdated version from [hasicorp](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) and compiled it into a bash script --> [Terraform-Install](./bin/install_tf_cli.sh). 

## Shebang Considerations
A Shebang (prounced Sha-bang) tells the bash script what program that will interpet the script. eg. #!/bin/bash

ChatGPT recommended this format for bash: #!/usr/bin/env bash

for portability for different OS distributions
will search the user's PATH for the bash executable
https://en.wikipedia.org/wiki/Shebang_(Unix).

## Execution Considerations
To execute a bash script we can use the ./ (shorthand notiation to execute the bash script).

eg. ./bin/install_tf_cli.sh

If we are using a script in .gitpod.yml we need to point the script to a program to interpert it.

eg. source ./bin/install_tf_cli.sh

## Linux Permissions Considerations
To make the bash scripts executable change linux permission so it will be exetuable at the user mode.

chmod u+x ./bin/install_tf_cli.sh

### alternatively:
chmod 744 ./bin/install_tf_cli.sh
https://en.wikipedia.org/wiki/Chmod

## Github Lifecycle (Before, Init, Command)
Note: The Init will not rerun if we restart an existing workspace, so the "before" command would need to be used.

https://www.gitpod.io/docs/configure/workspaces/tasks