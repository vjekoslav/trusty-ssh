FROM ubuntu:14.04
MAINTAINER Vjekoslav Nikolic <vnikolic@gmail.com>

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y openssh-server supervisor sudo rsyslog

RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor

# Create user
RUN useradd --create-home -s /bin/bash vagrant

# Configure user - SSH access
RUN mkdir -p /home/vagrant/.ssh
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key" > /home/vagrant/.ssh/authorized_keys
RUN chmod 700 /home/vagrant/.ssh
RUN echo -n 'vagrant:vagrant' | chpasswd
RUN touch /home/vagrant/.hushlogin
RUN chown -R vagrant:vagrant /home/vagrant/
RUN mkdir -p /etc/sudoers.d && echo "vagrant ALL= NOPASSWD: ALL" > /etc/sudoers.d/vagrant && chmod 0440 /etc/sudoers.d/vagrant

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD run /usr/local/bin/
RUN chmod +x /usr/local/bin/run

EXPOSE 22

CMD ["/usr/local/bin/run"]
