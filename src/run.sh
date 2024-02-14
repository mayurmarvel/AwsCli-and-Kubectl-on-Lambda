function handler () {
    #executables
    # aws=/opt/awscli/aws/aws
    # kubectl=/opt/kubectl
    
    #storage
    # mkdir -p /tmp/aws
    mkdir -p /tmp/kube
    
    #configuring Aws Cli
    # echo "[default]" > /tmp/aws/config
    # echo "aws_access_key_id=$SECRET_ACCESS_KEY_ID" >> /tmp/aws/config
    # echo "aws_secret_access_key=$SECRET_ACCESS_KEY" >> /tmp/aws/config
    # export AWS_CONFIG_FILE=/tmp/aws/config

    

    #DATA2=`$aws s3 mb s3://gtttttgsgsg --region us-east-1`
    DATA1=`$aws s3 ls`
    
    RESPONSE="{\"statusCode\": 200, \"body\": \"$DATA1\"}"
    
    echo $RESPONSE
}