How to open port on AWS EC2 Linux server
============================================================


 ![Open port on AWS EC2 Linux](http://cdn2.kerneltalks.com/wp-content/uploads/2017/03/Open-port-on-AWS-EC2-Linux-150x150.jpg) 

 _Small tutorial with screenshots which shows how to open port on AWS EC2 Linux server. This will help you to manage port specific services on EC2 server._ 

* * *

AWS i.e. Amazon Web Services is no new term for IT world. Its a cloud services platform offered by Amazon. Under its Free tier account it offers you limited services free of cost for one year. This is one of best place to try out new technologies without spending much on financial front.

AWS offers server computing as one of their services and they call them as EC (Elastic Computing). Under this we can build our Linux servers. We have already seen [how to setup Linux server on AWS free of cost][11].

By default, all Linux servers build under EC2 has post 22 i.e. SSH service port (inbound from all IP) is open only. So, if you are hosting any port specific service then relative port needs to be open on AWS firewall for your server.

Also it has port 1 to 65535 are open too (outbound for all traffic). If you want to change this you can use same below process for editing outbound rules too.

Setting up firewall rule on AWS for your server is easy job. You will be able to open ports in seconds for your server. I will walk you through procedure with screenshots to open port for EC2 server.

 _Step 1 :_ 

Login to AWS account and navigate to EC2 management console. Goto Security Groups under Network & Security menu as highlighted below :

 ![AWS EC2 management console](http://cdn2.kerneltalks.com/wp-content/uploads/2017/03/AWS-EC2-management-console.jpg) 



* * *

 _Step 2 :_ 

On Security Groups screen select you r EC2 server and under Actions menu select Edit inbound rules

 ![AWS inbound rules](http://cdn2.kerneltalks.com/wp-content/uploads/2017/03/AWS-inbound-rules.jpg) 



 _Step 3:_ 

Now you will be presented with inbound rule window. You can add/edit/delete inbound rules here. There are several protocols like http, nfs etc listed in dropdown menu which auto-populate ports for you. If you have custom service and port you can define it too.

 ![AWS add inbound rule](http://cdn2.kerneltalks.com/wp-content/uploads/2017/03/AWS-add-inbound-rule.jpg) 


For example if you want to open port 80 then you have to select :

*   Type : http
*   Protocol : TCP
*   Port range : 80
*   Source : Anywhere (Open port 80 for all incoming req from any IP (0.0.0.0/0),  My IP : then it will auto populate your current public internet IP

* * *

 _Step 4:_ 

Thats it. Once you save these settings your server inbound port 80 is open! you can check by telneting to port 80 ofor your EC2 server public DNS (can be found it EC2 server details)

You can also check it on websites like [ping.eu][12].

--------------------------------------------------------------------------------

via: http://kerneltalks.com/virtualization/how-to-open-port-on-aws-ec2-linux-server/

作者：[Shrikant Lavhate ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://kerneltalks.com/virtualization/how-to-open-port-on-aws-ec2-linux-server/
[1]:http://kerneltalks.com/virtualization/how-to-open-port-on-aws-ec2-linux-server/#
[2]:http://kerneltalks.com/virtualization/how-to-open-port-on-aws-ec2-linux-server/#
[3]:http://kerneltalks.com/virtualization/how-to-open-port-on-aws-ec2-linux-server/#
[4]:http://kerneltalks.com/virtualization/how-to-open-port-on-aws-ec2-linux-server/#
[5]:http://kerneltalks.com/virtualization/how-to-open-port-on-aws-ec2-linux-server/#
[6]:http://kerneltalks.com/virtualization/how-to-open-port-on-aws-ec2-linux-server/#
[7]:http://kerneltalks.com/virtualization/how-to-open-port-on-aws-ec2-linux-server/#
[8]:http://kerneltalks.com/virtualization/how-to-open-port-on-aws-ec2-linux-server/#
[9]:http://kerneltalks.com/virtualization/how-to-open-port-on-aws-ec2-linux-server/#
[10]:http://kerneltalks.com/author/shrikant/
[11]:http://kerneltalks.com/howto/install-ec2-linux-server-aws-with-screenshots/
[12]:http://ping.eu/port-chk/
