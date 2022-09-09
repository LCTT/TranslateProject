[#]: subject: "How to Setup EKS Cluster along with NLB on AWS"
[#]: via: "https://www.linuxtechi.com/how-to-setup-eks-cluster-nlb-on-aws/"
[#]: author: "Pradeep Kumar https://www.linuxtechi.com/author/pradeep/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Setup EKS Cluster along with NLB on AWS
======
Are looking for an easy guide for setting up EKS cluster on AWS?

The step-by-step guide on this page will show you how to setup EKS cluster along with NLB (Network Load Balancer) on AWS from the scratch.

Amazon EKS is elastic Kubernetes service; it has basically two components control plane and worker nodes. Let’s deep dive into the steps

### 1) Create VPC for EKS Cluster

Login to your AWS console, create a VPC with two public and private subnets in two different availability zones.

Also create Internet gateway,  nat gateway and add routes to public and private subnet’s route table respectively.

Refer following for creating VPC,

* [How to Configure your own VPC(Virtual Private Cloud) in AWS][1]

In my case, I have created following VPC, subnets, internet & nat gateway and route tables.

![VPC-for-EKS-Cluster][2]

### 2) Install and Configure AWS CLI, eksctl and kubectl

Create a virtual machine either on your on-premises or on AWS. Make sure internet connectivity is there on that virtual machine. In my case, I have created a Ubuntu 22.04 virtual machine.

Login to the virtual machine and install AWS cli using the following steps,

```
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
$ unzip awscliv2.zip
$ sudo ./aws/install
```

Get you account’s access and secret key from AWS console.

![AWS-Account-Access-Secret-Keys][3]

Now, run following command to configure AWS CLI,

```
$ aws configure
```

It will prompt you to enter Access Key and Secret Key.

![AWS-Cli-configure-Ubuntu-22-04][4]

Once above command is executed successfully then it will create two files under .aws folder,

* Config
* Credentials

Run following command to test aws cli,

```
$ aws sts get-caller-identity
{
    "UserId": "xxxxxxxxxxxx",
    "Account": "xxxxxxxxxx",
    "Arn": "arn:aws:iam::xxxxxxxxxxx:root"
}
$
```

We will be using eksctl command line utility to configure Amazon EKS cluster, so run following set of commands to install it.

```
$ curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
$ sudo mv /tmp/eksctl /usr/local/bin
$ eksctl version
0.109.0
$
```

Kubectl is also a command line tool which will allow us to interact with eks cluster. For it’s installation, run beneath commands one after the another

```
$ curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
$ sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
$ kubectl version --client
```

![kubectl-install-for-eks-ubuntu][5]

Perfect, we are ready now to create EKS cluster using eksctl utility.

Copy public and private subnet’s ids of your VPC from VPC console. We would be using these ids in cluster yaml file.

![Subnet-Ids-VPC-Console-AWS][6]

### 3) Create EKS Cluster with eksctl utility

Create a cluster yaml file on your virtual machine with the following content,

```
$ vi demo-eks.yaml
apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig
metadata:
  name: demo-eks
  region: us-west-2
vpc:
  subnets:
    private:
      us-west-2a: { id: subnet-077d8aa1452f14836 }
      us-west-2b: { id: subnet-0131b18ab955c0c85 }
    public:
      us-west-2a: { id: subnet-0331b5df019a333b5 }
      us-west-2b: { id: subnet-0f92db1ada42abde3 }

nodeGroups:
  - name: ng-workers
    labels: { role: workers }
    instanceType: t2.micro
    desiredCapacity: 2
    privateNetworking: true
    iam:
      withAddonPolicies:
        imageBuilder: true
    ssh:
      publicKeyPath: /home/linuxtechi/.ssh/id_rsa.pub
```

![eks-cluster-yaml-file][7]

Here we are using public subnets for control plane and private subnets for worker nodes. It will also automatically create IAM roles and security group for control plane and worker nodes.

Apart from this we are also using a node group named ‘ng-workers’ for worker nodes with desired capacity two and instance type as ‘t2.micro’. Moreover, we have mentioned ‘linuxtechi’ user’s public key so that we can ssh worker nodes.

Note: Please change these parameters as per your setup.

Run following eksctl command to initiate EKS cluster setup,

```
$ eksctl create cluster -f demo-eks.yaml
```

![eksctl-create-cluster-aws][8]

Once the cluster is setup successfully, we will get the following output,

![EKS-Cluster-Ready-Message-AWS][9]

Great, output above confirms that EKS cluster is ready. Run following kubectl command to view status of worker nodes,

```
$ kubectl get nodes
```

![EKS-Cluster-Nodes-Kubectl-Command][10]

Head back to AWS console, verify the EKS cluster status

![EKS-Cluster-Status-AWS-Console][11]

Now, let’s deploy ingress controller along with NLB so that application from this cluster is accessible from outside.

### 4) Deploy Ingress Controller and NLB


We will be deploying nginx based ingress controller, download the following yaml file using wget command

```
$ wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/aws/deploy.yaml
```

Change the parameter ‘externalTrafficPolicy: Local’ to ‘externalTrafficPolicy: Cluster’

Note: This yaml file has the required entries of nginx ingress controller and AWS NLB.

```
$ sed  -i 's/externalTrafficPolicy: Local/externalTrafficPolicy: Cluster/g' deploy.yaml
```

Execute following kubectl command to deploy ingress controller and NLB,

```
$ kubectl create -f deploy.yaml
```

Output,

![deploy-yaml-file-ingress-nlb-aws][12]

To verify the status of ingress controller, run following commands,

```
$ kubectl get ns
$ kubectl get all -n ingress-nginx
```

Output,

![Ingress-Controller-Status-AWS-EKS][13]

Head back to AWS console and check NLB status which is created via deploy.yaml file.

![NLB-for-EKS-AWS-Console][14]

Perfect, above confirms that NLB has been setup properly for EKS cluster.

### 5) Test EKS Cluster Installation

To test eks cluster installation, let’s deploy a nginx based deployment, run

```
$ kubectl create deployment nginx-web --image=nginx --replicas=2
```

Create the service for deployment, run

```
$ kubectl expose deployment nginx-web --name=nginx-web --type=LoadBalancer --port=80 --protocol=TCP
```

View Service status,

```
$ kubectl get svc nginx-web
```

Output of above commands would look like below:

![Nginx-Based-Deployment-EKS-AWS][15]

To access the application, copy the URL shown in service command,

http://ad575eea69f5044f0ac8ac8d5f19b7bd-1003212167.us-west-2.elb.amazonaws.com

![Nginx-Default-Page-deployment-eks-aws][16]

Great, above nginx page confirms that we are able to access our nginx based deployment outside of our EKS cluster.

Once you are done with all the testing and wants to remove the NLB and EKS cluster, run following commands,

```
$ kubectl delete -f deploy.yaml
$ eksctl delete cluster -f demo-eks.yaml
```

That’s all from this guide, I hope you are able to deploy EKS cluster on your AWS account. Kindly do post your queries and feedback in below comments section.

Also Read: How to Create VPC Peering Across Two AWS Regions

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/how-to-setup-eks-cluster-nlb-on-aws/

作者：[Pradeep Kumar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lkxed
[1]: https://www.linuxtechi.com/how-to-configure-vpc-in-aws/
[2]: https://www.linuxtechi.com/wp-content/uploads/2022/08/VPC-for-EKS-Cluster.gif
[3]: https://www.linuxtechi.com/wp-content/uploads/2022/08/AWS-Account-Access-Secret-Keys.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2022/08/AWS-Cli-configure-Ubuntu-22-04.png
[5]: https://www.linuxtechi.com/wp-content/uploads/2022/08/kubectl-install-for-eks-ubuntu.png
[6]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Subnet-Ids-VPC-Console-AWS.png
[7]: https://www.linuxtechi.com/wp-content/uploads/2022/08/eks-cluster-yaml-file.png
[8]: https://www.linuxtechi.com/wp-content/uploads/2022/08/eksctl-create-cluster-aws.png
[9]: https://www.linuxtechi.com/wp-content/uploads/2022/08/EKS-Cluster-Ready-Message-AWS.png
[10]: https://www.linuxtechi.com/wp-content/uploads/2022/08/EKS-Cluster-Nodes-Kubectl-Command.png
[11]: https://www.linuxtechi.com/wp-content/uploads/2022/08/EKS-Cluster-Status-AWS-Console.gif
[12]: https://www.linuxtechi.com/wp-content/uploads/2022/08/deploy-yaml-file-ingress-nlb-aws.png
[13]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Ingress-Controller-Status-AWS-EKS.png
[14]: https://www.linuxtechi.com/wp-content/uploads/2022/08/NLB-for-EKS-AWS-Console.gif
[15]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Nginx-Based-Deployment-EKS-AWS.png
[16]: https://www.linuxtechi.com/wp-content/uploads/2022/08/Nginx-Default-Page-deployment-eks-aws.png
