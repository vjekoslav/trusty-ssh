# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  DOCKER_IMAGE_REPO = "vjeko"
  DOCKER_IMAGE_NAME = "trusty-ssh"

  config.vm.define "trusty" do |t|
    t.ssh.password = "vagrant"
    t.vm.provider "docker" do |d|
      d.image = "#{DOCKER_IMAGE_REPO}/#{DOCKER_IMAGE_NAME}:latest"
      d.name = "#{DOCKER_IMAGE_NAME}"
      d.remains_running = true
      d.has_ssh = true
    end
  end
end
