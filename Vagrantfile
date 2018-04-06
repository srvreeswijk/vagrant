$post_script = <<SCRIPT
echo configuring vagrant box with docker and updating yum repo
data > /etc/vagrant_provisioned_at

sudo yum update -y
sudo yum install -y git
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
# Enable these options to install the docekr edge or docker test versions. 
# sudo yum-config-manager --enable docker-ce-edge
# sudo yum-config-manager --enable docker-ce-test
# sudo yum-config-manager --disable docker-ce-edge  #this will disable the repo again. 
sudo yum install docker-ce
systemctl enable docker.service
systemctl start docker.service


docker -v
echo Install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.20.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.provision "shell", inline: $post_script
end
