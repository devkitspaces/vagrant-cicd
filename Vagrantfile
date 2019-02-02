# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'fileutils'
# FileUtils.touch('.vagrant_enabled')

# ---------------------------------------
# Libraries
# ---------------------------------------

root_dir = File.dirname(__FILE__)
lib_dir = 'lib'
lib_path = "#{root_dir}/#{lib_dir}"

if File.exist?(lib_path)
  lib_files = Dir.glob("#{lib_path}/*.rb")
  lib_files&.each do |files|
    require_relative "#{lib_dir}/#{File.basename(files, '.rb')}"
  end
end

# ---------------------------------------
# Libraries
# ---------------------------------------

Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2".freeze

required_plugins = get_plugins(Vagrant)
enable_plugins(required_plugins)

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  # config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.name = "basic_dev"
  end

  provision_files = get_provisioners(root_dir)
  run_provisioners(config, provision_files)
end
