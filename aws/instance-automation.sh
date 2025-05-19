#!/bin/bash

SG_ID=sg-0397920120499858a
IMG_ID=ami-09c813fb71547fc4f
INSTANCES=("mysql" "mongodb" "redis" "rabbitmq" "catalogue" "user" "cart" "payment" "shipping" "dispatch" "frontend")

for instance in ${INSTANCES[@]}
do 
    INSTANCE_ID=$(aws ec2 run-instances --image-id $IMG_ID --instance-type t2.micro --security-group-id $SG_ID --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance}]" --query Instances[0].InstanceId --output text)
    IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query "Reservations[0].Instances[0].PrivateIpAddress" --output text)  
    echo $instance IP Address : $IP
done
