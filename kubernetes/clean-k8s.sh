#!/bin/sh

# Delete file-uploader resources
kubectl delete all --all -n minio
kubectl delete ns minio

# Delete file-uploader resources
kubectl delete all --all -n development
kubectl delete ns development