# trusty-ssh
A Docker image based on Ubuntu Trusty, with SSH access

Download
--------

Docker image is available from docker hub:
```
docker pull vjeko/trusty-ssh
```

Usage
-----

```
docker run -d --name trusty1 --hostname trusty1 vjeko/trusty-ssh 
```

After container is running succefully, you can user vagrant/vagrant username and password to SSH into it:
```
ssh vagrant@CONTAINER-IP
```

Installed packages
------------------
* Ubuntu Server, based on ubuntu docker iamge
* openssh-server
* supervisor
* sudo
* rsyslog