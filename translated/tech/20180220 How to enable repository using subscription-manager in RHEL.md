
如何在RHEL中使用subscription-manager启用存储库
======
了解如何在RHEL中使用subscription-manager启用存储库。 这篇文章还包括了使用 Red Hat 注册系统的步骤，添加订阅，发生错误的解决方案。

![Enable repository using subscription-manager][1]

（图中文字：了解在RHEL中使用subscription-manager启用存储库）

在本文中，我们将逐步介绍如何在RHEL刚安装的服务器中启用Red Hat存储库。

可以利用 `subscription-manager` 命令启用存储库，如下所示 –

```
root@kerneltalks # subscription-manager repos --enable rhel-6-server-rhv-4-agent-beta-debug-rpms
Error: 'rhel-6-server-rhv-4-agent-beta-debug-rpms' does not match a valid repository ID. Use "subscription-manager repos --list" to see valid repositories.

```
当您的订阅不到位时，您会看到上述错误。让我们一步一步地通过 `subscription-manager` 来启用存储库。

##### 步骤 1 : 使用 Red Hat 注册您的系统


我们正在考虑您已经安装了新系统并且尚未在Red Hat上注册。如果您已经注册了系统，那么您可以忽略此步骤。

您可以使用下面的命令来检查您的系统是否已使用 Red Hat 注册以订阅 –

```
# subscription-manager version
server type: This system is currently not registered.
subscription management server: Unknown
subscription management rules: Unknown
subscription-manager: 1.18.10-1.el6
python-rhsm: 1.18.6-1.el6

```

在这里输出的第一行中，您可以看到系统未注册。那么，让我们开始注册系统。您需要在 `register` 开关中使用 `subscription-manager` 命令。在这一步需要使用您的 Red Hat 帐户凭证。

```
root@kerneltalks # subscription-manager register
Registering to: subscription.rhsm.redhat.com:443/subscription
Username: admin@kerneltalks.com
Password:
Network error, unable to connect to server. Please see /var/log/rhsm/rhsm.log for more information.
```

如果您遇到上述错误，那么您的服务器无法连接到 RedHat。检查您的网络连接，或者您能[解决网站名称的问题][2]。有时候，即使你能够 ping 通订阅服务器，你也会看到这个错误。这可能是因为您的环境中有代理服务器。在这种情况下，您需要将其详细信息添加到文件 `/etc/rhsm/rhsm.conf` 中。以下代理详细信息应被填充为：

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

一旦你完成了这些，重新检查 `subscription-manager` 是否通过使用下面的命令获得了新的代理信息 –

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

现在，请尝试重新注册您的系统。

```
root@kerneltalks # subscription-manager register
Registering to: subscription.rhsm.redhat.com:443/subscription
Username: admin@kerneltalks.com
Password:
You must first accept Red Hat's Terms and conditions. Please visit https://www.redhat.com/wapps/tnc/termsack?event[]=signIn . You may have to log out of and back into the Customer Portal in order to see the terms.
```

如果您是第一次将服务器添加到 Red Hat 帐户，您将看到上述错误。转到 [URL ][3]并接受条款。回到终端，然后再试一次。

```
oot@kerneltalks # subscription-manager register
Registering to: subscription.rhsm.redhat.com:443/subscription
Username: admin@kerneltalks.com
Password:
The system has been registered with ID: xxxxb2-xxxx-xxxx-xxxx-xx8e199xxx
```

Bingo！系统现在已在 Red Hat 上注册。你可以再次用 `version` 开关来验证它。

```
#subscription-managerversionservertype:RedHatSubscriptionManagementsubscriptionmanagementserver:2.0.43-1subscriptionmanagementrules:5.26subscription-manager:1.18.10-1.el6python-rhsm:1.18.6-1.el6" decode="true"  ]root@kerneltalks # subscription-manager version
server type: Red Hat Subscription Management
subscription management server: 2.0.43-1
subscription management rules: 5.26
subscription-manager: 1.18.10-1.el6
python-rhsm: 1.18.6-1.el6
```

##### 步骤 2 : 将订阅添加到您的服务器

首先尝试列出存储库。您将无法列出任何内容，因为我们尚未在我们的服务器中添加任何订阅。

```
root@kerneltalks # subscription-manager repos --list
This system has no repositories available through subscriptions.
```

正如您所看到 `subscription-manager` 找不到任何存储库，您需要将订阅添加到您的服务器上。一旦订阅被添加，`subscription-manager` 将能够列出下列的存储库。

要添加订阅，请先使用以下命令检查服务器的所有可用订阅 –

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

您将获得可用于您的服务器的此类订阅的列表。您需要阅读它提供的内容并记下对您有用或需要的订阅的 `Pool ID`。

现在，使用 pool ID 将订阅附加到您的服务器。

```
# subscription-manager attach --pool=8a85f98c6011059f0160110a2ae6000f
Successfully attached a subscription for: Red Hat Enterprise Linux for Virtual Datacenters, Standard
```

如果您不确定选择哪一个，则可以使用下面的命令自动地添加最适合您的服务器的订阅 –

```
root@kerneltalks # subscription-manager attach --auto
Installed Product Current Status:
Product Name: Red Hat Enterprise Linux Server
Status: Subscribed
```

接下来是最后一步启用存储库。

##### 步骤 3 : 启用存储库

现在您将能够启用存储库，该存储库在您的附加订阅下可用。

```
root@kerneltalks # subscription-manager repos --enable rhel-6-server-rhv-4-agent-beta-debug-rpms
Repository 'rhel-6-server-rhv-4-agent-beta-debug-rpms' is enabled for this system.
```

到这里，您已经完成了。您可以[用 yum 命令列出存储库][4]并确认

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
