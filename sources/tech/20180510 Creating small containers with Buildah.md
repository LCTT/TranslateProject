pinewall translating

Creating small containers with Buildah
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open%20source_collaboration_0.png?itok=YEl_GXbv)
I recently joined Red Hat after many years working for another tech company. In my previous job, I developed a number of different software products that were successful but proprietary. Not only were we legally compelled to not share the software outside of the company, we often didn’t even share it within the company. At the time, that made complete sense to me: The company spent time, energy, and budget developing the software, so they should protect and claim the rewards it garnered.

Fast-forward to a year ago, when I joined Red Hat and developed a completely different mindset. One of the first things I jumped into was the [Buildah project][1]. It facilitates building Open Container Initiative (OCI) images, and it is especially good at allowing you to tailor the size of the image that is created. At that time Buildah was in its very early stages, and there were some warts here and there that weren’t quite production-ready.

Being new to the project, I made a few minor changes, then asked where the company’s internal git repository was so that I could push my changes. The answer: Nothing internal, just push your changes to GitHub. I was baffled—sending my changes out to GitHub would mean anyone could look at that code and use it for their own projects. Plus, the code still had a few warts, so that just seemed so counterintuitive. But being the new guy, I shook my head in wonder and pushed the changes out.

A year later, I’m now convinced of the power and value of open source software. I’m still working on Buildah, and we recently had an issue that illustrates that power and value. The issue, titled [Buildah images not so small?][2] , was raised by Tim Dudgeon (@tdudgeon). To summarize, he noted that images created by Buildah were bigger than those created by Docker, even though the Buildah images didn’t contain the extra "fluff" he saw in the Docker images.

For comparison he first did:
```
$ docker pull centos:7
$ docker images
REPOSITORY            TAG              IMAGE ID                 CREATED             SIZE
docker.io/centos          7                   2d194b392dd1        2 weeks ago         195 MB
```

He noted that the size of the Docker image was 195MB. Tim then created a minimal (scratch) image using Buildah, with only the `coreutils` and `bash` packages added to the image, using the following script:
```
$ cat  ./buildah-base.sh
#!/bin/bash

set -x

# build a minimal image
newcontainer=$(buildah from scratch)
scratchmnt=$(buildah mount $newcontainer)

# install the packages
yum install --installroot $scratchmnt bash coreutils --releasever 7 --setopt install_weak_deps=false -y
yum clean all -y --installroot $scratchmnt --releasever 7

sudo buildah config --cmd /bin/bash $newcontainer

# set some config info
buildah config --label name=centos-base $newcontainer

# commit the image
buildah unmount $newcontainer
buildah commit $newcontainer centos-base

$ sudo ./buildah-base.sh

$ sudo buildah images
IMAGE ID               IMAGE NAME                                             CREATED AT            SIZE
8379315d3e3e     docker.io/library/centos-base:latest           Mar 25, 2018 17:08   212.1 MB
```

Tim wondered why the image was 17MB larger, because `python` and `yum` were not installed in the Buildah image, whereas they were installed in the Docker image. This set off quite the discussion in the GitHub issue, as it was not at all an expected result.

What was great about the discussion was that not only were Red Hat folks involved, but several others from outside as well. In particular, a lot of great discussion and investigation was led by GitHub user @pixdrift, who noted that the documentation and locale-archive were chewing up a little more than 100MB of space in the Buildah image. Pixdrift suggested forcing locale in the yum installer and provided this updated `buildah-bash.sh` script with those changes:
```
#!/bin/bash

set -x

# build a minimal image
newcontainer=$(buildah from scratch)
scratchmnt=$(buildah mount $newcontainer)

# install the packages
yum install --installroot $scratchmnt bash coreutils --releasever 7 --setopt=install_weak_deps=false --setopt=tsflags=nodocs --setopt=override_install_langs=en_US.utf8 -y
yum clean all -y --installroot $scratchmnt --releasever 7

sudo buildah config --cmd /bin/bash $newcontainer

# set some config info
buildah config --label name=centos-base $newcontainer

# commit the image
buildah unmount $newcontainer
buildah commit $newcontainer centos-base
```

When Tim ran this new script, the image size shrank to 92MB, shedding 120MB from the original Buildah image size and getting closer to the expected size; however, engineers being engineers, a size savings of 56% wasn’t enough. The discussion went further, involving how to remove individual locale packages to save even more space. To see more details of the discussion, click the [Buildah images not so small?][2] link. Who knows—maybe you’ll have a helpful tip, or better yet, become a contributor for Buildah. On a side note, this solution illustrates how the Buildah software can be used to quickly and easily create a minimally sized container that's loaded only with the software that you need to do your job efficiently. As a bonus, it doesn’t require a daemon to be running.

This image-sizing issue drove home the power of open source software for me. A number of people from different companies all collaborated to solve a problem through open discussion in a little over a day. Although no code changes were created to address this particular issue, there have been many code contributions to Buildah from contributors outside of Red Hat, and this has helped to make the project even better. These contributions have served to get a wider variety of talented people to look at the code than ever would have if it were a proprietary piece of software stuck in a private git repository. It’s taken only a year to convert me to the [open source way][3], and I don’t think I could ever go back.

This article was originally posted at [Project Atomic][4]. Reposted with permission.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/containers-buildah

作者：[Tom Sweeney][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/tomsweeneyredhat
[1]:https://github.com/projectatomic/buildah
[2]:https://github.com/projectatomic/buildah/issues/532
[3]:https://twitter.com/opensourceway
[4]:http://www.projectatomic.io/blog/2018/04/open-source-what-a-concept/
