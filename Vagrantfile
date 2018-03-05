Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.define "private-dns-one" do |m|
    m.vm.hostname = "private-dns-one"
    m.vm.network "private_network", ip: "192.168.0.11"
  end

  config.vm.define "consul-one" do |m|
    m.vm.hostname = "consul-one"
    m.vm.network "private_network", ip: "192.168.0.21"
  end

  config.vm.define "vault-one" do |m|
    m.vm.hostname = "vault-one"
    m.vm.network "private_network", ip: "192.168.0.31"
  end

  config.vm.define "web-one" do |m|
    m.vm.hostname = "web-one"
    m.vm.network "private_network", ip: "192.168.0.41"
  end

  config.vm.define "postgres-one" do |m|
    m.vm.hostname = "postgres-one"
    m.vm.network "private_network", ip: "192.168.0.51"

    m.vm.provider "virtualbox" do |p|
      p.memory = 2048
    end

  end

end
