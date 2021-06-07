[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A stress-free guide to keeping WordPress sites updated)
[#]: via: (https://opensource.com/article/20/4/updating-wordpress)
[#]: author: (Sara Kelly https://opensource.com/users/sarapk)

A stress-free guide to keeping WordPress sites updated
======
This practical guide to a necessary task will show you how to maximize
site performance and avoid bugs and other issues with regular updates.
![Working from home at a laptop][1]

We all know how important it is to keep WordPress sites updated. New updates provide the latest bug and security fixes against any nasties lurking on the web. But, more critically, an outdated site can also lead to poor performance, such as slow loading speed or an outdated look and feel.

Unfortunately, keeping your WordPress site up-to-date is not as easy as clicking a button. There are several components to consider, from theme to plugins to PHP. Even worse, updating too quickly can wreak another kind of havoc. Have you ever experienced the dreaded, "There has been a critical error on your website" warning after an innocent little update? I know I have, many times!

Here is a practical guide on what to look out for, as well as when and what to update, to ensure your WordPress site works well.

### Updating WordPress

Let's start with the basics. Check your WordPress version is up-to-date by visiting Dashboard &gt; Updates.

![WordPress update screen][2]

### Choosing a WordPress theme

Before we deep dive into updating themes, I'd like to take a few steps back. Choose an up-to-date theme from the get-go and do your homework before installing it! There is nothing worse than pouring your heart and soul into customizing a new theme, only to discover it is buggy.

Questions to ask when choosing a theme include:

  * When was it first created?
  * What is the current version available?
  * Does the theme provider still maintain an active demo site and helpdesk?
  * What do recent reviews say about the theme?



If the theme provider is no longer maintaining the theme, save yourself the trouble and move on. Also, don't assume that just because you paid for a theme, that is necessarily maintained. I recently fell into this trap when I purchased [Pinable][3]. I loved the Pinterest look and feel. However, soon after installation, I noticed the lack of customization within the theme settings, major compatibility issues arose with my plugins, and the customer service was nonexistent. I should have known better. The theme was created in 2013 and selling for a bargain.

If you already have a theme, then pay attention to how frequently updates become available. If there are never any updates, the theme provider may have closed up shop. It is only a matter of time before the impact of an outdated theme will cause problems.

A quick aside while we are on the topic—up-to-date themes also give access to the two new alignment options in the WordPress block editor, which enable wide-width and full-width images. These help your blog posts look more professional. While there are a number of [tutorials][4] on the web that show you how to manually update your functions, PHP file, and CSS to enable the new alignment blocks, the code does not always work on older themes (especially masonry themes).

![Wordpress theme][5]

### Updating themes

To check the current version of your theme, go to Appearance &gt; Themes and click on the active theme to see the current version. If an upgrade is available, there will be an alert banner. Click on "update now" to initiate the update. You can also check for updates by going to Dashboard &gt; Updates.

![Themify screenshot][6]

If you purchased a theme from a marketplace such as [Envato][7] or [Themify][8], check the theme documentation to learn what is required to initiate updates, as it will not show up automatically in the dashboard. In most cases, you will be required to download and install a specific plugin or manually upload new versions when they become available. In the latter case, you will need to delete or rename the old theme file via your cPanel before you can install the new one. A guide to installing themes via cPanel is available [here][9].

If you plan to customize your theme extensively and are worried about the impact of this when upgrading, consider creating a child theme first. A child theme lets you make changes without touching the original theme's code. You can then update your site without losing any customizations you've made. Read more about child themes [here][10].

As I said before, the source of most issues tends to be the theme. Learn what is required to keep your theme up to date, and do so regularly. If your theme provider is no longer creating updates, then find a new theme.

### Easy does it for plugins

If you manage multiple plugins, then you will be used to the frequent dashboard reminders to update! Before we get onto that, though, let's touch on some basics.

As a general rule, you don't want to have too many plugins. They slow down the speed of your site by creating more code that the browser has to load. Always delete any inactive plugins. I prefer to manage plugins on the Plugins tab. Here you can see all active and inactive plugins, the current version, and whether an update is available. To update the plugin, simply click "update."

![Plugin update page][11]

Nonetheless, I implore you to wait a week or two before installing new updates. Updating my plugins too quickly has caused me no end of grievances. To begin with, updates are prone to human error. Don't be the guinea pig that tests out the latest version. Sometimes, the newest version of a plugin is not compatible with an older version of WordPress or your theme. Check these are up-to-date first.

### Website down after updating plugins?

If your site has stopped working or performance has dropped noticeably after updating your plugins, then all is not lost. Forget about those newfangled plugins that promise to test speed and identify buggy plugins (the last thing you want is more plugins)! Disable all your plugins, then activate one at a time while you test the speed and performance of your site on a website such as [Pingdom][12]. This is a great exercise to perform periodically, even if your website has not crashed. Once you identify the plugin causing the problem, delete it.

In the event you cannot access WordPress because there is a critical error, then you will need to access your files via cPanel and delete all the plugin folders from there ([full instructions here][13]). Don't worry; doing this will not impact your website's content. You can then proceed to reinstall and activate the plugins one-by-one via WordPress.

Cache plugins tend to be the biggest culprit in my experience. Issues with cache plugins can be minimized by clearing the cache frequently. Do not install multiple cache plugins that perform the same function, as they will only serve to slow down your site. The only way to truly get around cache plugin issues is to either not use them, use a plugin recommended by your hosting provider, or become an expert on cache. [This blog][14] on common cache issues in WordPress is a good place to start.

### Back up before updating PHP

If you are concerned about your website speed and have spent enough time browsing Google for answers, then you likely have seen the advice, "You gotta update your PHP!" Please tread carefully with manual PHP updates, though! If you have a good hosting provider, you should never need to do this. Rather, select the option for automatic PHP version management with your host. Newer versions of PHP may not be stable or compatible with the version of WordPress you are running. Let your hosting provider be the one to determine when updates are ready.

However, if you are adamant that an old version of PHP is causing your website to be slow, take care to follow these steps before initiating an update. First, back up your site. Investing in a premium version of [Jetpack][15] is worth its weight in gold. Jetpack can perform real-time as well as daily backups, depending on your plan. Not to mention, their customer service and troubleshooting support are excellent. Secondly, inform your hosting provider that you plan to update the PHP and seek their advice first. If your host is unable to advise or wants to charge you for the privilege, you should probably think about changing hosts.

You can update PHP either via cPanel or via your hosting platform under Devs &gt; PHP Manager. After that, you are on your own, as that is where my expertise on PHP ends.

If you have any other tips or pitfalls regarding updating WordPress, drop them in the comments box below.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/updating-wordpress

作者：[Sara Kelly][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sarapk
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wfh_work_home_laptop_work.png?itok=VFwToeMy (Working from home at a laptop)
[2]: https://opensource.com/sites/default/files/uploads/wp_update_1.png (Wordpress update screen)
[3]: https://www.theme-junkie.com/themes/pinable/
[4]: https://www.billerickson.net/full-and-wide-alignment-in-gutenberg/
[5]: https://opensource.com/sites/default/files/uploads/wp_theme_2.png (Wordpress theme)
[6]: https://opensource.com/sites/default/files/uploads/themify_3.png (Themify screenshot)
[7]: https://elements.envato.com/
[8]: https://themify.me/
[9]: https://hostadvice.com/how-to/how-to-install-a-wordpress-theme-using-cpanel/
[10]: https://developer.wordpress.org/themes/advanced-topics/child-themes/
[11]: https://opensource.com/sites/default/files/uploads/plugins_4.png (Plugin update page)
[12]: https://tools.pingdom.com/
[13]: https://www.wpbeginner.com/plugins/how-to-deactivate-all-plugins-when-not-able-to-access-wp-admin/
[14]: https://mhthemes.com/support/knb/solving-common-cache-issues-on-wordpress-websites/
[15]: https://jetpack.com/upgrade/backup/?utm_source=google&utm_campaign=google_jetpack_search_brand_desktop_sg_en&utm_medium=paid_search&utm_term=%2Bwordpress%20%2Bjetpack%20%2Bbackup&creative=379260213317&campaignid=2061290863&utm_content=77066462603&matchtype=b&device=c&network=g&gclid=Cj0KCQjwu6fzBRC6ARIsAJUwa2RuPx5Dzr72eBEtZegsf11MmOBgLiwLX2HcEUXVaULIgv1MdZqGmeAaArmFEALw_wcB&gclsrc=aw.ds
