# optional functions that u can check and play


function handler () {
    EVENT_DATA=$1
    DATA=`/opt/awscli/aws/aws --version`
    RESPONSE="{\"statusCode\": 200, \"body\": \"$DATA\"}"
    echo $RESPONSE
}

function handler () {
    EVENT_DATA=$1
    DATA=`/opt/kubectl version --client`
    RESPONSE="{\"statusCode\": 200, \"body\": \"$DATA\"}"
    echo $RESPONSE
}

function handler () {
    EVENT_DATA=$1
    export LD_LIBRARY_PATH=/opt/lib64/:$LD_LIBRARY_PATH
    DATA=`openssl version`
    RESPONSE="{\"statusCode\": 200, \"body\": \"$DATA\"}"
    echo $RESPONSE
}

function handler () {
    aws=/opt/awscli/aws/aws
    kubectl=/opt/kubectl
    
    
    DATA1=`/$aws --version`
    DATA2=`$kubectl version --client`
    RESPONSE="{\"statusCode\": 200, \"aws\": \"$DATA1\",\"kubectl\": \"$DATA2\"}"
    
    echo $RESPONSE
}


# configuring eks, kubectl openssl 

function handler () {
    #executables
    aws=/opt/awscli/aws/aws
    kubectl=/opt/kubectl
    
    #storage
    mkdir /tmp/aws
    mkdir /tmp/kube
    
    # #configuring Aws Cli
    # echo "[default]" > /tmp/aws/config
    # echo "aws_access_key_id=$SECRET_ACCESS_KEY_ID" >> /tmp/aws/config
    # echo "aws_secret_access_key=$SECRET_ACCESS_KEY" >> /tmp/aws/config
    # export AWS_CONFIG_FILE=/tmp/aws/config

    # awk '{gsub("command: aws", "command: $aws")}1' /tmp/kube/config > /tmp/kube/temp && mv -f /tmp/kube/temp /tmp/kube/config
    
    # aws eks --region <region> update-kubeconfig --name <cluster-name> --kubeconfig </tmp/kube/kubeconfig>

    # export KUBECONFIG="/tmp/kube/config"

    # DATA2=`$aws s3 mb s3://gtttttgsgsg --region us-east-1`
    DATA1=`$aws s3 ls`
    
    RESPONSE="{\"statusCode\": 200, \"body\": \"$DATA1\"}"
    
    echo $RESPONSE
}

function handler () {
    #executables
    openssl=/opt/bin/openssl
    export LD_LIBRARY_PATH=/opt/lib64:$LD_LIBRARY_PATH
    
    #storage
    mkdir -p /tmp/ossl

    DATA1=`$openssl version`
    
    RESPONSE="{\"statusCode\": 200, \"body\": \"$DATA1\"}"
    
    echo $RESPONSE
}
