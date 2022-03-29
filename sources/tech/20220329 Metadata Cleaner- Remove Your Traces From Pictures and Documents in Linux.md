[#]: subject: "Metadata Cleaner: Remove Your Traces From Pictures and Documents in Linux"
[#]: via: "https://itsfoss.com/metadata-cleaner/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Metadata Cleaner: Remove Your Traces From Pictures and Documents in Linux
======

**Brief:** _Getting rid of the metadata is essential for enhanced privacy. Metadata Cleaner is an open-source application for Linux that helps you do that. Let’s explore more here._

Metadata exists everywhere, whether it is a document, a message, pictures, or other file types.

You can easily access the metadata when you inspect the properties of a file.

However, users do not often focus on eliminating or getting rid of the metadata before sharing files. Mainly because they may not be aware of simple tools that make the task easier.

Metadata Cleaner is one such tool available for Linux users.

### Metadata Cleaner: Get Rid of Your Metadata Easily

![][1]

Metadata Cleaner helps you remove traces of your information associated with the metadata. It utilizes [mat2][2] to remove the metadata.

In other words, you can assume the GUI as the front-end to mat2.

For instance, a picture includes information on the location it was taken, the camera used, lens information, and more.

While it could be helpful information for some, you need to remove the metadata if you want to keep all the details private.

The same goes for documents as well. Removing metadata ensures improved privacy, whether for your business or personal use.

You have to add the target files and process them using the Metadata Cleaner to get them cleaned.

**Note**: _You must keep a backup of your files before cleaning. Getting_ rid of your metadata may result in drastic changes to your file, _like being unable to select the text in a PDF file, compressing the image, etc._

### Features of Metadata Cleaner

![][3]

Metadata Cleaner is a simple tool with some useful functionalities. Let me mention the key highlights for it below:

  * Ability to add multiple files to clean.
  * Check the metadata information for each file added.
  * View the count of metadata information associated with each file added.
  * One-click cleaning with maximum possible metadata removal.
  * A lightweight cleaning mode is available not to affect the file significantly.
  * Keyboard shortcuts supported.
  * A new window can be created from within.
  * You can add an entire folder to process multiple files.



I started with generic screenshots, a few photos, and documents downloaded off the internet to test things out.

![][4]

As you can notice in the screenshot above, the PDF file contains much information about its origin.

This is just an example; similarly, if you want to share a PDF file with someone or the public and do not want others to see the information about its origin, you can clean your traces using Metadata Cleaner.

As mentioned earlier, if the files are important to you, ensure proper backup if the cleaning process affects the files in a way you didn’t want.

![][5]

You can also use its lightweight cleaning mode for minimal metadata removal without affecting the file.

For instance, I used the standard cleaning method with a sample PDF, and here’s what it looks like:

![][6]

Similarly, you will have most of the essential data removed when processing documents and pictures.

### Install Metadata Cleaner in Linux

Metadata Cleaner is available as a [Flatpak package][7]. So, you can install it on any Linux distribution considering you [set up Flatpak][8] or if you already have it enabled.

You can install it using the following command in the terminal (if you do not have software center integration):

```

    flatpak install flathub fr.romainvigier.MetadataCleaner

```

You can head to its [website][9] or the [GitLab page][10] to explore more about it.

[Metadata Cleaner][9]

_Have you tried removing traces of your metadata before? What do you think of this tool? Let me know your thoughts in the comments below._

--------------------------------------------------------------------------------

via: https://itsfoss.com/metadata-cleaner/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/metadatacleaner.jpg?resize=800%2C561&ssl=1
[2]: https://0xacab.org/jvoisin/mat2
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/metadatacleaner-3.png?resize=800%2C592&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/metadatacleaner-1.png?resize=800%2C592&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/metadatacleaner-lightweight-mode.png?resize=800%2C199&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/metadatacleaner-example.png?resize=800%2C326&ssl=1
[7]: https://itsfoss.com/what-is-flatpak/
[8]: https://itsfoss.com/flatpak-guide/
[9]: https://metadatacleaner.romainvigier.fr/
[10]: https://gitlab.com/rmnvgr/metadata-cleaner/
