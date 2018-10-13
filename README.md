# VM Setup Repo
Scripts I use to setup a new development VM in Ubunutu 18.04, Bionic Beaver.  Currently I manually create a base Ubuntu image in Virtual box, downlowd these scripts from my repo, then execute the scripts I need for the type of work I will be performing.  I perform a minimal install, and unselect the third party packages.

## Bash Scipts

Note: The scripts have checks in them to ensure that they run only on a Ubuntu Linux box. It does this by checking for the existance of the file `/etc/lsb-release`.  Perhaps not the _best_ way to prevent a goof up, but it protects me from accidently running these on my Mac.

Script names *should* be self explanatory, but for the sake of clarity...

| Script Name | Description |
|:------------|:------------|
|setup.sh | Runs all the scripts for a full setup. Make sure you have a large enough virtual disk! I typically create 64GB image.|
|install-cassandra.sh | Installs cassandra, java 8 jre, and python cassandra driver. |
|install-chrome.sh | Installs Google Chrome Browser. |
|install-docker.sh | Installs Docker-CE and Docker Compose. |
|install-golang.sh | Installs the Go language and creates a Go workspace `~/go`. |
|install-kubectl.sh | Installs kubectl and creates the necessary `~/.kube` dir. |
|install-mongo.sh | Installs MongoDB and any dependencies [**not implemented**]. |
|install-node.sh | Installs Nodejs, Typescript, and Mocha (unit testing). |
|isntall-prereqs.sh | Installs a host of prerequisite packages that should be ran no matter the type of VM needed. |
|install-redis.sh | Installs Redis and any dependencies [**not implemented**]. |
|install-vscode.sh | Installs my current favorite editor, Visual Studio Code. |