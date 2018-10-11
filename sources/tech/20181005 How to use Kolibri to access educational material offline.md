How to use Kolibri to access educational material offline
======
Kolibri makes digital educational materials available to students without internet access.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/EDU_OSDC_BYU_520x292_FINAL.png?itok=NVY7vR8o)

While the internet has thoroughly transformed the availability of educational content for much of the world, many people still live in places where online access is poor or even nonexistent. [Kolibri][1] is a great solution for these communities. It's an app that creates an offline server to deliver high-quality educational resources to learners. You can set up Kolibri on a wide range of [hardware][2], including low-cost Windows, MacOS, and Linux (including Raspberry Pi) computers. A version for Android tablets is in the works.

Because it's open source, free to use, works without broadband access (after initial setup), and includes a wide range of educational content, it gives students in rural schools, refugee camps, orphanages, informal schools, prisons, and other places without reliable internet service access to many of the same resources used by students all over the world.

In addition to being simple to install, it's easy to customize Kolibri for various educational missions and needs, including literacy building, general reference materials, and life skills training. Kolibri includes content from sources including [OpenStax,][3] [CK-12][4], [Khan Academy][5], and [EngageNY][6]; once these packages are "seeded" by connecting the Kolibri serving device to a robust internet connection, they are immediately available for offline access on client devices through a compatible browser.

### Installation and setup

I installed Kolibri on an Intel i3-based laptop running Fedora 28. I chose the **pip install** method, which is very easy. Here's how to do it.

Open a terminal and enter:

```
$ sudo pip install kolibri

```

Start Kolibri by entering **$** **kolibri** **start** in the terminal.

Find your Kolibri installation's URL in the terminal.

![](https://opensource.com/sites/default/files/uploads/kolibri_url.png)

Open your browser and point it to that URL, being sure to append port **8080**.

Select the default language—options include English, Spanish, French, Arabic, Portuguese, Hindi, Farsi, Burmese, and Bengali. (I chose English.)

Name your facility, i.e., your classroom, library, or home. (I named mine Test.)

![](https://opensource.com/sites/default/files/uploads/kolibri_name.png)

Tell Kolibri what type of facility you're setting up—self-managed, admin-managed, or informal. (I chose self-managed.)

![](https://opensource.com/sites/default/files/uploads/kolibri_facility-type.png)

Create an admin account.

![](https://opensource.com/sites/default/files/uploads/kolibri_admin.png)

### Add content

You can add Kolibri-curated content channels while you are connected to broadband service. Explore and add content from the menu at the top-left of the browser.

![](https://opensource.com/sites/default/files/uploads/kolibri_menu.png)

Choose Device and Import.

![](https://opensource.com/sites/default/files/uploads/kolibri_import.png)

Selecting English as the default language provides access to 29 content channels including Touchable Earth, Global Digital Library, Khan Academy, OpenStax, CK-12, EngageNY, Blockly games, and more.

Select a channel you're interested in. You have the option to download the entire channel (which might take a long time) or to select the specific content you want to download.

![](https://opensource.com/sites/default/files/uploads/kolibri_select-content.png)

To access your content, return to the top-left menu and select Learn.

![](https://opensource.com/sites/default/files/uploads/kolibri_content.png)

### Add users

User accounts can be set up as learners, coaches, or admins. Users can access the Kolibri server from most web browsers on any Linux, MacOS, Windows, Android, or iOS device on the same network, even if the network isn't connected to the internet. Admins can set up classes on the device, assign coaches and learners to classes, and see every user's interaction and how much time they spend with the content.

If your Kolibri server is set up as self-managed, users can create their own accounts by entering the Kolibri URL in their browser and following the prompts. For information on setting up users on an admin-managed server, check out Kolibri's [documentation][7].

![](https://opensource.com/sites/default/files/uploads/kolibri_user-account.png)

After logging in, the user can access content right away to begin learning.

### Learn more

Kolibri is a very powerful learning resource, especially for people who don't have a robust connection to the internet. Its [documentation][8] is very complete, and a [demo][9] site maintained by the project allows you to try it out.

Kolibri is open source under the [MIT License][10]. The project, which is managed by the nonprofit organization Learning Equality, is looking for developers—if you would like to get involved, be sure to check out them on [GitHub][11]. To learn more, follow Learning Equality and Kolibri on its [blog][12], [Twitter][13], and [Facebook][14] pages.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/getting-started-kolibri

作者：[Don Watkins][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[1]: https://learningequality.org/kolibri/
[2]: https://drive.google.com/file/d/0B9ZzDms8cSNgVWRKdUlPc2lkTkk/view
[3]: https://openstax.org/
[4]: https://www.ck12.org/
[5]: https://www.khanacademy.org/
[6]: https://www.engageny.org/
[7]: https://kolibri.readthedocs.io/en/latest/manage.html#create-a-new-user-account
[8]: https://learningequality.org/documentation/
[9]: http://kolibridemo.learningequality.org/learn/#/topics
[10]: https://github.com/learningequality/kolibri/blob/develop/LICENSE
[11]: https://github.com/learningequality/
[12]: https://blog.learningequality.org/
[13]: https://twitter.com/LearnEQ/
[14]: https://www.facebook.com/learningequality
