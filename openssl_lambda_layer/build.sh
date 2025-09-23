# Do it on a Amazon Linux 2023 Ec2 machine with ec2-user
sudo dnf install perl-core zlib-devel perl-FindBin perl-lib zip tar wget -y

# Download OpenSSL
# Resource : https://www.openssl.org/source/
#⚠️ Run "ls /usr/lib64/libcrypto.so*"  in the "public.ecr.aws/lambda/provided:al2023" container(spin up and check).
# This will help to see what libscrypto version that al2023 has , so try to use a openssl verion upper => to that version.
# e.g : openssl-3.5.3.tar.gz and libcrypto on al23 is 3.2.2

wget https://github.com/openssl/openssl/releases/download/openssl-3.5.3/openssl-3.5.3.tar.gz -O openssl.tar.gz

# Unzip OpenSSL
tar -xzvf openssl.tar.gz

sudo mkdir -p /usr/local/ssl
mv openssl-* openssl
cd openssl

./Configure --prefix=/usr/local/ssl --openssldir=/usr/local/ssl \
    '-Wl,-rpath,$(LIBRPATH)'

sudo make install

cd /usr/local

sudo chmod +x ./ssl/bin/openssl

cd /usr/local/ssl

shopt -s extglob

# We are only packing the bin folder with openssl and no Deps.
sudo rm -rf !(bin)

sudo rm -f ./lib64/libcrypto.a

# Strip symbols from binaries and libraries
for file in bin/*; do
    if [ -f "$file" ]; then
        # Check if it's a binary file that can be stripped
        if file "$file" | grep -q "ELF\|executable\|shared object"; then
            sudo strip "$file" || true
        else
            echo "Skipping $file (not a binary)"
        fi
    fi
done


sudo rm -rf pkgconfig/

sudo zip -r openssl_slim_layer.zip *

##################################################
# THE BELOW MENTIONED THINGS ARE NOT WORKING AS LAMBDA TAKES LIBS FROM ITS PATH INSTEAD OF ENV , ITS HERE FOR REFERENCE.
# usage : make sure to mention the lib path while using

# the zip file will be in /usr/local/ssl

#export LD_LIBRARY_PATH=/home/ec2-user/ssl/lib64:$LD_LIBRARY_PATH

# make sure to have a config file while generating req , see optional.sh

##################################################
