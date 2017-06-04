How to Install and Configure GitLab on Ubuntu 16.04
============================================================

### On this page

1.  [Step 1 - Install required Ubuntu Packages][1]

2.  [Step 2 - Install Gitlab][2]

3.  [Step 3 - Configure Gitlab Main URL][3]

4.  [Step 4 - Generate SSL Let's encrypt and DHPARAM Certificate][4]

5.  [Step 5 - Enable Nginx HTTPS for GitLab][5]

6.  [Step 6 - Configure UFW Firewall][6]

7.  [Step 7 - Gitlab post-installation][7]

8.  [Step 8 - Testing][8]

9.  [Preferences][9]

GitLab is an open source GIT repository manager based on Rails and developed by GitLab Inc. It is a web-based GIT repository manager that allows your team to work on code, track bugs and feature requests and to test and deploy applications. GitLab provides features like a wiki, issue tracking, code reviews, activity feeds and merge management. It is capable of hosting multiple projects.

GitLab is available in four editions:

1.  Gitlab CE (Community Edition) - self-hosted, free and support from the Community forum.

2.  Gitlab EE (Enterprise Edition) - self-hosted, paid app, comes with additional features.

3.  GitLab.com - SaaS, free.

4.  GitLab.io - Private GitLab instance managed by GitLab Inc.

In this tutorial, I will show you step-by-step how to install GitLab CE (Community Edition) on your own Ubuntu 16.04 Xenial Xerus server. In this tutorial, I will be using the 'omnibus' package provided by GitLab for easy installation.

**What we will do:**

1.  Install Packages

2.  Install GitLab

3.  Configure GitLab URL

4.  Generate SSL Let's encrypt and DHPARAM Certificate

5.  Enable Nginx HTTPS for GitLab

6.  Configure UFW Firewall

7.  Perform the GitLab Installation

8.  Testing

**Prerequisites**

*   Ubuntu 16.04 Server - 64bit

*   Min RAM 2GB

*   Root Privileges

### Step 1 - Install required Ubuntu Packages

The first step is to install the packages needed for the GitLab installation. Please log in to the server as root user and upddate the Ubuntu repository.

```
ssh root@GitLabServer
apt-get update
```

Now install the packages including curl for downloading the GitLab repository, ca-certificates, and postfix for the SMTP configuration.

Install all packages with the apt command below.

```
sudo apt install curl openssh-server ca-certificates postfix
```

During postfix installation, you will be prompted about the configuration, select 'Internet Site'.

 [![Configure Postfix on Ubuntu](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/1.png)][13] 

and then enter the server domain name that shall be used for sending an email.

 [![Configure Postfix hostame on ubuntu](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/2.png)][14] 

### Step 2 - Install Gitlab

In this step, we will install GitLab using the omnibus packages. Omnibus will install all packages, services, and tools required for running GitLab on your server.

Add GitLab repository with the curl command.

```
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
```

 [![Adding GitLab Repository to Ubuntu 16.04](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/3.png)][15] 

And then install GitLab CE Community Edition with the apt command.

```
sudo apt install gitlab-ce
```

Wait for the server to download and install the gitlab package. When the installation is complete, you will see the results as below.

 [![Install GitLab](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/Nano.png)][16] 

### Step 3 - Configure Gitlab Main URL

Now we should configure the URL that will be used to access our GitLab server. I will use the domain name 'gitlab.hakase-labs.co' for the GitLab URL here (please choose your own domain name) and I'll use HTTPS for users access security.

The main configuration of GitLab is in the '/etc/gitlab' directory. Go to that directory and edit the configuration file 'gitlab.rb' with vim.

```
cd /etc/gitlab
vim gitlab.rb
```

In the GitLab configuration go to line 9 'external_url' and change the URL to your URL 'gitlab.hakase-labs.co'.

external_url 'http://gitlab.hakase-labs.co'

Save the file and exit the editor. In the next step will enable HTTPS for GitLab.

 [![Configure GitLab main URL](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/41.png)][17] 

### Step 4 - Generate SSL Let's encrypt and DHPARAM Certificate

In this step, we will enable the HTTPS protocol for GitLab. I will use a free SSL certificates provided by let's encrypt for the gitlab domain name.

Install letsencrypt command-line tool with apt command.

```
sudo apt install letsencrypt -y
```

When the installation is complete, generate a new certificate for the gitlab domain name with the command below.

```
letsencrypt certonly -d gitlab.hakase-labs.co
```

Enter your email address for the SSL certificate renew notification.

 [![Generate SSL Certificate on Ubuntu 16.04](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/5.png)][18] 

Choose 'Agree' for the Let's Encrypt Terms of Services and wait.

 [![Agreement of Letsencrypt TOS ](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/6.png)][19] 

When it's done, you will see the result below.

 [![SSL Letsencrypt certificate has been generated](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/7.png)][20] 

New Let's encrypt certificate files for GitLab have been generated. You can find the certificate files in the '/etc/letsencrypt/live' directory.

Next, create a new directory named 'ssl' under the GitLab configuration directory.

```
mkdir -p /etc/gitlab/ssl/
```

And generate dhparam pem files in the ssl directory with the openssl command.

```
sudo openssl dhparam -out /etc/gitlab/ssl/dhparams.pem 2048
```

 [![Generate DHPARAM certificate with openssl](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/8.png)][21] 

Now change the permissions of the certificate files to 600.

```
chmod 600 /etc/gitlab/ssl/*
```

The SSL Let's encrypt cert for GitLab and the DHPARAM certificate has been generated.

### Step 5 - Enable Nginx HTTPS for GitLab

At this stage, we have the certificate files from Letsencrypt in '/etc/letsencrypt/live' directory and the DHPARAM certificate in the '/etc/gitlab/ssl' directory.

In this step, we will configure a GitLab to use our certificate files. Go to the '/etc/gitlab' directory, then edit 'gitlab.rb' configuration with vim.

```
cd /etc/gitlab/
vim gitlab.rb
```

Change the external url to use 'https' instead of 'http'.

external_url 'https://gitlab.hakase-labs.co'

Then add the new SSL configuration for gitlab as below.

nginx['redirect_http_to_https'] = true
nginx['ssl_certificate'] = "/etc/letsencrypt/live/gitlab.hakase-labs.co/fullchain.pem"
nginx['ssl_certificate_key'] = "/etc/letsencrypt/live/gitlab.hakase-labs.co/privkey.pem"
nginx['ssl_dhparam'] = "/etc/gitlab/ssl/dhparams.pem"

**Note:**

We will enable HTTP to HTTPS redirect in gitlab.

Save the file and exit vim.

 [![Enable HTTPS on GitLab and enable Redirect HTTP to HTTPS GitLab](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/9.png)][22] 

Now we need to run the command below as root to apply the new gitlab configuration.

```
sudo gitlab-ctl reconfigure
```

You will see the results as below.

 [![Apply GitLab configuration has been completed](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/10.png)][23] 

HTTPS Configuration for GitLab has been completed.

### Step 6 - Configure UFW Firewall

In this step, we will enable the UFW firewall. It's already installed on the system, we just need to start the service. We will run GitLab behind the UFW firewall, so we must open the HTTP and HTTPS ports.

Enable UFW firewall with the command below.

```
ufw enable
```

The command will run ufw service and add it to start automatically at the boot time.

Next, open new ports ssh, HTTP, and HTTPS.

```
ufw allow ssh
ufw allow http
ufw allow https
```

 [![Allowing HTTP and HTTPS UFW Firewall Ubuntu](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/11.png)][24] 

Now check the firewall status and make sure ssh, http, and https ports is on the list.

```
ufw status
```

HTTP and HTTPS ports are configured.

 [![Checking UFW Rules Ubuntu ](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/12.png)][25] 

### Step 7 - Gitlab post-installation

GitLab has been installed to the system, and it's running behind the UFW firewall. In this step, we will do some quick settings like changing password, username and profile settings.

Open your web browser and type in the gitlab URL, mine is 'gitlab.hakase-labs.co'. You will be redirected to the HTTPS connection.

**Reset GitLab root password**

 [![Reset GitLab Default Password After Installation](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/13.png)][26] 

Now login to GitLab with user 'root' and with your password.

 [![GitLab Login as default user root](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/14.png)][27] 

**Change Username and Profile**

On the top right corner, click your profile and choose 'Profile Settings'.

 [![Change GitLab default profile](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/15.png)][28] 

On the profile tab, exchange the default name with your name and email with your email address. Now click 'Update Profile'.

 [![Change Default Username and Email for GitLab](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/16.png)][29] 

Click on the tab 'Account', change username with your own username. Then click 'Update Username'.

 [![Chagne Default Username gitLab](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/17.png)][30] 

**Add SSH Key**

Make sure you already have a key, if you do not have an SSH key, you can generate with it with the command below.

```
ssh-keygen
```

And you will get two keys, 'id_rsa' your private key and 'id_rsa.pub' your public key.

 [![Generate new SSH Key on Ubuntu](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/18.png)][31] 

Next, click on the tab 'SSH Key', copy the content of 'id_rsa.pub' file and paste to the key box, and click 'Add Key'.

 [![Add SSH Key to GitLab](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/19.png)][32] 

New SSH Key has been added.

**Sign up Restrictions and Limit Settings**

Click on the 'admin area' icon, and then click on the gear icon and choose 'Settings'.

 [![Configure GitLab system](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/20.png)][33] 

On the 'Account and Limit Settings' - you can configure max projects per user and the 'Sign-up Restrictions', you can add the domain name of your email to the white-list box.

And if all is complete, scroll to the bottom and click 'Save'.

 [![Configure Limit Setting and Sign-up Restrictions GitLab](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/21.png)][34] 

Basic GitLab configuration has been completed.

### Step 8 - Testing

Finally, we will do some tests to ensure that our GitLab system is working properly.

**Create New Project**

Click the plus icon on the top to create a new project repository. Type in your project name, description, and setup the visibility settings of your project. Then click on the 'Create project' button.

 [![GitLab Testing Create New Project](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/22.png)][35] 

The new project has been created.

**Test First Commit and Push** 

After the 'howtoforge' project has been created, you will be redirected to the project page. Now start adding new content to the repository. Make sure Git is installed on your computer and setup the global username and email for git with the command below.

```
git config --global user.name "hakase"
git config --global user.email "admin@hakase-labs.co"
```

Clone the Repository and add a README.md file.

```
git clone https://hakase@gitlab.irsyadf.me/hakase/howtoforge.git
cd howtoforge/
vim README.md
```

You will be asked for the 'hakase' user password. Please type the same password that you used when we accessed GitLab the first time.

Commit a new file to the howtoforge repository.

```
git add .
git commit -m 'Add README.md file by hakase-labs'
```

Next, push the change to the repository on the GitLab server.

```
git push origin master
```

Type in your password and press Enter to continue. You will see the result as below.

 [![GitLab Testing First Commit](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/23.png)][36] 

Now open the howtoforge project from your web browser, and you will see that the new README.md file has been added to the repository.

 [![New GitLab Repository is working](https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/24.png)][37] 

Gitlab has been installed on a Ubuntu 16.04 Xenial Xerus server.

### Preferences

*   [https://about.gitlab.com/downloads/#ubuntu1604][10][][11]

*   [https://docs.gitlab.com/ce/][12]

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-install-and-configure-gitlab-on-ubuntu-16-04/

作者：[Muhammad Arul ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/how-to-install-and-configure-gitlab-on-ubuntu-16-04/
[1]:https://www.howtoforge.com/tutorial/how-to-install-and-configure-gitlab-on-ubuntu-16-04/#step-install-required-ubuntu-packages
[2]:https://www.howtoforge.com/tutorial/how-to-install-and-configure-gitlab-on-ubuntu-16-04/#step-install-gitlab
[3]:https://www.howtoforge.com/tutorial/how-to-install-and-configure-gitlab-on-ubuntu-16-04/#step-configure-gitlab-main-url
[4]:https://www.howtoforge.com/tutorial/how-to-install-and-configure-gitlab-on-ubuntu-16-04/#step-generate-ssl-lets-encrypt-and-dhparam-certificate
[5]:https://www.howtoforge.com/tutorial/how-to-install-and-configure-gitlab-on-ubuntu-16-04/#step-enable-nginx-https-for-gitlab
[6]:https://www.howtoforge.com/tutorial/how-to-install-and-configure-gitlab-on-ubuntu-16-04/#step-configure-ufw-firewall
[7]:https://www.howtoforge.com/tutorial/how-to-install-and-configure-gitlab-on-ubuntu-16-04/#step-gitlab-postinstallation
[8]:https://www.howtoforge.com/tutorial/how-to-install-and-configure-gitlab-on-ubuntu-16-04/#step-testing
[9]:https://www.howtoforge.com/tutorial/how-to-install-and-configure-gitlab-on-ubuntu-16-04/#preferences
[10]:https://about.gitlab.com/downloads/#ubuntu1604
[11]:https://about.gitlab.com/downloads/#ubuntu1604
[12]:https://docs.gitlab.com/ce/
[13]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/1.png
[14]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/2.png
[15]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/3.png
[16]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/Nano.png
[17]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/41.png
[18]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/5.png
[19]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/6.png
[20]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/7.png
[21]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/8.png
[22]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/9.png
[23]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/10.png
[24]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/11.png
[25]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/12.png
[26]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/13.png
[27]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/14.png
[28]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/15.png
[29]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/16.png
[30]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/17.png
[31]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/18.png
[32]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/19.png
[33]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/20.png
[34]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/21.png
[35]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/22.png
[36]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/23.png
[37]:https://www.howtoforge.com/images/how_to_install_and_configure_gitlab_on_ubuntu_1604/big/24.png
