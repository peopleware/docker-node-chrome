#!/usr/bin/env bash

VERSION=$1

docker build --platform=linux/amd64 -t ppwcode/node-chrome:$VERSION -f Dockerfile.$VERSION .

docker login

docker tag ppwcode/node-chrome:$VERSION docker.io/ppwcode/node-chrome:$VERSION
docker tag ppwcode/node-chrome:$VERSION docker.io/ppwcode/node-chrome:latest
docker push docker.io/ppwcode/node-chrome:$VERSION
docker push docker.io/ppwcode/node-chrome:latest

aws --profile peopleware ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/peopleware

docker tag ppwcode/node-chrome:$VERSION public.ecr.aws/peopleware/ppwcode/node-chrome:$VERSION
docker tag ppwcode/node-chrome:$VERSION public.ecr.aws/peopleware/ppwcode/node-chrome:latest
docker push public.ecr.aws/peopleware/ppwcode/node-chrome:$VERSION
docker push public.ecr.aws/peopleware/ppwcode/node-chrome:latest
