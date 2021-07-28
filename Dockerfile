FROM node:14.17.3-buster-slim

WORKDIR /app

ARG DEBIAN_FRONTEND=noninteractive
ENV NG_CLI_ANALYTICS=ci

# Make sure wget and curl are installed
RUN apt-get update
RUN apt-get install wget curl gnupg -y

# Download and setup google chrome repository
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list

# Perform package management for image usage to build/test angular apps
RUN apt-get update
RUN apt-get install google-chrome-stable -y
RUN apt-get upgrade -y

# Make sure we run the latest npm version and install the latest angular/cli version
RUN npm -g update
RUN npm install -g @angular/cli

# No entry point, run it your build/tests via a script, cmd example:
# docker run -it -v $(pwd):/app --entrypoint ./<your_node_npm_script>.sh <container_name>
