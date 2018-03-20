How to enable repository using subscription-manager in RHEL
======
Learn how to enable repository using subscription-manager in RHEL. Article also includes steps to register system with Red Hat, attach subscription and errors along with resolutions.

![Enable repository using subscription-manager][1]

In this article we will walk you through step by step process to enable Red Hat repository in RHEL fresh installed server.

Repository can be enabled using `subscription-manager` command like below –

```
root@kerneltalks # subscription-manager repos --enable rhel-6-server-rhv-4-agent-beta-debug-rpms
Error: 'rhel-6-server-rhv-4-agent-beta-debug-rpms' does not match a valid repository ID. Use "subscription-manager repos --list" to see valid repositories.

```
You will see above error when your subscription is not in place. Lets go through step by step procedure to enable repositories via `subscription-manager`

##### Step 1 : Register your system with Red Hat

We are considering you have freshly installed system and its not yet registered with Red Hat. If you have registered system already then you can ignore this step.

You can check if your system is registered with Red Hat for subscription using below command –

```
# subscription-manager version
server type: This system is currently not registered.
subscription management server: Unknown
subscription management rules: Unknown
subscription-manager: 1.18.10-1.el6
python-rhsm: 1.18.6-1.el6

```
Here, in first line of output you can see system is not registered. So, lets start with registering system. You need to use `subscription-manager` command with `register` switch. You need to use your Red Hat account credentials here.

```
root@kerneltalks # subscription-manager register
Registering to: subscription.rhsm.redhat.com:443/subscription
Username: admin@kerneltalks.com
Password:
Network error, unable to connect to server. Please see /var/log/rhsm/rhsm.log for more information.
```

If you are getting above error then your server is not able to reach RedHat. Check internet connection & if you are able to [resolve site name][2]s. Sometimes even if you are able to ping subscription server, you will see this error. This might be because of you have proxy server in your environment. In such case, you need to add its details in file `/etc/rhsm/rhsm.conf`. Below proxy details should be populated :

```
# an http proxy server to use
 proxy_hostname =
 
# port for http proxy server
 proxy_port =
 
# user name for authenticating to an http proxy, if needed
 proxy_user =
 
# password for basic http proxy auth, if needed
 proxy_password =
 
```

Once you are done, recheck if `subscription-manager` taken up new proxy details by using below command –

```
root@kerneltalks # subscription-manager config
[server]
 hostname = [subscription.rhsm.redhat.com]
 insecure = [0]
 port = [443]
 prefix = [/subscription]
 proxy_hostname = [kerneltalksproxy.abc.com]
 proxy_password = [asdf]
 proxy_port = [3456]
 proxy_user = [user2]
 server_timeout = [180]
 ssl_verify_depth = [3]

[rhsm]
 baseurl = [https://cdn.redhat.com]
 ca_cert_dir = [/etc/rhsm/ca/]
 consumercertdir = [/etc/pki/consumer]
 entitlementcertdir = [/etc/pki/entitlement]
 full_refresh_on_yum = [0]
 manage_repos = [1]
 pluginconfdir = [/etc/rhsm/pluginconf.d]
 plugindir = [/usr/share/rhsm-plugins]
 productcertdir = [/etc/pki/product]
 repo_ca_cert = /etc/rhsm/ca/redhat-uep.pem
 report_package_profile = [1]

[rhsmcertd]
 autoattachinterval = [1440]
 certcheckinterval = [240]

[logging]
 default_log_level = [INFO]

[] - Default value in use
```

Now, try registering your system again.

```
root@kerneltalks # subscription-manager register
Registering to: subscription.rhsm.redhat.com:443/subscription
Username: admin@kerneltalks.com
Password:
You must first accept Red Hat's Terms and conditions. Please visit https://www.redhat.com/wapps/tnc/termsack?event[]=signIn . You may have to log out of and back into the Customer Portal in order to see the terms.
```

You will see above error if you are adding server to your Red Hat account for the first time. Go to the [URL ][3]and accept the terms. Come back to terminal and try again.

```
oot@kerneltalks # subscription-manager register
Registering to: subscription.rhsm.redhat.com:443/subscription
Username: admin@kerneltalks.com
Password:
The system has been registered with ID: xxxxb2-xxxx-xxxx-xxxx-xx8e199xxx
```

Bingo! System is registered with Red Hat now. You can again verify it with `version` switch.

```
#subscription-managerversionservertype:RedHatSubscriptionManagementsubscriptionmanagementserver:2.0.43-1subscriptionmanagementrules:5.26subscription-manager:1.18.10-1.el6python-rhsm:1.18.6-1.el6" decode="true"  ]root@kerneltalks # subscription-manager version
server type: Red Hat Subscription Management
subscription management server: 2.0.43-1
subscription management rules: 5.26
subscription-manager: 1.18.10-1.el6
python-rhsm: 1.18.6-1.el6
```

##### Step 2 : Attach subscription to your server

First try to list repositories. You wont be able to list any since we haven’t attached any subscription to our server yet.

```
root@kerneltalks # subscription-manager repos --list
This system has no repositories available through subscriptions.
```

As you can see `subscription-manager` couldn’t found any repositories, you need to attach subscriptions to your server. Once subscription is attached, `subscription-manager` will be able to list repositories under it.

To attach subscription, first check all available subscriptions for your server with below command –

```
root@kerneltalks # subscription-manager list --available
+-------------------------------------------+
Available Subscriptions
+-------------------------------------------+
Subscription Name: Red Hat Enterprise Linux for Virtual Datacenters, Standard
Provides: Red Hat Beta
Red Hat Software Collections (for RHEL Server)
Red Hat Enterprise Linux Atomic Host Beta
Oracle Java (for RHEL Server)
Red Hat Enterprise Linux Server
dotNET on RHEL (for RHEL Server)
Red Hat Enterprise Linux Atomic Host
Red Hat Software Collections Beta (for RHEL Server)
Red Hat Developer Tools Beta (for RHEL Server)
Red Hat Developer Toolset (for RHEL Server)
Red Hat Developer Tools (for RHEL Server)
SKU: RH00050
Contract: xxxxxxxx
Pool ID: 8a85f98c6011059f0160110a2ae6000f
Provides Management: Yes
Available: Unlimited
Suggested: 0
Service Level: Standard
Service Type: L1-L3
Subscription Type: Stackable (Temporary)
Ends: 12/01/2018
System Type: Virtual
```

You will get list of such subscriptions available for your server. You need to read through what it provides and note down `Pool ID` of subscriptions which are useful/required for you.

Now, attach subscriptions to your server by using pool ID.
```
# subscription-manager attach --pool=8a85f98c6011059f0160110a2ae6000f
Successfully attached a subscription for: Red Hat Enterprise Linux for Virtual Datacenters, Standard
```

If you are not sure which one to pick, you can simple attach subscriptions automatically which are best suited for your server with below command –

```
root@kerneltalks # subscription-manager attach --auto
Installed Product Current Status:
Product Name: Red Hat Enterprise Linux Server
Status: Subscribed
```

Move on to final step to enable repository.

##### Step 3 : Enable repository

Now you will be enable repository which is available under your attached subscription.

```
root@kerneltalks # subscription-manager repos --enable rhel-6-server-rhv-4-agent-beta-debug-rpms
Repository 'rhel-6-server-rhv-4-agent-beta-debug-rpms' is enabled for this system.
```

Thats it. You are done. You can [list repositories with yum command][4] and confirm.

--------------------------------------------------------------------------------

via: https://kerneltalks.com/howto/how-to-enable-repository-using-subscription-manager-in-rhel/

作者：[kerneltalks][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://kerneltalks.com
[1]:https://a2.kerneltalks.com/wp-content/uploads/2018/02/enable-repository-in-rhel.png
[2]:https://kerneltalks.com/howto/how-to-configure-nameserver-in-linux/
[3]:https://www.redhat.com/wapps/tnc/termsack?event%5B%5D=signIn
[4]:https://kerneltalks.com/howto/how-to-list-yum-repositories-in-rhel-centos/
