AWS cloud terminology
============================================================

* * *

 ![AWS Cloud terminology](http://cdn2.kerneltalks.com/wp-content/uploads/2017/03/AWS-Cloud-terminology-150x150.png) 

 _Understand AWS cloud terminology of 71 services! Get acquainted with terms used in AWS world to start with your AWS cloud career!_ 

* * *

AWS i.e. Amazon Web Services is cloud platform providing list of web services on pay per use basis. Its one of the famous cloud platform to date. Due to flexibility, availability, elasticity, scalability and no-maintenance many corporate are moving to cloud.  Since many companies using these services its become necessary that sysadmin or devOps should be aware of AWS.

This article aims at listing services provided by AWS and explaining terminology used in AWS world.

As of today, AWS offers total of 71 services which are grouped together in 17 groups as below :

* * *

 _Compute _ 

Its a cloud computing means virtual server provisioning. This group provides below services.

1.  EC2 : EC2 stands for Elastic Compute Cloud. This service provides you scalable [virtual machines per your requirement.][11]
2.  EC2 container service : Its high performance, high scalable which allows running services on EC2 clustered environment
3.  Lightsail : This service enables user to launch and manage virtual servers (EC2) very easily.
4.  Elastic Beanstalk : This service manages capacity provisioning, load balancing, scaling, health monitoring of your application automatically thus reducing your management load.
5.  Lambda : It allows to run your code only when needed without managing servers for it.
6.  Batch : It enables users to run computing workloads (batches) in customized managed way.

* * *

 _Storage_ 

Its a cloud storage i.e. cloud storage facility provided by Amazon. This group includes :

1.  S3 : S3 stands for Simple Storage Service (3 times S). This provides you online storage to store/retrive any data at any time, from anywhere.
2.  EFS : EFS stands for Elastic File System. Its a online storage which can be used with EC2 servers.
3.  Glacier : Its a low cost/slow performance data storage solution mainly aimed at archives or long term backups.
4.  Storage Gateway : Its interface which connects your on-premise applications (hosted outside AWS) with AWS storage.

* * *

 _Database_ 

AWS also offers to host databases on their Infra so that client can benefit with cutting edge tech Amazon have for faster/efficient/secured data processing. This group includes :

1.  RDS : RDS stands for Relational Database Service. Helps to setup, operate, manage relational database on cloud.
2.  DynamoDB : Its noSQL database providing fast processing and high scalability.
3.  ElastiCache : Its a way to manage in-memory cache for your web application to run them faster!
4.  Redshift : Its a huge (petabyte-size) fully scalable, data warehouse service in cloud.

* * *

 _Networking & Content Delivery_ 

As AWS provides cloud EC2 server, its corollary that networking will be in picture too. Content delivery is used to serve files to users from their geographically nearest location. This is pretty much famous for speeding up websites now a days.

1.  VPC : VPC stands for Virtual Private Cloud. Its your very own virtual network dedicated to your AWS account.
2.  CloudFront : Its content delivery network by AWS.
3.  Direct Connect : Its a network way of connecting your datacenter/premises with AWS to increase throughput, reduce network cost and avoid connectivity issues which may arise due to internet-based connectivity.
4.  Route 53 : Its a cloud domain name system DNS web service.

* * *

 _Migration_ 

Its a set of services to help you migrate from on-premises services to AWS. It includes :

1.  Application Discovery Service : A service dedicated to analyse your servers, network, application to help/speed up migration.
2.  DMS : DMS stands for Database Migration Service. It is used to migrate your data from on-premises DB to RDS or DB hosted on EC2.
3.  Server Migration : Also called as SMS (Server Migration Service) is a agentless service which moves your workloads from on-premises to AWS.
4.  Snowball :  Intended to use when you want to transfer huge amount of data in/out of AWS using physical storage appliances (rather than internet/network based transfers)

* * *

 _Developer Tools_ 

As name suggest, its a group of services helping developers to code easy/better way on cloud.

1.  CodeCommit : Its a secure, scalable, managed source control service to host code repositories.
2.  CodeBuild : Code builder on cloud. Executes, tests codes and build software packages for deployments.
3.  CodeDeploy : Deployment service to automate application deployments on AWS servers or on-premises.
4.  CodePipeline : This deployment service enables coders to visualize their application before release.
5.  X-Ray : Analyse applications with event calls.

* * *

 _Management Tools_ 

Group of services which helps you manage your web services in AWS cloud.

1.  CloudWatch : Monitoring service to monitor your AWS resources or applications.
2.  CloudFormation : Infrastructure as a code! Its way of managing AWS relative infra in collective and orderly manner.
3.  CloudTrail : Audit & compliance tool for AWS account.
4.  Config : AWS resource inventory, configuration history, and configuration change notifications to enable security and governance.
5.  OpsWorks : Automation to configure, deploy EC2 or on-premises compute
6.  Service Catalog : Create and manage IT service catalogs which are approved to use in your/company account
7.  Trusted Advisor : Its AWS AI helping you to have better, money saving AWS infra by inspecting your AWS Infra.
8.  Managed Service : Provides ongoing infra management

* * *

 _Security, Identity & compliance_ 

Important group of AWS services helping you secure your AWS space.

1.  IAM : IAM stands for Identity and Access Management. Controls user access to your AWS resources and services.
2.  Inspector : Automated security assessment helping you to secure and compliance your apps on AWS.
3.  Certificate Manager : Provision, manage and deploy SSL/TLS certificates for AWS applications.
4.  Directory Service : Its Microsoft Active Directory for AWS.
5.  WAF & Shield : WAF stands for Web Application Firewall. Monitors and controls access to your content on CloudFront or Load balancer.
6.  Compliance Reports : Compliance reporting of your AWS infra space to make sure your apps an dinfra are compliant to your policies.

* * *

 _Analytics_ 

Data analytics of your AWS space to help you see, plan, act on happenings in your account.

1.  Athena : Its a SQL based query service to analyse S3 stored data.
2.  EMR : EMR stands for Elastic Map Reduce. Service for big data processing and analysis.
3.  CloudSearch : Search capability of AWS within application and services.
4.  Elasticsearch Service : To create a domain and deploy, operate, and scale Elasticsearch clusters in the AWS Cloud
5.  Kinesis : Streams large amount of data in real time.
6.  Data Pipeline : Helps to move data between different AWS services.
7.  QuickSight : Collect, analyse and present insight of business data on AWS.

* * *

 _Artificial Intelligence_ 

AI in AWS!

1.  Lex : Helps to build conversational interfaces in application using voice and text.
2.  Polly : Its a text to speech service.
3.  Rekognition : Gives you ability to add image analysis to applications
4.  Machine Learning : It has algorithms to learn patterns in your data.

* * *

 _Internet of Things_ 

This service enables AWS highly available on different devices.

1.  AWS IoT : It lets connected hardware devices to interact with AWS applications.

* * *

 _Game Development_ 

As name suggest this services aims at Game Development.

1.  Amazon GameLift : This service aims for deplyoing, managing dedicated gaming servers for session based multiplayer games.

* * *

 _Mobile Services_ 

Group of services mainly aimed at handheld devices

1.  Mobile Hub : Helps you to create mobile app backend features and integrate them to mobile apps.
2.  Cognito : Controls mobile user’s authentication and access to AWS on internet connected devices.
3.  Device Farm : Mobile app testing service enables you to test apps across android, iOS on real phones hosted by AWS.
4.  Mobile Analytics : Measure, track and analyze mobile app data on AWS.
5.  Pinpoint : Targeted push notification and mobile engagements.

* * *

 _Application Services_ 

Its a group of services which can be used with your applications in AWS.

1.  Step Functions : Define and use various functions in your applications
2.  SWF : SWF stands for Simple Workflow Service. Its cloud workflow management helps developers to co-ordinate and contribute at different stages of application life cycle.
3.  API Gateway : Helps developers to create, manage, host APIs
4.  Elastic Transcoder : Helps developers to converts media files to play of various devices.

* * *

 _Messaging_ 

Notification and messaging services in AWS

1.  SQS : SQS stands for Simple Queue Service. Fully managed messaging queue service to communicate between services and apps in AWS.
2.  SNS : SNS stands for Simple Notification Service. Push notification service for AWS users to alert them about their services in AWS space.
3.  SES : SES stands for Simple Email Service. Its cost effective email service from AWS for its own customers.

* * *

 _Business Productivity_ 

Group of services to help boost your business productivity.

1.  WorkDocs : Collaborative file sharing, storing and editing service.
2.  WorkMail : Secured business mail, calendar service
3.  Amazon Chime : Online business meetings!

* * *

 _Desktop & App Streaming_ 

Its desktop app streaming over cloud.

1.  WorkSpaces : Fully managed, secured desktop computing service on cloud
2.  AppStream 2.0 : Stream desktop applications from cloud.

--------------------------------------------------------------------------------

via: http://kerneltalks.com/virtualization/aws-cloud-terminology/

作者：[Shrikant Lavhate][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://kerneltalks.com/virtualization/aws-cloud-terminology/
