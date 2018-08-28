How to publish a WordPress blog to a static GitLab Pages site
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web-design-monitor-website.png?itok=yUK7_qR0)

A long time ago, I set up a WordPress blog for a family member. There are lots of options these days, but back then there were few decent choices if you needed a web-based CMS with a WYSIWYG editor. An unfortunate side effect of things working well is that the blog has generated a lot of content over time. That means I was also regularly updating WordPress to protect against the exploits that are constantly popping up.

So I decided to convince the family member that switching to [Hugo][1] would be relatively easy, and the blog could then be hosted on [GitLab][2]. But trying to extract all that content and convert it to [Markdown][3] turned into a huge hassle. There were automated scripts that got me 95% there, but nothing worked perfectly. Manually updating all the posts was not something I wanted to do, so eventually, I gave up trying to move the blog.

Recently, I started thinking about this again and realized there was a solution I hadn't considered: I could continue maintaining the WordPress server but set it up to publish a static mirror and serve that with [GitLab Pages][4] (or [GitHub Pages][5] if you like). This would allow me to automate [Let's Encrypt][6] certificate renewals as well as eliminate the security concerns associated with hosting a WordPress site. This would, however, mean comments would stop working, but that feels like a minor loss in this case because the blog did not garner many comments.

Here's the solution I came up with, which so far seems to be working well:

  * Host WordPress site at URL that is not linked to or from anywhere else to reduce the odds of it being exploited. In this example, we'll use <http://private.localconspiracy.com> (even though this site is actually built with Pelican).
  * [Set up hosting on GitLab Pages][7] for the public URL <https://www.localconspiracy.com>.
  * Add a [cron job][8] that determines when the last-built date differs between the two URLs; if the build dates differ, mirror the WordPress version.
  * After mirroring with `wget`, update all links from "private" version to "public" version.
  * Do a `git push` to publish the new content.



These are the two scripts I use:

`check-diff.sh` (called by cron every 15 minutes)
```
#!/bin/bash

ORIGINDATE="$(curl -v --silent http://private.localconspiracy.com/feed/ 2>&1|grep lastBuildDate)"
PUBDATE="$(curl -v --silent https://www.localconspiracy.com/feed/ 2>&1|grep lastBuildDate)"

if [ "$ORIGINDATE" !=  "$PUBDATE" ]
then
  /home/doc/repos/localconspiracy/mirror.sh
fi
```

`mirror.sh:`
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

That's it! Now, when the blog is changed, within 15 minutes the site is mirrored to a static version and pushed up to the repo where it will be reflected in GitLab pages.

This concept could be extended a little further if you wanted to [run WordPress locally][9]. In that case, you would not need a server to host your WordPress blog; you could just run it on your local machine. In that scenario, there's no chance of your blog getting exploited. As long as you can run `wget` against it locally, you could use the approach outlined above to have a WordPress site hosted on GitLab Pages.

_This article was originally posted at[Local Conspiracy][10]. Reposted with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/publish-wordpress-static-gitlab-pages-site

作者：[Christopher Aedo][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
