Part 5 - LXD 2.0: Image management
==================================
This is the fifth blog post [in this series about LXD 2.0][0].

As there are a lot of commands involved with managing LXD containers, this post is rather long. If you’d instead prefer a quick step-by-step tour of those same commands, you can [try our online demo instead][1]!

![](https://linuxcontainers.org/static/img/containers.png)

### Container images

If you’ve used LXC before, you probably remember those LXC “templates”, basically shell scripts that spit out a container filesystem and a bit of configuration.

Most templates generate the filesystem by doing a full distribution bootstrapping on your local machine. This may take quite a while, won’t work for all distributions and may require significant network bandwidth.

Back in LXC 1.0, I wrote a “download” template which would allow users to download pre-packaged container images, generated on a central server from the usual template scripts and then heavily compressed, signed and distributed over https. A lot of our users switched from the old style container generation to using this new, much faster and much more reliable method of creating a container.

With LXD, we’re taking this one step further by being all-in on the image based workflow. All containers are created from an image and we have advanced image caching and pre-loading support in LXD to keep the image store up to date.

### Interacting with LXD images

Before digging deeper into the image format, lets quickly go through what LXD lets you do with those images.

#### Transparently importing images

All containers are created from an image. The image may have come from a remote image server and have been pulled using its full hash, short hash or an alias, but in the end, every LXD container is created from a local image.

Here are a few examples:

```
lxc launch ubuntu:14.04 c1
lxc launch ubuntu:75182b1241be475a64e68a518ce853e800e9b50397d2f152816c24f038c94d6e c2
lxc launch ubuntu:75182b1241be c3
```

All of those refer to the same remote image (at the time of this writing), the first time one of those is run, the remote image will be imported in the local LXD image store as a cached image, then the container will be created from it.

The next time one of those commands are run, LXD will only check that the image is still up to date (when not referring to it by its fingerprint), if it is, it will create the container without downloading anything.

Now that the image is cached in the local image store, you can also just start it from there without even checking if it’s up to date:

```
lxc launch 75182b1241be c4
```

And lastly, if you have your own local image under the name “myimage”, you can just do:

```
lxc launch my-image c5
```

If you want to change some of that automatic caching and expiration behavior, there are instructions in an earlier post in this series.

#### Manually importing images

##### Copying from an image server

If you want to copy some remote image into your local image store but not immediately create a container from it, you can use the “lxc image copy” command. It also lets you tweak some of the image flags, for example:

```
lxc image copy ubuntu:14.04 local:
```

This simply copies the remote image into the local image store.

If you want to be able to refer to your copy of the image by something easier to remember than its fingerprint, you can add an alias at the time of the copy:

```
lxc image copy ubuntu:12.04 local: --alias old-ubuntu
lxc launch old-ubuntu c6
```

And if you would rather just use the aliases that were set on the source server, you can ask LXD to copy the for you:

lxc image copy ubuntu:15.10 local: --copy-aliases
lxc launch 15.10 c7
All of the copies above were one-shot copy, so copying the current version of the remote image into the local image store. If you want to have LXD keep the image up to date, as it does for the ones stored in its cache, you need to request it with the `–auto-update` flag:

```
lxc image copy images:gentoo/current/amd64 local: --alias gentoo --auto-update
```

##### Importing a tarball

If someone provides you with a LXD image as a single tarball, you can import it with:

```
lxc image import <tarball>
```

If you want to set an alias at import time, you can do it with:

```
lxc image import <tarball> --alias random-image
```

Now if you were provided with two tarballs, identify which contains the LXD metadata. Usually the tarball name gives it away, if not, pick the smallest of the two, metadata tarballs are tiny. Then import them both together with:

```
lxc image import <metadata tarball> <rootfs tarball>
```

##### Importing from a URL

“lxc image import” also works with some special URLs. If you have an https web server which serves a path with the LXD-Image-URL and LXD-Image-Hash headers set, then LXD will pull that image into its image store.

For example you can do:

```
lxc image import https://dl.stgraber.org/lxd --alias busybox-amd64
```

When pulling the image, LXD also sets some headers which the remote server could check to return an appropriate image. Those are LXD-Server-Architectures and LXD-Server-Version.

This is meant as a poor man’s image server. It can be made to work with any static web server and provides a user friendly way to import your image.

#### Managing the local image store

Now that we have a bunch of images in our local image store, lets see what we can do with them. We’ve already covered the most obvious, creating containers from them but there are a few more things you can do with the local image store.

##### Listing images

To get a list of all images in the store, just run “lxc image list”:

```
stgraber@dakara:~$ lxc image list
+---------------+--------------+--------+------------------------------------------------------+--------+----------+------------------------------+
|     ALIAS     | FINGERPRINT  | PUBLIC |                     DESCRIPTION                      |  ARCH  |   SIZE   |         UPLOAD DATE          |
+---------------+--------------+--------+------------------------------------------------------+--------+----------+------------------------------+
| alpine-32     | 6d9c131efab3 | yes    | Alpine edge (i386) (20160329_23:52)                  | i686   | 2.50MB   | Mar 30, 2016 at 4:36am (UTC) |
+---------------+--------------+--------+------------------------------------------------------+--------+----------+------------------------------+
| busybox-amd64 | 74186c79ca2f | no     | Busybox x86_64                                       | x86_64 | 0.79MB   | Mar 30, 2016 at 4:33am (UTC) |
+---------------+--------------+--------+------------------------------------------------------+--------+----------+------------------------------+
| gentoo        | 1a134c5951e0 | no     | Gentoo current (amd64) (20160329_14:12)              | x86_64 | 232.50MB | Mar 30, 2016 at 4:34am (UTC) |
+---------------+--------------+--------+------------------------------------------------------+--------+----------+------------------------------+
| my-image      | c9b6e738fae7 | no     | Scientific Linux 6 x86_64 (default) (20160215_02:36) | x86_64 | 625.34MB | Mar 2, 2016 at 4:56am (UTC)  |
+---------------+--------------+--------+------------------------------------------------------+--------+----------+------------------------------+
| old-ubuntu    | 4d558b08f22f | no     | ubuntu 12.04 LTS amd64 (release) (20160315)          | x86_64 | 155.09MB | Mar 30, 2016 at 4:30am (UTC) |
+---------------+--------------+--------+------------------------------------------------------+--------+----------+------------------------------+
| w (11 more)   | d3703a994910 | no     | ubuntu 15.10 amd64 (release) (20160315)              | x86_64 | 153.35MB | Mar 30, 2016 at 4:31am (UTC) |
+---------------+--------------+--------+------------------------------------------------------+--------+----------+------------------------------+
|               | 75182b1241be | no     | ubuntu 14.04 LTS amd64 (release) (20160314)          | x86_64 | 118.17MB | Mar 30, 2016 at 4:27am (UTC) |
+---------------+--------------+--------+------------------------------------------------------+--------+----------+------------------------------+
```

You can filter based on the alias or fingerprint simply by doing:

```
stgraber@dakara:~$ lxc image list amd64
+---------------+--------------+--------+-----------------------------------------+--------+----------+------------------------------+
|     ALIAS     | FINGERPRINT  | PUBLIC |               DESCRIPTION               |  ARCH  |   SIZE   |          UPLOAD DATE         |
+---------------+--------------+--------+-----------------------------------------+--------+----------+------------------------------+
| busybox-amd64 | 74186c79ca2f | no     | Busybox x86_64                          | x86_64 | 0.79MB   | Mar 30, 2016 at 4:33am (UTC) |
+---------------+--------------+--------+-----------------------------------------+--------+----------+------------------------------+
| w (11 more)   | d3703a994910 | no     | ubuntu 15.10 amd64 (release) (20160315) | x86_64 | 153.35MB | Mar 30, 2016 at 4:31am (UTC) |
+---------------+--------------+--------+-----------------------------------------+--------+----------+------------------------------+
```

Or by specifying a key=value filter of image properties:

```
stgraber@dakara:~$ lxc image list os=ubuntu
+-------------+--------------+--------+---------------------------------------------+--------+----------+------------------------------+
|    ALIAS    | FINGERPRINT  | PUBLIC |                  DESCRIPTION                |  ARCH  |   SIZE   |          UPLOAD DATE         |
+-------------+--------------+--------+---------------------------------------------+--------+----------+------------------------------+
| old-ubuntu  | 4d558b08f22f | no     | ubuntu 12.04 LTS amd64 (release) (20160315) | x86_64 | 155.09MB | Mar 30, 2016 at 4:30am (UTC) |
+-------------+--------------+--------+---------------------------------------------+--------+----------+------------------------------+
| w (11 more) | d3703a994910 | no     | ubuntu 15.10 amd64 (release) (20160315)     | x86_64 | 153.35MB | Mar 30, 2016 at 4:31am (UTC) |
+-------------+--------------+--------+---------------------------------------------+--------+----------+------------------------------+
|             | 75182b1241be | no     | ubuntu 14.04 LTS amd64 (release) (20160314) | x86_64 | 118.17MB | Mar 30, 2016 at 4:27am (UTC) |
+-------------+--------------+--------+---------------------------------------------+--------+----------+------------------------------+
```

To see everything LXD knows about a given image, you can use “lxc image info”:

```
stgraber@castiana:~$ lxc image info ubuntu
Fingerprint: e8a33ec326ae7dd02331bd72f5d22181ba25401480b8e733c247da5950a7d084
Size: 139.43MB
Architecture: i686
Public: no
Timestamps:
 Created: 2016/03/15 00:00 UTC
 Uploaded: 2016/03/16 05:50 UTC
 Expires: 2017/04/26 00:00 UTC
Properties:
 version: 12.04
 aliases: 12.04,p,precise
 architecture: i386
 description: ubuntu 12.04 LTS i386 (release) (20160315)
 label: release
 os: ubuntu
 release: precise
 serial: 20160315
Aliases:
 - ubuntu
Auto update: enabled
Source:
 Server: https://cloud-images.ubuntu.com/releases
 Protocol: simplestreams
 Alias: precise/i386
```

##### Editing images

A convenient way to edit image properties and some of the flags is to use:

lxc image edit <alias or fingerprint>
This opens up your default text editor with something like this:

autoupdate: true
properties:
 aliases: 14.04,default,lts,t,trusty
 architecture: amd64
 description: ubuntu 14.04 LTS amd64 (release) (20160314)
 label: release
 os: ubuntu
 release: trusty
 serial: "20160314"
 version: "14.04"
public: false
You can change any property you want, turn auto-update on and off or mark an image as publicly available (more on that later).

##### Deleting images

Remove an image is a simple matter of running:

```
lxc image delete <alias or fingerprint>
```

Note that you don’t have to remove cached entries, those will automatically be removed by LXD after they expire (by default, after 10 days since they were last used).

##### Exporting images

If you want to get image tarballs from images currently in your image store, you can use “lxc image export”, like:

```
stgraber@dakara:~$ lxc image export old-ubuntu .
Output is in .
stgraber@dakara:~$ ls -lh *.tar.xz
-rw------- 1 stgraber domain admins 656 Mar 30 00:55 meta-ubuntu-12.04-server-cloudimg-amd64-lxd.tar.xz
-rw------- 1 stgraber domain admins 156M Mar 30 00:55 ubuntu-12.04-server-cloudimg-amd64-lxd.tar.xz
```

#### Image formats

LXD right now supports two image layouts, unified or split. Both of those are effectively LXD-specific though the latter makes it easier to re-use the filesystem with other container or virtual machine runtimes.

LXD being solely focused on system containers, doesn’t support any of the application container “standard” image formats out there, nor do we plan to.

Our images are pretty simple, they’re made of a container filesystem, a metadata file describing things like when the image was made, when it expires, what architecture its for, … and optionally a bunch of file templates.

See this document for up to date details on the [image format][1].

##### Unified image (single tarball)

The unified image format is what LXD uses when generating images itself. They are a single big tarball, containing the container filesystem inside a “rootfs” directory, have the metadata.yaml file at the root of the tarball and any template goes into a “templates” directory.

Any compression (or none at all) can be used for that tarball. The image hash is the sha256 of the resulting compressed tarball.

##### Split image (two tarballs)

This format is most commonly used by anyone rolling their own images and who already have a compressed filesystem tarball.

They are made of two distinct tarball, the first contains just the metadata bits that LXD uses, so the metadata.yaml file at the root and any template in the “templates” directory.

The second tarball contains only the container filesystem directly at its root. Most distributions already produce such tarballs as they are common for bootstrapping new machines. This image format allows re-using them unmodified.

Any compression (or none at all) can be used for either tarball, they can absolutely use different compression algorithms. The image hash is the sha256 of the concatenation of the metadata and rootfs tarballs.

##### Image metadata

A typical metadata.yaml file looks something like:

```
architecture: "i686"
creation_date: 1458040200
properties:
 architecture: "i686"
 description: "Ubuntu 12.04 LTS server (20160315)"
 os: "ubuntu"
 release: "precise"
templates:
 /var/lib/cloud/seed/nocloud-net/meta-data:
  when:
   - start
  template: cloud-init-meta.tpl
 /var/lib/cloud/seed/nocloud-net/user-data:
  when:
   - start
  template: cloud-init-user.tpl
  properties:
   default: |
    #cloud-config
    {}
 /var/lib/cloud/seed/nocloud-net/vendor-data:
  when:
   - start
  template: cloud-init-vendor.tpl
  properties:
   default: |
    #cloud-config
    {}
 /etc/init/console.override:
  when:
   - create
  template: upstart-override.tpl
 /etc/init/tty1.override:
  when:
   - create
  template: upstart-override.tpl
 /etc/init/tty2.override:
  when:
   - create
  template: upstart-override.tpl
 /etc/init/tty3.override:
  when:
   - create
  template: upstart-override.tpl
 /etc/init/tty4.override:
  when:
   - create
  template: upstart-override.tpl
```

##### Properties

The two only mandatory fields are the creation date (UNIX EPOCH) and the architecture. Everything else can be left unset and the image will import fine.

The extra properties are mainly there to help the user figure out what the image is about. The “description” property for example is what’s visible in “lxc image list”. The other properties can be used by the user to search for specific images using key/value search.

Those properties can then be edited by the user through “lxc image edit” in contrast, the creation date and architecture fields are immutable.

##### Templates

The template mechanism allows for some files in the container to be generated or re-generated at some point in the container lifecycle.

We use the pongo2 templating engine for those and we export just about everything we know about the container to the template. That way you can have custom images which use user-defined container properties or normal LXD properties to change the content of some specific files.

As you can see in the example above, we’re using those in Ubuntu to seed cloud-init and to turn off some init scripts.

### Creating your own images

LXD being focused on running full Linux systems means that we expect most users to just use clean distribution images and not spin their own image.

However there are a few cases where having your own images is useful. Such as having pre-configured images of your production servers or building your own images for a distribution or architecture that we don’t build images for.

#### Turning a container into an image

The easiest way by far to build an image with LXD is to just turn a container into an image.

This can be done with:

```
lxc launch ubuntu:14.04 my-container
lxc exec my-container bash
<do whatever change you want>
lxc publish my-container --alias my-new-image
```

You can even turn a past container snapshot into a new image:

```
lxc publish my-container/some-snapshot --alias some-image
```

#### Manually building an image

Building your own image is also pretty simple.

1. Generate a container filesystem. This entirely depends on the distribution you’re using. For Ubuntu and Debian, it would be by using debootstrap.
2. Configure anything that’s needed for the distribution to work properly in a container (if anything is needed).
3. Make a tarball of that container filesystem, optionally compress it.
4. Write a new metadata.yaml file based on the one described above.
5. Create another tarball containing that metadata.yaml file.
6. Import those two tarballs as a LXD image with:
  ```
  lxc image import <metadata tarball> <rootfs tarball> --alias some-name
  ```

You will probably need to go through this a few times before everything works, tweaking things here and there, possibly adding some templates and properties.

### Publishing your images

All LXD daemons act as image servers. Unless told otherwise all images loaded in the image store are marked as private and so only trusted clients can retrieve those images, but should you want to make a public image server, all you have to do is tag a few images as public and make sure you LXD daemon is listening to the network.

#### Just running a public LXD server

The easiest way to share LXD images is to run a publicly visible LXD daemon.

You typically do that by running:

```
lxc config set core.https_address "[::]:8443"
```

Remote users can then add your server as a public image server with:

```
lxc remote add <some name> <IP or DNS> --public
```

They can then use it just as they would any of the default image servers. As the remote server was added with “–public”, no authentication is required and the client is restricted to images which have themselves been marked as public.

To change what images are public, just “lxc image edit” them and set the public flag to true.

#### Use a static web server

As mentioned above, “lxc image import” supports downloading from a static http server. The requirements are basically:

* The server must support HTTPs with a valid certificate, TLS1.2 and EC ciphers
* When hitting the URL provided to “lxc image import”, the server must return an answer including the LXD-Image-Hash and LXD-Image-URL HTTP headers

If you want to make this dynamic, you can have your server look for the LXD-Server-Architectures and LXD-Server-Version HTTP headers which LXD will provide when fetching the image. This allows you to return the right image for the server’s architecture.

#### Build a simplestreams server

The “ubuntu:” and “ubuntu-daily:” remotes aren’t using the LXD protocol (“images:” is), those are instead using a different protocol called simplestreams.

simplestreams is basically an image server description format, using JSON to describe a list of products and files related to those products.

It is used by a variety of tools like OpenStack, Juju, MAAS, … to find, download or mirror system images and LXD supports it as a native protocol for image retrieval.

While certainly not the easiest way to start providing LXD images, it may be worth considering if your images can also be used by some of those other tools.

More information can be found here.

### Conclusion

I hope this gave you a good idea of how LXD manages its images and how to build and distribute your own. The ability to have the exact same image easily available bit for bit on a bunch of globally distributed system is a big step up from the old LXC days and leads the way to more reproducible infrastructure.

### Extra information

The main LXD website is at: <https://linuxcontainers.org/lxd>
Development happens on Github at: <https://github.com/lxc/lxd>
Mailing-list support happens on: <https://lists.linuxcontainers.org>
IRC support happens in: #lxcontainers on irc.freenode.net

And if you don’t want or can’t install LXD on your own machine, you can always [try it online instead][3]!


--------------------------------------------------------------------------------

via: https://www.stgraber.org/2016/03/30/lxd-2-0-image-management-512/

作者：[Stéphane Graber][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.stgraber.org/author/stgraber/
[0]: https://www.stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
[1]: https://github.com/lxc/lxd/blob/master/doc/image-handling.md
[2]: https://launchpad.net/simplestreams
[3]: https://linuxcontainers.org/lxd/try-it

原文：https://www.stgraber.org/2016/03/30/lxd-2-0-image-management-512/
