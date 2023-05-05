[#]: subject: "New AWS storage type for Fedora Linux"
[#]: via: "https://fedoramagazine.org/new-aws-storage-type-for-fedora-linux/"
[#]: author: "Major Hayden https://fedoramagazine.org/author/mhayden/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

New AWS storage type for Fedora Linux
======

![][1]

Photo by [Rodion Kutsaiev][2] on [Unsplash][3] (cropped)

If you filter Fedora Linux AWS images using a script, you might notice a change in the image names. The Fedora Cloud SIG recently updated the image publishing configuration to use the latest generation storage option and simplify the image listings.

This involves two changes:

  * Replacing _gp2_ storage with _gp3_ storage by default for new images
  * Removing _standard_ storage from new images



### What’s the benefit of these changes?

The _gp3_ storage type appeared in 2020 and switching to that storage type for Fedora Linux users means more consistent performance for a lower cost. (For more details, read Corey Quinn’s [helpful blog post][4].)

Removing _standard_ storage from new image uploads means we’re creating half the AMIs we created before and it reduces the number of images you need to review when launching an instance. Finding the right Fedora Linux image for your deployment should be a little easier.

### What if I really like the other storage types?

When you launch your instance, you can choose any storage type that is compatible with your instance in your preferred region. Although Fedora Linux images will have _gp3_ set as the default, you can choose from any other storage type at launch time.

### How should I adjust my scripts that look for Fedora Linux images on AWS?

The format of the image names remains the same, but you’ll notice a new string in the storage type portion of the image name. As an example, here’s what you would see before the change was made:

```

    Fedora-Cloud-Base-Rawhide-20230503.n.0.aarch64-hvm-us-east-1-standard-0
    Fedora-Cloud-Base-Rawhide-20230503.n.0.aarch64-hvm-us-east-1-gp2-0
    Fedora-Cloud-Base-Rawhide-20230503.n.0.x86_64-hvm-us-east-1-standard-0
    Fedora-Cloud-Base-Rawhide-20230503.n.0.x86_64-hvm-us-east-1-gp2-0

```

After the change, there is only one image per release and architecture:

```

    Fedora-Cloud-Base-Rawhide-20230504.n.0.aarch64-hvm-us-east-1-gp3-0
    Fedora-Cloud-Base-Rawhide-20230504.n.0.x86_64-hvm-us-east-1-gp3-0

```

### Why was this change made?

The Fedora Cloud SIG wants to make the Fedora Linux cloud experience the best it can possibly be on every public cloud platform. This change gives Fedora Linux a better performing default storage option at a lower cost, reduces the overhead from creating AMIs on AWS, and simplifies the Fedora Linux image listings.

Read the Fedora change proposals for [removing standard storage][5] and [switching the default to gp3][6] for a lot more detail. As always, you can find members of the Fedora Cloud SIG and join our group on [Fedora Matrix][7] or on Libera IRC in #fedora-cloud.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/new-aws-storage-type-for-fedora-linux/

作者：[Major Hayden][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mhayden/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/05/clouds-816x345.jpg
[2]: https://unsplash.com/@frostroomhead?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/images/nature/cloud?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://www.lastweekinaws.com/blog/the-best-release-of-reinvent-2020/
[5]: https://fedoraproject.org/wiki/Changes/CloudEC2ImagesNoStandardStorage
[6]: https://fedoraproject.org/wiki/Changes/CloudEC2gp3
[7]: https://chat.fedoraproject.org/#/room/#cloud:fedoraproject.org
