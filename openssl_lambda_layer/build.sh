# Do it ons Amazon Linux 2023 or AL23 Docker
sudo dnf install perl-core zlib-devel perl-FindBin perl-lib zip tar wget -y

# Download OpenSSL
# Resource : https://www.openssl.org/source/
wget https://www.openssl.org/source/openssl-3.0.13.tar.gz -O openssl.tar.gz

# Unzip OpenSSL
tar -xzvf openssl.tar.gz

sudo mkdir -p /usr/local/ssl

cd openssl

./Configure --prefix=/usr/local/ssl --openssldir=/usr/local/ssl \
    '-Wl,-rpath,$(LIBRPATH)'

sudo make install

cd /usr/local

sudo chmod +x ./ssl/bin/openssl

cd ssl

rm -rf !(bin|lib64)

rm -f ./lib64/libcrypto.a

# Strip symbols from binaries and libraries
for file in bin/* lib64/*; do
    if [ -f "$file" ]; then
        strip "$file" || true  # Continue even if stripping fails
    fi
done


zip -r openssl_slim_layer.zip *




