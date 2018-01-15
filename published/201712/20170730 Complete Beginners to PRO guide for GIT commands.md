GIT 命令“从初学到专业”完整进阶指南 
=========== 

在[之前的教程][1]中，我们已经学习了在机器上安装 git。本教程，我们将讨论如何使用 git，比如与 git 一起使用的各种命令。所以我们开始吧，

- 推荐阅读：[如何在 Linux 上安装 GIT (Ubuntu 和 CentOS)][1]

### 设置用户信息

这应该是安装完 git 的第一步。我们将添加用户信息 (用户名和邮箱)，所以当我们提交代码时，会产生带有用户信息的提交信息，这使得跟踪提交过程变得更容易。要添加用户信息，命令是 `git config`：

```
$ git config --global user.name "Daniel"
$ git config --global user.email "dan.mike@xyz.com"
```

添加完用户信息之后，通过运行下面命令，我们将检查这些信息是否成功更新。

```
$ git config --list
```

我们应该能够看到输出的用户信息。 

### GIT 命令
#### 新建一个仓库

为了建立一个新仓库，运行如下命令：

```
$ git init
``` 

#### 查找一个仓库

为了查找一个仓库，命令如下：

```
$ git grep "repository"
```

#### 与远程仓库连接 

为了与远程仓库连接，运行如下命令：

```
$ git remote add origin remote_server
```

然后检查所有配置的远程服务器，运行如下命令：

```
$ git remote -v
``` 

#### 克隆一个仓库

为了从本地服务器克隆一个仓库，运行如下代码：

```
$ git clone repository_path
```

如果我们想克隆远程服务器上的一个仓库，那克隆这个仓库的命令是：

```
$ git clone repository_path
```

#### 在仓库中列出分支

为了检查所有可用的和当前工作的分支列表，执行：

```
$ git branch
```

#### 创建新分支

创建并使用一个新分支，命令是：

```
$ git checkout -b 'branchname'
```

#### 删除一个分支

为了删除一个分支，执行：

```
$ git branch -d 'branchname'
``` 

为了删除远程仓库的一个分支，执行：

```
$ git push origin:'branchname'
```

#### 切换到另一个分支

从当前分支切换到另一个分支，使用

```
$ git checkout 'branchname'
``` 

#### 添加文件

添加文件到仓库，执行：

```
$ git add filename
```

#### 文件状态 

检查文件状态 (那些将要提交或者添加的文件)，执行：

```
$ git status
```

#### 提交变更

在我们添加一个文件或者对一个文件作出变更之后，我们通过运行下面命令来提交代码：

```
$ git commit -a
```

提交变更到 head 但不提交到远程仓库，命令是：

```
$ git commit -m "message"
```

#### 推送变更 

推送对该仓库 master 分支所做的变更，运行：

```
$ git push origin master
``` 

#### 推送分支到仓库 

推送对单一分支做出的变更到远程仓库，运行：

```
$ git push origin 'branchname'
```

推送所有分支到远程仓库，运行：

```
$ git push -all origin
```

#### 合并两个分支

合并另一个分支到当前活动分支，使用命令：

```
$ git merge 'branchname'
``` 

#### 从远端服务器合并到本地服务器 

从远端服务器下载/拉取变更到到本地服务器的工作目录，运行：

```
$ git pull 
``` 

#### 检查合并冲突

查看对库文件的合并冲突，运行：

```
$ git diff -base 'filename'
``` 

查看所有冲突，运行：

```
$ git diff
``` 

如果我们在合并之前想预览所有变更，运行：

```
$ git diff 'source-branch' 'target-branch' 
```

#### 创建标记

创建标记来标志任一重要的变更，运行：

```
$ git tag 'tag number' 'commit id' 
```

通过运行以下命令，我们可以查找 commit id ：

```
$ git log
``` 
#### 推送标记

推送所有创建的标记到远端服务器，运行：

```
$ git push -tags origin
```

#### 回复做出的变更

如果我们想用 head 中最后一次变更来替换对当前工作树的变更，运行：

```
$ git checkout -'filename'
```

我们也可以从远端服务器获取最新的历史，并且将它指向本地仓库的 master 分支,而不是丢弃掉所有本地所做所有变更。为了这么做，运行：

```
$ git fetch origin
$ git reset -hard master
```

好了，伙计们。这些就是我们使用 git 服务器的命令。我们将会很快为大家带来更有趣的教程。如果你希望我们对某个特定话题写一个教程，请通过下面的评论箱告诉我们。像往常一样， 欢迎您的各种意见和建议。

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/beginners-to-pro-guide-for-git-commands/

作者：[Shusain][a]
译者：[liuxinyu123](https://github.com/liuxinyu123)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/install-git-linux-ubuntu-centos/
[2]:/cdn-cgi/l/email-protection
[3]:http://linuxtechlab.com/scheduling-important-jobs-crontab/
[4]:https://www.facebook.com/linuxtechlab/
[5]:https://twitter.com/LinuxTechLab
[6]:https://plus.google.com/+linuxtechlab
[7]:http://linuxtechlab.com/contact-us-2/
