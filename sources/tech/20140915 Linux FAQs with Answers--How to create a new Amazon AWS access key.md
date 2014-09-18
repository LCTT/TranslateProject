Translating by GOLinux ...
Linux FAQs with Answers--How to create a new Amazon AWS access key
================================================================================
> **Question**: I was asked to provide an **AWS access key ID** and **secret access key** when configuring an application which requires access to my Amazon AWS account. How can I create a new AWS access key? 

Amazon AWS security credentials are used to authenticate you and authorize any third-party application to access your AWS account. There are different types of AWS security credentials available, e.g., password, access key, multi-factor authentication, X.509 certificates, etc.

If you want to create a new access key (access key ID and secret access key), here is how to do it.

First, log in to [AWS console][1].

Choose "Security Credentials" menu from the top bar.

![](https://farm4.staticflickr.com/3855/14987093969_b106406596_o.png)

In the next page, choose "Access Keys (Access Key ID and Secret Access Key) option.

![](https://farm6.staticflickr.com/5584/15173842295_6110021f8f_z.jpg)

In the next page, you will see a list of existing access key IDs (if any). Note that you cannot retrieve "secret access keys" of existing access key IDs. For security reason, a secret access key is visible only at the time you create a new access key.

![](https://farm4.staticflickr.com/3897/15150859306_cd25d519be_o.png)

Click on "Create New Access Key", and it will create a new pair of access key ID and secret access key instantly.

![](https://farm4.staticflickr.com/3919/14987346068_232e8c73cd_z.jpg)

Either download a key file which contains a new access key, or copy and paste a new access key information. Again remember. Once you close this window, the secret access key will not be available again unless you download a key file.

### Multi-User AWS Account ###

If you are a corporate which has a corporate AWS account shared by multiple employees, you may want to use Identity and Access Management (IAM) to create and manage their access keys.

IAM is a web service which allows a corporate to manage multiple users and their associated security credentials under a single AWS account. Using IAM, multiple users can sign in as different identities under a single AWS account, and manage their own security credentials without tampering with each other's keys.

To manage IAM users, click on "Users" menu on the "Security Credentials" page.

![](https://farm6.staticflickr.com/5589/14987486468_a9120b1f8e_z.jpg)

Then you can create a new IAM user and manage their security credentials such as access keys.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/create-amazon-aws-access-key.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://aws.amazon.com/console/
