[#]: subject: (Introduction to image builder)
[#]: via: (https://fedoramagazine.org/introduction-to-image-builder/)
[#]: author: (Andy Mott https://fedoramagazine.org/author/amott/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Introduction to image builder
======

![][1]

Photo by [Marcel Strauß][2] on [Unsplash][3]

Image Builder is a tool that allows you to create custom OS images (based on the upstream project Weldr), and it’s included in the base repos so you can build images right from the start.

You can use the command line or a Cockpit plugin, and it’s a fairly simple and straightforward process which allows you to create images for most of the major platforms – Libvirt/KVM (RHV or general Linux virtualisation), VMware, Openstack, AWS and Azure. You can also deploy these images from Satellite.

### Installing Image Builder

To install Image Builder, run this command:

```
sudo dnf install -y osbuild-composer composer-cli cockpit-composer
```

If you’re not using Cockpit then omit that last package and you’ll just have the cli tool.

If you are using Cockpit, then make sure you add the service to firewalld to allow access like this:

```
sudo firewall-cmd --add-service=cockpit && sudo firewall-cmd --runtime-to-permanent
```

You need to enable the osbuild-composer socket (and cockpit if you installed it and haven’t yet enabled it):

```
sudo systemctl enable --now osbuild-composer.socket
sudo systemctl enable --now cockpit.socket
```

Image Builder is now running and ready to use so let’s create an image using the cli first, then move on to using Cockpit.

### Image Builder CLI

The main cli command is _composer-cli,_ which you use to create, list, examine and delete blueprints. It is also used to build, list, delete and download images for upload to their intended platform.

#### Available commands

The following is a list of the Image Builder commands and their functions:

**Blueprint manipulation** |
---|---
List all available blueprints | sudo composer-cli blueprints list
Show a blueprint contents in the toml format | sudo composer-cli blueprints show _blueprint-name_
Save (export) blueprint contents in the toml format into a file _blueprint-name.toml_ | sudo composer-cli blueprints save _blueprint-name_
Remove a blueprint | sudo composer-cli blueprints delete _blueprint-name_
Push (import) a blueprint file in the toml format into Image Builder | sudo composer-cli blueprints push _blueprint-name_
**Composing images from blueprints** |
Start a compose | sudo composer-cli compose start _blueprint-name_ _image-type_
List all composes | sudo composer-cli compose list
List all composes and their status | sudo composer-cli compose status
Cancel a running compose | sudo composer-cli compose cancel _compose-uuid_
Delete a finished compose | sudo composer-cli compose delete _compose-uuid_
Show detailed information about a compose | sudo composer-cli compose info _compose-uuid_
Download image file of a compose | sudo composer-cli compose image _compose-uuid_
**Additional resources** |
The composer-cli man page provides a full list of the available subcommands and options | man composer-cli
The composer-cli command provides help on the subcommands and options | sudo composer-cli help

#### Creating an image blueprint

The first step in using Image Builder is to use your favorite editor to create the blueprint of the image itself. The blueprint includes everything the image needs to run. Let’s create a really simple one to begin with, then take it from there.

##### **Create the blueprint file**

Blueprint files are .toml files, created in your favorite editor, and the minimal required information is shown here:

```
name = "image-name"
description = "my image blueprint"
version = "0.0.1"
modules = []
groups = []
```

The file above can be used to create a minimal image with just the essential software required to run. Typically, images need a few more things, so let’s add in some additional packages. Add in the following below the groups item to add in extra packages:

```
[[packages]]
name = "bash-completion"
version = "*"
```

You will need to repeat this block for every package you wish to install. The version can be a specific version or the asterisk to denote the latest.

Going into a bit more detail, the groups declaration is used to add any groups you might need in the image. If you’re not adding any you can use the format above, but if you need to create a group remove the line shown above:

```
groups = []
```

and add this:

```
[[groups]]
name = "mygroup"
```

Again, you need to repeat this block for every group you want to add.

It is recommended that you create at least a “root” user using something similar to this:

```
[[customizations.user]]
 name = "root"
 description = "root"
 password = "$6$ZkdAX1t8QwEAc/GH$Oi3NY3fyTH/87ALiPfCzZTwpCoKv7P3bCVnoD9JnI8f5gV9I3A0bq5mZrKrw6isuYatmRQ.SVq3Vq27v3X2yu."
 home = "/home/root/"
 shell = "/usr/bin/bash"
 groups = ["root"]
```

An example blueprint is available at <https://github.com/amott-rh/image-builder-blueprint> and it contains an explanation for creating the password hash. It doesn’t cover everything, but has the majority of the options shown.

##### **Push the blueprint to Image Builder**

Once you have your blueprint ready, you need to push it to Image Builder. This command pushes file _blueprint-name.toml_ to Image Builder:

```
sudo composer-cli blueprints push blueprint-name.toml
```

Check that it has been pushed with the _blueprints list_ command:

```
sudo composer-cli blueprints list
```

##### Generate the image

Now you have your blueprint uploaded and can use it to generate images. Use the _compose-cli start_ command for this, giving the blueprint name and the output format you want (qcow, ami, vmdk, etc):

```
sudo composer-cli compose start blueprint-name qcow2
```

You can obtain a list of image types with:
```

```

sudo composer-cli compose types
```

```

The _compose_ step creates a minimally-sized image – if you want more space on your OS disk then add _–size_ and a size, in Gb, to the command.

The image compose will take a short time, and you can see the status of any images with the

compose status

command:

```
sudo composer-cli compose status
```

##### Using the image

When the image build is complete the status will show “FINISHED” and you can download it and use it to build your VM:

```
sudo composer-cli compose image image-uuid
```

The image UUID is displayed when you start the compose. It can also be found at the beginning of the compose status command output.

The downloaded image file is named with the UUID of the image plus the appropriate extension for the image type. You can copy this file to an image repository and rename as appropriate before creating a VM with it.

A simple qemu/kvm machine is started like this:

```
sudo qemu-kvm --name test-image -m 1024 -hda ./UUID-disk.qcow2
```

Alternatively, you can copy this image to a new file and use that file as the OS disk for a new VM.

### Image Builder in Cockpit

If you want to use Image Builder in Cockpit, you need to install the cockpit-composer package as described in the installation section above.

After installation, log into your Cockpit URL (localhost:9090) and select _Image Builder_ in the _Tools&gt;Applications_ section. This will take you to the initial Image Builder page, where you can create new blueprints:

![][4]

#### Create a blueprint

Selecting the _Create blueprint_ button will display a dialogue box where you need to enter a name for your blueprint plus an optional description:

![][5]

After you enter a name and select _Create_, you move to the add packages page. Create a minimal image here by simply selecting the _Create Image_ button, or add extra packages by entering the name in the search box under _Available Components_ and then selecting the + button to add it to your image. Any dependencies required by the package will also be added to the image. Add as many packages as you require.

![][6]

After adding your packages, select the _Commit_ button to save your blueprint. You will be shown the changes your actions will make with the option to continue with your commit or discard the changes next.

When the commit has been made, you will be returned to the same screen where you can add more packages. If you’re done with that, select the name of your blueprint in the breadcrumbs at the top left of the screen to go to the main screen for that blueprint. From here you can add customizations (users, groups etc), more packages, or create the image:

![][7]

If your image requires any specific users, or if you want to edit the root user (I’d recommend this, either to set a password or add an ssh key so you can log in without having to further edit or customize the image), then you can do this here. You can also create a hostname, which is useful for a single-use image but less so if the image will be used as the base for multiple deployments.

To add a user, select the _Create user_ _account_ button. If you name this user root you can update the root account as you need. Enter a user name, description, any password and/or ssh public key, and if this user will be an administrative user (like root) then tick the box to signify this:

![][8]

Select the _Create_ button at the bottom to create the user and return to the main blueprint page. Here you will see the new user, and can create more as necessary. Once you’ve created all your users and added all your packages you can create am image from the blueprint by selecting the _Create image_ button at the upper right.

![][9]

#### Create an image

In the Create image dialogue select an image type from the dropdown list, then select a size. This will effectively be the size of the disk available in the OS, just like you’d specify the virtual disk size when creating a VM manually. This will be thin-provisioned, so the actual image file won’t be this size! Select _Creat_e, when finished, to add your image to a build queue.

![][10]

Building images takes a little time, and you can check progress or view completed images in the Images page:

![][11]

You can create multiple image types from the same blueprint, so you can deploy the exact same image on multiple platforms, increasing your security and making maintenance and administration easier.

#### Download the image

To use your image, you need to download it, then upload to your chosen platform. To download the image, select the 3-dot menu next to the image and choose _Download_:

![][12]

That’s it – your image is ready to deploy. For a simple QEMU/KVM example use the same command from the CLI section above.

```
sudo qemu-kvm --name test-image -m 1024 -hda ./UUID-disk.qcow2
```

#### Final thoughts

  * You can always edit your blueprints at a later date. The Cockpit UI will automatically increment the version number, but you will need to do this yourself in the toml file if using the CLI. Once you’ve edited the blueprint you will also need to create a new image.
  * You may verify the TOML format using this web site <https://www.toml-lint.com/> Note that this verifies only the file formatting, not correctness of the content.
  * You can create images with different sizes if your environment has such requirements.
  * Create a different blueprint for each specific image you need – don’t update the same one with different packages and version numbers then create images from those.
  * Image Builder does not allow disks to be partitioned. The output types that have a partitioned disk will have a single partition and additionally any platform-specific partitions that are required to boot the system image. For example, qcow2 image type has a single root partition, and possibly a platform specific boot partition – like PReP for PPC64 system – that the image requires to boot.
  * Images types that may be created are listed in the following table:

**Description** | **CLI name** | **File Extension**
---|---|---
QEMU QCOW2 Image | qcow2 | .qcow2
Ext4 File System Image | 80 | .qcow2
Raw Partitioned Disk Image | partitiond-disk | .img
Live Bootable ISO | live-iso | .iso
TAR Archive | tar | .tar
Amazon Machine Image Disk | ami | .ami
VMware Virtual Machine Disk | vmdk | .vmdk
Openstack | openstack | .qcow2

Image Builder is a fantastic tool for anyone who needs to have repeatable based images for their environment. It’s definitely still a work in progress, but new features are coming all the time, with plans to allow uploading directly into various hypervisors and cloud platforms and other cool stuff.

#### Image Builder documentation

Official Weldr documentation: <https://weldr.io/lorax/>

RHEL 8: <https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html-single/composing_a_customized_rhel_system_image/index>

RHEL 7: <https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html-single/image_builder_guide/index>

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/introduction-to-image-builder/

作者：[Andy Mott][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/amott/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/05/image_builder-816x345.jpg
[2]: https://unsplash.com/@martzzl?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/builder?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/wp-content/uploads/2021/05/image-builder-start-page-1024x198.png
[5]: https://fedoramagazine.org/wp-content/uploads/2021/05/Screenshot-from-2021-05-25-10-20-34.png
[6]: https://fedoramagazine.org/wp-content/uploads/2021/05/image-builder-add-components-1024x456.png
[7]: https://fedoramagazine.org/wp-content/uploads/2021/05/image-builder-main-blueprint-page-1024x226.png
[8]: https://fedoramagazine.org/wp-content/uploads/2021/05/image-builder-add-user.png
[9]: https://fedoramagazine.org/wp-content/uploads/2021/05/image-builder-main-page-2-1024x303.png
[10]: https://fedoramagazine.org/wp-content/uploads/2021/05/image-builder-create-image-2-1024x701.png
[11]: https://fedoramagazine.org/wp-content/uploads/2021/05/image-builder-images-page-1024x252.png
[12]: https://fedoramagazine.org/wp-content/uploads/2021/05/image-builder-download-image-1024x255.png
