AWS_PROFILE=datadev
REGION=us-east-1
ACCOUNT_ID=107714303354

deploy:
	aws ecr get-login-password --profile $(AWS_PROFILE) --region $(REGION) | docker login --username AWS --password-stdin $(ACCOUNT_ID).dkr.ecr.$(REGION).amazonaws.com
	docker build --no-cache --platform="linux/amd64" -t ml-ops-v1 .
	docker tag ml-ops-v1:latest $(ACCOUNT_ID).dkr.ecr.$(REGION).amazonaws.com/ml-ops-v1:latest
	docker push $(ACCOUNT_ID).dkr.ecr.$(REGION).amazonaws.com/ml-ops-v1:latest