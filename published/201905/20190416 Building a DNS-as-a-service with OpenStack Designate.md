[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10840-1.html)
[#]: subject: (Building a DNS-as-a-service with OpenStack Designate)
[#]: via: (https://opensource.com/article/19/4/getting-started-openstack-designate)
[#]: author: (Amjad Yaseen https://opensource.com/users/ayaseen)

用 OpenStack Designate 构建一个 DNS 即服务（DNSaaS）
======

> 学习如何安装和配置 Designate，这是一个 OpenStack 的多租户 DNS 即服务（DNSaaS）。

![Command line prompt](https://img.linux.net.cn/data/attachment/album/201905/11/110822rjub9wtwtwtmccet.jpg)

[Designate][2] 是一个多租户的 DNS 即服务，它包括一个用于域名和记录管理的 REST API 和集成了 [Neutron][3] 的框架，并支持 Bind9。

DNSaaS 可以提供：

  * 一个管理区域和记录的干净利落的 REST API
  * 自动生成记录（集成 OpenStack）
  * 支持多个授权名字服务器
  * 可以托管多个项目/组织

![Designate's architecture][4]

这篇文章解释了如何在 CentOS 和 RHEL 上手动安装和配置 Designate 的最新版本，但是同样的配置也可以用在其它发行版上。

### 在 OpenStack 上安装 Designate

在我的 [GitHub 仓库][5]里，我已经放了 Ansible 的 bind 和 Designate 角色的示范设置。

这个设置假定 bing 服务是安装 OpenStack 控制器节点之外（即使你可以在本地安装 bind）。

1、在 OpenStack 控制节点上安装 Designate 和 bind 软件包：

```
# yum install openstack-designate-* bind bind-utils -y
```

2、创建 Designate 数据库和用户：

```
MariaDB [(none)]> CREATE DATABASE designate CHARACTER SET utf8 COLLATE utf8_general_ci;
       
MariaDB [(none)]> GRANT ALL PRIVILEGES ON designate.* TO \
'designate'@'localhost' IDENTIFIED BY 'rhlab123';

MariaDB [(none)]> GRANT ALL PRIVILEGES ON designate.* TO 'designate'@'%' \
IDENTIFIED BY 'rhlab123';
```

注意：bind 包必须安装在控制节点之外才能使<ruby>远程名字服务控制<rt>Remote Name Daemon Control</rt></ruby>（RNDC）功能正常。

### 配置 bind（DNS 服务器）

1、生成 RNDC 文件：

```
rndc-confgen -a -k designate -c /etc/rndc.key -r /dev/urandom

cat <<EOF> etcrndc.conf
include "/etc/rndc.key";
options {
  default-key "designate";
  default-server {{ DNS_SERVER_IP }};
  default-port 953;
};
EOF
```

2、将下列配置添加到 `named.conf`：

```
include "/etc/rndc.key"; 
controls {
  inet {{ DNS_SERVER_IP }} allow { localhost;{{ CONTROLLER_SERVER_IP }}; } keys { "designate"; };
};
```

在 `option` 节中，添加：

```
options {
  ...
  allow-new-zones yes;
  request-ixfr no;
  listen-on port 53 { any; };
  recursion no;
  allow-query { 127.0.0.1; {{ CONTROLLER_SERVER_IP }}; };
};
```

添加正确的权限：

```
chown named:named /etc/rndc.key
chown named:named /etc/rndc.conf
chmod 600 /etc/rndc.key
chown -v root:named /etc/named.conf
chmod g+w /var/named

# systemctl restart named
# setsebool named_write_master_zones 1
```

3、把 `rndc.key` 和 `rndc.conf` 推入 OpenStack 控制节点：

```
# scp -r /etc/rndc* {{ CONTROLLER_SERVER_IP }}:/etc/
```

### 创建 OpenStack Designate 服务和端点

输入：

```
# openstack user create --domain default --password-prompt designate
# openstack role add --project services --user designate admin
# openstack service create --name designate --description "DNS" dns

# openstack endpoint create --region RegionOne dns public http://{{ CONTROLLER_SERVER_IP }}:9001/
# openstack endpoint create --region RegionOne dns internal http://{{ CONTROLLER_SERVER_IP }}:9001/  
# openstack endpoint create --region RegionOne dns admin http://{{ CONTROLLER_SERVER_IP }}:9001/
```

### 配置 Designate 服务

1、编辑 `/etc/designate/designate.conf`：

在 `[service:api]` 节配置 `auth_strategy`：

```
[service:api]
listen = 0.0.0.0:9001
auth_strategy = keystone
api_base_uri = http://{{ CONTROLLER_SERVER_IP }}:9001/
enable_api_v2 = True
enabled_extensions_v2 = quotas, reports
```

在 `[keystone_authtoken]` 节配置下列选项：

```
[keystone_authtoken]
auth_type = password
username = designate
password = rhlab123
project_name = service
project_domain_name = Default
user_domain_name = Default
www_authenticate_uri = http://{{ CONTROLLER_SERVER_IP }}:5000/
auth_url = http://{{ CONTROLLER_SERVER_IP }}:5000/ 
```

在 `[service:worker]` 节，启用 worker 模型：

```
enabled = True
notify = True
```

在 `[storage:sqlalchemy]` 节，配置数据库访问：

```
[storage:sqlalchemy]
connection = mysql+pymysql://designate:rhlab123@{{ CONTROLLER_SERVER_IP }}/designate
```

填充 Designate 数据库：

```
# su -s /bin/sh -c "designate-manage database sync" designate
```

2、 创建 Designate 的 `pools.yaml` 文件（包含 target 和 bind 细节）：

编辑 `/etc/designate/pools.yaml`：

```
- name: default
  # The name is immutable. There will be no option to change the name after
  # creation and the only way will to change it will be to delete it
  # (and all zones associated with it) and recreate it.
  description: Default Pool

  attributes: {}

  # List out the NS records for zones hosted within this pool
  # This should be a record that is created outside of designate, that
  # points to the public IP of the controller node.
  ns_records:
    - hostname: {{Controller_FQDN}}. # Thisis mDNS
      priority: 1

  # List out the nameservers for this pool. These are the actual BIND servers.
  # We use these to verify changes have propagated to all nameservers.
  nameservers:
    - host: {{ DNS_SERVER_IP }}
      port: 53

  # List out the targets for this pool. For BIND there will be one
  # entry for each BIND server, as we have to run rndc command on each server
  targets:
    - type: bind9
      description: BIND9 Server 1

      # List out the designate-mdns servers from which BIND servers should
      # request zone transfers (AXFRs) from.
      # This should be the IP of the controller node.
      # If you have multiple controllers you can add multiple masters
      # by running designate-mdns on them, and adding them here.
      masters:
        - host: {{ CONTROLLER_SERVER_IP }}
          port: 5354

      # BIND Configuration options
      options:
        host: {{ DNS_SERVER_IP }}
        port: 53
        rndc_host: {{ DNS_SERVER_IP }}
        rndc_port: 953
        rndc_key_file: /etc/rndc.key
        rndc_config_file: /etc/rndc.conf
```

填充 Designate 池：

```
su -s /bin/sh -c "designate-manage pool update" designate
```

3、启动 Designate 中心和 API 服务：

```
systemctl enable --now designate-central designate-api
```

4、验证 Designate 服务运行：

```
# openstack dns service list

+--------------+--------+-------+--------------+
| service_name | status | stats | capabilities |
+--------------+--------+-------+--------------+
| central      | UP     | -     | -            |
| api          | UP     | -     | -            |
| mdns         | UP     | -     | -            |
| worker       | UP     | -     | -            |
| producer     | UP     | -     | -            |
+--------------+--------+-------+--------------+
```

### 用外部 DNS 配置 OpenStack Neutron

1、为 Designate 服务配置 iptables：

```
# iptables -I INPUT -p tcp -m multiport --dports 9001 -m comment --comment "designate incoming" -j ACCEPT
       
# iptables -I INPUT -p tcp -m multiport --dports 5354 -m comment --comment "Designate mdns incoming" -j ACCEPT
       
# iptables -I INPUT -p tcp -m multiport --dports 53 -m comment --comment "bind incoming" -j ACCEPT
        
# iptables -I INPUT -p udp -m multiport --dports 53 -m comment --comment "bind/powerdns incoming" -j ACCEPT
       
# iptables -I INPUT -p tcp -m multiport --dports 953 -m comment --comment "rndc incoming - bind only" -j ACCEPT
       
# service iptables save; service iptables restart
# setsebool named_write_master_zones 1
```

2、 编辑 `/etc/neutron/neutron.conf` 的 `[default]` 节：

```
external_dns_driver = designate
```

3、 在 `/etc/neutron/neutron.conf` 中添加 `[designate]` 节：

```
[designate]
url = http://{{ CONTROLLER_SERVER_IP }}:9001/v2 ## This end point of designate
auth_type = password
auth_url = http://{{ CONTROLLER_SERVER_IP }}:5000
username = designate
password = rhlab123
project_name = services
project_domain_name = Default
user_domain_name = Default
allow_reverse_dns_lookup = True
ipv4_ptr_zone_prefix_size = 24
ipv6_ptr_zone_prefix_size = 116 
```

4、编辑 `neutron.conf` 的 `dns_domain`：

```
dns_domain = rhlab.dev.
```

重启： 

```
# systemctl restart neutron-*
```

5、在 `/etc/neutron/plugins/ml2/ml2_conf.ini` 中的组成层 2（ML2）中添加 `dns`：

```
extension_drivers=port_security,qos,dns
```

6、在 Designate 中添加区域：

```
# openstack zone create –email=admin@rhlab.dev rhlab.dev.
```

在 `rhlab.dev` 区域中添加记录：

```
# openstack recordset create --record '192.168.1.230' --type A rhlab.dev. Test
```

Designate 现在就安装和配置好了。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/getting-started-openstack-designate

作者：[Amjad Yaseen][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayaseen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: https://docs.openstack.org/designate/latest/
[3]: /article/19/3/openstack-neutron
[4]: https://opensource.com/sites/default/files/uploads/openstack_designate_architecture.png (Designate's architecture)
[5]: https://github.com/ayaseen/designate
