[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Building Smaller Container Images)
[#]: via: (https://fedoramagazine.org/building-smaller-container-images/)
[#]: author: (Muayyad Alsadi https://fedoramagazine.org/author/alsadi/)

Building Smaller Container Images
======

![][1]

Linux Containers have become a popular topic, making sure that a container image is not bigger than it should be is considered as a good practice. This article give some tips on how to create smaller Fedora container images.

### microdnf

Fedora’s DNF is written in Python and and it’s designed to be extensible as it has wide range of plugins. But Fedora has an alternative base container image which uses an smaller package manager called [microdnf][2] written in C. To use this minimal image in a Dockerfile the FROM line should look like this:

```
FROM registry.fedoraproject.org/fedora-minimal:30
```

This is an important saving if your image does not need typical DNF dependencies like Python. For example, if you are making a NodeJS image.

### Install and Clean up in one layer

To save space it’s important to remove repos meta data using _dnf clean all_ or its microdnf equivalent _microdnf clean all_. But you should not do this in two steps because that would actually store those files in a container image layer then mark them for deletion in another layer. To do it properly you should do the installation and cleanup in one step like this

```
FROM registry.fedoraproject.org/fedora-minimal:30
RUN microdnf install nodejs && microdnf clean all
```

### Modularity with microdnf

Modularity is a way to offer you different versions of a stack to choose from. For example you might want non-LTS NodeJS version 11 for a project and old LTS NodeJS version 8 for another and latest LTS NodeJS version 10 for another. You can specify which stream using colon

```
# dnf module list
# dnf module install nodejs:8
```

The _dnf module install_ command implies two commands one that enables the stream and one that install nodejs from it.

```
# dnf module enable nodejs:8
# dnf install nodejs
```

Although microdnf does not offer any command related to modularity, it is possible to enable a module with a configuation file, and libdnf (which microdnf uses) [seems][3] to support modularity streams. The file looks like this

```
/etc/dnf/modules.d/nodejs.module
[nodejs]
name=nodejs
stream=8
profiles=
state=enabled
```

A full Dockerfile using modularity with microdnf looks like this:

```
FROM registry.fedoraproject.org/fedora-minimal:30
RUN \
   echo -e "[nodejs]\nname=nodejs\nstream=8\nprofiles=\nstate=enabled\n" > /etc/dnf/modules.d/nodejs.module && \
   microdnf install nodejs zopfli findutils busybox && \
   microdnf clean all
```

### Multi-staged builds

In many cases you might have tons of build-time dependencies that are not needed to run the software for example building a Go binary, which statically link dependencies. Multi-stage build are an efficient way to separate the application build and the application runtime.

For example the Dockerfile below builds [confd][4] a Go application.

```
# building container
FROM registry.fedoraproject.org/fedora-minimal AS build
RUN mkdir /go && microdnf install golang && microdnf clean all
WORKDIR /go
RUN export GOPATH=/go; CGO_ENABLED=0 go get github.com/kelseyhightower/confd

FROM registry.fedoraproject.org/fedora-minimal
WORKDIR /
COPY --from=build /go/bin/confd /usr/local/bin
CMD ["confd"]
```

The multi-stage build is done by adding _AS_ after the _FROM_ instruction and by having another _FROM_ from a base container image then using C _OPY –from=_ instruction to copy content from the _build_ container to the second container.

This Dockerfile can then be built and run using podman

```
$ podman build -t myconfd .
$ podman run -it myconfd
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/building-smaller-container-images/

作者：[Muayyad Alsadi][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/alsadi/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/05/smaller-container-images-816x345.jpg
[2]: https://github.com/rpm-software-management/microdnf
[3]: https://bugzilla.redhat.com/show_bug.cgi?id=1575626
[4]: https://github.com/kelseyhightower/confd
