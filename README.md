# AWS Batch Example

This is an example setup for an AWS Batch run environment!

## Quickstart

1. Build the stack in the batch_template.yaml

   ```
   $ aws cloudformation deploy --capabilities CAPABILITY_IAM --template-file batch_template.yaml --stack-name batch-example
   ```

2. Build & push the docker image to the ECR Repository created in the stack

   ```
   $ docker build --tag batch_example .
   $ $(aws ecr get-login --no-include-email)
   $ docker tag batch_example:latest $(aws cloudformation describe-stacks --stack-name batch-example --query "Stacks[0].Outputs[?OutputKey=='JobImageURL'].OutputValue" --output text):latest
   $ docker push $(aws cloudformation describe-stacks --stack-name batch-example --query "Stacks[0].Outputs[?OutputKey=='JobImageURL'].OutputValue" --output text):latest
   ```
