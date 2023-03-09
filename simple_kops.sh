#!/bin/bash

export KOPS_STATE_STORE=s3://gpt-k8s-store
export NAME=elliottlamararnold.com 
export AWS_REGION=us-east-1


# # Create a new cluster configuration
kops create cluster \
  --node-count 2 \
  --node-size t2.medium \
  --master-size t2.medium \
  --zones "${AWS_REGION}a,${AWS_REGION}b" \
  --name $NAME \
  --dns-zone Z0655861EA7YPC93I1LB \
  --yes \
  --cloud aws

# # Update the cluster configuration
kops update cluster $NAME --yes

# Wait for the cluster to be ready
kops validate cluster --wait 10m

kops export kubecfg --state s3://gpt-k8s-store

# kops delete cluster --name $NAME --yes
