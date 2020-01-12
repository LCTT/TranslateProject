[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Sync files across multiple devices with Syncthing)
[#]: via: (https://opensource.com/article/20/1/sync-files-syncthing)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

Sync files across multiple devices with Syncthing
======
Learn how to sync files between devices with Syncthing in the first
article in our series on 20 ways to be more productive with open source
in 2020.
![Files in a folder][1]

Last year, I brought you 19 days of new (to you) productivity tools for 2019. This year, I'm taking a different approach: building an environment that will allow you to be more productive in the new year, using tools you may or may not already be using.

### Syncing files with Synthing

Setting up a new machine is a pain. We all have our "standard setups" that we copy from machine to machine. And over the years, I've used a lot of ways to keep them in sync between machines. In the old days (and this will tell you how old I am), it was with floppy disks, then Zip disks, USB sticks, SCP, Rsync, Dropbox, ownCloud—you name it. And they never seemed to work right for me.

Then I stumbled upon [Syncthing][2].

![syncthing console][3]

Syncthing is a lightweight, peer-to-peer file-synchronization system. You don't need to pay for a service, you don't need a third-party server, and it's fast. Much faster, in my experience, than many of the "big names" in file synchronization.

Syncthing is available for Linux, MacOS, Windows, and several flavors of BSD. There is also an Android app (but nothing official for iOS yet). There are even handy graphical frontends for all of the above (although I'm not going to cover those here). On Linux, there are packages available for most distributions, so installation is very straightforward.

![Installing Syncthing on Ubuntu][4]

When you start Syncthing the first time, it launches a web browser to configure the daemon. There's not much to do on the first machine, but it is a good chance to poke around the user interface (UI) a little bit. The most important thing to see is System ID under the **Actions** menu in the top-right.

![Machine ID][5]

Once the first machine is set up, repeat the installation on the second machine. In the UI, there will be a button on the lower-right labeled **Add Remote Device**. Click the button, and you will be presented with a box to enter a **Device ID and a Name**. Copy and paste the **Device ID** from the first machine and click **Save**.

You should see a pop-up on the first node asking to add the second. Once you accept it, the new machine will show up on the lower-right of the first one. Share the default directory with the second machine. Click on **Default Folder** and then click the **Edit** button. There are four links at the top of the pop-up. Click on **Sharing** and then select the second machine. Click **Save** and look at the second machine. You should get a prompt to accept the shared directory. Once you accept that, it will start synchronizing files between the two machines.

![Sharing a directory in Syncthing][6]

Test it out by copying a file to the default directory (**/your/home/Share**) on one of the machines. It should show up on the other one very quickly.

You can add as many directories as you want or need to the sharing, which is pretty handy. As you can see in the first image, I have one for **myconfigs**—that's where I keep my configuration files. When I get a new machine, I just install Syncthing, and if I tune a configuration on one, I don't have to update all of them—it happens automatically.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/sync-files-syncthing

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_paper_folder.png?itok=eIJWac15 (Files in a folder)
[2]: https://syncthing.net/
[3]: https://opensource.com/sites/default/files/uploads/productivity_1-1.png (syncthing console)
[4]: https://opensource.com/sites/default/files/uploads/productivity_1-2.png (Installing Syncthing on Ubuntu)
[5]: https://opensource.com/sites/default/files/uploads/productivity_1-3.png (Machine ID)
[6]: https://opensource.com/sites/default/files/uploads/productivity_1-4.png (Sharing a directory in Syncthing)
