# docker-node-chrome

A docker image used for build and testing of Angular application based on node:XX.XX-slim with Google Chrome, curl and wget pre-installed. No entry point has been defined for usage, please defined your own entry point with a script to trigger the desired behaviour of the image.

A example of a cmd line to use:

`docker run -it -rm -v $(pwd):/app --entrypoint <your_node_npm_script>.sh <container_name>`

Mount your Angular application by executing the above cmd in your Angular application root directory. And supplying a shell script to trigger a build or test.

A shell script could for example be:

```
    #!/bin/bash
    ## Build with the CI profile
    npm ci --no-progress
   
    ## And run the CI and build tests
    npm run test:ci
    npm run build:test
```

Maintainer: [Peopleware NV](http://www.peopleware.be)
