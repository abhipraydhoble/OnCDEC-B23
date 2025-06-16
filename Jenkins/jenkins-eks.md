

## Create EKS Cluster
#### launch one instance t2.medium


**1:Install eksctl CLI tool for creating EKS Clusters on AWS**
##### download eksctl CLI tool for creating EKS Clusters on AWS
```` 
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
````
##### move eksctl setup to /usr/local/bin directory

````
sudo mv /tmp/eksctl /usr/local/bin
```` 
##### To check eksctl version
```` 
eksctl version
````

**2:Install kubectl**
Download the latest release with the command:
````
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
````

Install kubectl:
````
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
````
Note:
If you do not have root access on the target system, you can still install kubectl to the ~/.local/bin directory:
````
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
````
````
kubectl version --client
````

**3:Install AWS CLI on Ubuntu**
##### Download the aws cli bundle using below command
````
sudo apt install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
````


**4:Configure AWS CLI**
##### To connect AWS using CLI we have configure AWS user using below command
````
aws configure
````

**5:Create Amazon EKS cluster using eksctl**
````
eksctl create cluster --name my-ekscluster --region ap-southeast-1 --version 1.32 --nodegroup-name linux-nodes --node-type t2.micro --nodes 2
````
**6: Log In Into EKS cluster**
````
aws eks update-kubeconfig --name my-ekscluster
````
**7: Delete EKS Cluster**
````
eksctl delete cluster --name my-ekscluster --region ap-southeast-1
````
---
## Create IAM role & attach to EKS Host & Jenkins Server #

1) Create New Role using IAM service ( Select Usecase - ec2 ) 	
2) Add below permissions for the role <br/>
	- IAM - fullaccess <br/>
	- VPC - fullaccess <br/>
	- EC2 - fullaccess  <br/>
	- CloudFomration - fullaccess  <br/>
	- Administrator - acces <br/>
		
3) Enter Role Name (eksrole) 
4) Attach created role to EKS Management Host (Select EC2 => Click on Security => Modify IAM Role => attach IAM role we have created) 
5) Attach created role to Jenkins Machine (Select EC2 => Click on Security => Modify IAM Role => attach IAM role we have created) 
--- 

## Jenkins Server Setup in Linux VM #

Install Jenkins
````
sudo apt update -y
sudo apt install fontconfig openjdk-21-jre -y
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins
````

Copy jenkins admin pswd
```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
	  

##  Setup Docker in Jenkins ##
```
curl -fsSL get.docker.com | /bin/bash
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
sudo docker version
```
## Install AWS CLI in JENKINS Server #  

**Install AWS CLI**
```
sudo apt install unzip 
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
```
 
##  Install Kubectl in JENKINS Server #


```
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin
kubectl version --short --client
```

##  Update EKS Cluster Config File in Jenkins Server #
	
1) Execute below command in Eks Management host & copy kube config file data <br/>
	$ cat .kube/config 

2) Execute below commands in Jenkins Server and paste kube config file  <br/>
	$ cd /var/lib/jenkins <br/>
	$ sudo mkdir .kube  <br/>
	$ sudo vi .kube/config  <br/>

3) Execute below commands in Jenkins Server and paste kube config file for ubuntu user to check EKS Cluster info<br/>
	$ cd ~ <br/>
	$ ls -la  <br/>
	$ sudo vi .kube/config  <br/>

4) check eks nodes <br/>
	$ kubectl get nodes
---
check eks nodes
```
export KUBECONFIG=~/.kube/config
kubectl config current-context
kubectl get nodes
```
# check using jenkins pipeline 
1.install plugins:- stage,aws credential

2.create aws-cred in manage jenkins> credential

3.create pipeline
```
pipeline {
  agent any
  environment {
    KUBECONFIG = '/var/lib/jenkins/.kube/config'
  }
  stages {
    stage('Use AWS Credentials') {
      steps {
          withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-cred', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
          sh "aws sts get-caller-identity"
          sh "kubectl get nodes"
            }
      }
    }
}
}
```

Note: We should be able to see EKS cluster nodes in jenkins console and jenkins server 
# Delete eks cluster after use in eks-server
```
eksctl delete cluster --name my-ekscluster --region <your-region-name>
```
