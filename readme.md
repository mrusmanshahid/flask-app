
## How to Run Locally

go to root folder where `Dockerfile` and `docker-compose` is located and run 

```
docker-compose up --build
```


## How to trigger deployment without GHA
- Configure AWS CLI with the access on AWS to create ECS, RDS, ALB etc
- Build your image locally using the command below
```
docker build . -t demo-flask-app:latest
```
- Goto `infra` folder and then modify `main.tf` with required information highlighted at the top under `locals`

- Once modified, run the following commands
```
terraform init
terraform plan
terraform apply
```

- Once applied it will provide you with the ECR endpoint if you haven't change the `service_name` under `infra/main.tf` then it will be something like `{ACCOUNT_ID}.dkr.ecr.{REGION}.amazonaws.com/demo-flask-app-repo:latest` or otherwise replace `demo-flask-app-repo` with `{YOUR_SERVICE_NAME}-repo`

- Login into ECR and Push locally build image using
```
ws ecr get-login-password --region "{REGION}" \
  | docker login --username AWS --password-stdin "{ACCOUNT_ID}.dkr.ecr.ap-south-1.amazonaws.com/demo-flask-app-repo"

docker tag demo-flask-app {ACCOUNT_ID}.dkr.ecr.{REGION}.amazonaws.com/demo-flask-app-repo:latest

docker push {ACCOUNT_ID}.dkr.ecr.{REGION}.amazonaws.com/demo-flask-app-repo:latest 
```

- The previous step should trigger the latest image which would deploy the latest version of the app further use the `dns` generated to serve the `app`. 


- The terraform is set to use the public `ip-address` but feel free to change it.


## How to trigger via GHA
- Merge this code to GH this will generate the action workflows
- Generate a release tag and push tag to GH, this will trigger the ECR deployment
- Then one of the deploy workflow to trigger the deployment, it will call the terrraform and would trigger the rest of it.
- These actions are set to use AWS_ACCESS_KEY_ID, AWS_ACCESS_SECRET and REGION from GH secret, if you are going to execute it on custom runners then please modify as per your needs.
