# gha-wait-for-deployment
Polls a given url, looking for a specific json response

## CircleCI
``` yaml
  wait-for-deployment-dev:
    docker:
      - image: nodefortytwo/gha-terraform:latest
    steps:
      - run: |
          DESIRED_VALUE=${CIRCLE_SHA1} \
          sh /entrypoint.sh
    environment:
      MAX_TRIES: 20
      URL: https://admin.dev.createglobal.io/version
      SECONDS_BETWEEN_CHECKS: 30
      QUERY: .version
```
