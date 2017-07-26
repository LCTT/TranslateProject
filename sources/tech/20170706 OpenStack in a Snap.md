OpenStack in a Snap
============================================================


### Share or save

![](https://insights.ubuntu.com/wp-content/uploads/646b/openstaack-in-a-snap.png)

OpenStack is complex and many of the community members are working hard to make the deployment and operation of OpenStack easier. Much of this time is focused on tools such as Ansible, Puppet, Kolla, Juju, Triple-O, Chef (to name a few). But what if we step down a level and also make the package experience easier?

With snaps we’re working on doing just that. Snaps are a new way of delivering software. The following description from [snapcraft.io][2] provides a good summary of the core benefits of snaps:  _“Snaps are quick to install, easy to create, safe to run, and they update automatically and transactionally so your app is always fresh and never broken.”_ 

### Bundled software

A single snap can deliver multiple pieces of software from different sources to provide a solution that gets you up and running fast. You’ll notice that installing a snap is quick. That’s because when you install a snap, that single snap bundles all of its dependencies. That’s a bit different from installing a deb, where all of the dependencies get pulled down and installed separately.

### Snaps are easy to create

In my time working on Ubuntu, I’ve spent much of it working on Debian packaging for OpenStack. It’s a niche skill that takes quite a bit of time to understand the nuances of. When compared with snaps, the difference in complexity between deb packages and snaps is like night and day. Snaps are just plain simple to work on, and even quite fun!

### A few more features of snaps

*   Each snap is installed in it’s own read-only squashfs filesystem.

*   Each snap is run in a strict environment sandboxed by AppArmor and seccomp policy.

*   Snaps are transactional. New versions of a snap install to a new read-only squashfs filesystem. If an upgrade fails, it will roll-back to the old version.

*   Snaps will auto-refresh when new versions are available.

*   OpenStack Snaps are guaranteed to be aligned with OpenStack’s upper-constraints. Packagers no longer need to maintain separate packages for the OpenStack dependency chain. Woo-hoo!

### Introducing the OpenStack Snaps!

We currently have the following projects snapped:

*   **Keystone** – This snap provides the OpenStack identity service.

*   **Glance** – This snap provides the OpenStack image service.

*   **Neutron** – This snap specifically provides the ‘neutron-server’ process as part of a snap based OpenStack deployment.

*   **Nova** – This snap provides the Nova controller component of an OpenStack deployment.

*   **Nova-hypervisor** – This snap provides the hypervisor component of an OpenStack deployment, configured to use Libvirt/KVM + Open vSwitch which are installed using deb packages. This snap also includes nova-lxd, allowing for use of nova-lxd instead of KVM.

This is enough to get a minimal working OpenStack cloud. You can find the source for all of the OpenStack snaps on [github][3]. For more details on the OpenStack snaps please refer to the individual READMEs in the upstream repositories. There you can find more details for managing the snaps, such as overriding default configs, restarting services, setting up aliases, and more.

### Want to create your own OpenStack snap?

Check out the [snap cookie cutter][4]. I’ll be writing a blog post soon that walks you through using the snap cookie cutter. It’s really simple and will help get the creation of a new OpenStack snap bootstrapped in no time.

### Testing the OpenStack snaps

We’ve been using a simple script for initial testing of the OpenStack snaps. The script installs the snaps on a single node and provides additional post-install configuration for services. To try it out:

```
git clone https://github.com/openstack-snaps/snap-test
cd snap-test
./snap-deploy
```

At this point we’ve been doing all of our testing on Ubuntu Xenial (16.04). Also note that this will install and configure quite a bit of software on your system so you’ll likely want to run it on a disposable machine.

### Tracking OpenStack

Today you can install snaps from the edge channel of the snap store. For example:

```
sudo snap install --edge keystone
```

The OpenStack team is working toward getting CI/CD in place to enable publishing snaps across tracks for OpenStack releases (Ie. a track for ocata, another track for pike, etc). Within each track will be 4 different channels. The edge channel for each track will contain the tip of the OpenStack project’s corresponding branch, with the beta, candidate and release channels being reserved for released versions. This should result in an experience such as:

```
sudo snap install --channel=ocata/stable keystone
sudo snap install --channel=pike/edge keystone
```

### Poking around

Snaps have various environment variables available to them that simplify the creation of the snap. They’re all documented [here][6]. You probably won’t need to know much about them to be honest, however there are a few locations that you’ll want to be familiar with once you’ve installed a snap:

###  _$SNAP == /snap/<snap-name>/current_ 

This is where the snap and all of it’s files are mounted. Everything here is read-only. In my current install of keystone, $SNAP is /snap/keystone/91\. Fortunately you don’t need to know the current version number as there’s a symlink to that directory at /snap/keystone/current.

```
$ ls /snap/keystone/current/
bin                     etc      pysqlite2-doc        usr
command-manage.wrapper  include  snap                 var
command-nginx.wrapper   lib      snap-openstack.yaml
command-uwsgi.wrapper   meta     templates

$ ls /snap/keystone/current/bin/
alembic                oslo-messaging-send-notification
convert-json           oslo-messaging-zmq-broker
jsonschema             oslo-messaging-zmq-proxy
keystone-manage        oslopolicy-checker
keystone-wsgi-admin    oslopolicy-list-redundant
keystone-wsgi-public   oslopolicy-policy-generator
lockutils-wrapper      oslopolicy-sample-generator
make_metadata.py       osprofiler
mako-render            parse_xsd2.py
mdexport.py            pbr
merge_metadata.py      pybabel
migrate                snap-openstack
migrate-repository     sqlformat
netaddr                uwsgi
oslo-config-generator

$ ls /snap/keystone/current/usr/bin/
2to3               idle     pycompile     python2.7-config
2to3-2.7           pdb      pydoc         python2-config
cautious-launcher  pdb2.7   pydoc2.7      python-config
compose            pip      pygettext     pyversions
dh_python2         pip2     pygettext2.7  run-mailcap
easy_install       pip2.7   python        see
easy_install-2.7   print    python2       smtpd.py
edit               pyclean  python2.7

$ ls /snap/keystone/current/lib/python2.7/site-packages/
...
```

###  _$SNAP_COMMON == /var/snap/<snap-name>/common_ 

This directory is used for system data that is common across revisions of a snap. This is where you’ll override default config files and access log files.

```
$ ls /var/snap/keystone/common/
etc  fernet-keys  lib  lock  log  run

$ sudo ls /var/snap/keystone/common/etc/
keystone  nginx  uwsgi

$ ls /var/snap/keystone/common/log/
keystone.log  nginx-access.log  nginx-error.log  uwsgi.log
```

### Strict confinement

The snaps all run under strict confinement, where each snap is run in a restricted environment that is sandboxed with seccomp and AppArmor policy. More details on snap confinement can be viewed [here][7].

### New features/updates coming for snaps

There are a few features and updates coming for snaps that I’m looking forward to:

*   We’re working on getting libvirt AppArmor policy in place so that the nova-hypervisor snap can access qcow2 backing files.
    *   For now, as a work-around, you can put virt-aa-helper in complain mode: sudo aa-complain /usr/lib/libvirt/virt-aa-helper

*   We’re also working on getting additional snapd interface policy in place that will enable network connectivity for deployed instances.
    *   For now you can install the nova-hypervisor snap in devmode, which disables security confinement: snap install –devmode –edge nova-hypervisor

*   Auto-connecting nova-hypervisor interfaces. We’re working on getting the interfaces for the nova-hypervisor defined automatically at install time.
    *   Interfaces define the AppArmor and seccomp policy that enables a snap to access resources on the system.

    *   For now you can manually connect the required interfaces as described in the nova-hypervisor snap’s README.

*   Auto-alias support for commands. We’re working on getting auto-alias support defined for commands across the snaps, where aliases will be defined automatically at install time.
    *   This enables use of the traditional command names. Instead of ‘nova.manage db sync‘ you’ll be able to issue ‘nova-manage db sync’ right after installing the snap.

    *   For now you can manually enable aliases after the snap is installed, such as ‘snap alias nova.manage nova-manage’. See the snap READMEs for more details.

*   Auto-alias support for daemons. Currently snappy only supports aliases for commands (not daemons). Once alias support is available for daemons, we’ll set them up to be automatically configured at install time.
    *   This enables use of the traditional unit file names. Instead of ‘systemctl restart snap.nova.nova-compute’ you’ll be able to issue ‘systemctl restart nova-compute’.

*   Asset tracking for snaps. This will enables tracking of versions used to build the snap which can be re-used in future builds.

If you’d like to chat more about snaps you can find us on IRC in #openstack-snaps on freenode. We welcome your feedback and contributions! Thanks and have fun! Corey

--------------------------------------------------------------------------------

作者简介：

Corey Bryant is an Ubuntu core developer and software engineer at Canonical on the OpenStack Engineering team, primarily focusing on OpenStack packaging for Ubuntu and OpenStack charm development for Juju.  He's passionate about open-source software and enjoys working with people from all over the world on a common cause.



------

via: 网址

作者：[ Corey Bryant ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://insights.ubuntu.com/author/corey-bryant/
[1]:https://insights.ubuntu.com/author/corey-bryant/
[2]:http://snapcraft.io/
[3]:https://github.com/openstack?utf8=%E2%9C%93&q=snap-&type=&language=
[4]:https://github.com/openstack-snaps/snap-cookiecutter/blob/master/README.rst
[5]:https://github.com/openstack-snaps/snap-test
[6]:https://snapcraft.io/docs/reference/env
[7]:https://snapcraft.io/docs/reference/confinement
