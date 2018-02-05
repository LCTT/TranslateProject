如何在 Ubuntu 上使用 pm2 和 Nginx 部署 Node.js 应用
============================================================
 
pm2 是一个 Node.js 应用的进程管理器，它可以让你的应用程序保持运行，还有一个内建的负载均衡器。它非常简单而且强大，你可以零间断重启或重新加载你的 node 应用，它也允许你为你的 node 应用创建集群。

在这篇博文中，我会向你展示如何安装和配置 pm2 用于这个简单的 'Express' 应用，然后配置 Nginx 作为运行在 pm2 下的 node 应用的反向代理。

前提：

*   Ubuntu 16.04 - 64bit
*   Root 权限

### 第一步 - 安装 Node.js LTS

在这篇指南中，我们会从零开始我们的实验。首先，我们需要在服务器上安装 Node.js。我会使用 Nodejs LTS 6.x 版本，它能从 nodesource 仓库中安装。

从 Ubuntu 仓库安装 `python-software-properties` 软件包并添加 “nodesource” Nodejs 仓库。

```
sudo apt-get install -y python-software-properties 
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
```

安装最新版本的 Nodejs LTS：

```
sudo apt-get install -y nodejs
```

安装完成后，查看 node 和 npm 版本。

```
node -v
npm -v
```

[
 ![检查 node.js 版本](https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/1.png) 
][10]

### 第二步 - 生成 Express 示例 App

我会使用 `express-generator` 软件包生成的简单 web 应用框架进行示例安装。`express-generator` 可以使用 `npm` 命令安装。

用 `npm `安装 `express-generator`：

```
npm install express-generator -g
```

- `-g` ： 在系统内部安装软件包。

我会以普通用户运行应用程序，而不是 root 或者超级用户。我们首先需要创建一个新的用户。

创建一个名为 `yume` 的用户：

```
useradd -m -s /bin/bash yume
passwd yume
```

使用 `su` 命令登录到新用户：

```
su - yume
```

下一步，用 `express` 命令生成一个新的简单 web 应用程序：

```
express hakase-app
```

命令会创建新项目目录 `hakase-app`。

[
 ![用 express-generator 生成应用框架](https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/2.png) 
][11]

进入到项目目录并安装应用需要的所有依赖。

```
cd hakase-app
npm install
```

然后用下面的命令测试并启动一个新的简单应用程序：

```
DEBUG=myapp:* npm start
```

默认情况下，我们的 express 应用会运行在 `3000` 端口。现在访问服务器的 IP 地址：192.168.33.10:3000 ：

[
 ![express nodejs 运行在 3000 端口](https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/3.png) 
][13]

这个简单 web 应用框架现在以 'yume' 用户运行在 3000 端口。

### 第三步 - 安装 pm2

pm2 是一个 node 软件包，可以使用 `npm` 命令安装。（用 root 权限，如果你仍然以 yume 用户登录，那么运行命令 `exit` 再次成为 root 用户）：

```
npm install pm2 -g
```

现在我们可以为我们的 web 应用使用 pm2 了。

进入应用目录 `hakase-app`：

```
su - yume
cd ~/hakase-app/
```

这里你可以看到一个名为 `package.json` 的文件，用 `cat` 命令显示它的内容。

```
cat package.json
```

[
 ![配置 express nodejs 服务](https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/4.png) 
][14]

你可以看到 `start` 行有一个 nodejs 用于启动 express 应用的命令。我们会和 pm2 进程管理器一起使用这个命令。

像下面这样使用 `pm2` 命令运行 express 应用：

```
pm2 start ./bin/www
```

现在你可以看到像下面这样的结果：

[
 ![使用 pm2 运行 nodejs app](https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/5.png) 
][15]

我们的 express 应用正在 `pm2` 中运行，名称为 `www`，id 为 `0`。你可以用 show 选项 `show nodeid|name` 获取更多 pm2 下运行的应用的信息。

```
pm2 show www
```

[
 ![pm2 服务状态](https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/6.png) 
][16]

如果你想看我们应用的日志，你可以使用 logs 选项。它包括访问和错误日志，你还可以看到应用程序的 HTTP 状态。

```
pm2 logs www
```

[
 ![pm2 服务日志](https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/7.png) 
][17]

你可以看到我们的程序正在运行。现在，让我们来让它开机自启动。

```
pm2 startup systemd
```

- `systemd`： Ubuntu 16 使用的是 systemd。

你会看到要用 root 用户运行命令的信息。使用 `exit` 命令回到 root 用户然后运行命令。

```
sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u yume --hp /home/yume
```

它会为启动应用程序生成 systemd 配置文件。当你重启服务器的时候，应用程序就会自动运行。

[
 ![pm2 添加服务到开机自启动](https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/8.png) 
][18]

### 第四步 - 安装和配置 Nginx 作为反向代理

在这篇指南中，我们会使用 Nginx 作为 node 应用的反向代理。Ubuntu 仓库中有 Nginx，用 `apt` 命令安装它：

```
sudo apt-get install -y nginx
```

下一步，进入到 `sites-available` 目录并创建新的虚拟主机配置文件。

```
cd /etc/nginx/sites-available/
vim hakase-app
```

粘贴下面的配置：

```
upstream hakase-app {
    # Nodejs app upstream
    server 127.0.0.1:3000;
    keepalive 64;
}

# Server on port 80
server {
    listen 80;
    server_name hakase-node.co;
    root /home/yume/hakase-app;

    location / {
        # Proxy_pass configuration
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_set_header X-NginX-Proxy true;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_max_temp_file_size 0;
        proxy_pass http://hakase-app/;
        proxy_redirect off;
        proxy_read_timeout 240s;
    }
}
```

保存文件并退出 vim。

在配置中：

*	node 应用使用域名 `hakase-node.co` 运行。
*	所有来自 nginx 的流量都会被转发到运行在 `3000` 端口的 node app。

测试 Nginx 配置确保没有错误。

```
nginx -t
```

启用 Nginx 并使其开机自启动。

```
systemctl start nginx
systemctl enable nginx
```

### 第五步 - 测试

打开你的 web 浏览器并访问域名（我的是）：[http://hakase-app.co][19]

你可以看到 express 应用正在 Nginx web 服务器中运行。

[
 ![Nodejs app 在 pm2 和 Nginx 中运行](https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/9.png) 
][20]

下一步，重启你的服务器，确保你的 node app 能开机自启动：

```
pm2 save
sudo reboot
```

如果你再次登录到了你的服务器，检查 node app 进程。以 `yume` 用户运行下面的命令。 

```
su - yume
pm2 status www
```

[
 ![nodejs 在 pm2 下开机自启动](https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/10.png) 
][21]

Node 应用在 pm2 中运行并使用 Nginx 作为反向代理。

### 链接

*   [Ubuntu][7]
*   [Node.js][8]
*   [Nginx][9]

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-deploy-nodejs-applications-with-pm2-and-nginx-on-ubuntu/

作者：[Muhammad Arul][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/how-to-deploy-nodejs-applications-with-pm2-and-nginx-on-ubuntu/
[1]:https://www.howtoforge.com/tutorial/how-to-deploy-nodejs-applications-with-pm2-and-nginx-on-ubuntu/#step-install-nodejs-lts
[2]:https://www.howtoforge.com/tutorial/how-to-deploy-nodejs-applications-with-pm2-and-nginx-on-ubuntu/#step-generate-express-sample-app
[3]:https://www.howtoforge.com/tutorial/how-to-deploy-nodejs-applications-with-pm2-and-nginx-on-ubuntu/#step-install-pm
[4]:https://www.howtoforge.com/tutorial/how-to-deploy-nodejs-applications-with-pm2-and-nginx-on-ubuntu/#step-install-and-configure-nginx-as-a-reverse-proxy
[5]:https://www.howtoforge.com/tutorial/how-to-deploy-nodejs-applications-with-pm2-and-nginx-on-ubuntu/#step-testing
[6]:https://www.howtoforge.com/tutorial/how-to-deploy-nodejs-applications-with-pm2-and-nginx-on-ubuntu/#links
[7]:https://www.ubuntu.com/
[8]:https://nodejs.org/en/
[9]:https://www.nginx.com/
[10]:https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/big/1.png
[11]:https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/big/2.png
[12]:https://www.howtoforge.com/admin/articles/edit/192.168.33.10:3000
[13]:https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/big/3.png
[14]:https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/big/4.png
[15]:https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/big/5.png
[16]:https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/big/6.png
[17]:https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/big/7.png
[18]:https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/big/8.png
[19]:http://hakase-app.co/
[20]:https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/big/9.png
[21]:https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/big/10.png
