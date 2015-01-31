# trusty-ssh
A Docker image based on Ubuntu Trusty, with SSH access

Usage
-----

```
docker run -d --name trusty1 --hostname trusty1 vjeko/trusty-ssh 
```

Installed packages
------------------
* Ubuntu Server, based on ubuntu docker iamge
* openssh-server
* supervisor
* sudo
