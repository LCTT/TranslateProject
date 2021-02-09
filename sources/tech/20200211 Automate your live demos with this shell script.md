[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Automate your live demos with this shell script)
[#]: via: (https://opensource.com/article/20/2/live-demo-script)
[#]: author: (Lisa Seelye https://opensource.com/users/lisa)

Automate your live demos with this shell script
======
Try this script the next time you give a presentation to prevent making
typos in front of a live audience.
![Person using a laptop][1]

I gave a talk about [multi-architecture container images][2] at [LISA19][3] in October that included a lengthy live demo. Rather than writing out 30+ commands and risking typos, I decided to automate the demo with a shell script.

The script mimics what appears as input/output and runs the real commands in the background, pausing at various points so I can narrate what is going on. I'm very pleased with how the script turned out and the effect on stage. The script and supporting materials for my presentation are available on [GitHub][4] under an Apache 2.0 license.

### The script


```
#!/bin/bash

set -e

IMG=thedoh/lisa19
REGISTRY=docker.io
VERSION=19.10.1

# Plan B with GCR:
#IMG=dulcet-iterator-213018
#REGISTRY=us.gcr.io
#VERSION=19.10.1

pause() {
  local step="${1}"
  ps1
  echo -n "# Next step: ${step}"
  read
}

ps1() {
  echo -ne "\033[01;32m${USER}@$(hostname -s) \033[01;34m$(basename $(pwd)) \$ \033[00m"
}

echocmd() {
  echo "$(ps1)$@"
}

docmd() {
  echocmd $@
  $@
}

step0() {
  local registry="${1}" img="${2}" version="${3}"
  # Mindful of tokens in ~/.docker/config.json
  docmd grep experimental ~/.docker/config.json
 
  docmd cd ~/go/src/github.com/lisa/lisa19-containers
 
  pause "This is what we'll be building"
  docmd export REGISTRY=${registry}
  docmd export IMG=${img}
  docmd export VERSION=${version}
  docmd make REGISTRY=${registry} IMG=${img} VERSION=${version} clean
}

step1() {
  local registry="${1}" img="${2}" version="${3}"
 
  docmd docker build --no-cache --platform=linux/amd64 --build-arg=GOARCH=amd64 -t ${REGISTRY}/${IMG}:amd64-${VERSION} .
  pause "ARM64 image next"
  docmd docker build --no-cache --platform=linux/arm64 --build-arg=GOARCH=arm64 -t ${REGISTRY}/${IMG}:arm64-${VERSION} .
}

step2() {
  local registry="${1}" img="${2}" version="${3}" origpwd=$(pwd) savedir=$(mktemp -d) jsontemp=$(mktemp -t XXXXX)
  chmod 700 $jsontemp $savedir
  # Set our way back home and get ready to fix our arm64 image to amd64.
  echocmd 'origpwd=$(pwd)'
  echocmd 'savedir=$(mktemp -d)'
  echocmd "mkdir -p \$savedir/change"
  mkdir -p $savedir/change &amp;&gt;/dev/null
  echocmd "docker save ${REGISTRY}/${IMG}:arm64-${VERSION} 2&gt;/dev/null 1&gt; \$savedir/image.tar"
  docker save ${REGISTRY}/${IMG}:arm64-${VERSION} 2&gt;/dev/null 1&gt; $savedir/image.tar
  pause "untar the image to access its metadata"
 
  echocmd "cd \$savedir/change"
  cd $savedir/change
  echocmd tar xf \$savedir/image.tar
  tar xf $savedir/image.tar
  docmd ls -l
 
  pause "find the JSON config file"
  echocmd 'jsonfile=$(jq -r ".[0].Config" manifest.json)'
  jsonfile=$(jq -r ".[0].Config" manifest.json)
 
  pause "notice the original metadata says amd64"
  echocmd jq '{architecture: .architecture, ID: .config.Image}' \$jsonfile
  jq '{architecture: .architecture, ID: .config.Image}' $jsonfile
 
  pause "Change from amd64 to arm64 using a temp file"
  echocmd "jq '.architecture = \"arm64\"' \$jsonfile &gt; \$jsontemp"
  jq '.architecture = "arm64"' $jsonfile &gt; $jsontemp
  echocmd /bin/mv -f -- \$jsontemp \$jsonfile
  /bin/mv -f -- $jsontemp $jsonfile

  pause "Check to make sure the config JSON file says arm64 now"
  echocmd jq '{architecture: .architecture, ID: .config.Image}' \$jsonfile
  jq '{architecture: .architecture, ID: .config.Image}' $jsonfile
 
  pause "delete the image with the incorrect metadata"
  docmd docker rmi ${REGISTRY}/${IMG}:arm64-${VERSION}
 
  pause "Re-compress the ARM64 image and load it back into Docker, then clean up the temp space"
  echocmd 'tar cf - * | docker load'
  tar cf - * | docker load

  docmd cd $origpwd
  echocmd "/bin/rm -rf -- \$savedir"
  /bin/rm -rf -- $savedir &amp;&gt;/dev/null
}

step3() {
  local registry="${1}" img="${2}" version="${3}"
  docmd docker push ${registry}/${img}:amd64-${version}
  pause "push ARM64 image to ${registry}"
  docmd docker push ${registry}/${img}:arm64-${version}
}

step4() {
  local registry="${1}" img="${2}" version="${3}"
  docmd docker manifest create ${registry}/${img}:${version} ${registry}/${img}:arm64-${version} ${registry}/${img}:amd64-${version}
 
  pause "add a reference to the amd64 image to the manifest list"
  docmd docker manifest annotate ${registry}/${img}:${version} ${registry}/${img}:amd64-${version} --os linux --arch amd64
  pause "now add arm64"
  docmd docker manifest annotate ${registry}/${img}:${version} ${registry}/${img}:arm64-${version} --os linux --arch arm64
}

step5() {
  local registry="${1}" img="${2}" version="${3}"
  docmd docker manifest push ${registry}/${img}:${version}
}

step6() {
  local registry="${1}" img="${2}" version="${3}"
  docmd make REGISTRY=${registry} IMG=${img} VERSION=${version} clean
 
  pause "ask docker.io if ${img}:${version} has a linux/amd64 manifest, and run it"
  docmd docker pull --platform linux/amd64 ${registry}/${img}:${version}
  docmd docker run --rm -i ${registry}/${img}:${version}
 
  pause "clean slate again"
  docmd make REGISTRY=${registry} IMG=${img} VERSION=${version} clean
 
  pause "now repeat for linux/arm64 and see what it gives us"
  docmd docker pull --platform linux/arm64 ${registry}/${img}:${version}
  set +e
  docmd docker run --rm -i ${registry}/${img}:${version}
  set -e
  if [[ $(uname -s) == "Darwin" ]]; then
    pause "note about Docker on Mac and binfmt_misc: binfmt_misc lets a mac run arm64 binaries in the Docker VM"
  fi
}

pause "initial setup"
step0 ${REGISTRY} ${IMG} ${VERSION}
pause "1 build constituent images"
step1 ${REGISTRY} ${IMG} ${VERSION}

pause "2 fix ARM64 metadata"
step2 ${REGISTRY} ${IMG} ${VERSION}

pause "3 push constituent images up to docker.io"
step3 ${REGISTRY} ${IMG} ${VERSION}

pause "4 build the manifest list for the image"
step4 ${REGISTRY} ${IMG} ${VERSION}

pause "5 Push the manifest list to docker.io"
step5 ${REGISTRY} ${IMG} ${VERSION}

pause "6 clean slate, and validate the list-based image"
step6 ${REGISTRY} ${IMG} ${VERSION}

docmd echo 'Manual steps all done!'
make REGISTRY=${REGISTRY} IMG=${IMG} VERSION=${VERSION} clean &amp;&gt;/dev/null
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/live-demo-script

作者：[Lisa Seelye][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lisa
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://www.usenix.org/conference/lisa19/presentation/seelye
[3]: https://www.usenix.org/conference/lisa19
[4]: https://github.com/lisa/lisa19-containers
