#perform update & install tools (Al2023)
# change the PACKAGE MANAGER acc to ur OS
sudo dnf update -y && dnf install -y zip unzip

sudo mkdir -p kubectl_layer && cd kubectl_layer

#download kubectl
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

#give executable permissions
sudo chmod +x kubectl

mkdir -p bin

sudo ln -sf "$(pwd)/kubectl" "$(pwd)/bin/kubectl"

#zip the file
sudo zip --symlinks -r kubectl_layer.zip .
