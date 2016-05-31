Test Fedora 24 Beta in an OpenStack cloud
===========================================

![](https://major.io/wp-content/uploads/2012/01/fedorainfinity.png)

Although there are a few weeks remaining before [Fedora 24][1] is released, you can test out the Fedora 24 Beta release today! This is a great way to get [a sneak peek at new features][2] and help find bugs that still need a fix.

The [Fedora Cloud][3] image is available for download from your favorite [local mirror][4] or directly from [Fedora’s servers][5]. In this post, I’ll show you how to import this image into an OpenStack environment and begin testing Fedora 24 Beta.

One last thing: this is beta software. It has been reliable for me so far, but your experience may vary. I would recommend waiting for the final release before deploying any mission critical applications on it.

### Importing the image

The older glance client (version 1) allows you to import an image from a URL that is reachable from your OpenStack environment. This is helpful since my OpenStack cloud has a much faster connection to the internet (1 Gbps) than my home does (~ 20 mbps upload speed). However, the functionality to import from a URL was [removed in version 2 of the glance client][6]. The [OpenStackClient][7] doesn’t offer the feature either.

There are two options here:

- Install an older version of the glance client
- Use Horizon (the web dashboard)

Getting an older version of glance client installed is challenging. The OpenStack requirements file for the liberty release [leaves the version of glance client without a maximum version cap][8] and it’s difficult to get all of the dependencies in order to make the older glance client work.

Let’s use Horizon instead so we can get back to the reason for the post.

### Adding an image in Horizon

Log into the Horizon panel and click Compute > Images. Click + Create Image at the top right of the page and a new window should appear. Add this information in the window:

- **Name**: Fedora 24 Cloud Beta
- **Image Source**: Image Location
- **Image Location**: http://mirrors.kernel.org/fedora/releases/test/24_Beta/CloudImages/x86_64/images/Fedora-Cloud-Base-24_Beta-1.6.x86_64.qcow2
- **Format**: QCOW2 – QEMU Emulator
- **Copy Data**: ensure the box is checked

When you’re finished, the window should look like this:

![](https://major.io/wp-content/uploads/2016/05/horizon_image.png)

Click Create Image and the images listing should show Saving for a short period of time. Once it switches to Active, you’re ready to build an instance.

### Building the instance

Since we’re already in Horizon, we can finish out the build process there.

On the image listing page, find the row with the image we just uploaded and click Launch Instance on the right side. A new window will appear. The Image Name drop down should already have the Fedora 24 Beta image selected. From here, just choose an instance name, select a security group and keypair (on the Access & Security tab), and a network (on the Networking tab). Be sure to choose a flavor that has some available storage as well (m1.tiny is not enough).

Click Launch and wait for the instance to boot.

Once the instance build has finished, you can connect to the instance over ssh as the fedora user. If your [security group allows the connection][9] and your keypair was configured correctly, you should be inside your new Fedora 24 Beta instance!

Not sure what to do next? Here are some suggestions:

- Update all packages and reboot (to ensure that you are testing the latest updates)
- Install some familiar applications and verify that they work properly
- Test out your existing automation or configuration management tools
- Open bug tickets!

--------------------------------------------------------------------------------

via: https://major.io/2016/05/24/test-fedora-24-beta-openstack-cloud/

作者：[major.io][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://major.io/about-the-racker-hacker/
[1]: https://fedoraproject.org/wiki/Releases/24/Schedule
[2]: https://fedoraproject.org/wiki/Releases/24/ChangeSet
[3]: https://getfedora.org/en/cloud/
[4]: https://admin.fedoraproject.org/mirrormanager/mirrors/Fedora/24/x86_64
[5]: https://getfedora.org/en/cloud/download/
[6]: https://wiki.openstack.org/wiki/Glance-v2-v1-client-compatability
[7]: http://docs.openstack.org/developer/python-openstackclient/
[8]: https://github.com/openstack/requirements/blob/stable/liberty/global-requirements.txt#L159
[9]: https://major.io/2016/05/16/troubleshooting-openstack-network-connectivity/
