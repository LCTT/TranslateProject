[#]: subject: "Community container images available for applications development"
[#]: via: "https://fedoramagazine.org/community-container-images-available-for-applications-development/"
[#]: author: "Petr Hracek https://fedoramagazine.org/author/phracek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Community container images available for applications development
======

![][1]

Photo by [Paul Teysen][2] on [Unsplash][3]

This article aims to introduce community containers, where users can pull them from, and use them. The three groups of containers available for use by community users are discussed. These are: Fedora, CentOS, and CentOS Stream.

### What are the differences between the containers?

Fedora containers are based on the latest stable Fedora content, and CentOS-7 containers are based on components from the CentOS-7 and related SCLo SIG components. And finally, CentOS Stream containers are based on either CentOS Stream 8 or CentOS Stream 9.

Each container, e.g. [s2i-php-container][4] or [s2i-perl-container][5], contain the same packages which are available for a given operating system. It means, that from a functionality point of view these example containers provides the PHP interpreter or Perl interpreter,respectively. 

Differences can be only in versions, which are available for each distribution. For example:

Fedora PHP containers are available in these versions:

  * [PHP-80][6] for Fedora 35



CentOS-7 PHP containers are available in these versions:

  * [PHP-73][7]



CentOS Stream 9 PHP containers are available in these versions:

  * [PHP-74][8]



CentOS Stream 8 is not mentioned here for the PHP use case since users can pull it directly from the Red Hat Container Catalog registry as a [UBI][9] image. Containers that are not UBI based have CentOS Stream 8 repositories in the [quay.io/sclorg][10] namespace with repository suffix “-c8s”.

### Fedora container images moved recently

The Fedora container images have recently moved to the [quay.io/fedora][11] registry organization. All of them use [Fedora:35][12], and later [Fedora:36 ,][13]as a base image. The CentOS-7 containers are stored in the [quay.][14][io][14][/centos7][14] registry organization. All of them use [CentOS][15][-7][15] as a base image.

### CentOS Stream container images

The CentOS Stream containers are stored in the [quay.io/sclorg][10] registry organization.

The base image used for our CentOS Stream 8 containers is [CentOS Stream 8][16] with the tag “stream8”.

The base image used for our CentOS Stream 9 containers is [CentOS Stream 9][16] with the tag “stream9”.

In this registry organization, each container contains a “suffix”, either “c8s”  for CentOS Stream 8 or “c9s” for CentOS Stream 9, respectively.

See container [PHP-74][8] for CentOS Stream 9.

### Frequency of container image updates and testing

The community-based containers are updated in two ways.

First, when a pull request in the container sources that live under github.com/sclorg organization is merged, the corresponding versions in the GitHub repository are built and pushed into the proper repository.

Second, an update process is also implemented by GitHub Actions set up in each of our GitHub repositories. The base images, like “s2i-core” and “s2i-base”, are built each Tuesday at 1:00 pm. The rest of the containers are built each Wednesday at 1:00 pm.

This means every package update or change is updated in the container image within a few days, not later than after a week.

Each container that is not beyond its end of life is tested by our nightly builds. If we discover or detect an error on some of our containers, we attempt to fix it, but there are no guarantees provided.

### What container shall I use?

In the end, what containers are we providing? That’s a great question. All containers live in the GitHub organization <https://github.com/sclorg>

The list of containers with their upstreams is summarized here:

  * PostgreSQL server – <https://github.com/sclorg/postgresql-container>
  * Nginx web server – <https://github.com/sclorg/nginx-container>
  * Redis server – <https://github.com/sclorg/redis-container>
  * Varnish cache – <https://github.com/sclorg/varnish-container>
  * MySQL server – <https://github.com/sclorg/mysql-container>
  * MariaDB server – <https://github.com/sclorg/mariadb-container>
  * Apache HTTPD server – <https://github.com/sclorg/httpd-container>
  * PHP application container image – <https://github.com/sclorg/s2i-php-container>
  * Perl application container image – [https://][5][github][5][.com/sclorg/s2i-perl-container][5]
  * Ruby application container image – <https://github.com/sclorg/s2i-ruby-container>
  * Node.js application container image – <https://github.com/sclorg/s2i-nodejs-container>
  * Python application container image – <https://github.com/sclorg/s2i-python-container>



### How to use the container image I picked?

All container images are tuned up to be fully functional in the OpenShift (or [OKD][17] and even Kubernetes itself) without any trouble. Some containers support the source-to-image build strategy while some are expected to be used as daemons (like databases, for instance). For specific steps, please, navigate to the GitHub page for the respective container image by following one of the links above.

### Finally, Some Real examples

Let’s show how to use PHP container images across all platforms that we support.

First of all, clone the container GitHub repository using this command:

```

    $ git clone https://github.com/sclorg/s2i-php-container

```

Switch to the following directory created by the cloning step:

```

    $ cd s2i-php-container/examples/from-dockerfile

```

#### Fedora example

Start by pulling the Fedora PHP-80 image with this command:

```

    $ podman pull quay.io/fedora/php-80

```

Modify “Dockerfile” so it refers to Fedora php-80 image. “Dockerfile” then looks like:

```

    FROM quay.io/fedora/php-80

    USER 0
    # Add application sources
    ADD app-src .
    RUN chown -R 1001:0 .
    USER 1001

    # Install the dependencies
    RUN TEMPFILE=$(mktemp) && \
        curl -o "$TEMPFILE" "https://getcomposer.org/installer" && \
        php <"$TEMPFILE" && \
        ./composer.phar install --no-interaction --no-ansi --optimize-autoloader

    # Run script uses standard ways to configure the PHP application
    # and execs httpd -D FOREGROUND at the end
    # See more in <version>/s2i/bin/run in this repository.
    # Shortly what the run script does: The httpd daemon and php need to be
    # configured, so this script prepares the configuration based on the container
    # parameters (e.g. available memory) and puts the configuration files into
    # the appropriate places.
    # This can obviously be done differently, and in that case, the final CMD
    # should be set to "CMD httpd -D FOREGROUND" instead.
    CMD /usr/libexec/s2i/run

```

##### Check if the application works properly

Build it by using this command:

```

    $ podman build -f Dockerfile -t cakephp-app-80

```

Now run the application using this command:

```

    $ podman run -ti --rm -p 8080:8080 cakephp-app-80

```

To check the PHP version use these commands:

```

    $ podman run -it –rm cakephp-app-80 bash
    $ php –version

```

To check if everything works properly use this command:

```

    $ curl -s -w ‘%{http_code}’ localhost:8080

```

This should return HTTP code 200. If you would like to see a web page enter “localhost:8080” in your browser.

#### CentOS 7 example

Start by pulling the CentOS-7 PHP-73 image using this command:

```

    $ podman pull quay.io/centos7/php-73-centos7

```

Modify “Dockerfile” so it refers to CentOS php-73 image.

“Dockerfile” then looks like this:

```

    FROM quay.io/centos7/php-73-centos7

    USER 0
    # Add application sources
    ADD app-src .
    RUN chown -R 1001:0 .
    USER 1001

    # Install the dependencies
    RUN TEMPFILE=$(mktemp) && \
        curl -o "$TEMPFILE" "https://getcomposer.org/installer" && \
        php <"$TEMPFILE" && \
        ./composer.phar install --no-interaction --no-ansi --optimize-autoloader

    # Run script uses standard ways to configure the PHP application
    # and execs httpd -D FOREGROUND at the end
    # See more in <version>/s2i/bin/run in this repository.
    # Shortly what the run script does: The httpd daemon and php needs to be
    # configured, so this script prepares the configuration based on the container
    # parameters (e.g. available memory) and puts the configuration files into
    # the appropriate places.
    # This can obviously be done differently, and in that case, the final CMD
    # should be set to "CMD httpd -D FOREGROUND" instead.
    CMD /usr/libexec/s2i/run

```

##### Check if the application works properly

Build it using this command:

```

    $ podman build -f Dockerfile -t cakephp-app-73

```

Now run the application using this command:

```

    $ podman run -ti --rm -p 8080:8080 cakephp-app-73

```

To check the PHP version us these commands:

```

    $ podman run -it –rm cakephp-app-73 bash
    $ php –version

```

To check if everything works properly use this command:

```

    curl -s -w ‘%{http_code}’ localhost:8080

```

which should return HTTP code 200. If you would like to see a web page enter localhost:8080 in your browser.

#### RHEL 9 UBI 9 real example

Start by pulling the RHEL9 UBI-based PHP-80 image using the command:

```

    $ podman pull registry.access.redhat.com/ubi9/php-80

```

Modify “Dockerfile” so it refers to the RHEL9 ubi9 php-80 image.

“Dockerfile” then looks like:

```

    FROM registry.access.redhat.com/ubi9/php-80

    USER 0
    # Add application sources
    ADD app-src .
    RUN chown -R 1001:0 .
    USER 1001

    # Install the dependencies
    RUN TEMPFILE=$(mktemp) && \
        curl -o "$TEMPFILE" "https://getcomposer.org/installer" && \
        php <"$TEMPFILE" && \
        ./composer.phar install --no-interaction --no-ansi --optimize-autoloader

    # Run script uses standard ways to configure the PHP application
    # and execs httpd -D FOREGROUND at the end
    # See more in <version>/s2i/bin/run in this repository.
    # Shortly what the run script does: The httpd daemon and php needs to be
    # configured, so this script prepares the configuration based on the container
    # parameters (e.g. available memory) and puts the configuration files into
    # the appropriate places.
    # This can obviously be done differently, and in that case, the final CMD
    # should be set to "CMD httpd -D FOREGROUND" instead.
    CMD /usr/libexec/s2i/run

```

##### Check if the application works properly

Build it using this command:

```

    $ podman build -f Dockerfile -t cakephp-app-80-ubi9

```

Now run the application using this command:

```

    $ podman run -ti --rm -p 8080:8080 cakephp-app-80-ubi9

```

To check the PHP version use these commands:

```

    $ podman run -it –rm cakephp-app-80-ubi9 bash
    $ php –version

```

To check if everything works properly use this command:

```

    curl -s -w ‘%{http_code}’ localhost:8080

```

which should return HTTP code 200. If you would like to see a web page enter localhost:8080 in your browser.

### What to do in the case of a bug or enhancement

Just file a bug (known as an “issue” in GitHub) or even a pull request with a fix, to one of the GitHub repositories mentioned in the previous section.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/community-container-images-available-for-applications-development/

作者：[Petr Hracek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/phracek/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/07/RHSCL_containers-816x345.jpg
[2]: https://unsplash.com/@hooverpaul55?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/container-port?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://github.com/sclorg/s2i-php-container
[5]: https://github.com/sclorg/s2i-perl-container
[6]: https://quay.io/repository/fedora/php-80
[7]: https://quay.io/repository/centos7/php-73-centos7
[8]: https://quay.io/repository/sclorg/php-74-c9s
[9]: https://www.redhat.com/en/blog/introducing-red-hat-universal-base-image
[10]: https://quay.io/organization/sclorg
[11]: https://quay.io/organization/fedora
[12]: http://quay.io/fedora/fedora:35
[13]: http://quay.io/fedora/fedora:36
[14]: https://quay.io/organization/centos7
[15]: http://quay.io/centos/centos:centos7
[16]: https://quay.io/repository/centos/centos
[17]: https://developers.redhat.com/blog/2018/08/03/okd-renaming-of-openshift-origin-with-3-10-release#
