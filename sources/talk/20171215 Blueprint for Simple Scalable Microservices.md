Blueprint for Simple Scalable Microservices
======

![](https://ryanmccue.ca/content/images/2017/12/Copy-of-Copy-of-Electric-Love--1-.png)

When you're building a microservice, what do you value? A fully managed and scalable system? It's hard to know where to start with AWS; there are so many options for hosting code, you can use EC2, ECS, Elastic Beanstalk, Lambda. Everyone has patterns for deploying microservices. Using the pattern below will provide a great structure for a scalable microservice architecture.

### Elastic Beanstalk

The first and most important piece is [Elastic Beanstalk][1]. It is a great, simple way to deploy auto-scaling microservices. All you need to do is upload your code to Elastic Beanstalk via their command line tool or management console. Once it's in Elastic Beanstalk the deployment, capacity provisioning, load balancing, auto-scaling is handled by AWS.

### S3

Another important service is [S3][2]; it is an object storage built to store and retrieve data. S3 has lots of uses, from storing images, to backups. Particular use cases are storing sensitive files such as private keys, environment variable files which will be accessed and used by multiple instances or services. Finally, using S3 for less sensitive, publically accessible files like configuration files, Dockerfiles, and images.

### Kinesis

[Kinesis][3] is a tool which allows for microservices to communicate with each other and other projects like Lambda, which we will discuss farther down. Kinesis does this by real-time, persistent data streaming, which enables microservices to emit events. Data can be persisted for up to 7 days for persistent and batch processing.

### RDS

[Amazon RDS][4] is a great, fully managed relational database hosted by AWS. Using RDS over your own database server is beneficial because AWS manages everything. It makes it easy to set up, operate, and scale a relational databases.

### Lambda

Finally, [AWS Lambda][5] lets you run code without provisioning or managing servers. Lambda has many uses; you can even create the whole APIs with it. Some great uses for it in a microservice architecture are cron jobs and image manipulation. Crons can be scheduled with [CloudWatch][6].

### Conclusion

These AWS products you can create fully scalable, stateless microservices that can communicate with each other. Using Elastic Beanstalk to run microservices, S3 to store files, Kinesis to emit events and Lambdas to subscribe to them and run other tasks. Finally, RDS for easily managing and scaling relational databases.

--------------------------------------------------------------------------------

via: https://ryanmccue.ca/blueprint-for-simple-scalable-microservices/

作者：[Ryan McCue][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://ryanmccue.ca/author/ryan/
[1]:https://aws.amazon.com/elasticbeanstalk/?nc2=h_m1
[2]:https://aws.amazon.com/s3/?nc2=h_m1
[3]:https://aws.amazon.com/kinesis/?nc2=h_m1
[4]:https://aws.amazon.com/rds/?nc2=h_m1
[5]:https://aws.amazon.com/lambda/?nc2=h_m1
[6]:https://aws.amazon.com/cloudwatch/?nc2=h_m1
