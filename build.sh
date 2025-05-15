#!/usr/bin/env bash

VERSION=$1

# Build image
docker build --platform=linux/amd64 -t ppwcode/node-chrome:$VERSION -f Dockerfile.$VERSION .

# Add docker.io tags
docker tag ppwcode/node-chrome:$VERSION docker.io/ppwcode/node-chrome:$VERSION
docker tag ppwcode/node-chrome:$VERSION docker.io/ppwcode/node-chrome:latest
# Add AWS ECR tags
docker tag ppwcode/node-chrome:$VERSION public.ecr.aws/peopleware/ppwcode/node-chrome:$VERSION
docker tag ppwcode/node-chrome:$VERSION public.ecr.aws/peopleware/ppwcode/node-chrome:latest

# Login to docker.io
docker login
# Push to docker.io
docker push docker.io/ppwcode/node-chrome:$VERSION
docker push docker.io/ppwcode/node-chrome:latest

# Login to AWS ECR
aws --profile peopleware ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/peopleware
# Push to AWS ECR
docker push public.ecr.aws/peopleware/ppwcode/node-chrome:$VERSION
docker push public.ecr.aws/peopleware/ppwcode/node-chrome:latest
