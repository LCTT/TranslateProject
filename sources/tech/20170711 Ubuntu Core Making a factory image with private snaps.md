Ubuntu Core: Making a factory image with private snaps
============================================================



### Share or save

This is a follow-up to the [ROS prototype to production on Ubuntu Core][3] series to answer a question I received: “What if I want to make an image for the factory, but don’t want to make my snaps public?” This question is of course not robotics-specific, and neither is its answer. In this post we’ll cover two ways to do this.

Before we start, you’ll need a little bit of an Ubuntu Core imaging background. If you followed the ROS prototype to production series ([part 5][4] specifically) you already have the required background, but if you didn’t, check out the [tutorial for creating your own Ubuntu Core image][5].

Assuming you’re up-to-speed and know what I’m talking about when I say “model definition” or “model assertion,” let’s get started on a few different methods for creating an Ubuntu Core image with private snaps.

### Method 1: Don’t put your snap in the store at all

It really doesn’t get simpler. Take a look at this example model definition, **amd64-model.json**:

```
{
 "type": "model",
 "series": "16",
 "model": "custom-amd64",
 "architecture": "amd64",
 "gadget": "pc",
 "kernel": "pc-kernel",
 "authority-id": "4tSgWHfAL1vm9l8mSiutBDKnnSQBv0c8",
 "brand-id": "4tSgWHfAL1vm9l8mSiutBDKnnSQBv0c8",
 "timestamp": "2017-06-23T21:03:24+00:00",
 "required-snaps": ["kyrofa-test-snap"]
}
```

Let’s go ahead and turn that into a model assertion:

```
$ cat amd64-model.json | snap sign -k my-key-name > amd64.model
You need a passphrase to unlock the secret key for
user: "my-key-name"
4096-bit RSA key, ID 0B79B865, created 2016-01-01
...
```

Now you have your model assertion: **amd64.model**. If you hand that to **ubuntu-image** right now you’ll run into a problem:

```
$ sudo ubuntu-image -c stable amd64.model 
Fetching core
Fetching pc-kernel
Fetching pc
Fetching kyrofa-test-snap
error: cannot find snap "kyrofa-test-snap": snap not found
COMMAND FAILED: snap prepare-image --channel=stable amd64.model /tmp/tmp6p453gk9/unpack
```

The snap with the name **kyrofa-test-snap** isn’t actually in the store. But that’s important to note: the model definition (and thus assertion) only contains a list of snap names. If you have a snap locally with that name, even if it’s not in the store, you can tell **ubuntu-image** to use it to satisfy that name in the assertion with the **–extra-snaps** option:

```
$ sudo ubuntu-image -c stable \
         --extra-snaps /path/to/kyrofa-test-snap_0.1_amd64.snap \
         amd64.model
Fetching core
Fetching pc-kernel
Fetching pc
Copying "/path/to/kyrofa-test-snap_0.1_amd64.snap" (kyrofa-test-snap)
kyrofa-test-snap already prepared, skipping
WARNING: "kyrofa-test-snap" were installed from local snaps
disconnected from a store and cannot be refreshed subsequently!
Partition size/offset need to be a multiple of sector size (512).
The size/offset will be rounded up to the nearest sector.
```

There. You now have an Ubuntu Core image (named **pc.img**) with your snap preinstalled, without the snap ever needing to be in the store. This works, but it has a big disadvantage which **ubuntu-image** points out with a warning: preinstalling a snap that isn’t connected to the store means you have no way to update it once devices are flashed with this image. Your only update mechanism would be to ship new images to be flashed.

### Method 2: Use a brand store

When you create a store account and visit [dashboard.snapcraft.io][6], you’re viewing your snaps in the standard Ubuntu store. If you install snapd fresh on your system, this is the store it uses by default. While you can release snaps privately on the Ubuntu store, you [can’t preinstall those in an image][7] because only you (and the collaborators you’ve added) can obtain access to it. The only way you can make an image in this case would be to make the snaps publicly available, which defeats the whole purpose of this post.

For this use-case, we have what are called [**brand stores**][8]. Brand stores are still hosted in the Ubuntu store, but they’re a custom, curated version of it, meant to be specific to a given company or device. They can inherit (or not) from the standard Ubuntu store, and be open to all developers or locked down to a specific group (which is what we want in our case, to keep things private).

Note that this is a paid feature. You need to [request a brand store][9]. Once your request has been granted, you’ll see your new store by visiting “stores you can access” under your name.

![](https://insights.ubuntu.com/wp-content/uploads/1a62/stores_you_can_access.jpg)

There you’ll see the various stores to which you have access. You’ll have at least two: the normal Ubuntu store, and your new brand store. Select the brand store (red rectangle). While you’re here, record your store ID (blue rectangle): you’ll need it in a moment.

![](https://insights.ubuntu.com/wp-content/uploads/b10c/Screenshot-from-2017-07-06-15-16-32.png)

From there, registering names/uploading snaps works the same way, but now they go into your brand store instead of the standard one, and assuming you have it unlisted, those snaps are not available to external users. The only caveat today is that at least the first upload for the snap needs to be via the web interface. After that, you can continue to use Snapcraft like normal.

So how does this change things? My “kyrofa-store” inherits snaps from the Ubuntu store, and also contains a “kyrofa-branded-test-snap” published into the stable channel. This snap isn’t available in the Ubuntu store, as you can see if you search for it:

```
$ snap find kyrofa-branded
The search "kyrofa-branded" returned 0 snaps
```

But using the store ID we recorded earlier, we can make a model assertion that pulls from the brand store instead of the Ubuntu store. We just need to add the “store” key to the JSON document, making it look like this:

```
{
  "type": "model",
  "series": "16",
  "model": "custom-amd64",
  "architecture": "amd64",
  "gadget": "pc",
  "kernel": "pc-kernel",
  "authority-id": "4tSgWHfAL1vm9l8mSiutBDKnnSQBv0c8",
  "brand-id": "4tSgWHfAL1vm9l8mSiutBDKnnSQBv0c8",
  "timestamp": "2017-06-23T21:03:24+00:00",
  "required-snaps": ["kyrofa-branded-test-snap"],
  "store": "ky<secret>ek"
}
```

Sign it just as we did in **Method 1**, and we can create an Ubuntu Core image with our private, brand-store snap preinstalled as simply as:

```
$ sudo ubuntu-image -c stable amd64.model
Fetching core
Fetching pc-kernel
Fetching pc
Fetching kyrofa-branded-test-snap
Partition size/offset need to be a multiple of sector size (512).
The size/offset will be rounded up to the nearest sector.
```

Now, like at the end of **Method 1**, you have a **pc.img** ready for the factory. However, with this method, the snaps in the image are all coming from the store, which means they will automatically update as usual.

### Conclusion

These are the only two options for doing this today. When I started writing this post I thought there was a third (keeping one’s snap private and creating an image with it), but that turns out to [not be the case][10].

Note that we’ve also received numerous requests for some sort of on-premises/enterprise store, and while such a product is not yet available, the store team is working on it. Once this is available, I’ll write a new post about it.

I hope this proves useful!

 _Original post can be found [here][1]._

--------------------------------------------------------------------------------

作者简介：

Kyle is a member of the Snapcraft team, and is also Canonical's resident roboticist. He focuses on snaps and the snap developer experience, as well as robotics enablement for snaps and Ubuntu Core.



-----

via: https://insights.ubuntu.com/2017/07/11/ubuntu-core-making-a-factory-image-with-private-snaps/

作者：[Kyle Fazzari  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://insights.ubuntu.com/author/kyrofa/
[1]:http://bit.ly/2sS7M1i
[2]:https://insights.ubuntu.com/author/kyrofa/
[3]:https://insights.ubuntu.com/2017/04/06/from-ros-prototype-to-production-on-ubuntu-core/
[4]:https://insights.ubuntu.com/2017/05/09/ros-production-create-ubuntu-core-image-with-snap-preinstalled-55/
[5]:https://tutorials.ubuntu.com/tutorial/create-your-own-core-image
[6]:http://dashboard.snapcraft.io/
[7]:https://forum.snapcraft.io/t/unable-to-create-an-image-that-uses-private-snaps
[8]:https://docs.ubuntu.com/core/en/build-store/index
[9]:https://docs.ubuntu.com/core/en/create
[10]:https://forum.snapcraft.io/t/unable-to-create-an-image-that-uses-private-snaps
