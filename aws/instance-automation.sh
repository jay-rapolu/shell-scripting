#!/bin/bash

SG_ID=sg-0397920120499858a
IMG_ID=ami-09c813fb71547fc4f

aws ec2 run-instances --image-id $IMG_ID --instance-type t2.micro --security-group-ids $SG_ID --tags Key=Name,Value=MyInstance