[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Building a DNS-as-a-service with OpenStack Designate)
[#]: via: (https://opensource.com/article/19/4/getting-started-openstack-designate)
[#]: author: (Amjad Yaseen https://opensource.com/users/ayaseen)

Building a DNS-as-a-service with OpenStack Designate
======
Learn how to install and configure Designate, a multi-tenant
DNS-as-a-service (DNSaaS) for OpenStack.
![Command line prompt][1]

[Designate][2] is a multi-tenant DNS-as-a-service that includes a REST API for domain and record management, a framework for integration with [Neutron][3], and integration support for Bind9.

You would want to consider a DNSaaS for the following:

  * A clean REST API for managing zones and records
  * Automatic records generated (with OpenStack integration)
  * Support for multiple authoritative name servers
  * Hosting multiple projects/organizations



![Designate's architecture][4]

This article explains how to manually install and configure the latest release of Designate service on CentOS or Red Hat Enterprise Linux 7 (RHEL 7), but you can use the same configuration on other distributions.

### Install Designate on OpenStack

I have Ansible roles for bind and Designate that demonstrate the setup in my [GitHub repository][5].

This setup presumes bind service is external (even though you can install bind locally) on the OpenStack controller node.

  1. Install Designate's packages and bind (on OpenStack controller): [code]`# yum install openstack-designate-* bind bind-utils -y`
```
  2. Create the Designate database and user: [code] MariaDB [(none)]> CREATE DATABASE designate CHARACTER SET utf8 COLLATE utf8_general_ci;

MariaDB [(none)]> GRANT ALL PRIVILEGES ON designate.* TO \
'designate'@'localhost' IDENTIFIED BY 'rhlab123';

MariaDB [(none)]> GRANT ALL PRIVILEGES ON designate.* TO 'designate'@'%' \
IDENTIFIED BY 'rhlab123';
```




Note: Bind packages must be installed on the controller side for Remote Name Daemon Control (RNDC) to function properly.

### Configure bind (DNS server)

  1. Generate RNDC files: [code] rndc-confgen -a -k designate -c /etc/rndc.key -r /dev/urandom

cat <<EOF> etcrndc.conf
include "/etc/rndc.key";
options {
default-key "designate";
default-server {{ DNS_SERVER_IP }};
default-port 953;
};
EOF 
```
  2. Add the following into **named.conf** : [code]`include "/etc/rndc.key"; controls { inet {{ DNS_SERVER_IP }} allow { localhost;{{ CONTROLLER_SERVER_IP }}; } keys { "designate"; }; };`[/code] In the **option** section, add: [code] options {
...
allow-new-zones yes;
request-ixfr no;
listen-on port 53 { any; };
recursion no;
allow-query { 127.0.0.1; {{ CONTROLLER_SERVER_IP }}; };
}; [/code] Add the right permissions: [code] chown named:named /etc/rndc.key
chown named:named /etc/rndc.conf
chmod 600 /etc/rndc.key
chown -v root:named /etc/named.conf
chmod g+w /var/named

# systemctl restart named
# setsebool named_write_master_zones 1
```

  3. Push **rndc.key** and **rndc.conf** into the OpenStack controller: [code]`# scp -r /etc/rndc* {{ CONTROLLER_SERVER_IP }}:/etc/`
```
## Create OpenStack Designate service and endpoints

Enter:
```


# openstack user create --domain default --password-prompt designate
# openstack role add --project services --user designate admin
# openstack service create --name designate --description "DNS" dns

# openstack endpoint create --region RegionOne dns public http://{{ CONTROLLER_SERVER_IP }}:9001/
# openstack endpoint create --region RegionOne dns internal http://{{ CONTROLLER_SERVER_IP }}:9001/
# openstack endpoint create --region RegionOne dns admin http://{{ CONTROLLER_SERVER_IP }}:9001/

```
## Configure Designate service

  1. Edit **/etc/designate/designate.conf** :
    * In the **[service:api]** section, configure **auth_strategy** : [code] [service:api]
listen = 0.0.0.0:9001
auth_strategy = keystone
api_base_uri = http://{{ CONTROLLER_SERVER_IP }}:9001/
enable_api_v2 = True
enabled_extensions_v2 = quotas, reports
```
    * In the **[keystone_authtoken]** section, configure the following options: [code] [keystone_authtoken]
auth_type = password
username = designate
password = rhlab123
project_name = service
project_domain_name = Default
user_domain_name = Default
www_authenticate_uri = http://{{ CONTROLLER_SERVER_IP }}:5000/
auth_url = http://{{ CONTROLLER_SERVER_IP }}:5000/ 
```
    * In the **[service:worker]** section, enable the worker model: [code] enabled = True
notify = True
```
    * In the **[storage:sqlalchemy]** section, configure database access: [code] [storage:sqlalchemy]
connection = mysql+pymysql://designate:rhlab123@{{ CONTROLLER_SERVER_IP }}/designate 
```
* Populate the Designate database: [code]`# su -s /bin/sh -c "designate-manage database sync" designate`
```


  2. Create Designate's **pools.yaml** file (has target and bind details):
    * Edit **/etc/designate/pools.yaml** : [code] - name: default
# The name is immutable. There will be no option to change the name after
# creation and the only way will to change it will be to delete it
# (and all zones associated with it) and recreate it.
description: Default Pool

attributes: {}

# List out the NS records for zones hosted within this pool
# This should be a record that is created outside of designate, that
# points to the public IP of the controller node.
ns_records:
\- hostname: {{Controller_FQDN}}. # Thisis mDNS
priority: 1

# List out the nameservers for this pool. These are the actual BIND servers.
# We use these to verify changes have propagated to all nameservers.
nameservers:
\- host: {{ DNS_SERVER_IP }}
port: 53

# List out the targets for this pool. For BIND there will be one
# entry for each BIND server, as we have to run rndc command on each server
targets:
\- type: bind9
description: BIND9 Server 1

# List out the designate-mdns servers from which BIND servers should
# request zone transfers (AXFRs) from.
# This should be the IP of the controller node.
# If you have multiple controllers you can add multiple masters
# by running designate-mdns on them, and adding them here.
masters:
\- host: {{ CONTROLLER_SERVER_IP }}
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
* Populate Designate's pools: [code]`su -s /bin/sh -c "designate-manage pool update" designate`
```



  3. Start Designate central and API services: [code]`systemctl enable --now designate-central designate-api`
```
  4. Verify Designate's services are up: [code] # openstack dns service list

+--------------+--------+-------+--------------+
| service_name | status | stats | capabilities |
+--------------+--------+-------+--------------+
| central | UP | - | - |
| api | UP | - | - |
| mdns | UP | - | - |
| worker | UP | - | - |
| producer | UP | - | - |
+--------------+--------+-------+--------------+
```




### Configure OpenStack Neutron with external DNS

  1. Configure iptables for Designate services: [code] # iptables -I INPUT -p tcp -m multiport --dports 9001 -m comment --comment "designate incoming" -j ACCEPT

# iptables -I INPUT -p tcp -m multiport --dports 5354 -m comment --comment "Designate mdns incoming" -j ACCEPT

# iptables -I INPUT -p tcp -m multiport --dports 53 -m comment --comment "bind incoming" -j ACCEPT


# iptables -I INPUT -p udp -m multiport --dports 53 -m comment --comment "bind/powerdns incoming" -j ACCEPT

# iptables -I INPUT -p tcp -m multiport --dports 953 -m comment --comment "rndc incoming - bind only" -j ACCEPT

# service iptables save; service iptables restart
# setsebool named_write_master_zones 1 
```
2. Edit the **[default]** section of **/etc/neutron/neutron.conf** : [code]`external_dns_driver = designate`
```

  3. Add the **[designate]** section in **/_etc/_neutron/neutron.conf** : [code] [designate]
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
  4. Edit **dns_domain** in **neutron.conf** : [code] dns_domain = rhlab.dev.

# systemctl restart neutron-*
```

  5. Add **dns** to the list of Modular Layer 2 (ML2) drivers in **/etc/neutron/plugins/ml2/ml2_conf.ini** : [code]`extension_drivers=port_security,qos,dns`
```
6. Add **zone** in Designate: [code]`# openstack zone create –email=admin@rhlab.dev rhlab.dev.`[/code] Add a new record in **zone rhlab.dev** : [code]`# openstack recordset create --record '192.168.1.230' --type A rhlab.dev. Test`
```




Designate should now be installed and configured.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/getting-started-openstack-designate

作者：[Amjad Yaseen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayaseen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: https://docs.openstack.org/designate/latest/
[3]: /article/19/3/openstack-neutron
[4]: https://opensource.com/sites/default/files/uploads/openstack_designate_architecture.png (Designate's architecture)
[5]: https://github.com/ayaseen/designate
