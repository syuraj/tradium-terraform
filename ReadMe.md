### How to deploy a hello-world nodejs app into aws eks using Terraform and Kubernets

* Run `./terraform` to create aws vpc, eks and all other aws resources (subnets, security groups, roles)
* Buld the docker image of the nodejs app
    * `cd ./app && docker build . -t tradium-node-app`
* Upload docker image into aws elastic container registry
    * Login to aws ecr `aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 068852463551.dkr.ecr.us-east-1.amazonaws.com/ss-eks-ecr`
    * Tag the above docker image using aws ecr address `docker tag tradium-node-app 068852463551.dkr.ecr.us-east-1.amazonaws.com/ss-eks-ecr:tradium-node-app-1`
    * Push to aws ecr `docker push 068852463551.dkr.ecr.us-east-1.amazonaws.com/ss-eks-ecr:tradium-node-app-1`
* Copy aws ecr image uri. e.g. `068852463551.dkr.ecr.us-east-1.amazonaws.com/ss-eks-ecr:tradium-node-app-1` and put into image field of `statefulset.yaml`
* Run `./kubernetes`
    * `kubectl apply -f service.yaml`
    * `kubectl apply -f statefulset.yaml`