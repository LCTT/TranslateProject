如何将 WordPress 博客发布到静态 GitLab Pages 上
======

> 通过 GitLab 或 GitHub Pages 来提供一个 WordPress 镜像站点, 从而最小化安全问题。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web-design-monitor-website.png?itok=yUK7_qR0)

很久以前，我为一个家庭成员建立了一个 WordPress 博客。如今有很多选择，但是当时如果你需要一个带有所见即所得的编辑器的基于 Web 的 CMS，那么就没什么像样的的选择了。而一切运行良好的不幸的副作用是随着时间的推移该博客产生了很多内容。这意味着我要经常更新 WordPress 以防止不断出现的漏洞。

因此，当我决定劝说家人切换到 [Hugo][1] 会相对容易，然后可以在 [GitLab][2] 上托管博客。但是尝试提取所有内容并将其转换为 [Markdown][3] 变成了一个巨大的麻烦。有自动脚本完成了 95% 的工作，但并不完美。手动更新所有帖子不是我想做的事情，所以最终，我放弃了试图移动博客。

最近，我又开始考虑这个问题，并意识到有一个我没有考虑过的解决方案：我可以继续维护 WordPress 服务器，但将其设置为发布静态镜像，并使用 [GitLab Pages][4]（或 [GitHub Pages][5] ，如果你喜欢的话）提供服务。这能让我自动化 [Let's Encrypt][6] 证书续订并消除与托管 WordPress 站点相关的安全问题。然而，这意味着评论将无法使用，但在这种情况下感觉就像是一个小损失，因为博客没有收到很多评论。

这是我提出的解决方案，到目前为止似乎运作良好：

  * 托管 WordPress 站点中的 URL 没有链接到或来自其他任何地方，以减少它被利用的几率。在此例中，我们将使用 <http://private.localconspiracy.com>（即使此站点实际上是使用 Pelican 构建的）。
  * 将公共 URL <https://www.localconspiracy.com> [托管到 GitLab Pages 上][7]。
  * 添加 [cron 任务][8]，确定两个 URL 之间的最后构建日期何时不同。如果构建日期不同，则镜像 WordPress 版本。
  * 使用 `wget` 镜像后，将所有链接从“私有”更新成“公共”。
  * 运行 `git push` 来发布新内容。

这是我使用的两个脚本：

`check-diff.sh` （cron 每 15 分钟调用一次）：

```
#!/bin/bash

ORIGINDATE="$(curl -v --silent http://private.localconspiracy.com/feed/ 2>&1|grep lastBuildDate)"
PUBDATE="$(curl -v --silent https://www.localconspiracy.com/feed/ 2>&1|grep lastBuildDate)"

if [ "$ORIGINDATE" !=  "$PUBDATE" ]
then
  /home/doc/repos/localconspiracy/mirror.sh
fi
```

`mirror.sh`：

```
#!/bin/sh

cd /home/doc/repos/localconspiracy

wget \
--mirror \
--convert-links  \
--adjust-extension \
--page-requisites  \
--retry-connrefused  \
--exclude-directories=comments \
--execute robots=off \
http://private.localconspiracy.com

git rm -rf public/*
mv private.localconspiracy.com/* public/.
rmdir private.localconspiracy.com
find ./public/ -type f -exec sed -i -e 's|http://private.localconspiracy|https://www.localconspiracy|g' {} \;
find ./public/ -type f -exec sed -i -e 's|http://www.localconspiracy|https://www.localconspiracy|g' {} \;
git add public/*
git commit -m "new snapshot"
git push origin master
```

就是这些了！现在，当博客发生变化时，在 15 分钟内将网站镜像到静态版本并推送到仓库，这将在 GitLab Pages 中反映出来。

如果你想[在本地运行 WordPress][9]，这个概念可以进一步扩展。在这种情况下，你不需要服务器来托管你的 WordPress 博客。你可以在本机运行它。在这种情况下，你的博客不可能被攻击利用。只要你可以在本地运行 `wget`，就可以使用上面的方法在 GitLab Pages 上托管 WordPress 站点。

_这篇文章最初发表于 [Local Conspiracy] [10]。允许转载。_

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/publish-wordpress-static-gitlab-pages-site

作者：[Christopher Aedo][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/docaedo
[1]:https://gohugo.io/
[2]:https://gitlab.com/
[3]:https://en.wikipedia.org/wiki/Markdown
[4]:https://docs.gitlab.com/ee/user/project/pages/
[5]:https://pages.github.com/
[6]:https://letsencrypt.org/
[7]:https://about.gitlab.com/2016/04/07/gitlab-pages-setup/
[8]:https://en.wikipedia.org/wiki/Cron
[9]:https://codex.wordpress.org/Installing_WordPress_Locally_on_Your_Mac_With_MAMP
[10]:https://localconspiracy.com/2018/08/wp-on-gitlab.html
