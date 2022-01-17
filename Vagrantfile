

Vagrant.configure(2) do |config|
  config.vm.box_check_update = false

  # vbox template for all vagrant instances
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "512"
    vb.cpus = 2
  end

             config.vm.define "vg-openscap-01" do |k8scluster|
                k8scluster.vm.box = "bento/ubuntu-20.04"
                k8scluster.vm.hostname = "vg-openscap-01"
                k8scluster.vm.network "private_network", ip: "192.168.50.15"
                #Disabling the default /vagrant share can be done as follows:
                k8scluster.vm.synced_folder ".", "/vagrant", disabled: true
                k8scluster.vm.provider "virtualbox" do |vb|
                    vb.name = "vbox-openscap-01"
                    vb.memory = "768"
                end
                k8scluster.vm.provision :shell, path: "scripts/bootstrap.sh"
                k8scluster.vm.provision :shell, path: "scripts/openscap.sh"
              end

              config.vm.define "vg-openscap-02" do |k8scluster|
                k8scluster.vm.box = "bento/ubuntu-21.04"
                k8scluster.vm.hostname = "vg-openscap-02"
                k8scluster.vm.network "private_network", ip: "192.168.50.16"
                #Disabling the default /vagrant share can be done as follows:
                k8scluster.vm.synced_folder ".", "/vagrant", disabled: true
                k8scluster.vm.provider "virtualbox" do |vb|
                    vb.name = "vbox-openscap-02"
                    vb.memory = "768"
                end
                k8scluster.vm.provision :shell, path: "provisioning/bootstrap.sh"
              end
  
              config.vm.define "vg-openscap-03" do |k8scluster|
                k8scluster.vm.box = "bento/ubuntu-18.04"
                k8scluster.vm.hostname = "vg-openscap-03"
                k8scluster.vm.network "private_network", ip: "192.168.50.17"
                #Disabling the default /vagrant share can be done as follows:
                k8scluster.vm.synced_folder ".", "/vagrant", disabled: true
                k8scluster.vm.provider "virtualbox" do |vb|
                    vb.name = "vbox-openscap-03"
                    vb.memory = "768"
                end
                k8scluster.vm.provision :shell, path: "scripts/bootstrap.sh"
                k8scluster.vm.provision :shell, path: "scripts/openscap.sh"
              end

              config.vm.define "vg-openscap-04" do |k8scluster|
                # https://app.vagrantup.com/ubuntu/boxes/impish64
                k8scluster.vm.box = "ubuntu/impish64" #21.10   
                k8scluster.vm.hostname = "vg-openscap-04"
                k8scluster.vm.network "private_network", ip: "192.168.50.18"
                #Disabling the default /vagrant share can be done as follows:
                k8scluster.vm.synced_folder ".", "/vagrant", disabled: true
                k8scluster.vm.provider "virtualbox" do |vb|
                    vb.name = "vbox-openscap-04"
                    vb.memory = "768"
                end
                k8scluster.vm.provision :shell, path: "provisioning/bootstrap.sh"
              end

              config.vm.define "vg-openscap-05" do |k8scluster|
                # https://app.vagrantup.com/ubuntu/boxes/hirsute64
                k8scluster.vm.box = "ubuntu/hirsute64" #21.04  
                k8scluster.vm.hostname = "vg-openscap-05"
                k8scluster.vm.network "private_network", ip: "192.168.50.19"
                #Disabling the default /vagrant share can be done as follows:
                k8scluster.vm.synced_folder ".", "/vagrant", disabled: true
                k8scluster.vm.provider "virtualbox" do |vb|
                    vb.name = "vbox-openscap-05"
                    vb.memory = "768"
                end
                k8scluster.vm.provision :shell, path: "provisioning/bootstrap.sh"
              end              

end
