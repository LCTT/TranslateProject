[#]: subject: (Access cloud files on Windows with ownCloud)
[#]: via: (https://opensource.com/article/21/7/owncloud-windows-files)
[#]: author: (Martin Loschwitz https://opensource.com/users/martinloschwitzorg)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Access cloud files on Windows with ownCloud
======
ownCloud VFS leverages Microsoft's cloud files API to make opening,
modifying, and saving online files seamless.
![Scissors cutting open access to files][1]

Most computer users nowadays rely on online file storage. Thanks to the rise of cloud computing, the idea of storing files remotely and downloading them when needed has gained a lot of fresh air in recent years. Yet, the principle's technical roots are anything but new, with implementations reaching back decades. While the protocols used and features expected for accessing data on online storage have changed massively, the basic idea hasn't altered much since the days of FTP and similar protocols.

There's an easy explanation for why online (or "cloud") storage has so many fans. Cloud storage usually resides on highly redundant infrastructure, often distributed across physical sites. Ordinary people would have a tough time setting up anything similar with the tools generally available to them. Cloud storage also allows users to extend their storage space easily without having to fiddle with their device hardware. It also enables people to share files with relatives, friends, or colleagues in just a few simple steps.

Smartphones are an excellent example of cloud storage's advantages; clients including Dropbox, Google Drive, and iCloud are deeply integrated into mobile operating systems and can be used in apps just like local storage.

Classical desktop and laptop computers don't integrate online storage as well as smartphones do. Rather, accessing iCloud, ownCloud, or other storage solutions from a computer is a tedious task for several reasons.

### A matter of protocol

Many of the reasons boil down to the protocol. The methods and protocols for accessing online storage have changed often, and no single protocol has established itself as a de-facto standard. Online storage services such as Dropbox, S3, and iCloud use proprietary protocols (partially based on open protocols such as WebDAV), which cannot be implemented easily on desktop operating systems. As a result, desktop users often face tedious user interfaces (UIs), reduced comfort, and poor user experience (UX) with online file storage.

It helps to look a bit deeper to understand the problem and come up with possible solutions. To start, all modern operating systems—notably Windows, macOS, and Linux (along with its numerous derivatives)—assume they are exclusively in charge of a user's files. This comes from the old-fashioned assumption that a user's files will be hosted on a single device. If all a user's files are stored on the same device, it is easy to put them in a tree-like structure (as desktop operating systems have been doing for ages) and present a unique view to the user.

With cloud-based storage, things are not so easy. Because these files are not available locally, a computer's operating system cannot manage or display them the same way it displays local files. To edit an Excel sheet stored in the cloud, you must download the file from the cloud, store it locally, modify it, and upload it again. Not only does this break your UI and UX; it also creates chaos.

Some online storage providers try to work around the issue with clients that synchronize contents between the cloud and the local machine. This is an ugly workaround. For instance, you might not want the dozens of gigabytes of data stored in your cloud to also reside on your small local device. To mitigate this challenge, some tools allow you to select a subset of data to synchronize between the client and the online service; this shifts the problem to the side a bit but certainly does not solve it.

### How WebDAV failed the industry

Many IT professionals are likely shaking their heads fiercely, knowing there's a protocol for these types of tasks that could be used. And they are not completely wrong. [WebDAV][2] was specified as early as June 2007 by the IETF to extend the HTTP protocol for Web Distributed Authoring and Versioning (WebDAV for short). WebDAV's sole purpose was to provide an interface that allows files in a remote location, such as online cloud storage, to be accessed and edited the same way local files can be. WebDAV has gained traction since then: Private cloud solutions such as ownCloud and NextCloud support and can be accessed through it.

Yet to call WebDAV a ringing success would be unrealistic, as neither the server nor the client side has achieved widespread use. Matters are especially bad on the server side: many online storage services, including Dropbox, Google Drive, and Microsoft OneDrive, do not support the WebDAV extension to HTTP. Some put proxy services in place. Dropbox, for instance, can be used with DAVbox to achieve WebDAV access. Other services provide tools to mitigate the lack of a working WebDAV server. Generally speaking, though, WebDAV support is not widespread throughout the industry, and that will probably not change anytime soon.

### Poor operating system support for WebDAV

This leads right into the second aspect of WebDAV's disastrous history: the client side. At this time, only one operating system has somewhat complete client support throughout the relevant tools of its userland, and that is Linux. Standard desktop environments such as KDE, GNOME, and Xfce can connect to WebDAV drives from the desktop. They also integrate WebDAV drives as if they were normal local disks, effectively allowing users to move data back and forth between the remote site and the local machine. Last but not least, they can download files from WebDAV devices on demand instead of keeping files continuously in sync between a remote site and the local drive. In Linux, life with WebDAV is mostly good—mostly because WebDAV doesn't feature inherent caching.

Matters change a bit when looking at macOS. Apple equipped macOS with a WebDAV client a while ago, and it mostly works fine. However, it is tedious for less experienced users to set up. And macOS's WebDAV client tends to misbehave when the connection between the client and the server is brittle—like it would be for users in Germany behind LTE connectivity. In such setups, users have to clean up their WebDAV directories regularly to be able to use them.

The most widespread operating system, Windows, also offers the most dramatic failure in terms of WebDAV integration. To even set up a WebDAV-based storage drive, you would have to edit the Windows Registry—a task that easily exceeds the average computer user's knowledge. If that were not bad enough, even after modifying the Registry, the Windows client for the WebDAV protocol looks more like a stub than a usable feature. You will soon experience problems like those found with the macOS WebDAV implementation, and the experience of using the protocol will be terrible.

### ownCloud's VFS alternative

[ownCloud][3] is a private cloud solution that allows users to store, sync, and share data on their own terms, including on a Raspberry Pi, a private cloud, or in a hybrid setup. ownCloud offers a client for the world's most common operating system. But for many years, it relied upon workarounds, like requiring users to explicitly choose which files to synchronize.

ownCloud has come up with a solution to the problem—and it's a rather sophisticated one. Windows offers an interface to connect to cloud-based online storage, and ownCloud leverages that interface with its [virtual file system][4] (VFS). 

### How VFS works

ownCloud's VFS functionality for Windows heavily relies on a Microsoft feature named [cloud files API][5]. It was officially introduced in Windows 10, version 1809 in 2017. Microsoft designed it for file synchronization with OneDrive, but other services are free to use the API, which is now part of the Windows 10 core. The cloud files API is kind of a demarcation line for synchronizing data from the cloud to a local machine and vice versa. It's split into two parts:

  * The **API** provides functions on the API level to perform tasks such as opening, saving, and uploading files to the remote host after the user commits changes. The cloud files API handles a lot of things invisible to the user; for instance, a client using the API will display all remote files as "present" in the local view without downloading them. The cloud files API will download a file only after the user explicitly requests to open it from the remote drive.
  * The **Windows.Storage.Provider** namespace allows applications in the userland to configure a client to access a remote service through the cloud files API.



### What the user sees

The revolutionary way that cloud files API deals with files in remote storage under Windows becomes clear when you see ownCloud VFS in action.

First, set up a connection to your ownCloud drives from within the ownCloud Client for Windows. Make sure _virtual file support_ is enabled; this makes the directories in your ownCloud drive immediately visible and selectable in Windows tools, such as the Explorer. You won't be able to tell them apart from the files on your local storage devices, and when you open a file stored in ownCloud, it will appear like it is locally present. For files not synchronized to the local host, the cloud files API generates a placeholder that is replaced with the actual file when you open it. This allows a seamless user experience while preserving bandwidth on the client's and the server's internet links.

Setting up a VFS drive in Windows does not require administrator privileges, as editing the Windows Registry for WebDAV connectivity requires. This means ownCloud VFS might be usable on devices such as business laptops, where the administrator account is usually not available to the user. Compliance policies may still forbid using ownCloud if the instance is not run by the company under its compliance regime, however.

### Major differences from WebDAV

Not only does VFS work considerably better on Windows 10 operating systems, it also offers a few features not available in protocols like WebDAV. One of these is implicit caching. During normal operations, VFS will synchronize files when they are opened until a locally defined cache is full; if the user requests additional files, VFS will remove the oldest files from the cache.

Furthermore, VFS allows you to specify "favorite" files that will always be synchronized automatically from the remote drive whether or not you are trying to access them. This shortens the initial time to access frequently used files, especially if the files are large.

### Storage Sense makes sense

Another helpful feature in the Windows cloud files API is the "Storage Sense" feature added in Windows 1809. While primarily aimed at OneDrive users, Storage Sense can be used in the background with an ownCloud online storage drive due to its cloud files API support. Storage Sense regularly scans the Windows C: drive for files that have not been used for a long time. It synchronizes these files to the remote cloud storage and deletes them from the local device, freeing up space for data used more often.

The user can determine Storage Sense's intervals and when Windows will trigger scans. The latter factor is not very important anymore because searching an SSD or NVMe device is very fast compared to the old days of searching spinning disk drives. Storage Sense aims to increase available disk space on systems, and ownCloud drives can be targets for offloading unused files.

### VFS on other operating systems

By creating a virtual file system based on the cloud files API, ownCloud improves the experience of using ownCloud online storage as a web drive in Microsoft Windows 10. ownCloud is one of the few free, libre, and open source software projects using this API at all—even other vendors' commercial support for it is rather weak. Apple's iCloud client for Windows uses the cloud files API, but the list is short.

How does ownCloud use VFS on other operating systems? It's not as easy as porting the Windows functionality to other operating systems because the cloud files API is not present on non-Windows machines.

ownCloud still implements comparable functionality—sort of. The macOS and Linux ownCloud clients behave as though the cloud files API were available even on non-Windows systems. Certain Windows functions have been replaced in the background with stubs for the corresponding system. There are a few notable differences between the Windows client and the view in Linux or macOS. For instance, Windows shows the correct file size even for remote files represented locally by a placeholder. On Linux and macOS, all files are displayed with a size of 1 byte and a local extension of .owncloud. This makes it clear that the files do not exist locally—at least until the user asks to open them and ownCloud initiates the download.

It's true, though, that the VFS experience on macOS and Linux is not quite as smooth as it is on Windows 10.

### Summary

ownCloud's VFS dramatically improves the integration of ownCloud cloud storage drives into Windows 10. In contrast to WebDAV and related protocols, the cloud files API is a native API in Windows, integrated seamlessly with the operating system. This eliminates the ugly hacking required to enable WebDAV access in Windows 10, let alone the contortions needed to use it effectively. Older Windows clients do not benefit from the API, and its advantages might create an incentive to update old Windows versions in environments where ownCloud is heavily used.

macOS and Linux users do not benefit as much from ownCloud's VFS support. On Linux, hobby projects like [elokab-files-manager][6] provide better support for ownCloud VFS. But this is certainly not something you would want to bet on as your daily driver. The situation on macOS is even worse: While Apple has long promised to add similar API functionality to macOS, only Big Sur seems to have the required feature set. As of this writing, ownCloud's developers have not yet adapted the ownCloud client for macOS to the new features in Big Sur. Consequently, Linux and macOS users can use VFS on their platforms with minor limitations. Windows 10 users, however, get the biggest bang for their buck.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/owncloud-windows-files

作者：[Martin Loschwitz][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/martinloschwitzorg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/document_free_access_cut_security.png?itok=ocvCv8G2 (Scissors cutting open access to files)
[2]: https://en.wikipedia.org/wiki/WebDAV
[3]: https://owncloud.com/
[4]: https://owncloud.com/features/virtual-files/
[5]: https://docs.microsoft.com/en-us/windows/win32/cfapi/build-a-cloud-file-sync-engine
[6]: https://github.com/dragotin/elokab-files-manager
