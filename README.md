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

## Working Env Vars
#### env command

We can list out all Enviroment Variables (Env Vars) using the `env` command

We can filter specific env vars using grep eg. `env | grep AWS_`

### Setting and Unsetting Env Vars
In the terminal we can set using 
``` 
export HELLO='world' 
```

In the terrminal we unset using 
```
unset HELLO
```

We can set an env var temporarily when just running a command
```
HELLO='world' ./bin/print_message
```
Within a bash script we can set env without writing export eg.
```
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```

#### Printing Vars
We can print an env var using echo eg. `echo $HELLO`

#### Scoping of Env Vars
When you open up new bash terminals in VSCode it will not be aware of env vars that you have set in another window.

If you want to Env Vars to persist across all future bash terminals that are open you need to set env vars in your bash profile. eg. `.bash_profile`

#### Persisting Env Vars in Gitpod
We can persist env vars into gitpod by storing them in Gitpod "Codespaces secrets".

```
gp env HELLO='world'
```
All future workspaces launched will have the env vars already set for all bash terminals opened in those workspaces.

You can also set en vars in the .gitpod.yml but they should only be non-senstive env vars.

## AWS CLI Installation

AWS CLI is installed for the project via the bash script `./bin/install_aws_cli`

{Getting Started](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)-We'll need to generate [AWS CLI keys](https://us-east-1.console.aws.amazon.com/iamv2/home?region=us-east-1#/security_credentials) for IAM User in order to the user AWS CLI.

Install (AWS CLI) [AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials are configured correctly by running the following AWS CLI command:
```
aws sts get-caller-identity
```
If it is succesful you should see a json payload return that looks like this:
```
{
    "UserId": "AIEAVUO15ZPVHJ5WIJ5KR",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/<IAM User Name>"
}
```

## Terraform Basics
### Terraform Registry
Terraform sources its providers and modules from the Terraform registry which located at [registry.terraform.io](https://registry.terraform.io/)

- **Providers** is an interface to APIs that will allow you to create resources in terraform.
- **Modules** are a way to make large amount of terraform code modular, portable and sharable.

[Randon Terraform Provider](https://registry.terraform.io/providers/hashicorp/random)

### Terraform Console
You can see a list of all the Terrform commands by simply typing `terraform`

#### Terraform Init
At the start of a new terraform project we will run `terraform init` to download the binaries for the terraform providers that we'll use in this project.

#### Terraform Plan

`terraform plan`


This will generate out a changeset, about the state of our infrastructure and what will be changed.

We can output this changeset ie. "plan" to be passed to an apply, but often you can just ignore outputting.

#### Terraform Apply

`terraform apply`

This will run a plan and pass the changeset to be executed by terraform. Apply should prompt yes or no.

If you want to automatically approve an apply we can provide the auto approve flag eg. `terraform apply --auto-approve`

#### Terraform Destroy
`teraform destroy` This will destroy resources.

You can use the auto approve flag to skip the approve prompt eg. `terraform apply --auto-approve`

### Terraform Lock Files
`.terraform.lock.hcl` contains the locked versioning for the providers or modulues that should be used with the project.

The Terraform Lock File should be committed to your Version Control System (VCS) eg. Github

### Terraform State Files
`.terraform.tfstate` contain information about the current state of your infrastructure.

This file *should not be commited* to your VCS.

This file can contain sensentive data.

If you lose this file, you lose knowning the state of your infrastructure.

`.terraform.tfstate.backup` is the previous state file state.

### Terraform Directory
`.terraform` directory contains binaries of terraform providers..
