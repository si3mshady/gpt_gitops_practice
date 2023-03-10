#!/bin/bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
brew install argocd
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'


kubectl create secret generic argocd-initial-admin-secret --from-literal=username=admin --from-literal=password=admin -n argocd
# 9zZJwh-qJKcQvV7q