[#]: subject: "How to Install AWS CLI on Linux Step-by-Step"
[#]: via: "https://www.linuxtechi.com/how-to-install-aws-cli-on-linux/"
[#]: author: "Pradeep Kumar https://www.linuxtechi.com/author/pradeep/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install AWS CLI on Linux Step-by-Step
======

This post describes how to install latest version of AWS CLI on a linux system step-by-step. AWS CLI is a command line interface which allows us to interact with our AWS account. Developer and sysadmin use aws cli to perform day to day activities and automation.

##### Prerequisites

- Pre-Installed Linux System
- Sudo User with admin rights
- Internet Connectivity

Without any further delay, let’s jump into AWS Cli installations steps.

### 1) Download installation file

Open the terminal and run following curl command to download aws cli installation file,

```
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
```

Above command will download file as ‘awscliv2.zip’ in current working directory.

Execute below [ls command][1] to verify downloaded file,

```
$ ls -l awscliv2.zip -rw-rw-r-- 1 linuxtechi linuxtechi 47244662 Oct 20 10:53 awscliv2.zip $
```

### 2) Unzip downloaded installation file

Run beneath [unzip command][2] to unzip the installer.

if(typeof ez_ad_units != 'undefined'){ez_ad_units.push([[300,250],'linuxtechi_com-medrectangle-3','ezslot_6',320,'0','0'])};__ez_fad_position('div-gpt-ad-linuxtechi_com-medrectangle-3-0');

```
$ unzip awscliv2.zip
```

It will create aws folder in present working directory and unzip all required files into it.

```
$ ls -ld aws drwxr-xr-x 3 linuxtechi linuxtechi 4096 Oct 19 17:18 aws $
```

### 3) Run install script

To install aws cli, run following install script,

```
$ sudo ./aws/install
```

Script will install all files under /usr/local/aws-cli and will create symbolic link in /usr/local/bin.

if(typeof ez_ad_units != 'undefined'){ez_ad_units.push([[300,250],'linuxtechi_com-medrectangle-4','ezslot_7',340,'0','0'])};__ez_fad_position('div-gpt-ad-linuxtechi_com-medrectangle-4-0');

### 4) Verify AWS CLI version

To verify the aws cli version, run

```
$ aws --version aws-cli/2.8.4 Python/3.9.11 Linux/5.15.0-48-generic exe/x86_64.ubuntu.22 prompt/off $
```

### 5) Configure AWS CLI

To verify the AWS Cli installation, let’s configure aws cli.

Login to your AWS management console and retrieve AWS access key id and secret access key.

In case it is not created yet then create access key ID and secret access key. Copy these keys somewhere safe.

Now head back to Linux terminal, run following aws command,

if(typeof ez_ad_units != 'undefined'){ez_ad_units.push([[250,250],'linuxtechi_com-box-4','ezslot_8',260,'0','0'])};__ez_fad_position('div-gpt-ad-linuxtechi_com-box-4-0');

```
$ aws configure AWS Access Key ID [None]: xxxxxxxxxxxxxxxxxxx AWS Secret Access Key [None]: xxxxxxxxxxxxxxxxxxx Default region name [None]: us-west-2 Default output format [None]: json $
```

Above credentials will be saved in following file,

```
$ cat  ~/.aws/credentials
```

Output of above commands,

Run aws command to list s3 bucket and vpc of your account.

```
$ aws s3 ls $ aws ec2 describe-vpcs
```

Output,

Output above confirms that aws cli has been configured successfully.

That’s all from this post, please do post your queries and feedback in below comments sections.

if(typeof ez_ad_units != 'undefined'){ez_ad_units.push([[250,250],'linuxtechi_com-banner-1','ezslot_9',360,'0','0'])};__ez_fad_position('div-gpt-ad-linuxtechi_com-banner-1-0');

Also Read:[How to Setup EKS Cluster along with NLB on AWS][3]

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/how-to-install-aws-cli-on-linux/

作者：[Pradeep Kumar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lkxed
[1]: https://www.linuxtechi.com/linux-ls-command-examples-beginners/
[2]: https://www.linuxtechi.com/linux-zip-unzip-command-examples/
[3]: https://www.linuxtechi.com/how-to-setup-eks-cluster-nlb-on-aws/
