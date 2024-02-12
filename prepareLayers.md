# Creating Lambda Layers 
package the binary files to a zip and upload it 

## AWS CLI

- Download & navigate to [AWSCLI_LAMBDA_LAYER](./awscli_lambda_layer)  folder in this repo

- Install & Start docker . [Instructions here ](https://docs.docker.com/engine/install/)

- give the ``` build.sh``` exectuale permission

        sudo chmod +x ./build.sh

- run the script 

        sudo bash ./build.sh

- You will see the ```layer.zip``` file in your current folder

- rename it

        mv layer.zip awscli_lambda_layer.zip

## KUBECTL 

- navigate to [KUBECTL_LAMBDA_LAYERS](./kubectl_lambda_layer/)

-  give the ``` build.sh``` exectuale permission

        sudo chmod +x ./build.sh

- run the script 

        sudo bash ./build.sh

- You will see the ```kubectl_lambda_layer.zip``` file in your current folder



### NEXT STEP : Creating Lambda Function >> [Click Here](./createFunction.md)

--- 
### Optional references for downloading executables

- Aws CLI : https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions


- Kubectl : https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
