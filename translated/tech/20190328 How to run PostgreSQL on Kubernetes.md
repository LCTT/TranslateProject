[#]: collector: (lujun9972)
[#]: translator: (arrowfeng)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to run PostgreSQL on Kubernetes)
[#]: via: (https://opensource.com/article/19/3/how-run-postgresql-kubernetes)
[#]: author: (Jonathan S. Katz https://opensource.com/users/jkatz05)

怎样在Kubernetes上运行PostgreSQL
======
创建统一管理的，具备灵活性的云原生生产部署来部署一个人性化的数据库即服务。
![cubes coming together to create a larger cube][1]

通过在[Kubernetes][2]上运行[PostgreSQL][3]数据库，你能创建统一管理的，具备灵活性的云原生生产部署应用来部署一个个性化的数据库即服务为你的特定需求进行量身定制。

对于Kubernetes，使用Operator允许你提供额外的上下文去[管理有状态应用][4]。当使用像PostgreSQL这样开源的数据库去执行包括配置，扩张，高可用和用户管理时，Operator也很有帮助。

让我们来探索如何在Kubernetes上启动并运行PostgreSQL。

### 安装 PostgreSQL Operator

将PostgreSQL和Kubernetes结合使用的第一步是安装一个Operator。在针对Linux系统的Crunchy's [快速启动脚本][6]的帮助下，你可以在任意基于Kubernetes的环境下启动和运行开源的[Crunchy PostgreSQL Operator][5]。

快速启动脚本有一些必要前提：

  * [Wget][7]工具已安装。
  * [kubectl][8]工具已安装。
  * 一个[StorageClass][9]已经定义在你的Kubernetes中。
  * 拥有集群权限的可访问Kubernetes的用户账号。安装Operator的[RBAC][10]规则是必要的。
  * 拥有一个[namespace][11]去管理PostgreSQL Operator。



执行这个脚本将提供给你一个默认的PostgreSQL Operator deployment，它假设你的[dynamic storage][12]和存储类的名字为**standard**。通过这个脚本允许用户自定义的值去覆盖这些默认值。

通过下列命令，你能下载这个快速启动脚本并把它的权限设置为可执行：
```
wget <https://raw.githubusercontent.com/CrunchyData/postgres-operator/master/examples/quickstart.sh>
chmod +x ./quickstart.sh
```

然后你运行快速启动脚本：
```
./examples/quickstart.sh
```

在脚本提示你相关的Kubernetes集群基本信息后，它将执行下列操作：
  * 下载Operator配置文件
  * 将 **$HOME/.pgouser** 这个文件设置为默认设置
  * 以Kubernetes [Deployment][13]部署Operator
  * 设置你的 **.bashrc** 文件包含Operator环境变量
  * 设置你的 **$HOME/.bash_completion** 文件为 **pgo bash_completion**文件
  
在快速启动脚本的执行期间，你将会被提示在你的Kubernetes集群设置RBAC规则。在另一个终端，执行快速启动命令所提示你的命令。

一旦这个脚本执行完成，你将会得到关于打开一个端口转发到PostgreSQL Operator pod的信息。在另一个终端，执行端口转发；这将允许你开始对PostgreSQL Operator执行命令！尝试输入下列命令创建集群：

```
pgo create cluster mynewcluster
```

你能输入下列命令测试你的集群运行状况：

```
pgo test mynewcluster
```

现在，你能在Kubernetes环境下管理你的PostgreSQL数据库！你可以在[官方文档][14]找到非常全面的命令，包括扩容，高可用，备份等等。

* * *
这篇文章部分参考了该作者为了Crunchy博客而写的[在Kubernetes上开始运行PostgreSQL][15]


--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/how-run-postgresql-kubernetes

作者：[Jonathan S. Katz][a]
选题：[lujun9972][b]
译者：[arrowfeng](https://github.com/arrowfeng)
校对：[校对ID](https://github.com/校对ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jkatz05
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cube_innovation_process_block_container.png?itok=vkPYmSRQ (cubes coming together to create a larger cube)
[2]: https://www.postgresql.org/
[3]: https://kubernetes.io/
[4]: https://opensource.com/article/19/2/scaling-postgresql-kubernetes-operators
[5]: https://github.com/CrunchyData/postgres-operator
[6]: https://crunchydata.github.io/postgres-operator/stable/installation/#quickstart-script
[7]: https://www.gnu.org/software/wget/
[8]: https://kubernetes.io/docs/tasks/tools/install-kubectl/
[9]: https://kubernetes.io/docs/concepts/storage/storage-classes/
[10]: https://kubernetes.io/docs/reference/access-authn-authz/rbac/
[11]: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
[12]: https://kubernetes.io/docs/concepts/storage/dynamic-provisioning/
[13]: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
[14]: https://crunchydata.github.io/postgres-operator/stable/#documentation
[15]: https://info.crunchydata.com/blog/get-started-runnning-postgresql-on-kubernetes
