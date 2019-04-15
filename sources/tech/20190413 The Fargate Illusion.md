[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The Fargate Illusion)
[#]: via: (https://leebriggs.co.uk/blog/2019/04/13/the-fargate-illusion.html)
[#]: author: (Lee Briggs https://leebriggs.co.uk/)

The Fargate Illusion
======

I’ve been building a Kubernetes based platform at $work now for almost a year, and I’ve become a bit of a Kubernetes apologist. It’s true, I think the technology is fantastic. I am however under no illusions about how difficult it is to operate and maintain. I read posts like [this][1] one earlier in the year and found myself nodding along to certain aspects of the opinion. If I was in a smaller company, with 10/15 engineers, I’d be horrified if someone suggested managing and maintaining a fleet of Kubernetes clusters. The operational overhead is just too high.

Despite my love for all things Kubernetes at this point, I do remain curious about the notion that “serverless” computing will kill the ops engineer. The main source of intrigue here is the desire to stay gainfully employed in the future - if we aren’t going to need OPS engineers in our glorious future, I’d like to see what all the fuss is about. I’ve done some experimentation in Lamdba and Google Cloud Functions and been impressed by what I saw, but I still firmly believe that serverless solutions only solve a percentage of the problem.

I’ve had my eye on [AWS Fargate][2] for some time now and it’s something that developers at $work have been gleefully pointed at as “serverless computing” - mainly because with Fargate, you can run your Docker container without having to manage the underlying nodes. I wanted to see what that actually meant - so I set about trying to get an app running on Fargate from scratch. I defined the succes criteria here as something close-ish to a “production ready” application, so I wanted to have the following:

  * A running container on Fargate
  * With configuration pushed down in the form of environment variables
  * “Secrets” should not be in plaintext
  * Behind a loadbalancer
  * TLS enabled with a valid SSL certificate



I approached this whole task from an infrastructure as code mentality, and instead of following the default AWS console wizards, I used terraform to define the infrastructure. It’s very possible this overcomplicated things, but I wanted to make sure any deployment was repeatable and discoverable to anyone else wanting to follow along.

All of the above criteria is generally achieveable with a Kubernetes based platform using a few external add-ons and plugins, so I’m admittedly approaching this whole task with a comparitive mentality - because I’m comparing it with my common workflow. My main goal was to see how easy this was with Fargate, especially when compared with Kubernetes. I was pretty surprised with the outcome.

### AWS has overhead

I had a clean AWS account and was determined to go from zero to a deployed webapp. Like any other infrastructure in AWS, I had to get the baseline infrastructure working - so I first had to define a VPC.

I wanted to follow the best practices, so I carved the VPC up into subnets across availability zones, with a public and a private subnet. It occurred to me at this point that as long as this need was always there, I’d probably be able to find a job of some description. The notion that AWS is operationally “free” is something that has irked me for quite some time now. Many people in the developer community take for granted how much work and effort there is in setting up and defining a well designed AWS account and infrastructure. This is _before_ we even start talking about a multi-account architecture - I’m still in a single account here and I’m already having to define infrastructure and traditional network items.

It’s also worth remembering here, I’ve done this quite a few times now, so I _knew_ exactly what to do. I could have used the default VPC in my account, and the pre-provided subnets, which I expect many people who are getting started might do. This took me about half an hour to get running, but I couldn’t help but think here that even if I want to run lambda functions, I still need some kind of connectivity and networking. Defining NAT gateways and routing in a VPC doesn’t feel very serveless at all, but it has to be done to get things moving.

### Run my damn container

Once I had the base infrastructure up and running, I now wanted to get my docker container running. I started examining the Fargate docs and browsed through the [Getting Started][3] docs and something immediately popped out at me:

> [][4]

Hold on a minute, there’s at least THREE steps here just to get my container up and running? This isn’t quite how this whole thing was sold to me, but let’s get started.

#### Task Definitions

A task definition defines the actual container you want to run. The problem I ran into immediately here is that this thing is insanely complicated. Lots of the options here are very straightforward, like specifying the docker image and memory limits, but I also had to define a networking model and a variety of other options that I wasn’t really familiar with. Really? If I had come into this process with absolutely no AWS knowledge I’d be incredibly overwhelmed at this stage. A full list of the [parameters][5] can be found on the AWS page, and the list is long. I knew my container needed to have some environment variables, and it needed to expose a port. So I defined that first, with the help of a fantastic [terraform module][6] which really made this easier. If I didn’t have this, I’d be hand writing JSON to define my container definition.

First, I defined some environment variables:

```
container_environment_variables = [
    {
      name  = "USER"
      value = "${var.user}"
    },
    {
      name  = "PASSWORD"
      value = "${var.password}"
    }
]
```

Then I compiled the task definition using the module I mentioned above:

```
module "container_definition_app" {
  source  = "cloudposse/ecs-container-definition/aws"
  version = "v0.7.0"

  container_name  = "${var.name}"
  container_image = "${var.image}"

  container_cpu                = "${var.ecs_task_cpu}"
  container_memory             = "${var.ecs_task_memory}"
  container_memory_reservation = "${var.container_memory_reservation}"

  port_mappings = [
    {
      containerPort = "${var.app_port}"
      hostPort      = "${var.app_port}"
      protocol      = "tcp"
    },
  ]

  environment = "${local.container_environment_variables}"

}
```

I was pretty confused at this point - I need to define a lot of configuration here to get this running and I’ve barely even started, but it made a little sense - anything running a docker container needs to have _some_ idea of the configuration values of the docker container. I’ve [previously written][7] about the problems with Kubernetes and configuration management and the same problem seemed to be rearing its ugly head again here.

Next, I defined the task definition from the module above (which thankfully abstracted the required JSON away from me - if I had to hand write JSON at this point I’ve have probably given up).

I realised immediately I was missing something as I was defining the module parameters. I need an IAM role as well! Okay, let me define that:

```
resource "aws_iam_role" "ecs_task_execution" {
  name = "${var.name}-ecs_task_execution"

  assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution" {
  count = "${length(var.policies_arn)}"

  role       = "${aws_iam_role.ecs_task_execution.id}"
  policy_arn = "${element(var.policies_arn, count.index)}"
}
```

That makes sense, I’d need to define an RBAC policy in Kubernetes, so I’m still not exactly losing or gaining anything here. I am starting to think at this point that this feels very familiar from a Kubernetes perspective.

```
resource "aws_ecs_task_definition" "app" {
  family                   = "${var.name}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "${var.ecs_task_cpu}"
  memory                   = "${var.ecs_task_memory}"
  execution_role_arn       = "${aws_iam_role.ecs_task_execution.arn}"
  task_role_arn            = "${aws_iam_role.ecs_task_execution.arn}"

  container_definitions    = "${module.container_definition_app.json}"

}
```

At this point, I’ve written quite a few lines of code to get this running, read a lot of ECS documentation and all I’ve done is define a task definition. I still haven’t got this thing running yet. I’m really confused at this point what the value add is here over a Kubernetes based platform, but I continued onwards.

#### Services

A service is partly how to expose the container to the world, and partly how you define how many replicas it has. My first thought was “Ah! This is like a Kubernetes service!” and I set about mapping the ports and such like. Here was my first run at the terraform:

```
resource "aws_ecs_service" "app" {
  name                               = "${var.name}"
  cluster                            = "${module.ecs.this_ecs_cluster_id}"
  task_definition                    = "${data.aws_ecs_task_definition.app.family}:${max(aws_ecs_task_definition.app.revision, data.aws_ecs_task_definition.app.revision)}"
  desired_count                      = "${var.ecs_service_desired_count}"
  launch_type                        = "FARGATE"
  deployment_maximum_percent         = "${var.ecs_service_deployment_maximum_percent}"
  deployment_minimum_healthy_percent = "${var.ecs_service_deployment_minimum_healthy_percent}"

  network_configuration {
    subnets          = ["${values(local.private_subnets)}"]
    security_groups  = ["${module.app.this_security_group_id}"]
  }

}
```

I again got frustrated when I had to define the security group for this that allowed access to the ports needed, but I did so and plugged that into the network configuration. Then I got a smack in the face.

I need to define my own loadbalancer?

What?

Surely not?

##### LoadBalancers Never Go Away

I was honestly kind floored by this, I’m not even sure why. I’ve gotten so used to Kubernetes services and ingress objects that I completely took for granted how easy it is to get my application on the web with Kubernetes. Of course, we’ve spent months building a platform to make this easier at $work. I’m a heavy user of [external-dns][8] and [cert-manager][9] to automate populating DNS entries on ingress objects and automating TLS certificates and I am very aware of the work needed to get these set up, but I honestly thought it would be easier to do this on Fargate. I recognise that Fargate isn’t claiming to be the be all and end-all of how to run applications - it’s just abstracting away the node management - but I have been consistently told this is _easier_ than Kubernetes. I really was surprised. Defining a LoadBalancer (even if you don’t want to use Ingresses and Ingress controllers) is part and parcel of deploying a service to Kubernetes, and I had to do the same thing again here. It just all felt so familiar.

I now realised I needed:

  * A loadbalancer
  * A TLS certificate
  * A DNS entry



So I set about making those. I made use of some popular terraform modules, and came up with this:

```
# Define a wildcard cert for my app
module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "v1.1.0"

  create_certificate = true

  domain_name = "${var.route53_zone_name}"
  zone_id     = "${data.aws_route53_zone.this.id}"

  subject_alternative_names = [
    "*.${var.route53_zone_name}",
  ]


  tags = "${local.tags}"

}
# Define my loadbalancer
resource "aws_lb" "main" {
  name            = "${var.name}"
  subnets         = [ "${values(local.public_subnets)}" ]
  security_groups = ["${module.alb_https_sg.this_security_group_id}", "${module.alb_http_sg.this_security_group_id}"]
}

resource "aws_lb_target_group" "main" {
  name        = "${var.name}"
  port        = "${var.app_port}"
  protocol    = "HTTP"
  vpc_id      = "${local.vpc_id}"
  target_type = "ip"
  depends_on  = [ "aws_lb.main" ]
}

# Redirect all traffic from the ALB to the target group
resource "aws_lb_listener" "main" {
  load_balancer_arn = "${aws_lb.main.id}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.main.id}"
    type             = "forward"
  }
}

resource "aws_lb_listener" "main-tls" {
  load_balancer_arn = "${aws_lb.main.id}"
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = "${module.acm.this_acm_certificate_arn}"

  default_action {
    target_group_arn = "${aws_lb_target_group.main.id}"
    type             = "forward"
  }
}
```

I’ll be completely honest here - I screwed this up several times. I had to fish around in the AWS console to figure out what I’d done wrong. It certainly wasn’t an “easy” process - and I’ve done this before - many times. Honestly, at this point, Kubernetes looked positively _enticing_ to me, but I realised it was because I was very familiar with it. If I was lucky enough to be using a managed Kubernetes platform (with external-dns and cert-manager preinstalled) I’d really wonder what value add I was missing from Fargate. It just really didn’t feel that easy.

After a bit of back and forth, I now had a working ECS service. The final definition, including the service, looked a bit like this:

```
data "aws_ecs_task_definition" "app" {
  task_definition = "${var.name}"
  depends_on      = ["aws_ecs_task_definition.app"]
}

resource "aws_ecs_service" "app" {
  name                               = "${var.name}"
  cluster                            = "${module.ecs.this_ecs_cluster_id}"
  task_definition                    = "${data.aws_ecs_task_definition.app.family}:${max(aws_ecs_task_definition.app.revision, data.aws_ecs_task_definition.app.revision)}"
  desired_count                      = "${var.ecs_service_desired_count}"
  launch_type                        = "FARGATE"
  deployment_maximum_percent         = "${var.ecs_service_deployment_maximum_percent}"
  deployment_minimum_healthy_percent = "${var.ecs_service_deployment_minimum_healthy_percent}"

  network_configuration {
    subnets          = ["${values(local.private_subnets)}"]
    security_groups  = ["${module.app_sg.this_security_group_id}"]
  }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.main.id}"
    container_name   = "app"
    container_port   = "${var.app_port}"
  }

  depends_on = [
    "aws_lb_listener.main",
  ]

}
```

I felt like it was close at this point, but then I remembered I’d only done 2 of the required 3 steps from the original “Getting Started” document - I still needed to define the ECS cluster.

#### Clusters

Thanks to a very well [defined module][10], defining the cluster to run all this on was actually very easy.

```
module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "v1.1.0"

  name = "${var.name}"
}
```

What surprised me the _most_ here is why I had to define a cluster at all. As someone reasonably familiar with ECS it makes some sense you’d need a cluster, but I tried to consider this from the point of view of someone having to go through this process as a complete newcomer - it seems surprising to me that Fargate is billed as “serverless” but you still need to define a cluster. It’s a small detail, but it really stuck in my mind.

### Tell me your secrets

At this stage of the process, I was fairly happy I managed to get something running. There was however something missing from my original criteria. If we go all the way back to the task definition, you’ll remember my app has an environment variable for the password:

```
container_environment_variables = [
    {
      name  = "USER"
      value = "${var.user}"
    },
    {
      name  = "PASSWORD"
      value = "${var.password}"
    }
]
```

If I looked at my task definition in the AWS console, my password was there, staring at me in plaintext. I wanted this to end, so I set about trying to move this into something else, similar to [Kubernetes secrets][11]

#### AWS SSM

The way Fargate/ECS does the secret management portion is to use [AWS SSM][12] (the full name for this service is AWS Systems Manager Parameter Store, but I refuse to use that name because quite frankly it’s stupid)

The AWS documentation [covers this][13] fairly well, so I set about converting this to terraform.

##### Specifying the Secret

First, you have to define a parameter and give it a name. In terraform, it looks like this:

```
resource "aws_ssm_parameter" "app_password" {
  name  = "${var.app_password_param_name}" # The name of the value in AWS SSM
  type  = "SecureString"
  value = "${var.app_password}" # The actual value of the password, like correct-horse-battery-stable
}
```

Obviously the key component here is the “SecureString” type. This uses the default AWS KMS key to encrypt the data, something that was not immediately obvious to me. This has a huge advantage over Kubernetes secrets, which aren’t encrypted in etcd by default.

Then I specified another local value map for ECS, and passed that as a secret parameter:

```
container_secrets = [
    {
      name      = "PASSWORD"
      valueFrom = "${var.app_password_param_name}"
    },
]

module "container_definition_app" {
  source  = "cloudposse/ecs-container-definition/aws"
  version = "v0.7.0"

  container_name  = "${var.name}"
  container_image = "${var.image}"

  container_cpu                = "${var.ecs_task_cpu}"
  container_memory             = "${var.ecs_task_memory}"
  container_memory_reservation = "${var.container_memory_reservation}"

  port_mappings = [
    {
      containerPort = "${var.app_port}"
      hostPort      = "${var.app_port}"
      protocol      = "tcp"
    },
  ]

  environment = "${local.container_environment_variables}"
  secrets     = "${local.container_secrets}"
```

##### A problem arises

At this point, I redeployed my task definition, and was very confused. Why isn’t the task rolling out properly? I kept seeing in the console that the running app was still using the previous task definition (version 7) when the new task definition (version 8) was available. This took me way longer than it should have to figure out, but in the events screen on the console, I noticed an IAM error. I had missed a step, and the container couldn’t read the secret from AWS SSM, because it didn’t have the correct IAM permissions. This was the first time I got genuinely frustrated with this whole thing. The feedback here was _terrible_ from a user experience perspective. If I hadn’t known any better, I would have figured everything was fine, because there was still a task running, and my app was still available via the correct URL - I was just getting the old config.

In a Kubernetes world, I would have clearly seen an error in the pod definition. It’s absolutely fantastic that Fargate makes sure my app doesn’t go down, but as an operator I need some actual feedback as to what’s happening. This really wasn’t good enough. I genuinely hope someone from the Fargate team reads this and tries to improve this experience.

### That’s a wrap?

This was the end of the road - my app was running and I’d met all my criteria. I did realise that I had some improvements to make, which included:

  * Defining a cloudwatch log group, so I could write logs correctly
  * Add a route53 hosted zone to make the whole thing a little easier to automate from a DNS perspective
  * Fix and rescope the IAM permissions, which were very broad at this point



But honestly at this point, I wanted to reflect on the experience. I threw out a [twitter thread][14] about my experience and then spent the rest of the time thinking about what I really felt here.

### Table Stakes

What I realised, after an evening of reflection, was that this process is largely the same whether you’re using Fargate or Kubernetes. What surprised me the most was that despite the regular claims I’ve heard that Fargate is “easier” I really just couldn’t see any benefits over a Kubernetes based platform. Now, if you’re in a world where you’re building Kubernetes clusters I can absolutely see the value here - managing nodes and the control plane is just overhead you don’t really need. The problem is - most consumers of a Kubernetes based platform don’t _have_ to do this. If you’re lucky enough to be using GKE, you barely even need to think about the management of the cluster, you can run a cluster with a single gcloud command nowadays. I regularly use Digital Ocean’s managed Kubernetes service and I can safely say that it was as easy as spinning up a Fargate cluster - in fact in some way’s it was easier.

Having to define some infrastructure to run your container is table stakes at this point. Google may have just changed the game this week with their [Google Cloud Run][15] product, but they’re massively ahead of everyone else in this field.

What I think can be safely said from this whole experience though is this: _Running containers at scale is still hard_. It requires thought, it requires domain knowledge, it requires collaboration between Operations and Developers. It also requires a foundation to build on - any AWS based operation is going to need to have some fundamental infrastructure defined and running. I’m very intrigued by the “NoOps” concept that some companies seem to aspire for. I guess if you’re running a stateless application, and you can put it all inside a lambda function and an API gateway you’re probably in a good position, but are we really close to this in any kind of enterprise environment? I really don’t think so.

#### Fair Comparisons

Another realisation that struck me is that often the comparisons between technology A and technology B sometimes aren’t really fair, and I see this very often with AWS. The reality of the situation is often very different from the Jeff Barr blogpost. If you’re a small enough company that you can deploy your application in AWS using the AWS console and select all of the defaults, this absolutely is easier. However, I didn’t want to use the defaults, because the defaults are almost always not production ready. Once you start to peel back the layers of cloud provider services, you begin to realise that at the end of the day - you’re still running software. It still needs to be designed well, deployed well and operated well. I believe that the value add of AWS and Kubernetes and all the other cloud providers is it makes it much, much easier to run, design and operate things well, but it is definitely not free.

#### Arguing for Kubernetes

My final takeaway here is this: if you view Kubernetes purely as a container orchestration tool, you’re probably going to love Fargate. However, as I’ve become more familiar with Kubernetes, I’ve come to appreciate just how important it is as a technology - not just because it’s a great container orchestration tool but also because of its design patterns - it’s declarative, API driven platform. A simple though that occurred to me during _all_ of this Fargate process was that if I deleted any of this stuff, Fargate isn’t necessarily going to recreate it for me. Autoscaling is nice, not having to manage servers and patching and OS updates is awesome, but I felt I’d lost so much by not being able to use Kubernetes self healing and API driven model. Sure, Kubernetes has a learning curve - but from this experience, so does Fargate.

### Summary

Despite my confusion during some of this process, I really did enjoy the experience. I still believe Fargate is a fantastic technology, and what the AWS team has done with ECS/Fargate really is nothing short of remarkable. My perspective however is that this is definitely not “easier” than Kubernetes, it’s just.. different.

The problems that arise when running containers in production are largely the same. If you take anything away from this post it should be this: _whichever way you choose is going to have operational overhead_. Don’t fall into the trap of believing that you can just pick something and your world is going to be easier. My personal opinion is this: If you have an operations team and your company is going to be deploying containers across multiple app teams - pick a technology and build processes and tooling around it to make it easier.

I’m certainly going to take the claims from people that certain technology is easier with a grain of salt from now on. At this stage, when it comes to Fargate, this sums up my feelings:

> [][16]

--------------------------------------------------------------------------------

via: https://leebriggs.co.uk/blog/2019/04/13/the-fargate-illusion.html

作者：[Lee Briggs][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://leebriggs.co.uk/
[b]: https://github.com/lujun9972
[1]: https://matthias-endler.de/2019/maybe-you-dont-need-kubernetes/
[2]: https://aws.amazon.com/fargate/
[3]: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_GetStarted.html
[4]: https://imgur.com/FpU0lds
[5]: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html
[6]: https://github.com/cloudposse/terraform-aws-ecs-container-definition
[7]: https://leebriggs.co.uk/blog/2018/05/08/kubernetes-config-mgmt.html
[8]: https://github.com/kubernetes-incubator/external-dns
[9]: https://github.com/jetstack/cert-manager
[10]: https://github.com/terraform-aws-modules/terraform-aws-ecs
[11]: https://kubernetes.io/docs/concepts/configuration/secret/
[12]: https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-paramstore.html
[13]: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/specifying-sensitive-data.html
[14]: https://twitter.com/briggsl/status/1116870900719030272
[15]: https://cloud.google.com/run/
[16]: https://imgur.com/QfFg225
