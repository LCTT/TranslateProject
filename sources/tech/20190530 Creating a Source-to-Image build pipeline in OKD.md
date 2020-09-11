[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Creating a Source-to-Image build pipeline in OKD)
[#]: via: (https://opensource.com/article/19/5/creating-source-image-build-pipeline-okd)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)

Creating a Source-to-Image build pipeline in OKD
======
S2I is an ideal way to build and compile Go applications in a repeatable
way, and it just gets better when paired with OKD BuildConfigs.
![][1]

In the first three articles in this series, we explored the general [requirements][2] of a Source-to-Image (S2I) system and [prepared][3] and [tested][4] an environment specifically for a Go (Golang) application. This S2I build is perfect for local development or maintaining a builder image with a code pipeline, but if you have access to an [OKD][5] or OpenShift cluster (or [Minishift][6]), you can set up the entire workflow using OKD BuildConfigs, not only to build and maintain the builder image but also to use the builder image to create the application image and subsequent runtime image automatically. This way, the images can be rebuilt automatically when downstream images change and can trigger OKD deploymentConfigs to redeploy applications running from these images.

### Step 1: Build the builder image in OKD

As in local S2I usage, the first step is to create the builder image to build the GoHelloWorld test application that we can reuse to compile other Go-based applications. This first build step will be a Docker build, just like before, that pulls the Dockerfile and S2I scripts from a Git repository to build the image. Therefore, those files must be committed and available in a public Git repo (or you can use the companion [GitHub repo][7] for this article).

_Note:_ OKD BuildConfigs do not require that source Git repos are public. To use a private repo, you must set up deploy keys and link the keys to a builder service account. This is not difficult, but for simplicity's sake, this exercise will use a public repository.

#### Create an image stream for the builder image

The BuildConfig will create a builder image for us to compile the GoHelloWorld app, but first, we need a place to store the image. In OKD, that place is an image stream.

An [image stream][8] and its tags are like a manifest or list of related images and image tags. It serves as an abstraction layer that allows you to reference an image, even if the image changes. Think of it as a collection of aliases that reference specific images and, as images are updated, automatically points to the new image version. The image stream is nothing except these aliases—just metadata about real images stored in a registry.

An image stream can be created with the **oc create imagestream <name>** command, or it can be created from a YAML file with **oc create -f <filename>**. Either way, a brand-new image stream is a small placeholder object that is empty until it is populated with image references, either manually (who wants to do things manually?) or with a BuildConfig.

Our golang-builder image stream looks like this:


```
# imageStream-golang-builder.yaml
\---
apiVersion: image.openshift.io/v1
kind: ImageStream
metadata:
generation: 1
name: golang-builder
spec:
lookupPolicy:
local: false
```

Other than a name, and a (mostly) empty spec, there is nothing really there.

_Note:_ The **lookupPolicy** has to do with allowing Kubernetes-native components to resolve image stream references since image streams are OKD-native and not a part of the Kubernetes core. This topic is out of scope for this article, but you can read more about how it works in OKD's documentation [Using Image Streams with Kubernetes Resources][9].

Create an image stream for the builder image and its progeny.


```
$ oc create -f imageStream-golangBuilder.yaml

# Check the ImageStream
$ oc get imagestream golang-builder
NAME DOCKER REPO TAGS UPDATED
imagestream.image.openshift.io/golang-builder docker-registry.default.svc:5000/golang-builder/golang-builder
```

Note that the newly created image stream has no tags and has never been updated.

#### Create a BuildConfig for the builder image

In OKD, a [BuildConfig][10] describes how to build container images from a specific source and triggers for when they build. Don't be thrown off by the language—just as you might say you build and re-build the same image from a Dockerfile, but in reality, you have built multiple images, a BuildConfig builds and rebuilds the same image, but in reality, it creates multiple images. (And suddenly the reason for image streams becomes much clearer!)

Our builder image BuildConfig describes how to build and re-build our builder image(s). The BuildConfig's core is made up of four important parts:

  1. Build source
  2. Build strategy
  3. Build output
  4. Build triggers



The _build source_ (predictably) describes where the thing that runs the build comes from. The builds described by the golang-builder BuildConfig will use the Dockerfile and S2I scripts we created previously and, using the Git-type build source, clone a Git repository to get the files to do the builds.


```
source:
type: Git
git:
ref: master
uri: <https://github.com/clcollins/golang-s2i.git>
```

The _build strategy_ describes what the build will do with the source files from the build source. The golang-builder BuildConfig mimics the **docker build** we used previously to build our local builder image by using the Docker-type build strategy.


```
strategy:
type: Docker
dockerStrategy: {}
```

The **dockerStrategy** build type tells OKD to build a Docker image from the Dockerfile contained in the source specified by the build source.

The _build output_ tells the BuildConfig what to do with the resulting image. In this case, we specify the image stream we created above and a tag to give to the image. As with our local build, we're tagging it with **golang-builder:1.12** as a reference to the Go version inherited from the parent image.


```
output:
to:
kind: ImageStreamTag
name: golang-builder:1.12
```

Finally, the BuildConfig defines a set of _build triggers_ —events that will cause the image to be rebuilt automatically. For this BuildConfig, a change to the BuildConfig configuration or an update to the upstream image (golang:1.12) will trigger a new build.


```
triggers:
\- type: ConfigChange
\- imageChange:
type: ImageChange
```

Using the [builder image BuildConfig][11] from the GitHub repo as a reference (or just using that file), create a BuildConfig YAML file and use it to create the BuildConfig.


```
$ oc create -f buildConfig-golang-builder.yaml

# Check the BuildConfig
$ oc get bc golang-builder
NAME TYPE FROM LATEST
golang-builder Docker Git@master 1
```

Because the BuildConfig included the "ImageChange" trigger, it immediately kicks off a new build. You can check that the build was created with the **oc get builds** command.


```
# Check the Builds
$ oc get builds
NAME TYPE FROM STATUS STARTED DURATION
golang-builder-1 Docker Git@8eff001 Complete About a minute ago 13s
```

While the build is running and after it has completed, you can view its logs with **oc logs -f <build name>** and see the Docker build output as you would locally.


```
$ oc logs -f golang-builder-1-build
Step 1/11 : FROM docker.io/golang:1.12
\---> 7ced090ee82e
Step 2/11 : LABEL maintainer "Chris Collins <[collins.christopher@gmail.com][12]>"
\---> 7ad989b765e4
Step 3/11 : ENV CGO_ENABLED 0 GOOS linux GOCACHE /tmp STI_SCRIPTS_PATH /usr/libexec/s2i SOURCE_DIR /go/src/app
\---> 2cee2ce6757d

<...>
```

If you did not include any build triggers (or did not have them in the right place), your build may not start automatically. You can manually kick off a new build with the **oc start-build** command.


```
$ oc start-build golang-builder

# Or, if you want to automatically tail the build log
$ oc start-build golang-builder --follow
```

When the build completes, the resulting image is tagged and pushed to the integrated image registry and the image stream is updated with the new image's information. Check the image stream with the **oc get imagestream** command to see that the new tag exists.


```
$ oc get imagestream golang-builder
NAME DOCKER REPO TAGS UPDATED
golang-builder docker-registry.default.svc:5000/golang-builder/golang-builder 1.12 33 seconds ago
```

### Step 2: Build the application image in OKD

Now that we have a builder image for our Golang applications created and stored within OKD, we can use this builder image to compile all of our Go apps. First on the block is the example GoHelloWorld app from our [local build example][4]. GoHelloWorld is a simple Go app that just outputs **Hello World!** when it's run.

Just as we did in the local example with the **s2i build** command, we can tell OKD to use our builder image and S2I to build the application image for GoHelloWorld, compiling the Go binary from the source code in the [GoHelloWorld GitHub repository][13]. This can be done with a BuildConfig with a **sourceStrategy** build.

#### Create an image stream for the application image

First things first, we need to create an image stream to manage the image created by the BuildConfig. The image stream is just like the golang-builder image stream, just with a different name. Create it with **oc create is** or using a YAML file from the [GitHub repo][7].


```
$ oc create -f imageStream-goHelloWorld-appimage.yaml
imagestream.image.openshift.io/go-hello-world-appimage created
```

#### Create a BuildConfig for the application image

Just as we did with the builder image BuildConfig, this BuildConfig will use the Git source option to clone our source code from the GoHelloWorld repository.


```
source:
type: Git
git:
uri: <https://github.com/clcollins/goHelloWorld.git>
```

Instead of using a DockerStrategy build to create an image from a Dockerfile, this BuildConfig will use the sourceStrategy definition to build the image using S2I.


```
strategy:
type: Source
sourceStrategy:
from:
kind: ImageStreamTag
name: golang-builder:1.12
```

Note the **from:** hash in sourceStrategy. This tells OKD to use the **golang-builder:1.12** image we created previously for the S2I build.

The BuildConfig will output to the new **appimage** image stream we created, and we'll include config- and image-change triggers to kick off new builds automatically if anything updates.


```
output:
to:
kind: ImageStreamTag
name: go-hello-world-appimage:1.0
triggers:
\- type: ConfigChange
\- imageChange:
type: ImageChange
```

Once again, create a BuildConfig or use the one from the GitHub repo.


```
`$ oc create -f buildConfig-goHelloWorld-appimage.yaml`
```

The new build shows up alongside the golang-builder build and, because image-change triggers are specified, the build starts immediately.


```
$ oc get builds
NAME TYPE FROM STATUS STARTED DURATION
golang-builder-1 Docker Git@8eff001 Complete 8 minutes ago 13s
go-hello-world-appimage-1 Source Git@99699a6 Running 44 seconds ago
```

If you want to watch the build logs, use the **oc logs -f** command. Once the application image build completes, it is pushed to the image stream we specified, then the new image stream tag is created.


```
$ oc get is go-hello-world-appimage
NAME DOCKER REPO TAGS UPDATED
go-hello-world-appimage docker-registry.default.svc:5000/golang-builder/go-hello-world-appimage 1.0 10 minutes ago
```

Success! The GoHelloWorld app was cloned from source into a new image and compiled and tested using our S2I scripts. We can use the image as-is but, as with our local S2I builds, we can do better and create an image with just the new Go binary in it.

### Step 3: Build the runtime image in OKD

Now that the application image has been created with a compiled Go binary for the GoHelloWorld app, we can use something called chain builds to mimic when we extracted the binary from our local application image and created a new runtime image with just the binary in it.

#### Create an image stream for the runtime image

Once again, the first step is to create an image stream image for the new runtime image.


```
# Create the ImageStream
$ oc create -f imageStream-goHelloWorld.yaml
imagestream.image.openshift.io/go-hello-world created

# Get the ImageStream
$ oc get imagestream go-hello-world
NAME DOCKER REPO TAGS UPDATED
go-hello-world docker-registry.default.svc:5000/golang-builder/go-hello-world
```

#### Chain builds

Chain builds are when one or more BuildConfigs are used to compile software or assemble artifacts for an application, and those artifacts are saved and used by a subsequent BuildConfig to generate a runtime image without re-compiling the code.

![Chain Build workflow][14]

Chain build workflow

#### Create a BuildConfig for the runtime image

The runtime BuildConfig uses the DockerStrategy build to build the image from a Dockerfile—the same thing we did with the builder image BuildConfig. This time, however, the source is not a Git source, but a Dockerfile source.

What is the Dockerfile source? It's an inline Dockerfile! Instead of cloning a repo with a Dockerfile in it and building that, we specify the Dockerfile in the BuildConfig. This is especially appropriate with our runtime Dockerfile because it's just three lines long.


```
source:
type: Dockerfile
dockerfile: |-
FROM scratch
COPY app /app
ENTRYPOINT ["/app"]
images:
\- from:
kind: ImageStreamTag
name: go-hello-world-appimage:1.0
paths:
\- sourcePath: /go/src/app/app
destinationDir: "."
```

Note that the Dockerfile in the Dockerfile source definition above is the same as the Dockerfile we used in the [third article][4] in this series when we built the slim GoHelloWorld image locally using the binary we extracted with the S2I **save-artifacts** script.

Something else to note: **scratch** is a reserved word in Dockerfiles. Unlike other **FROM** statements, it does not define an _actual_ image, but rather that the first layer of this image will be nothing. It is defined with **kind: DockerImage** but does not have a registry or group/namespace/project string. Learn more about this behavior in this excellent [container best practices][15] reference.

The **images** section of the Dockerfile source describes the source of the artifact(s) to be used in the build; in this case, from the appimage generated earlier. The **paths** subsection describes where to get the binary (i.e., in the **/go/src/app** directory of the app image, get the **app** binary) and where to save it (i.e., in the current working directory of the build itself: **"."** ). This allows the **COPY app /app** to grab the binary from the current working directory and add it to **/app** in the runtime image.

_Note:_ **paths** is an array of source and the destination path _pairs_. Each entry in the list consists of a source and destination. In the example above, there is just one entry because there is just a single binary to copy.

The Docker strategy is then used to build the inline Dockerfile.


```
strategy:
type: Docker
dockerStrategy: {}
```

Once again, it is output to the image stream created earlier and includes build triggers to automatically kick off new builds.


```
output:
to:
kind: ImageStreamTag
name: go-hello-world:1.0
triggers:
\- type: ConfigChange
\- imageChange:
type: ImageChange
```

Create a BuildConfig YAML or use the runtime BuildConfig from the GitHub repo.


```
$ oc create -f buildConfig-goHelloWorld.yaml
buildconfig.build.openshift.io/go-hello-world created
```

If you watch the logs, you'll notice the first step is **FROM scratch** , which confirms we're adding the compiled binary to a blank image.


```
$ oc logs -f pod/go-hello-world-1-build
Step 1/5 : FROM scratch
\--->
Step 2/5 : COPY app /app
\---> 9e70e6c710f8
Removing intermediate container 4d0bd9cef0a7
Step 3/5 : ENTRYPOINT /app
\---> Running in 7a2dfeba28ca
\---> d697577910fc

<...>
```

Once the build is completed, check the image stream tag to validate that the new image was pushed to the registry and image stream was updated.


```
$ oc get imagestream go-hello-world
NAME DOCKER REPO TAGS UPDATED
go-hello-world docker-registry.default.svc:5000/golang-builder/go-hello-world 1.0 4 minutes ago
```

Make a note of the **DOCKER REPO** string for the image. It will be used in the next section to run the image.

### Did we create a tiny, binary-only image?

Finally, let's validate that we did, indeed, build a tiny image with just the binary.

Check out the image details. First, get the image's name from the image stream.


```
$ oc describe imagestream go-hello-world
Name: go-hello-world
Namespace: golang-builder
Created: 42 minutes ago
Labels: <none>
Annotations: <none>
Docker Pull Spec: docker-registry.default.svc:5000/golang-builder/go-hello-world
Image Lookup: local=false
Unique Images: 1
Tags: 1

1.0
no spec tag

* docker-registry.default.svc:5000/golang-builder/go-hello-world@sha256:eb11e0147a2917312f5e0e9da71109f0cb80760e945fdc1e2db6424b91bc9053
13 minutes ago
```

The image is listed at the bottom, described with the SHA hash (e.g., **sha256:eb11e0147a2917312f5e0e9da71109f0cb80760e945fdc1e2db6424b91bc9053** ; yours will be different).

Get the details of the image using the hash.


```
$ oc describe image sha256:eb11e0147a2917312f5e0e9da71109f0cb80760e945fdc1e2db6424b91bc9053
Docker Image: docker-registry.default.svc:5000/golang-builder/go-hello-world@sha256:eb11e0147a2917312f5e0e9da71109f0cb80760e945fdc1e2db6424b91bc9053
Name: sha256:eb11e0147a2917312f5e0e9da71109f0cb80760e945fdc1e2db6424b91bc9053
Created: 15 minutes ago
Annotations: image.openshift.io/dockerLayersOrder=ascending
image.openshift.io/manifestBlobStored=true
openshift.io/image.managed=true
Image Size: 1.026MB
Image Created: 15 minutes ago
Author: <none>
Arch: amd64
Entrypoint: /app
Working Dir: <none>
User: <none>
Exposes Ports: <none>
Docker Labels: io.openshift.build.name=go-hello-world-1
io.openshift.build.namespace=golang-builder
Environment: PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
OPENSHIFT_BUILD_NAME=go-hello-world-1
OPENSHIFT_BUILD_NAMESPACE=golang-builder
```

Notice the image size, 1.026MB, is exactly as we want. The image is a scratch image with just the binary inside it!

### Run a pod with the runtime image

Using the runtime image we just created, let's create a pod on-demand and run it and validate that it still works.

This almost never happens in Kubernetes/OKD, but we will run a pod, just a pod, by itself.


```
$ oc run -it go-hello-world --image=docker-registry.default.svc:5000/golang-builder/go-hello-world:1.0 --restart=Never
Hello World!
```

Everything is working as expected—the image runs and outputs "Hello World!" just as it did in the previous, local S2I builds.

By creating this workflow in OKD, we can use the golang-builder S2I image for any Go application. This builder image is in place and built for any other applications, and it will auto-update and rebuild itself anytime the upstream golang:1.12 image changes.

New apps can be built automatically using the S2I build by creating a chain build strategy in OKD with an appimage BuildConfig to compile the source and the runtime BuildConfig to create the final image. Using the build triggers, any change to the source code in the Git repo will trigger a rebuild through the entire pipeline, rebuilding the appimage and the runtime image automatically.

This is a great way to maintain updated images for any application. Paired with an OKD deploymentConfig with an image build trigger, long-running applications (e.g., webapps) will be automatically redeployed when new code is committed.

Source-to-Image is an ideal way to develop builder images to build and compile Go applications in a repeatable way, and it just gets better when paired with OKD BuildConfigs.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/creating-source-image-build-pipeline-okd

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/blocks_building.png?itok=eMOT-ire
[2]: https://opensource.com/article/19/5/source-image-golang-part-1
[3]: https://opensource.com/article/19/5/source-image-golang-part-2
[4]: https://opensource.com/article/19/5/source-image-golang-part-3
[5]: https://www.okd.io/
[6]: https://github.com/minishift/minishift
[7]: https://github.com/clcollins/golang-s2i.git
[8]: https://docs.okd.io/latest/architecture/core_concepts/builds_and_image_streams.html#image-streams
[9]: https://docs.okd.io/latest/dev_guide/managing_images.html#using-is-with-k8s
[10]: https://docs.okd.io/latest/dev_guide/builds/index.html#defining-a-buildconfig
[11]: https://github.com/clcollins/golang-s2i/blob/master/okd/buildConfig-golang-builder.yaml
[12]: mailto:collins.christopher@gmail.com
[13]: https://github.com/clcollins/goHelloWorld.git
[14]: https://opensource.com/sites/default/files/uploads/chainingbuilds.png (Chain Build workflow)
[15]: http://docs.projectatomic.io/container-best-practices/#_from_scratch
