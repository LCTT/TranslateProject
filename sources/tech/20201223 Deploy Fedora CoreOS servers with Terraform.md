[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Deploy Fedora CoreOS servers with Terraform)
[#]: via: (https://fedoramagazine.org/deploy-fedora-coreos-with-terraform/)
[#]: author: (Nathan Smith https://fedoramagazine.org/author/nfsmith/)

Deploy Fedora CoreOS servers with Terraform
======

![][1]

Photo by [Jasper Boer][2] on [Unsplash][3]

Fedora CoreOS is a lightweight, secure operating system optimized for running containerized workloads. A YAML document is all you need to describe the workload you’d like to run on a Fedora CoreOS server.

This is wonderful for a single server, but how would you describe a fleet of cooperating Fedora CoreOS servers? For example, what if you wanted a set of servers running load balancers, others running a database cluster and others running a web application? How can you get them all configured and provisioned? How can you configure them to communicate with each other? This article looks at how Terraform solves this problem.

### Getting started

Before you start, decide whether you need to review the basics of Fedora CoreOS. Check out this [previous article][4] on the Fedora Magazine:

> [Getting started with Fedora CoreOS][4]

**Terraform** is an open source tool for defining and provisioning infrastructure. Terraform defines infrastructure as code in files. It provisions infrastructure by calculating the difference between the desired state in code and observed state and applying changes to remove the difference.

HashiCorp, the company that created and maintains Terraform, offers an RPM repository to install Terraform.

```
sudo dnf config-manager --add-repo \
  https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
sudo dnf install terraform
```

To get yourself familiar with the tools, start with a simple example. You’re going to create a single Fedora CoreOS server in AWS. To follow along, you need to install _awscli_ and have an AWS account. _awscli_ can be installed from the Fedora repositories and configured using the _aws configure_ command

```
sudo dnf install -y awscli
aws configure
```

_**Please note,** AWS is a paid service. If executed correctly, participants should expect less than $1 USD in charges, but mistakes may lead to unexpected charges_.

### Configuring Terraform

In a new directory, create a file named _config.yaml_. This file will hold the contents of your Fedore CoreOS configuration. The configuration simply adds an SSH key for the _core_ user. Modify the ******_authorized_ssh_key_ section to use your own.

```
variant: fcos
version: 1.2.0
passwd:
  users:
  - name: core
    authorized_ssh_keys:
    - "ssh-ed25519 AAAAC3....... user@hostname"
```

Next, create a file _main.tf_ to contain your Terraform specification. Take a look at the contents section by section. It begins with a block to specify the versions of your providers.

```
terraform {
  required_providers {
    ct = {
      source  = "poseidon/ct"
      version = "0.7.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
```

Terraform uses providers to control infrastructure. Here it uses the AWS provider to provision EC2 servers, but it can provision any kind of AWS infrastructure. The [ct provider][5] from [Poseidon Labs][6] stands for _config transpiler_. This provider will [transpile][7] Fedora CoreOS configurations into Ignition configurations. As a result, you do not need to use _[fcct][8]_ to transpile your configurations. Now that your provider versions are specified, initialize them.

```
provider "aws" {
  region = "us-west-2"
}

provider "ct" {}
```

The AWS region is set to _us-west-2_ and the _ct_ provider requires no configuration. With the providers configured, you’re ready to define some infrastructure. Use a _[data source][9]_ block to read the configuration.

```
data "ct_config" "config" {
  content = file("config.yaml")
  strict = true
}
```

With this data block defined, you can now access the transpiled Ignition output as _data.ct_config.config.rendered_. To create an EC2 server, use a [resource][10] block, and pass the Ignition output as the _user_data_ attribute.

```
resource "aws_instance" "server" {
  ami           = "ami-0699a4456969d8650"
  instance_type = "t3.micro"
  user_data     = data.ct_config.config.rendered
}
```

This configuration hard-codes the virtual machine image (AMI) to the latest _stable_ image of Fedora CoreOS in the _us-west-2_ region at time of writing. If you would like to use a different region or stream, you can discover the correct AMI on the [Fedora CoreOS downloads page][11].

Finally, you’d like to know the public IP address of the server once it’s created. Use an _[output][12]_ block to define the outputs to be displayed once Terraform completes its provisioning.

```
output "instance_ip_addr" {
  value = aws_instance.server.public_ip
}
```

Alright! You’re ready to create some infrastructure. To deploy the server simply run:

```
terraform init   # Installs the provider dependencies
terraform apply  # Displays the proposed changes and applies them
```

Once **completed, Terraform prints the public IP address of the server, and you can SSH to the server by running _ssh core@{public ip here}_. Congratulations — you’ve provisioned your first Fedora CoreOS server using Terraform!

### Updates and immutability

At this point you can modify the configuration in _config.yaml_ however you like. To deploy your change simply run _terraform apply_ again. Notice that each time you change the configuration, when you run _terraform apply_ it destroys the server and creates a new one. This aligns well with the Fedora CoreOS philosophy: Configuration can only happen once. Want to change that configuration? Create a new server. This can feel pretty alien if you’re accustomed to provisioning your servers once and continuously re-configuring them with tools like [Ansible][13], [Puppet][14] or [Chef][15].

The benefit of always creating new servers is that it is significantly easier to test that newly provisioned servers will act as expected. It can be much more difficult to account for all of the possible ways in which updating a system in place may break. Tooling that adheres to this philosophy typically falls under the heading of _Immutable Infrastructure_. This approach to infrastructure has some of the same benefits seen in functional programming techniques, namely that mutable state is often a source of error.

### Using variables

You can use Terraform [input variables][16] to parameterize your infrastructure. In the previous example, you might like to parameterize the AWS region or instance type. This would let you deploy several instances of the same configuration with differing parameters. What if you want to parameterize the Fedora CoreOS configuration? Do so using the [_templatefile_][17] function.

As an example, try parameterizing the username of your user. To do this, add a _username_ variable to the _main.tf_ file:

```
variable "username" {
  type        = string
  description = "Fedora CoreOS user"
  default     = "core"
}
```

Next, modify the _config.yaml_ file to turn it into a template. When rendered, the _${username}_ will be replaced.

```
variant: fcos
version: 1.2.0
passwd:
  users:
  - name: ${username}
    authorized_ssh_keys:
    - "ssh-ed25519 AAAAC3....... user@hostname"
```

Finally, modify the data block to render the template using the _templatefile_ function.

```
data "ct_config" "config" {
  content = templatefile(
    "config.yaml",
    { username = var.username }
  )
  strict = true
}
```

To deploy with _username_ set to _jane_, run _terraform apply -var=”username=jane”_. To verify, try to SSH into the server with _ssh jane@{public ip address}_.

### Leveraging the dependency graph

Passing variables from Terraform into Fedora CoreOS configuration is quite useful. But you can go one step further and pass infrastructure data into the server configuration. This is where Terraform and Fedora CoreOS start to really shine.

Terraform creates a [dependency graph][18] to model the state of infrastructure and to plan updates. If the output of one resource (e.g the public IP address of a server) is passed as the input of another service (e.g the destination in a firewall rule), Terraform understands that changes in the former require recreating or modifying the later. If you pass infrastructure data into a Fedora CoreOS configuration, it will participate in the dependency graph. Updates to the inputs will trigger creation of a new server with the new configuration.

Consider a system of one load balancer and three web servers as an example.

![][19]

The goal is to configure the load balancer with the IP address of each web server so that it can forward traffic to them.

### Web server configuration

First, create a file _web.yaml_ and add a simple Nginx configuration with a templated message.

```
variant: fcos
version: 1.2.0
systemd:
  units:
  - name: nginx.service
    enabled: true
    contents: |
      [Unit]
      Description=Nginx Web Server
      After=network-online.target
      Wants=network-online.target
      [Service]
      ExecStartPre=-/bin/podman kill nginx
      ExecStartPre=-/bin/podman rm nginx
      ExecStartPre=/bin/podman pull nginx
      ExecStart=/bin/podman run --name nginx -p 80:80 -v /etc/nginx/index.html:/usr/share/nginx/html/index.html:z nginx
      [Install]
      WantedBy=multi-user.target
storage:
  directories:
  - path: /etc/nginx
  files:
  - path: /etc/nginx/index.html
    mode: 0444
    contents:
      inline: |
        <html>
          <h1>Hello from Server ${count}</h1>
        </html>
```

In _main.tf_, you can create three web servers using this template with the following blocks:

```
data "ct_config" "web" {
  count   = 3
  content = templatefile(
    "web.yaml",
    { count = count.index }
  )
  strict = true
}

resource "aws_instance" "web" {
  count         = 3
  ami           = "ami-0699a4456969d8650"
  instance_type = "t3.micro"
  user_data     = data.ct_config.web[count.index].rendered
}
```

Notice the use of _count = 3_ and the _count.index_ variable. You can use [count][20] to make many copies of a resource. Here, it creates three configurations and three web servers. The _count.index_ variable is used to pass the first configuration to the first web server and so on.

### Load balancer configuration

The load balancer will be a basic [HAProxy load balancer][21] that forwards to each server. Place the configuration in a file named _lb.yaml_:

```
variant: fcos
version: 1.2.0
systemd:
  units:
  - name: haproxy.service
    enabled: true
    contents: |
      [Unit]
      Description=Haproxy Load Balancer
      After=network-online.target
      Wants=network-online.target
      [Service]
      ExecStartPre=-/bin/podman kill haproxy
      ExecStartPre=-/bin/podman rm haproxy
      ExecStartPre=/bin/podman pull haproxy
      ExecStart=/bin/podman run --name haproxy -p 80:8080 -v /etc/haproxy/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg:ro haproxy
      [Install]
      WantedBy=multi-user.target
storage:
  directories:
  - path: /etc/haproxy
  files:
  - path: /etc/haproxy/haproxy.cfg
    mode: 0444
    contents:
      inline: |
        global
          log    stdout format raw local0
        defaults
          mode   tcp
          log    global
          option tcplog
        frontend http
          bind            *:8080
          default_backend http
        backend http
          balance roundrobin
%{ for name, addr in servers ~}
          server  ${name} ${addr}:80 check
%{ endfor ~}
```

The template expects a [map][22] with server names as keys and IP addresses as values. You can create that using the [_zipmap_][23] function. Use the ID of the web servers as keys and the public IP addresses as values.

```
data "ct_config" "lb" {
  content = templatefile(
    "lb.yaml",
    {
      servers = zipmap(
        aws_instance.web.*.id,
        aws_instance.web.*.public_ip
      )
    }
  )
  strict = true
}

resource "aws_instance" "lb" {
  ami           = "ami-0699a4456969d8650"
  instance_type = "t3.micro
  user_data     = data.ct_config.lb.rendered
}
```

Finally, add an output block to display the IP address of the load balancer.

```
output "load_balancer_ip" {
  value = aws_instance.lb.public_ip
}
```

All right! Run _terraform apply_ and the IP address of the load balancer displays on completion. You should be able to make requests to the load balancer and get responses from each web server.

```
$ export LB={{load balancer IP here}}
$ curl $LB
<html>
  <h1>Hello from Server 0</h1>
</html>
$ curl $LB
<html>
  <h1>Hello from Server 1</h1>
</html>
$ curl $LB
<html>
  <h1>Hello from Server 2</h1>
</html>
```

Now you can modify the configuration of the web servers or load balancer. Any changes can be realized by running _terraform apply_ once again. Note in particular that any change to the web server IP addresses will cause Terraform to recreate the load balancer (changing the count from 3 to 4 is a simple test). Hopefully this emphasizes that the load balancer configuration is indeed a part of the Terraform dependency graph.

### Clean up

You can destroy all the infrastructure using the _terraform destroy_ command. Simply navigate to the folder where you created _main.tf_ and run _terraform destroy_.

### Where next?

Code for this tutorial can be found at [this GitHub repository][24]. Feel free to play with examples and contribute more if you find something you’d love to share with the world. To learn more about all the amazing things Fedora CoreOS can do, dive into [the docs][25] or come chat with [the community][26]. To learn more about Terraform, you can rummage through [the docs][27], checkout #terraform on [freenode][28], or contribute on [GitHub][29].

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/deploy-fedora-coreos-with-terraform/

作者：[Nathan Smith][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/nfsmith/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/12/terraform-816x345.jpg
[2]: https://unsplash.com/@jasperboer?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/landscape?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/getting-started-with-fedora-coreos/
[5]: https://github.com/poseidon/terraform-provider-ct
[6]: https://www.psdn.io/
[7]: https://en.wikipedia.org/wiki/Source-to-source_compiler
[8]: https://docs.fedoraproject.org/en-US/fedora-coreos/using-fcct/
[9]: https://www.terraform.io/docs/configuration/data-sources.html
[10]: https://www.terraform.io/docs/configuration/blocks/resources/syntax.html
[11]: https://getfedora.org/en/coreos/download?tab=cloud_launchable&stream=stable
[12]: https://www.terraform.io/docs/configuration/outputs.html
[13]: https://www.ansible.com/
[14]: https://puppet.com/
[15]: https://www.chef.io/
[16]: https://www.terraform.io/docs/configuration/variables.html
[17]: https://www.terraform.io/docs/configuration/functions/templatefile.html
[18]: https://www.terraform.io/docs/internals/graph.html
[19]: https://fedoramagazine.org/wp-content/uploads/2020/12/diagram.png
[20]: https://www.terraform.io/docs/configuration/meta-arguments/count.html
[21]: https://www.haproxy.org/
[22]: https://www.terraform.io/docs/configuration/expressions/types.html#maps-objects
[23]: https://www.terraform.io/docs/configuration/functions/zipmap.html
[24]: https://github.com/nsmith5/fcos-terraform-tutorial
[25]: https://docs.fedoraproject.org/en-US/fedora-coreos/getting-started/
[26]: https://discussion.fedoraproject.org/c/server/coreos/5
[27]: https://www.terraform.io/docs/index.html
[28]: https://freenode.net/
[29]: https://github.com/hashicorp/terraform
