Translating by H-mudcup
Picty: Managing Photos Made Easy
================================================================================
![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/03/picty_002-790x429.png)

### About Picty ###

**Picty** is a free, simple, yet powerful photo collection manager that will help you to manage your photos. It is designed around managing **metadata** and a **lossless** approach to image handling. Picty currently supports both online(web-based) and offline(local) collections. In local collections, the images will be stored in a local folder and it’s sub-folders. A database will be maintained to speed up the image queries in the user’s home folder. In online(web-based) collections, you can upload and share images through a web browser. Ant user with proper rights can share photos to any persons, and each user can have multiple collections open at once and collections can be shared by multiple users. There is a simple interface for transferring images between collections using a transfer plugin.

You can download any number of photos from your Camera or any devices. Also, Picty allows you to browse photo collections from your Camera before downloading it. Picty is lightweight application, and has snappy interface. It supports Linux, and Windows platforms.

### Features ###

- Supports big photo collections (20,000 plus images).
- Open more than one collection at a time and transfer images between them.
- Collections are:
    - Folders of images in your local file system.
    - Images on cameras, phones and other media devices.
    - Photo hosting services (Flickr currently supported).
- picty does not “Import” photos into its own database, it simply provides an interface for accessing them wherever they are. To keep things snappy and to allow you to browse even if you are offline, picty maintains a cache of thumbnails and metadata.
- Reads and writes metadata in industry standard formats Exif, IPTC and Xmp
- Lossless approach:
    - picty writes all changes including image edits as metadata. e.g. an image crop is stored as any instruction, the original pixels remain in the file
    - Changes are stored in picty’s collection cache until you save your metadata changes to the images. You can easily revert unsaved changes that you don’t like.
- Basic image editing:
    - Current support for basic image enhancements such as brightness, contrast, color, cropping, and straightening.
    - Improvements to those tools and other tools coming soon (red eye reduction, levels, curves, noise reduction)
- Image tagging:
    - Use standard IPTC and Xmp keywords for image tags
    - A tag tree view lets you easily manage your tags and navigate your collection
- Folder view:
    - Navigate the directory heirarchy of your image collection
- Multi-monitor support
    - picty can be configured to let you browse your collection on one screen and view full screen images on another.
- Customizable
    - Create launchers for external tools
    - Supports plugins – many of the current features (tagging and folder views, and all of the image editing tools) are provided by plugins
    - Written in python – batteries included!

### Installation ###

#### 1. Install from PPA ####

Picty developers has a PPA for Debian based distributions, like Ubuntu, to make the installation much easier.

To install in Ubuntu and derivatives, run:

    sudo add-apt-repository ppa:damien-moore/ppa
    sudo apt-get update
    sudo apt-get install picty

#### 2. Install from Source ####

Also, you can install it from Source files. First, install the following dependencies.

    sudo apt-get install bzr python-pyinotify python-pyexiv2 python-gtk2 python-gnome2 dcraw python-osmgpsmap python-flickrapi

Then, get the latest version using command:

    bzr branch lp:picty

To run picty, change to the picty directory, and enter:

    cd picty
    bin/picty

To update to the latest version, run:

    cd picty
    bzr pull

### Usage ###

Launch Picty either from Menu or Unity Dash.

![picty_001](http://www.unixmen.com/wp-content/uploads/2015/03/picty_001.png)

You can either choose existing collection, device or directory. Let us create a **new collection**. To do that, create New Collection button. Enter the collection, and browse to the path where you have the images stored. Finally, click **Create** button.

![Create a Collection_001](http://www.unixmen.com/wp-content/uploads/2015/03/Create-a-Collection_001.png)

![picty_002](http://www.unixmen.com/wp-content/uploads/2015/03/picty_002.png)

You can modify, rotate, add/remove tags, set descriptive info of each images. To do that, just right click any image and do the actions of your choice.

Visit the following Google group to get more information and support about Picty Photo manager.

- [http://groups.google.com/group/pictyphotomanager][1]

Cheers!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/picty-managing-photos-made-easy/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:http://groups.google.com/group/pictyphotomanager
