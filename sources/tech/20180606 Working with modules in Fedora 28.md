Working with modules in Fedora 28
======
![](https://fedoramagazine.org/wp-content/uploads/2018/05/modules-workingwith-816x345.jpg)
The recent Fedora Magazine article entitled [Modularity in Fedora 28 Server Edition][1] did a great job of explaining Modularity in Fedora 28. It also pointed out a few example modules and explained the problems they solve. This article puts one of those modules to practical use, covering installation and setup of Review Board 3.0 using modules.

### Getting started

To follow along with this article and use modules, you need a system running [Fedora 28 Server Edition][2] along with [sudo administrative privileges][3]. Also, run this command to make sure all the packages on the system are current:
```
sudo dnf -y update

```

While you can use modules on Fedora 28 non-server editions, be aware of the [caveats described in the comments of the previous article][4].

### Examining modules

First, take a look at what modules are available for Fedora 28. Run the following command:
```
dnf module list

```

The output lists a collection of modules that shows the associated stream, version, and available installation profiles for each. A [d] next to a particular module stream indicates the default stream used if the named module is installed.

The output also shows most modules have a profile named default. That’s not a coincidence, since default is the name used for the default profile.

To see where all those modules are coming from, run:
```
dnf repolist

```

Along with the usual [fedora and updates package repositories][5], the output shows the fedora-modular and updates-modular repositories.

The introduction stated you’d be setting up Review Board 3.0. Perhaps a module named reviewboard caught your attention in the earlier output. Next, to get some details about that module, run this command:
```
dnf module info reviewboard

```

The description confirms it is the Review Board module, but also says it’s the 2.5 stream. However, you want 3.0. Look at the available reviewboard modules:
```
dnf module list reviewboard

```

The [d] next to the 2.5 stream means it is configured as the default stream for reviewboard. Therefore, be explicit about the stream you want:
```
dnf module info reviewboard:3.0

```

Now for even more details about the reviewboard:3.0 module, add the verbose option:
```
dnf module info reviewboard:3.0 -v

```

### Installing the Review Board 3.0 module

Now that you’ve tracked down the module you want, install it with this command:
```
sudo dnf -y module install reviewboard:3.0

```

The output shows the ReviewBoard package was installed, along with several other dependent packages, including several from the django:1.6 module. The installation also enabled the reviewboard:3.0 module and the dependent django:1.6 module.

Next, to see enabled modules, use this command:
```
dnf module list --enabled

```

The output shows [e] for enabled streams, and [i] for installed profiles. In the case of the reviewboard:3.0 module, the default profile was installed. You could have specified a different profile when installing the module. In fact, you still can — and this time you don’t need to specify the 3.0 stream since it was already enabled:
```
sudo dnf -y module install reviewboard/server

```

However, installation of the reviewboard:3.0/server profile is rather uneventful. The reviewboard:3.0 module’s server profile is the same as the default profile — so there’s nothing more to install.

### Spin up a Review Board site

Now that the Review Board 3.0 module and its dependent packages are installed, [create a Review Board site][6] running on the local system. Without further ado or explanation, copy and paste the following commands to do that:
```
sudo rb-site install --noinput \
 --domain-name=localhost --db-type=sqlite3 \
 --db-name=/var/www/rev.local/data/reviewboard.db \
 --admin-user=rbadmin --admin-password=secret \
 /var/www/rev.local
sudo chown -R apache /var/www/rev.local/htdocs/media/uploaded \
 /var/www/rev.local/data
sudo ln -s /var/www/rev.local/conf/apache-wsgi.conf \
 /etc/httpd/conf.d/reviewboard-localhost.conf
sudo setsebool -P httpd_can_sendmail=1 httpd_can_network_connect=1 \
 httpd_can_network_memcache=1 httpd_unified=1
sudo systemctl enable --now httpd

```

Now fire up a web browser on the system, point it at <http://localhost>, and enjoy the shiny new Review Board site! To login as the Review Board admin, use the userid and password seen in the rb-site command above.

### Module cleanup

It’s good practice to clean up after yourself. To do that, remove the Review Board module and the site directory:
```
sudo dnf -y module remove reviewboard:3.0
sudo rm -rf /var/www/rev.local

```

### Closing remarks

Now that you’ve explored how to examine and administer the Review Board module, go experiment with the other modules available in Fedora 28.

Learn more about using modules in Fedora 28 on the [Fedora Modularity][7] web site. The dnf manual page’s Module Command section also contains useful information.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/working-modules-fedora-28/

作者：[Merlin Mathesius][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/merlinm/
[1]:https://fedoramagazine.org/modularity-fedora-28-server-edition/
[2]:https://getfedora.org/server/
[3]:https://fedoramagazine.org/howto-use-sudo/
[4]:https://fedoramagazine.org/modularity-fedora-28-server-edition/#comment-476696
[5]:https://fedoraproject.org/wiki/Repositories
[6]:https://www.reviewboard.org/docs/manual/dev/admin/installation/creating-sites/
[7]:https://docs.pagure.org/modularity/
