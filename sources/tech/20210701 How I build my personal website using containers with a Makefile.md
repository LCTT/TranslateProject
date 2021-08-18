[#]: subject: (How I build my personal website using containers with a Makefile)
[#]: via: (https://opensource.com/article/21/7/manage-containers-makefile)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How I build my personal website using containers with a Makefile
======
Simplify container management by combining the commands to build, test,
and deploy a project in a Makefile.
![Parts, modules, containers for software][1]

The `make` utility and its related [Makefile][2] have been used to build software for a long time. The Makefile defines a set of commands to run, and the `make` utility runs them. It is similar to a Dockerfile or Containerfile—a set of commands used to build container images.

Together, a Makefile and Containerfile are an excellent way to manage a container-based project. The Containerfile describes the contents of the container image, and the Makefile describes how to manage the project itself: kicking the image build, testing, and deployment, among other helpful commands.

### Make targets

The Makefile consists of "targets": one or more commands grouped under a single command. You can run each target by running the `make` command followed by the target you want to run:


```
# Runs the "build_image" make target from the Makefile
$ make build_image
```

This is the beauty of the Makefile. You can build a collection of targets for each task that needs to be performed manually. In the context of a container-based project, this includes building the image, pushing it to a registry, testing the image, and even deploying the image and updating the service running it. I use a Makefile for my personal website to do all these tasks in an easy, automated way.

### Build, test, deploy

I build my website using [Hugo][3], a static website generator that builds static HTML from YAML files. I use Hugo to build the HTML files for me, then build a container image with those files and [Caddy][4], a fast and simple web server, and run that image as a container. (Both Hugo and Caddy are open source, Apache-licensed projects.) I use a Makefile to make building and deploying that image to production much easier.

The first target in the Makefile is appropriately the `image_build` command:


```
image_build:
  podman build --format docker -f Containerfile -t $(IMAGE_REF):$(HASH) .
```

This target invokes [Podman][5] to build an image from the Containerfile included in the project. There are some variables in the command above—what are they? Variables can be specified in the Makefile, similarly to Bash or a programming language. I use them for a variety of things within the Makefile, but the most useful is building the image reference to be pushed to remote container image registries:


```
# Image values
REGISTRY := "us.gcr.io"
PROJECT := "my-project-name"
IMAGE := "some-image-name"
IMAGE_REF := $(REGISTRY)/$(PROJECT)/$(IMAGE)

# Git commit hash
HASH := $(shell git rev-parse --short HEAD)
```

Using these variables, the `image_build` target builds an image reference like `us.gcr.io/my-project-name/my-image-name:abc1234` using the short Git revision hash as the image tag so that it can be tied to the code that built it easily.

The Makefile then tags that image as `:latest`. I don't generally use `:latest` for anything in production, but further down in this Makefile, it will come in useful for cleanup:


```
image_tag:
  podman tag $(IMAGE_REF):$(HASH) $(IMAGE_REF):latest
```

So, now the image has been built and needs to be validated to make sure it meets some minimum requirements. For my personal website, this is honestly just, "does the webserver start and return something?" This could be accomplished with shell commands in the Makefile, but it was easier for me to write a Python script that starts a container with Podman, issues an HTTP request to the container, verifies it receives a reply, and then cleans up the container. Python's "try, except, finally" exception handling is perfect for this and considerably easier than replicating the same logic from shell commands in a Makefile:


```
#!/usr/bin/env python3

import time
import argparse
from subprocess import check_call, CalledProcessError
from urllib.request import urlopen, Request

parser = argparse.ArgumentParser()
parser.add_argument('-i', '--image', action='store', required=True, help='image name')
args = parser.parse_args()

print(args.image)

try:
    check_call("podman rm smk".split())
except CalledProcessError as err:
    pass

check_call(
    "podman run --rm --name=smk -p 8080:8080 -d {}".format(args.image).split()
)

time.sleep(5)

r = Request("<http://localhost:8080>", headers={'Host': 'chris.collins.is'})
try:
    print(str(urlopen(r).read()))
finally:
    check_call("podman kill smk".split())
```

This could be a more thorough test. For example, during the build process, the Git revision hash could be built into the response, and the test could check that the response included the expected hash. This would have the benefit of verifying that at least some of the expected content is there.

If all goes well with the tests, then the image is ready to be deployed. I use Google's Cloud Run service to host my website, and like any of the major cloud services, there is an excellent command-line interface (CLI) tool that I can use to interact with the service. Since Cloud Run is a container service, deployment consists of pushing the images built locally to a remote container registry, and then kicking off a rollout of the service using the `gcloud` CLI tool.

You can do the push using Podman or Skopeo (or Docker, if you're using it). My push target pushes the `$(IMAGE_REF):$(HASH)` image and also the `:latest` tag:


```
push:
  podman push --remove-signatures $(IMAGE_REF):$(HASH)
  podman push --remove-signatures $(IMAGE_REF):latest
```

After the image has been pushed, use the `gcloud run deploy` command to roll out the newest image to the project and make the new image live. Once again, the Makefile comes in handy here. I can specify the `--platform` and `--region` arguments as variables in the Makefile so that I don't have to remember them each time. Let's be honest: I write so infrequently for my personal blog, there is zero chance I would remember these variables if I had to type them from memory each time I deployed a new image:


```
rollout:
  gcloud run deploy $(PROJECT) --image $(IMAGE_REF):$(HASH) --platform $(PLATFORM) --region $(REGION)
```

### More targets

There are additional helpful `make` targets. When writing new stuff or testing CSS or code changes, I like to see what I'm working on locally without deploying it to a remote server. For this, my Makefile has a `run_local` command, which spins up a container with the contents of my current commit and opens my browser to the URL of the page hosted by the locally running webserver:


```
.PHONY: run_local
run_local:
  podman stop mansmk ; podman rm mansmk ; podman run --name=mansmk --rm -p $(HOST_ADDR):$(HOST_PORT):$(TARGET_PORT) -d $(IMAGE_REF):$(HASH) &amp;&amp; $(BROWSER) $(HOST_URL):$(HOST_PORT)
```

I also use a variable for the browser name, so I can test with several if I want to. By default, it will open in Firefox when I run `make run_local`. If I want to test the same thing in Google, I run `make run_local BROWSER="google-chrome"`.

When working with containers and container images, cleaning up old containers and images is an annoying chore, especially when you iterate frequently. I include targets in my Makefile for handling these tasks, too. When cleaning up a container, if the container doesn't exist, Podman or Docker will return with an exit code of 125. Unfortunately, `make` expects each command to return 0 or it will stop processing, so I use a wrapper script to handle that case:


```
#!/usr/bin/env bash

ID="${@}"

podman stop ${ID} 2&gt;/dev/null

if [[ $?  == 125 ]]
then
  # No such container
  exit 0
elif [[ $? == 0 ]]
then
  podman rm ${ID} 2&gt;/dev/null
else
  exit $?
fi
```

Cleaning images requires a bit more logic, but it can all be done within the Makefile. To do this easily, I add a label (via the Containerfile) to the image when it's being built. This makes it easy to find all the images with these labels. The most recent of these images can be identified by looking for the `:latest` tag. Finally, all of the images, except those pointing to the image tagged with `:latest`, can be deleted:


```
clean_images:
  $(eval LATEST_IMAGES := $(shell podman images --filter "label=my-project.purpose=app-image" --no-trunc | awk '/latest/ {print $$3}'))
  podman images --filter "label=my-project.purpose=app-image" --no-trunc --quiet | grep -v $(LATEST_IMAGES) | xargs --no-run-if-empty --max-lines=1 podman image rm
```

This is the point where using a Makefile for managing container projects really comes together into something cool. To this point, the Makefile includes commands for building and tagging images, testing, pushing images, rolling out a new version, cleaning up a container, cleaning up images, and running a local version. Running each of these with `make image_build && make image_tag && make test`… etc. is considerably easier than running each of the original commands, but it can be simplified even further.

A Makefile can group commands into a target, allowing multiple targets to run with a single command. For example, my Makefile groups the `image_build` and `image_tag` targets under the `build` target, so I can run both by simply using `make build`. Even better, these targets can be further grouped into the default `make` target, `all`, allowing me to run all of them in order by executing `make all` or more simply, `make`.

For my project, I want the default `make` action to include everything from building the image to testing, deploying, and cleaning up, so I include the following targets:


```
.PHONY: all
all: build test deploy clean

.PHONY: build image_build image_tag
build: image_build image_tag

.PHONY: deploy push rollout
deploy: push rollout

.PHONY: clean clean_containers clean_images
clean: clean_containers clean_images
```

This does everything I've talked about in this article, except the `make run_local` target, in a single command: `make`.

### Conclusion

A Makefile is an excellent way to manage a container-based project. By combining all the commands necessary to build, test, and deploy a project into `make` targets within the Makefile, all the "meta" work—everything aside from writing the code—can be simplified and automated. The Makefile can even be used for code-related tasks: running unit tests, maintaining modules, compiling binaries and checksums. While it can't yet write code for you, using a Makefile combined with the benefits of a containerized, cloud-based service can `make` (wink, wink) managing many aspects of a project much easier.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/manage-containers-makefile

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_modules_networking_hardware_parts.png?itok=rPpVj92- (Parts, modules, containers for software)
[2]: https://opensource.com/article/18/8/what-how-makefile
[3]: https://gohugo.io/
[4]: https://caddyserver.com/
[5]: https://podman.io
