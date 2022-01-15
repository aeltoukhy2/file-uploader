#!/bin/sh

# Install Argocd
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl create -f ./infrastructure/argocd/argocd.proj.yaml
  # Get Argocd admin password
  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

# Install minio
kubectl create -f ./infrastructure/minio/1-namespace.yaml
kubectl create -f ./infrastructure/minio/2-minio-standalone-pvc.yaml
kubectl create -f ./infrastructure/minio/3-minio-standalone-deployment.yaml
kubectl create -f ./infrastructure/minio/4-minio-standalone-service.yaml

# Install file-uploader
kubectl create -f ./deployments/file-uploader/namespace.yaml
kubectl create -f ./deployments/file-uploader/deployment.yaml
kubectl create -f ./deployments/file-uploader/service.yaml