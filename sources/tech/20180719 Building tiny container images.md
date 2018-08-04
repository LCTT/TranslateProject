Building tiny container images
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_scale_performance.jpg?itok=R7jyMeQf)

When [Docker][1] exploded onto the scene a few years ago, it brought containers and container images to the masses. Although Linux containers existed before then, Docker made it easy to get started with a user-friendly command-line interface and an easy-to-understand way to build images using the Dockerfile format. But while it may be easy to jump in, there are still some nuances and tricks to building container images that are usable, even powerful, but still small in size.

### First pass: Clean up after yourself

Some of these examples involve the same kind of cleanup you would use with a traditional server, but more rigorously followed. Smaller image sizes are critical for quickly moving images around, and storing multiple copies of unnecessary data on disk is a waste of resources. Consequently, these techniques should be used more regularly than on a server with lots of dedicated storage.

An example of this kind of cleanup is removing cached files from an image to recover space. Consider the difference in size between a base image with [Nginx][2] installed by `dnf` with and without the metadata and yum cache cleaned up:
```
# Dockerfile with cache

FROM fedora:28

LABEL maintainer Chris Collins <collins.christopher@gmail.com>



RUN dnf install -y nginx



-----



# Dockerfile w/o cache

FROM fedora:28

LABEL maintainer Chris Collins <collins.christopher@gmail.com>



RUN dnf install -y nginx \

        && dnf clean all \

        && rm -rf /var/cache/yum



-----



[chris@krang] $ docker build -t cache -f Dockerfile .  

[chris@krang] $ docker images --format "{{.Repository}}: {{.Size}}"

| head -n 1

cache: 464 MB



[chris@krang] $ docker build -t no-cache -f Dockerfile-wo-cache .

[chris@krang] $ docker images --format "{{.Repository}}: {{.Size}}"  | head -n 1

no-cache: 271 MB

```

That is a significant difference in size. The version with the `dnf` cache is almost twice the size of the image without the metadata and cache. Package manager cache, Ruby gem temp files, `nodejs` cache, even downloaded source tarballs are all perfect candidates for cleaning up.

### Layers—a potential gotcha

Unfortunately (or fortunately, as you’ll see later), based on the way layers work with containers, you cannot simply add a `RUN rm -rf /var/cache/yum` line to your Dockerfile and call it a day. Each instruction of a Dockerfile is stored in a layer, with changes between layers applied on top. So even if you were to do this:
```
RUN dnf install -y nginx

RUN dnf clean all

RUN rm -rf /var/cache/yum

```

...you’d still end up with three layers, one of which contains all the cache, and two intermediate layers that "remove" the cache from the image. But the cache is actually still there, just as when you mount a filesystem over the top of another one, the files are there—you just can’t see or access them.

You’ll notice that the example in the previous section chains the cache cleanup in the same Dockerfile instruction where the cache is generated:
```
RUN dnf install -y nginx \

        && dnf clean all \

        && rm -rf /var/cache/yum

```

This is a single instruction and ends up being a single layer within the image. You’ll lose a bit of the Docker (*ahem*) cache this way, making a rebuild of the image slightly longer, but the cached data will not end up in your final image. As a nice compromise, just chaining related commands (e.g., `yum install` and `yum clean all`, or downloading, extracting and removing a source tarball, etc.) can save a lot on your final image size while still allowing you to take advantage of the Docker cache for quicker development.

This layer "gotcha" is more subtle than it first appears, though. Because the image layers document the _changes_ to each layer, one upon another, it’s not just the existence of files that add up, but any change to the file. For example, _even changing the mode_ of the file creates a copy of that file in the new layer.

For example, the output of `docker images` below shows information about two images. The first, `layer_test_1`, was created by adding a single 1GB file to a base CentOS image. The second image, `layer_test_2`, was created `FROM layer_test_1` and did nothing but change the mode of the 1GB file with `chmod u+x`.
```
layer_test_2        latest       e11b5e58e2fc           7 seconds ago           2.35 GB

layer_test_1        latest       6eca792a4ebe           2 minutes ago           1.27 GB

```

As you can see, the new image is more than 1GB larger than the first. Despite the fact that `layer_test_1` is only the first two layers of `layer_test_2`, there’s still an extra 1GB file floating around hidden inside the second image. This is true anytime you remove, move, or change any file during the image build process.

### Purpose-built images vs. flexible images

An anecdote: As my office heavily invested in [Ruby on Rails][3] applications, we began to embrace the use of containers. One of the first things we did was to create an official Ruby base image for all of our teams to use. For simplicity’s sake (and suffering under “this is the way we did it on our servers”), we used [rbenv][4] to install the latest four versions of Ruby into the image, allowing our developers to migrate all of their applications into containers using a single image. This resulted in a very large but flexible (we thought) image that covered all the bases of the various teams we were working with.

This turned out to be wasted work. The effort required to maintain separate, slightly modified versions of a particular image was easy to automate, and selecting a specific image with a specific version actually helped to identify applications approaching end-of-life before a breaking change was introduced, wreaking havoc downstream. It also wasted resources: When we started to split out the different versions of Ruby, we ended up with multiple images that shared a single base and took up very little extra space if they coexisted on a server, but were considerably smaller to ship around than a giant image with multiple versions installed.

That is not to say building flexible images is not helpful, but in this case, creating purpose-build images from a common base ended up saving both storage space and maintenance time, and each team could modify their setup however they needed while maintaining the benefit of the common base image.

### Start without the cruft: Add what you need to a blank image

As friendly and easy-to-use as the _Dockerfile_ is, there are tools available that offer the flexibility to create very small Docker-compatible container images without the cruft of a full operating system—even those as small as the standard Docker base images.

[I’ve written about Buildah before][5], and I’ll mention it again because it is flexible enough to create an image from scratch using tools from your host to install packaged software and manipulate the image. Those tools then never need to be included in the image itself.

Buildah replaces the `docker build` command. With it, you can mount the filesystem of your container image to your host machine and interact with it using tools from the host.

Let’s try Buildah with the Nginx example from above (ignoring caches for now):
```
#!/usr/bin/env bash

set -o errexit



# Create a container

container=$(buildah from scratch)



# Mount the container filesystem

mountpoint=$(buildah mount $container)



# Install a basic filesystem and minimal set of packages, and nginx

dnf install --installroot $mountpoint  --releasever 28 glibc-minimal-langpack nginx --setopt install_weak_deps=false -y



# Save the container to an image

buildah commit --format docker $container nginx



# Cleanup

buildah unmount $container



# Push the image to the Docker daemon’s storage

buildah push nginx:latest docker-daemon:nginx:latest

```

You’ll notice we’re no longer using a Dockerfile to build the image, but a simple Bash script, and we’re building it from a scratch (or blank) image. The Bash script mounts the container’s root filesystem to a mount point on the host, and then uses the hosts’ command to install the packages. This way the package manager doesn’t even have to exist inside the container.

Without extra cruft—all the extra stuff in the base image, like `dnf`, for example—the image weighs in at only 304 MB, more than 100 MB smaller than the Nginx image built with a Dockerfile above.
```
[chris@krang] $ docker images |grep nginx

docker.io/nginx      buildah      2505d3597457    4 minutes ago         304 MB

```

_Note: The image name has`docker.io` appended to it due to the way the image is pushed into the Docker daemon’s namespace, but it is still the image built locally with the build script above._

That 100 MB is already a huge savings when you consider a base image is already around 300 MB on its own. Installing Nginx with a package manager brings in a ton of dependencies, too. For something compiled from source using tools from the host, the savings can be even greater because you can choose the exact dependencies and not pull in any extra files you don’t need.

If you’d like to try this route, [Tom Sweeney][6] wrote a much more in-depth article, [Creating small containers with Buildah][7], which you should check out.

Using Buildah to build images without a full operating system and included build tools can enable much smaller images than you would otherwise be able to create. For some types of images, we can take this approach even further and create images with _only_ the application itself included.

### Create images with only statically linked binaries

Following the same philosophy that leads us to ditch administrative and build tools inside images, we can go a step further. If we specialize enough and abandon the idea of troubleshooting inside of production containers, do we need Bash? Do we need the [GNU core utilities][8]? Do we _really_ need the basic Linux filesystem? You can do this with any compiled language that allows you to create binaries with [statically linked libraries][9]—where all the libraries and functions needed by the program are copied into and stored within the binary itself.

This is a relatively popular way of doing things within the [Golang][10] community, so we’ll use a Go application to demonstrate.

The Dockerfile below takes a small Go Hello-World application and compiles it in an image `FROM golang:1.8`:
```
FROM golang:1.8



ENV GOOS=linux

ENV appdir=/go/src/gohelloworld



COPY ./ /go/src/goHelloWorld

WORKDIR /go/src/goHelloWorld



RUN go get

RUN go build -o /goHelloWorld -a



CMD ["/goHelloWorld"]

```

The resulting image, containing the binary, the source code, and the base image layer comes in at 716 MB. The only thing we actually need for our application is the compiled binary, however. Everything else is unused cruft that gets shipped around with our image.

If we disable `cgo` with `CGO_ENABLED=0` when we compile, we can create a binary that doesn’t wrap C libraries for some of its functions:
```
GOOS=linux CGO_ENABLED=0 go build -a goHelloWorld.go

```

The resulting binary can be added to an empty, or "scratch" image:
```
FROM scratch

COPY goHelloWorld /

CMD ["/goHelloWorld"]

```

Let’s compare the difference in image size between the two:
```
[ chris@krang ] $ docker images

REPOSITORY      TAG             IMAGE ID                CREATED                 SIZE

goHello     scratch     a5881650d6e9            13 seconds ago          1.55 MB

goHello     builder     980290a100db            14 seconds ago          716 MB

```

That’s a huge difference. The image built from `golang:1.8` with the `goHelloWorld` binary in it (tagged "builder" above) is _460_ times larger than the scratch image with just the binary. The entirety of the scratch image with the binary is only 1.55 MB. That means we’d be shipping around 713 MB of unnecessary data if we used the builder image.

As mentioned above, this method of creating small images is used often in the Golang community, and there is no shortage of blog posts on the subject. [Kelsey Hightower][11] wrote [an article on the subject][12] that goes into more detail, including dealing with dependencies other than just C libraries.

### Consider squashing, if it works for you

There’s an alternative to chaining all the commands into layers in an attempt to save space: Squashing your image. When you squash an image, you’re really exporting it, removing all the intermediate layers, and saving a single layer with the current state of the image. This has the advantage of reducing that image to a much smaller size.

Squashing layers used to require some creative workarounds to flatten an image—exporting the contents of a container and re-importing it as a single layer image, or using tools like `docker-squash`. Starting in version 1.13, Docker introduced a handy flag, `--squash`, to accomplish the same thing during the build process:
```
FROM fedora:28

LABEL maintainer Chris Collins <collins.christopher@gmail.com>



RUN dnf install -y nginx

RUN dnf clean all

RUN rm -rf /var/cache/yum



[chris@krang] $ docker build -t squash -f Dockerfile-squash --squash .

[chris@krang] $ docker images --format "{{.Repository}}: {{.Size}}"  | head -n 1

squash: 271 MB

```

Using `docker squash` with this multi-layer Dockerfile, we end up with another 271MB image, as we did with the chained instruction example. This works great for this use case, but there’s a potential gotcha.

“What? ANOTHER gotcha?”

Well, sort of—it’s the same issue as before, causing problems in another way.

### Going too far: Too squashed, too small, too specialized

Images can share layers. The base may be _x_ megabytes in size, but it only needs to be pulled/stored once and each image can use it. The effective size of all the images sharing layers is the base layers plus the diff of each specific change on top of that. In this way, thousands of images may take up only a small amount more than a single image.

This is a drawback with squashing or specializing too much. When you squash an image into a single layer, you lose any opportunity to share layers with other images. Each image ends up being as large as the total size of its single layer. This might work well for you if you use only a few images and run many containers from them, but if you have many diverse images, it could end up costing you space in the long run.

Revisiting the Nginx squash example, we can see it’s not a big deal for this case. We end up with Fedora, Nginx installed, no cache, and squashing that is fine. Nginx by itself is not incredibly useful, though. You generally need customizations to do anything interesting—e.g., configuration files, other software packages, maybe some application code. Each of these would end up being more instructions in the Dockerfile.

With a traditional image build, you would have a single base image layer with Fedora, a second layer with Nginx installed (with or without cache), and then each customization would be another layer. Other images with Fedora and Nginx could share these layers.

Need an image:
```
[   App 1 Layer (  5 MB) ]          [   App 2 Layer (6 MB) ]

[   Nginx Layer ( 21 MB) ] ------------------^

[ Fedora  Layer (249 MB) ]  

```

But if you squash the image, then even the Fedora base layer is squashed. Any squashed image based on Fedora has to ship around its own Fedora content, adding another 249 MB for _each image!_
```
[ Fedora + Nginx + App 1 (275 MB)]      [ Fedora + Nginx + App 2 (276 MB) ]  

```

This also becomes a problem if you build lots of highly specialized, super-tiny images.

As with everything in life, moderation is key. Again, thanks to how layers work, you will find diminishing returns as your container images become smaller and more specialized and can no longer share base layers with other related images.

Images with small customizations can share base layers. As explained above, the base may be _x_ megabytes in size, but it only needs to be pulled/stored once and each image can use it. The effective size of all the images is the base layers plus the diff of each specific change on top of that. In this way, thousands of images may take up only a small amount more than a single image.
```
[ specific app   ]      [ specific app 2 ]

[ customizations ]--------------^

[ base layer     ]

```

If you go too far with your image shrinking and you have too many variations or specializations, you can end up with many images, none of which share base layers and all of which take up their own space on disk.
```
 [ specific app 1 ]     [ specific app 2 ]      [ specific app 3 ]

```

### Conclusion

There are a variety of different ways to reduce the amount of storage space and bandwidth you spend working with container images, but the most effective way is to reduce the size of the images themselves. Whether you simply clean up your caches (avoiding leaving them orphaned in intermediate layers), squash all your layers into one, or add only static binaries in an empty image, it’s worth spending some time looking at where bloat might exist in your container images and slimming them down to an efficient size.


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/building-container-images

作者：[Chris Collins][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/clcollins
[1]:https://www.docker.com/
[2]:https://www.nginx.com/
[3]:https://rubyonrails.org/
[4]:https://github.com/rbenv/rbenv
[5]:https://opensource.com/article/18/6/getting-started-buildah
[6]:https://twitter.com/TSweeneyRedHat
[7]:https://opensource.com/article/18/5/containers-buildah
[8]:https://www.gnu.org/software/coreutils/coreutils.html
[9]:https://en.wikipedia.org/wiki/Static_library
[10]:https://golang.org/
[11]:https://twitter.com/kelseyhightower
[12]:https://medium.com/@kelseyhightower/optimizing-docker-images-for-static-binaries-b5696e26eb07
