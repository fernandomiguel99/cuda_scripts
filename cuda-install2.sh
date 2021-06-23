#!/bin/bash
echo 'export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc
source ~/.bashrc
sudo ldconfig

echo 'Installing CuDnn v7.6.0'
cd ~/Downloads/
tar -xf cudnn-10.1-linux-x64-v7.6.0.64.tgz
sudo cp -R cuda/include/* /usr/local/cuda-10.0/include
sudo cp -R cuda/lib64/* /usr/local/cuda-10.0/lib64

echo 'Installing libcupti'
sudo apt-get install libcupti-dev -y
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc

echo 'Python related'
sudo apt-get install python3-numpy python3-dev python3-pip python3-wheel -y

echo 'Installing TensorFlow' 
sudo pip3 install tensorflow-gpu==1.14.0
sudo pip3 install tensorflow==1.14.0
sudo pip install tensorflow-gpu==1.14.0
sudo pip install tensorflow==1.14.0

cd ~/ git clone --recursive https://github.com/tensorflow/models
sudo apt-get install protobuf-compiler python-pil python-lxml python-tk -y
sudo pip install Cython -y
sudo pip install contextlib2 -y
sudo pip install jupyter -y
sudo pip install matplotlib -y
cd Downloads 
cp protoc.zip ~/models/research/
cd ~/models/research
sudo unzip protoc.zip
./bin/protoc object_detection/protos/*.proto --python_out=.
echo 'export PYTHONPATH=$PYTHONPATH:/home/usuario/models/research:/home/robofei/models/research/slim' >> ~/.bashrc
echo 'Installing dodo_detector'
cd ~/
wget https://github.com/douglasrizzo/dodo_detector/archive/refs/tags/0.6.1.tar.gz
tar -xf 0.6.1.tar.gz
cd dodo_detector-0.6.1
python setup.py build
python setup.py install
