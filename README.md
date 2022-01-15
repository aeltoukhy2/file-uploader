
## Architecture
![File Uploader DevOps Architecture](https://github.com/aeltoukhy2/file-uploader/raw/main/docs/file-uploader_arch.png)

 - Git Repo including:
	 - File uploader app: python app that upload persistent file using minio.
	 - Kubernetes declarative files including:
		 - ArgoCD: GitOps CD tool for Kubernetes.
		 - Minio: Kubernetes deployment files to create all Minio resources.
		 - FileUpload: create FileUpload resources (namespace, deployment, and service).
 - GitHub Actions workflow: use Dockerfile to create docker image for FileUploader app and push it on GitHub container registry.
 
## Setup
- Running Kubernetes cluster and kubectl.
- Run ./setup.sh

## What I didn't do because of time
- Provisioning Kubernetes cluster.
- Adding unit test runner in Github Actions workflow.


