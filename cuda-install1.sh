#!/bin/bash
echo "Cleaning any previous Nvidia or cuda installations"
sudo apt-get purge nvidia*
sudo apt-get autoremove -y
sudo apt-get autoclean -y
sudo rm -rf /usr/local/cuda*
echo "Downloading Cuda toolkit ver 10.0"
cd ~/Downloads/
wget https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/cuda-repo-ubuntu1804-10-0-local-10.0.130-410.48_1.0-1_amd64
sudo dpkg -i cuda-repo-ubuntu1804-10-0-local-10.0.130-410.48_1.0-1_amd64.deb
sudo apt-key add /var/cuda-repo-10-0-local-10.0.130-410.48/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda-10-0 -y
sudo cp cuda.sh /etc/profile.d/cuda.sh 
sudo chmod +x /etc/profile.d/cuda.sh
sudo cp cuda.conf /etc/ld.so.conf.d/cuda.conf
sudo chmod +x /etc/profile.d/cuda.sh
sudo ldconfig
sudo reboot now