[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10740-1.html)
[#]: subject: (The Fargate Illusion)
[#]: via: (https://leebriggs.co.uk/blog/2019/04/13/the-fargate-illusion.html)
[#]: author: (Lee Briggs https://leebriggs.co.uk/)

破除对 AWS Fargate 的幻觉
======

我在 $work 建立了一个基于 Kubernetes 的平台已经快一年了，而且有点像 Kubernetes 的布道者了。真的，我认为这项技术太棒了。然而我并没有对它的运营和维护的困难程度抱过什么幻想。今年早些时候我读了[这样][1]的一篇文章，并对其中某些观点深以为然。如果我在一家规模较小的、有 10 到 15 个工程师的公司，假如有人建议管理和维护一批 Kubernetes 集群，那我会感到害怕的，因为它的运维开销太高了！

尽管我现在对 Kubernetes 的一切都很感兴趣，但我仍然对“<ruby>无服务器<rt>Serverless</rt></ruby>”计算会消灭运维工程师的说法抱有好奇。这种好奇心主要来源于我希望在未来仍然能有一份有报酬的工作 —— 如果我们前景光明的未来不需要运维工程师，那我得明白到底是怎么回事。我已经在 Lamdba 和Google Cloud Functions 上做了一些实验，结果让我印象十分深刻，但我仍然坚信无服务器解决方案只是解决了一部分问题。

我关注 [AWS Fargate][2] 已经有一段时间了，这就是 $work 的开发人员所推崇为“无服务器计算”的东西 —— 主要是因为 Fargate，用它你就可以无需管理底层节点而运行你的 Docker 容器。我想看看它到底意味着什么，所以我开始尝试从头开始在 Fargate 上运行一个应用，看看是否可以成功。这里我对成功的定义是一个与“生产级”应用程序相近的东西，我想应该包含以下内容：

* 一个在 Fargate 上运行的容器
* 配置信息以环境变量的形式下推
* “秘密信息” 不能是明文的
* 位于负载均衡器之后
* 有效的 SSL 证书的 TLS 通道

我以“基础设施即代码”的角度来开始整个任务，不遵循默认的 AWS 控制台向导，而是使用 terraform 来定义基础架构。这很可能让整个事情变得复杂，但我想确保任何部署都是可重现的，任何想要遵循此步骤的人都可发现我的结论。

上述所有标准通常都可以通过基于 Kubernetes 的平台使用一些外部的附加组件和插件来实现，所以我确实是以一种比较的心态来处理整个任务的，因为我要将它与我的常用工作流程进行比较。我的主要目标是看看Fargate 有多容易，特别是与 Kubernetes 相比时。结果让我感到非常惊讶。

### AWS 是有开销的

我有一个干净的 AWS 账户，并决定从零到部署一个 webapp。与 AWS 中的其它基础设施一样，我必须首先使基本的基础设施正常工作起来，因此我需要先定义一个 VPC。

遵循最佳实践，因此我将这个 VPC 划分为跨可用区（AZ）的子网，一个公共子网和私有子网。这时我想到，只要这种设置基础设施的需求存在，我就能找到一份这种工作。AWS 是"免"运维的这一概念一直让我感到愤怒。开发者社区中的许多人理所当然地认为在设置和定义一个设计良好的 AWS 账户和基础设施是不需要付出多少工作和努力的。而这种想当然甚至发生在开始谈论多帐户架构*之前*就有了——现在我仍然使用单一帐户，我已经必须定义好基础设施和传统的网络设备。

这里也值得记住，我已经做了很多次，所以我*很清楚*该做什么。我可以在我的帐户中使用默认的 VPC 以及预先提供的子网，我觉得很多刚开始的人也可以使用它。这大概花了我半个小时才运行起来，但我不禁想到，即使我想运行 lambda 函数，我仍然需要某种连接和网络。定义 NAT 网关和在 VPC 中路由根本不会让你觉得很“Serverless”，但要往下进行这就是必须要做的。

### 运行简单的容器

在我启动运行了基本的基础设施之后，现在我想让我的 Docker 容器运行起来。我开始翻阅 Fargate 文档并浏览 [入门][3] 文档，这些就马上就展现在了我面前：

![][4]

等等，只是让我的容器运行就至少要有**三个**步骤？这完全不像我所想的，不过还是让我们开始吧。

#### 任务定义

“<ruby>任务定义<rt>Task Definition<rt></ruby>”用来定义要运行的实际容器。我在这里遇到的问题是，任务定义这件事非常复杂。这里有很多选项都很简单，比如指定 Docker 镜像和内存限制，但我还必须定义一个网络模型以及我并不熟悉的其它各种选项。真需要这样吗？如果我完全没有 AWS 方面的知识就进入到这个过程里，那么在这个阶段我会感觉非常的不知所措。可以在 AWS 页面上找到这些 [参数][5] 的完整列表，这个列表很长。我知道我的容器需要一些环境变量，它需要暴露一个端口。所以我首先在一个神奇的 [terraform 模块][6] 的帮助下定义了这一点，这真的让这件事更容易了。如果没有这个模块，我就得手写 JSON 来定义我的容器定义。

首先我定义了一些环境变量：

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

然后我使用上面提及的模块组成了任务定义：

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

在这一点上我非常困惑，我需要在这里定义很多配置才能运行，而这时什么都没有开始呢，但这是必要的 —— 运行 Docker 容器肯定需要了解一些容器配置的知识。我 [之前写过][7] 关于 Kubernetes 和配置管理的问题的文章，在这里似乎遇到了同样的问题。

接下来，我在上面的模块中定义了任务定义（幸好从我这里抽象出了所需的 JSON  —— 如果我不得不手写JSON，我可能已经放弃了）。

当我定义模块参数时，我突然意识到我漏掉了一些东西。我需要一个 IAM 角色！好吧，让我来定义：

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

这样做是有意义的，我需要在 Kubernetes 中定义一个 RBAC 策略，所以在这里我还未完全错失或获得任何东西。这时我开始觉得从 Kubernetes 的角度来看，这种感觉非常熟悉。

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

现在，为了运行起来我已经写了很多行代码，我阅读了很多 ECS 文档，我所做的就是定义一个任务定义。我还没有让这个东西运行起来。在这一点上，我真的很困惑这个基于 Kubernetes 的平台到底增值了什么，但我继续前行。

#### 服务

服务，一定程度上是将容器如何暴露给外部，另外是如何定义它拥有的副本数量。我的第一个想法是“啊！这就像一个 Kubernetes 服务！”我开始着手映射端口等。这是我第一次在 terraform 上跑：

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

当我必须定义允许访问所需端口的安全组时，我再次感到沮丧，当我这样做了并将其插入到网络配置中后，我就像被扇了一巴掌。

我还需要定义自己的负载均衡器？

什么？

当然不是吗？

##### 负载均衡器从未远离

老实说，我很满意，我甚至不确定为什么。我已经习惯了 Kubernetes 的服务和 Ingress 对象，我一心认为用 Kubernetes 将我的应用程序放到网上是多么容易。当然，我们在 $work 花了几个月的时间建立一个平台，以便更轻松。我是 [external-dns][8] 和 [cert-manager][9] 的重度用户，它们可以自动填充 Ingress 对象上的 DNS 条目并自动化 TLS 证书，我非常了解进行这些设置所需的工作，但老实说，我认为在 Fargate 上做这件事会更容易。我认识到 Fargate 并没有声称自己是“如何运行应用程序”这件事的全部和最终目的，它只是抽象出节点管理，但我一直被告知这比 Kubernetes *更加容易*。我真的很惊讶。定义负载均衡器（即使你不想使用 Ingress 和 Ingress Controller）也是向 Kubernetes 部署服务的重要组成部分，我不得不在这里再次做同样的事情。这一切都让人觉得如此熟悉。

我现在意识到我需要：

* 一个负载均衡器
* 一个 TLS 证书
* 一个 DNS 名字

所以我着手做了这些。我使用了一些流行的 terraform 模块，并做了这个：

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

我必须承认，我在这里搞砸了好几次。我不得不在 AWS 控制台中四处翻弄，以弄清楚我做错了什么。这当然不是一个“轻松”的过程，而且我之前已经做过很多次了。老实说，在这一点上，Kubernetes 看起来对我很有启发性，但我意识到这是因为我对它非常熟悉。幸运的是我能够使用托管的 Kubernetes 平台（预装了 external-dns 和 cert-manager），我真的很想知道我漏掉了 Fargate 什么增值的地方。它真的感觉不那么简单。

经过一番折腾，我现在有一个可以工作的 ECS 服务。包括服务在内的最终定义如下所示：

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

我觉得我已经接近完成了，但后来我记起了我只完成了最初的“入门”文档中所需的 3 个步骤中的 2 个，我仍然需要定义 ECS 群集。

#### 集群

感谢 [定义模块][10]，定义要所有这些运行的集群实际上非常简单。

```
module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "v1.1.0"

  name = "${var.name}"
}
```

这里让我感到惊讶的是为什么我必须定义一个集群。作为一个相当熟悉 ECS 的人，你会觉得你需要一个集群，但我试图从一个必须经历这个过程的新人的角度来考虑这一点 —— 对我来说，Fargate 标榜自己“
Serverless”而你仍需要定义集群，这似乎很令人惊讶。当然这是一个小细节，但它确实盘旋在我的脑海里。

### 告诉我你的 Secret

在这个阶段，我很高兴我成功地运行了一些东西。然而，我的原始的成功标准缺少一些东西。如果我们回到任务定义那里，你会记得我的应用程序有一个存放密码的环境变量：

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

如果我在 AWS 控制台中查看我的任务定义，我的密码就在那里，明晃晃的明文。我希望不要这样，所以我开始尝试将其转化为其他东西，类似于 [Kubernetes 的Secrets管理][11]。

#### AWS SSM

Fargate / ECS 执行<ruby>secret 管理<rt>secret management</rt></ruby>部分的方式是使用 [AWS SSM][12]（此服务的全名是 AWS 系统管理器参数存储库 Systems Manager Parameter Store，但我不想使用这个名称，因为坦率地说这个名字太愚蠢了）。

AWS 文档很好的[涵盖了这个内容][13]，因此我开始将其转换为 terraform。

##### 指定秘密信息

首先，你必须定义一个参数并为其命名。在 terraform 中，它看起来像这样：

```
resource "aws_ssm_parameter" "app_password" {
  name  = "${var.app_password_param_name}" # The name of the value in AWS SSM
  type  = "SecureString"
  value = "${var.app_password}" # The actual value of the password, like correct-horse-battery-stable
}
```

显然，这里的关键部分是 “SecureString” 类型。这会使用默认的 AWS KMS 密钥来加密数据，这对我来说并不是很直观。这比 Kubernetes 的 Secret 管理具有巨大优势，默认情况下，这些 Secret 在 etcd 中是不加密的。

然后我为 ECS 指定了另一个本地值映射，并将其作为 Secret 参数传递：

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

##### 出了个问题

此刻，我重新部署了我的任务定义，并且非常困惑。为什么任务没有正确拉起？当新的任务定义（版本 8）可用时，我一直在控制台中看到正在运行的应用程序仍在使用先前的任务定义（版本 7）。解决这件事花费的时间比我预期的要长，但是在控制台的事件屏幕上，我注意到了 IAM 错误。我错过了一个步骤，容器无法从 AWS SSM 中读取 Secret 信息，因为它没有正确的 IAM 权限。这是我第一次真正对整个这件事情感到沮丧。从用户体验的角度来看，这里的反馈非常*糟糕*。如果我没有发觉的话，我会认为一切都很好，因为仍然有一个任务正在运行，我的应用程序仍然可以通过正确的 URL 访问  —— 只不过是旧的配置而已。

在 Kubernetes 里，我会清楚地看到 pod 定义中的错误。Fargate 可以确保我的应用不会停止，这绝对是太棒了，但作为一名运维，我需要一些关于发生了什么的实际反馈。这真的不够好。我真的希望 Fargate 团队的人能够读到这篇文章，改善这种体验。

### 就这样了

到这里就结束了，我的应用程序正在运行，也符合我的所有标准。我确实意识到我做了一些改进，其中包括：

* 定义一个 cloudwatch 日志组，这样我就可以正确地写日志了
* 添加了一个 route53 托管区域，使整个事情从 DNS 角度更容易自动化
* 修复并重新调整了 IAM 权限，这里太宽泛了

但老实说，现在我想反思一下这段经历。我写了一个关于我的经历的 [推特会话][14]，然后花了其余时间思考我在这里的真实感受。

### 代价

经过一夜的反思，我意识到无论你是使用 Fargate 还是 Kubernetes，这个过程都大致相同。最让我感到惊讶的是，尽管我经常听说 Fargate “更容易”，但我真的没有看到任何超过 Kubernetes 平台的好处。现在，如果你正在构建 Kubernetes 集群，我绝对可以看到这里的价值 —— 管理节点和控制面板只是不必要的开销，问题是 —— 基于 Kubernetes 的平台的大多数消费者都*没有*这样做。如果你很幸运能够使用 GKE，你几乎不需要考虑集群的管理，你可以使用单个 `gcloud` 命令来运行集群。我经常使用 Digital Ocean 的 Kubernetes 托管服务，我可以肯定地说它就像操作 Fargate 集群一样简单，实际上在某种程度上它更容易。

必须定义一些基础设施来运行你的容器就是此时的代价。谷歌本周可能刚刚使用他们的 [Google Cloud Run][15] 产品改变了游戏规则，但他们在这一领域的领先优势远远领先于其他所有人。

从这整个经历中，我可以肯定的说：*大规模运行容器仍然很难。*它需要思考，需要领域知识，需要运维和开发人员之间的协作。它还需要一个基础来构建 —— 任何基于 AWS 的操作都需要事先定义和运行一些基础架构。我对一些公司似乎渴望的 “NoOps” 概念非常感兴趣。我想如果你正在运行一个无状态应用程序，你可以把它全部放在一个 lambda 函数和一个 API 网关中，这可能不错，但我们是否真的适合在任何一种企业环境中这样做？我真的不这么认为。

#### 公平比较

令我印象深刻的另一个现实是，技术 A 和技术 B 之间的比较通常不太公平，我经常在 AWS 上看到这一点。这种实际情况往往与 Jeff Barr 博客文章截然不同。如果你是一家足够小的公司，你可以使用 AWS 控制台在 AWS 中部署你的应用程序并接受所有默认值，这绝对更容易。但是，我不想使用默认值，因为默认值几乎是不适用于生产环境的。一旦你开始剥离掉云服务商服务的层面，你就会开始意识到最终你仍然是在运行软件 —— 它仍然需要设计良好、部署良好、运行良好。我相信 AWS 和 Kubernetes 以及所有其他云服务商的增值服务使得它更容易运行、设计和操作，但它绝对不是免费的。

#### Kubernetes 的争议

最后就是：如果你将 Kubernetes 纯粹视为一个容器编排工具，你可能会喜欢 Fargate。然而，随着我对 Kubernetes 越来越熟悉，我开始意识到它作为一种技术的重要性 —— 不仅因为它是一个伟大的容器编排工具，而且因为它的设计模式 —— 它是声明性的、API 驱动的平台。 在*整个* Fargate 过程期间发生的一个简单的事情是，如果我删除这里某个东西，Fargate 不一定会为我重新创建它。自动缩放很不错，不需要管理服务器和操作系统的补丁及更新也很棒，但我觉得因为无法使用 Kubernetes 自我修复和 API 驱动模型而失去了很多。当然，Kubernetes 有一个学习曲线，但从这里的体验来看，Fargate 也是如此。

### 总结

尽管我在这个过程中遭遇了困惑，但我确实很喜欢这种体验。我仍然相信 Fargate 是一项出色的技术，AWS 团队对 ECS/Fargate 所做的工作确实非常出色。然而，我的观点是，这绝对不比 Kubernetes “更容易”，只是……难点不同。

在生产环境中运行容器时出现的问题大致相同。如果你从这篇文章中有所收获，它应该是这样的：*不管你选择的哪种方式都有运维开销*。不要相信你选择一些东西你的世界就变得更轻松。我个人的意见是：如果你有一个运维团队，而你的公司要为多个应用程序团队部署容器 —— 选择一种技术并围绕它构建流程和工具以使其更容易。

人们说的一点肯定没错，用点技巧可以更容易地使用某种技术。在这个阶段，谈到 Fargate，下面的漫画这总结了我的感受：

![][16]

--------------------------------------------------------------------------------

via: https://leebriggs.co.uk/blog/2019/04/13/the-fargate-illusion.html

作者：[Lee Briggs][a]
选题：[lujun9972][b]
译者：[Bestony](https://github.com/Bestony)
校对：[wxy](https://github.com/wxy), 临石（阿里云智能技术专家）

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://leebriggs.co.uk/
[b]: https://github.com/lujun9972
[1]: https://matthias-endler.de/2019/maybe-you-dont-need-kubernetes/
[2]: https://aws.amazon.com/fargate/
[3]: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_GetStarted.html
[4]: https://i.imgur.com/YfMyXBdl.png
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
[16]: https://i.imgur.com/Bx7Q50Jl.jpg
