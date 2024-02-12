#perform update & install tools (Ubuntu)
# change the PACKAGE MANAGER acc to ur OS
apt update -y && apt install -y zip unzip

mkdir -p kube && cd kube

#download kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

#give executable permissions
chmod +x kubectl

#zip the file
zip -r kubectl_layer.zip .
