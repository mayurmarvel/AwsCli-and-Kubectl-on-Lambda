# Running AWS CLI & Kubectl & OpenSSL on AWS Lambda

NOTE : The Builds are availabe to download under Github Releases 🔽
### Table of Contents

➡️[Preparing the Layers](./prepareLayers.md)

➡️[Creating lambda Function](./createFunction.md)

➡️[Uploading Layers and Adding it to functions](./uploadLayers.md)


### Folder Structure


    
    -- 📁 awscli_lambda_layer
        -- 📄 scripts for preparing this layer
    |
    -- 📁 kubectl_lambda_layer
        -- 📄 script for preparing this layer
    |
    -- 📁 openssl_lambda_layer
        -- 📄 script for preparing this layer
    |
    |
    -- 📁 src
        -- ✅ Function Codes

    
 Run the Script in the Respective folders to generate the Zip file layer