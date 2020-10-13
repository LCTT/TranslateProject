[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to set up and run WordPress for your classroom)
[#]: via: (https://opensource.com/article/20/4/wordpress-virtual-machine)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

How to set up and run WordPress for your classroom
======
Follow these simple steps to customize WordPress for use in the
classroom using free open source software.
![Painting art on a computer screen][1]

There are many good reasons to set up WordPress for your classroom. As more schools switch to online classes, WordPress can become the go-to content management system. Teachers using WordPress can provide a number of different educational choices to differentiate instruction for their students. Blogging is an accessible way to create content that energizes student learning. Teachers can write short stories, poems, and provide picture galleries that function as story starters. Students can comment and those comments can be moderated by their teacher.

There are free options like [WordPress.com][2] and [Edublogs][3]. However, these free versions are limited, and you may want to explore all your options. You can install [Virtualbox][4] on any Windows, macOS, or Linux computer. You can use your own computer or an extra you happen to have access to in a virtual environment.

On Linux, you can install Virtualbox from your package manager. For instance, on Debian, Elementary OS, or Ubuntu:


```
`$ sudo apt install virtualbox`
```

On Fedora:


```
`$ sudo dnf install virtualbox`
```

### Download a Wordpress image

Wordpress is easy to install, but server configuration and management can be difficult for the uninitiated. That's why there's [Turnkey Linux][5], a project dedicated to creating virtual machine images and containers of popular server software, preconfigured and ready to run. With Turnkey Linux, you just download a disk image containing the operating system and the software you want to run, and then import that image into Virtualbox.

To get started with Wordpress, download the **VM** virtual machine image from [turnkeylinux.org/wordpress][6] (in the **Builds** section). Make sure you download the image labeled **VM**, because that's the only format meant for Virtualbox.

### Import the image into Virtualbox

After installing Virtualbox, launch the application and import the virtual machine image into Virtualbox.

![][7]

Networking on the imported image is set to NAT by default. You will want to change the network settings to "bridged."

![Virtualbox menu][8]

After restarting the virtual machine, you are prompted to add passwords for MySQL, Adminer, and the WordPress **admin** user.

Then you see the network configuration console for the installation. Launch a web browser and navigate to the **web** address provided (in this example, it's 192.168.86.149).

![Console][9]

In a web browser, you see a login screen for your Wordpress installation. Click on the **Login** link.

![Wordpress welcome][10]

Enter **admin** as the username, followed by the password you created earlier. Click the **Login** link. On this first login as **admin**, you can choose a new password. Be sure to remember it!

![Login screen][11]

After logging in, you're presented with the WordPress Dashboard. The software will likely notify you, in the upper left corner of the window, that a new version of Wordpress exists. Update to the latest versions as prompted so your site is secure.

It's important to note that your Wordpress blog isn't visible by anyone on the Internet yet. It only exists in your local network: only people in your building who are connected to the same router or wifi access point as you can see your Wordpress site right now. The worldwide Internet can't get to it because you're behind a firewall (embedded in your router, and possible also in your computer).

![Wordpress dashboard][12]

Following the upgrade, the application restarts, and you're ready to begin configuring WordPress to your liking.

![Wordpress configuration][13]

On the far left, there is a button to **Customize Your Site**.

There, you can choose the name of your site. You can accept the default theme, which is "Twenty Nineteen," or choose another. My favorite is "Twenty Ten," but browse through the themes available to find your personal favorite. WordPress comes with five free themes installed. You can download other free themes from the [WordPress][14][.org][15] site or choose to purchase a premium theme.

When you click the **Customize Your Site** button, you're presented with new menu options. Select **Site Identity** and change the name of your site. You might use the name of your school or classroom. There's also room to choose a byline (the credit given to the author of a blog post). You can choose the colors for your site and where you will place menus and widgets. WordPress widgets and content and features to the sidebars for your site. Homepage settings are important, as they allow you to choose between a static page that might have a description of your school or classroom or having your blog entries displayed prominently. You can add additional CSS.

![Turnkey theme][16]

You can edit your front page, add additional pages like "About," or add a blog post. You can also manage widgets, manage menus, turn comments on or off, or add a link to learn more about WordPress.

Customizing your site allows you to configure a number of options quickly and easily.

WordPress has dozens of widgets that you can place in different areas of your page. Widgets are independent sections of content that can be placed into specific areas provided by your theme. These areas are called sidebars.

### Adding content

After you have WordPress configured to your liking, you probably want to get busy creating content. The best way to do that is to head back to the WordPress Dashboard.

On the left side, near the top of the page, you see **Posts**. Select that link and a dropdown appears. Choose **Add New** to create your very first blog post.

![Add post dropdown][17]

Fill in your title in the top block and then move down to the body. It's like using a word processor. WordPress has all the tools you need to write. You can set the font size from _small_ to _huge_. You can start a paragraph with dropped capitals. The text and background color can be changed. Your posts can include quote blocks and embedded content. A wide variety of embedded content is supported so you can make your posts a dynamic multimedia experience.

![Wordpress classroom blog][18]

### Going online

So far, your Wordpress blog only exists on your local network. Anyone using the same router as you (your housemates or classroom) can see your Wordpress site by navigating to 192.168.86.149, but once you're away from that router, the site becomes inaccessible.

If you want to go online with your custom Wordpress site, you have to allow traffic through your router, and then direct that traffic to the computer running Virtualbox. If you've installed Virtualbox on a laptop, then your website would disappear any time you closed your laptop, which is why servers that never get shutdown exist. But if this is just a fun lesson on how to run a Wordpress site, then having a website that's only available during class hours is fine.

If you have access to your router, then you can log into it and make the adjustments yourself. If you don't own or control your router, then you must talk to your systems administrator for access.

A _router_ is the box you got from your internet service provider. You might also call it your _modem_.

Every device is different, so there's no way for me to definitively tell you what you need to click on to adjust your settings. Generally, you access your home router through a web browser. Your router's address is often printed on the bottom of the router and begins with either 192.168 or 10.

Navigate to the router address and log in with the credentials you were provided when you got your internet service. It's often as simple as `admin` with a numeric password (sometimes this password is printed on the router, too). If you don't know the login, call your internet provider and ask for details.

Different routers use different terms for the same thing; keywords to look for are **Port forwarding**, **Virtual server**, and **Firewall**. Whatever your router calls it, you want to accept traffic coming to port 80 of your router and forward that traffic to the same port of your virtual machines's IP address (in this example, that is 192.168.86.149, but it could be different for you).

![Example router setting screen][19]

Now you're allowing traffic through the web port of your router's firewall. To view your Wordpress site over the Internet, get your worldwide IP address. You can get your global IP by going to the site [icanhazip.com][20]. Then go to a different computer, open a browser, and navigate to that IP address. As long as Virtualbox is running, you'll see your Wordpress site on the Internet. You can do this from anywhere in the world, because your site is on the Internet now.

Most websites use a domain name so you don't have to remember global IP addresses. You can purchase a domain name from services like [webhosting.coop][21] or [gandi.net][22], or a temporary one from [freenom.com][23]. Mapping that to your Wordpress site, however, is out of scope for this article.

### Wordpress for everyone

[WordPress][24] is open source and is licensed under the [GNU Public License][25]. You are welcome to contribute to WordPress as either a [developer][26] or enthusiast. WordPress is committed to being inclusive and accessible as possible.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/wordpress-virtual-machine

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/painting_computer_screen_art_design_creative.png?itok=LVAeQx3_ (Painting art on a computer screen)
[2]: https://wordpress.com/
[3]: https://edublogs.org/
[4]: https://www.virtualbox.org/
[5]: https://www.turnkeylinux.org
[6]: https://www.turnkeylinux.org/wordpress
[7]: https://opensource.com/sites/default/files/uploads/how_to_get_started_with_wp_in_the_classroom_1.png
[8]: https://opensource.com/sites/default/files/uploads/how_to_get_started_with_wp_in_the_classroom_2.png (Virtualbox menu)
[9]: https://opensource.com/sites/default/files/uploads/how_to_get_started_with_wp_in_the_classroom_3.png (Console)
[10]: https://opensource.com/sites/default/files/uploads/how_to_get_started_with_wp_in_the_classroom_4.png (Wordpress welcome)
[11]: https://opensource.com/sites/default/files/uploads/how_to_get_started_with_wp_in_the_classroom_5.png (Login screen)
[12]: https://opensource.com/sites/default/files/uploads/how_to_get_started_with_wp_in_the_classroom_6.png (Wordpress dashboard)
[13]: https://opensource.com/sites/default/files/uploads/how_to_get_started_with_wp_in_the_classroom_7.png (Wordpress configuration)
[14]: http://Wordpress.org
[15]: http://WordPress.org
[16]: https://opensource.com/sites/default/files/uploads/how_to_get_started_with_wp_in_the_classroom_8.png (Turnkey theme)
[17]: https://opensource.com/sites/default/files/uploads/how_to_get_started_with_wp_in_the_classroom_12.png (Add post dropdown)
[18]: https://opensource.com/sites/default/files/uploads/how_to_get_started_with_wp_in_the_classroom_13.png (Wordpress classroom blog)
[19]: https://opensource.com/sites/default/files/router-web.jpg (Example router setting screen)
[20]: http://icanhazip.com/
[21]: https://webhosting.coop/domain-names
[22]: https://www.gandi.net
[23]: http://freenom.com/
[24]: https://wordpress.org/
[25]: https://github.com/WordPress/WordPress/blob/master/license.txt
[26]: https://wordpress.org/five-for-the-future/
