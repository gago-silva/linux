# linux
## Bash function and set of linux bash commands

## Docker installation steps for Rocky Linux

step 1 : Add Docker Repo on Rocky Linux

`sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo`

step 2 : Run system update

`sudo dnf update`

step 3 : Command to Install Docker CE Engine

`sudo dnf install docker-ce docker-ce-cli containerd.io`

step 4 : Enable, Start Docker Service and check the status of the service

`sudo systemctl enable docker`
`sudo systemctl start docker`
`systemctl status docker`

step 5 : Add Rocky Linux User to Docker User Group

`sudo usermod -aG docker $USER`


step 6 : Restart the docker Service

`sudo systemctl daemon-reload`
`sudo systemctl restart docker`

step 7 : Docker Service installation test

`docker pull ubuntu`
`docker images`
`docker run -it ubuntu`
