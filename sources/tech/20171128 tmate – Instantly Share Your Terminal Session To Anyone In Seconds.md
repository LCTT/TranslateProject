::: {#wrapper}
::: {.mobile-title-logo-in-header}
[![2daygeek.com](https://www.2daygeek.com/wp-content/uploads/2015/12/2day-geek-new-logo-final.png)](https://www.2daygeek.com/ "2daygeek.com | Home page"){.custom-logo-link}
:::

::: {.ham__navbar-toggler-two .collapsed title="Menu" aria-expanded="false"}
::: {.ham__navbar-span-wrapper}
[]{.line .line-1} []{.line .line-2} []{.line .line-3}
:::
:::

::: {.nav-text}
:::

::: {.nav-wrap .container}
-   <div>

    </div>

<!-- -->

-   [[LINUX
    DISTRO'S](https://www.2daygeek.com/category/linux-distributions/)]{#menu-item-6808}
-   [[LINUX
    COMMAND'S](https://www.2daygeek.com/category/linux-commands/)]{#menu-item-6806}
-   [[WEBSERVER](https://www.2daygeek.com/category/webserver/)]{#menu-item-9582}
-   [[MONITORING
    TOOLS](https://www.2daygeek.com/category/monitoring-tools/)]{#menu-item-6809}
-   [[PACKAGE
    MANAGEMENT](https://www.2daygeek.com/category/package-management/)]{#menu-item-6883}
-   [[REPOSITORY](https://www.2daygeek.com/category/repository/)]{#menu-item-6811}
-   [[CLOUD
    STORAGE](https://www.2daygeek.com/category/free-cloud-storage/)]{#menu-item-6986}
-   [[HACKING](https://gbhackers.com/)]{#menu-item-14871}
    -   [[Tutorials](https://gbhackers.com/)]{#menu-item-14872}
:::

::: {.nav-text}
:::

::: {.topbar-toggle-down}
:::

::: {.nav-wrap .container}
-   [[HOME](https://www.2daygeek.com/)]{#menu-item-293}
-   [[LINUX NEWS](http://linuxnews.2daygeek.com/)]{#menu-item-10920}
-   [[ABOUT US](https://www.2daygeek.com/about-us/)]{#menu-item-294}
-   [[CONTACT US](https://www.2daygeek.com/contact-us/)]{#menu-item-295}
-   [[DISCLAIMER](https://www.2daygeek.com/disclaimer/)]{#menu-item-296}
-   [[PRIVACY
    POLICY](https://www.2daygeek.com/privacy-policy/)]{#menu-item-3676}
-   [[SUPPORT
    US](https://www.2daygeek.com/support-us/)]{#menu-item-2729}
-   [[OS
    TWEAK](https://www.2daygeek.com/category/os-tweaks/)]{#menu-item-8366}
-   [[ICONS](https://www.2daygeek.com/category/icon-theme/)]{#menu-item-12012}
-   [[THEMES](https://www.2daygeek.com/category/gtk-theme/)]{#menu-item-12013}
:::

::: {#topbar-header-search .container}
::: {.container-inner}
::: {.toggle-search}
:::

::: {.search-expand}
::: {.search-expand-inner}
<div>

</div>
:::
:::
:::
:::

::: {.container .group}
::: {.container-inner}
::: {.group .pad .central-header-zone}
::: {.logo-tagline-group}
[![2daygeek.com](https://www.2daygeek.com/wp-content/uploads/2015/12/2day-geek-new-logo-final.png)](https://www.2daygeek.com/ "2daygeek.com | Home page"){.custom-logo-link}
:::

::: {#header-widgets}
::: {style="float:left;border:solid 0px;height:90px;width:728px;"}
[]{.underline}
:::
:::
:::

::: {.nav-text}
:::

::: {.nav-wrap .container}
-   [LINUX
    DISTRO'S](https://www.2daygeek.com/category/linux-distributions/)
-   [LINUX COMMAND'S](https://www.2daygeek.com/category/linux-commands/)
-   [WEBSERVER](https://www.2daygeek.com/category/webserver/)
-   [MONITORING
    TOOLS](https://www.2daygeek.com/category/monitoring-tools/)
-   [PACKAGE
    MANAGEMENT](https://www.2daygeek.com/category/package-management/)
-   [REPOSITORY](https://www.2daygeek.com/category/repository/)
-   [CLOUD
    STORAGE](https://www.2daygeek.com/category/free-cloud-storage/)
-   [HACKING](https://gbhackers.com/)
    -   [Tutorials](https://gbhackers.com/)
:::
:::
:::

::: {#page .container}
::: {.container-inner}
::: {.main}
::: {.main-inner .group}
::: {.section .content}
::: {.page-title .pad .group}
-   [Apps](https://www.2daygeek.com/category/apps/)
:::

::: {.pad .group}
::: {.post-inner .group}
tmate -- Instantly Share Your Terminal Session To Anyone In Seconds {#tmate-instantly-share-your-terminal-session-to-anyone-in-seconds .post-title .entry-title}
===================================================================

by [ [[Magesh
Maruthamuthu](https://www.2daygeek.com/author/magesh/ "Posts by Magesh Maruthamuthu")]{.fn}
]{.vcard .author} · [Published : November 28, 2017 \|\| Last Updated:
November 28, 2017]{.published}

::: {.clear}
:::

::: {.entry .themeform}
::: {.entry-inner}
::: {style="float:left;margin:10px 10px 10px 0;"}
[]{.underline}
:::

A while ago, we wrote about
[teleconsole](https://www.2daygeek.com/teleconsole-share-terminal-session-instantly-to-anyone-in-seconds/)
which is used to share terminal instantly to anyone (whoever you
trusting). Today also we are going to discuss about same kind of
application called tmate.

Why you want tmate application? this will help you to get help from your
friends when you need.

#### What Is tmate?

[tmate](https://tmate.io/) stands for teammates, it's a fork of tmux,
and uses the same configurations such as keybindings, color schemes etc.
It's a terminal multiplexer with instant terminal sharing. it enables a
number of terminals to be created, accessed, and controlled from a
single screen, that can be shared with another mates.

You can detach the session by leaving the job running in background and
re-attach the session when you want to view the status. tmate provides
an instant pairing solution, allowing you to share a terminal with one
or several teammates.

A status line at the bottom of the screen shows information on the
current session, such as ssh command to share with your mate.

#### How tmate works?

-   When launching tmate, an ssh connection is established to tmate.io
    (backend servers maintained by tmate developers) in the background
    through libssh.
-   The server (tmate.io) ssh key signatures are verified during the DH
    exchange.
-   The client is authenticated with local ssh keys.
-   Once connection is established, a 150 bits (non guessable random
    characters) session token is generated by local tmux server.
-   teammates can connect to tmate.io using the SSH session ID provided
    by user

#### Prerequisites for tmate

Generate SSH key as a prerequisites since tmate.io server authenticate
client machine through local ssh keys. Make a note, every system should
have SSH key.

    $ ssh-keygen -t rsa
    Generating public/private rsa key pair.
    Enter file in which to save the key (/home/magi/.ssh/id_rsa): 
    Enter passphrase (empty for no passphrase): 
    Enter same passphrase again: 
    Your identification has been saved in /home/magi/.ssh/id_rsa.
    Your public key has been saved in /home/magi/.ssh/id_rsa.pub.
    The key fingerprint is:
    SHA256:3ima5FuwKbWyyyNrlR/DeBucoyRfdOtlUmb5D214NC8 [email protected]
    The key's randomart image is:
    +---[RSA 2048]----+
    |                 |
    |                 |
    |           .     |
    |      . . =   o  |
    |     *ooS= . + o |
    |  . [email protected]*o.o.+ E .|
    |   =o==B++o  = . |
    |  o.+*o+..    .  |
    | ..o+o=.         |
    +----[SHA256]-----+

#### How to Install tmate

tmate is available in few of the distribution official repository that
can be installed through package manager.

For **`Debian/Ubuntu`**, use [APT-GET
Command](https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/)
or [APT
Command](https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/)to
install tmate.

::: {style="float:left;margin:10px 10px 10px 0;"}
[]{.underline}
:::

    $ sudo apt-get install software-properties-common
    $ sudo add-apt-repository ppa:tmate.io/archive
    $ sudo apt-get update
    $ sudo apt-get install tmate

Also, you can install tmate package from distribution official
repository.

    $ sudo apt-get install tmate

For **`Fedora`**, use [DNF
Command](https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/)
to install tmate.

    $ sudo dnf install tmate

For **`Arch Linux`** based systems, use []()[Yaourt
Command](https://www.2daygeek.com/install-yaourt-aur-helper-on-arch-linux/)
or []()[Packer
Command](https://www.2daygeek.com/install-packer-aur-helper-on-arch-linux/)
to install tmate from AUR repository.

    $ yaourt -S tmate
    or
    $ packer -S tmate

For **`openSUSE`**, use [Zypper
Command](https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/)
to install tmate.

    $ sudo zypper in tmate

#### How To Use tmate

After successfully installed, open your terminal and fire the following
command which will open the new session for you and in the bottom of the
screen you can able to see the SSH session ID.

    $ tmate

[![](data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7){.aligncenter
.size-full .wp-image-15269 width="1051"
height="643"}![](data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7){.aligncenter
.size-full .wp-image-15269 width="1051"
height="643"}](https://www.2daygeek.com/wp-content/uploads/2017/11/tmate-instantly-share-your-terminal-session-to-anyone-in-seconds-1.png)

Make a note, the SSH session ID will disappear after a few seconds, so
don't worry you can get those details using following command.

::: {style="float:none;margin:10px 0 10px 0;text-align:center;"}
[]{.underline}
:::

    $ tmate show-messages

The tmate show-messages command allows you to see tmate's log messages,
including the ssh connection string.\
[![](data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7){.aligncenter
.size-full .wp-image-15270 width="1051"
height="643"}![](data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7){.aligncenter
.size-full .wp-image-15270 width="1051"
height="643"}](https://www.2daygeek.com/wp-content/uploads/2017/11/tmate-instantly-share-your-terminal-session-to-anyone-in-seconds-2.png)

Now, share your SSH session ID to your friends or coworkers and allow
them to view the terminal session. Not only SSH session ID,
alternatively you can share web URL as well, also you can share either
read only sessions or read-write sessions?

#### How to connect session through SSH

Just run the SSH session ID which you got from your friend on terminal.
It's like similar to below.

    $ ssh session: ssh [email protected]

[![](data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7){.aligncenter
.size-full .wp-image-15273 width="869"
height="625"}![](data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7){.aligncenter
.size-full .wp-image-15273 width="869"
height="625"}](https://www.2daygeek.com/wp-content/uploads/2017/11/tmate-instantly-share-your-terminal-session-to-anyone-in-seconds-4.png)

#### How to connect session through Web URL

Open the browser and access the URL which you got from your friend. It's
like similar to below.\
[![](data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7){.aligncenter
.size-full .wp-image-15274 width="1024"
height="708"}![](data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7){.aligncenter
.size-full .wp-image-15274 width="1024"
height="708"}](https://www.2daygeek.com/wp-content/uploads/2017/11/tmate-instantly-share-your-terminal-session-to-anyone-in-seconds-3.png)

::: {style="float:none;margin:10px 0 10px 0;text-align:center;"}
:::

Just type `exit` to exit from the session.

::: {style="float:none;margin:10px 0 10px 0;text-align:center;"}
:::

    [Source System Output]
    [exited]

    [Remote System Output]
    [server exited]
    Connection to sg2.tmate.io closed by remote host.
    Connection to sg2.tmate.io closed.

::: {style="float:none;margin:10px 0 10px 0;text-align:center;"}
[]{.underline}
:::

::: {style="font-size:0px;height:0px;line-height:0px;margin:0;padding:0;clear:both"}
:::
:::

::: {.clear}
:::
:::
:::

::: {.clear}
:::

Tags: [Application](https://www.2daygeek.com/tag/application/)[Instant
terminal
sharing](https://www.2daygeek.com/tag/instant-terminal-sharing/)[Linux](https://www.2daygeek.com/tag/linux/)[tmate](https://www.2daygeek.com/tag/tmate/)

::: {.author-bio}
::: {.bio-avatar}
![](https://www.2daygeek.com/wp-content/plugins/lazy-load/images/1x1.trans.gif){.avatar
.avatar-128 .photo width="128" height="128"
srcset="https://secure.gravatar.com/avatar/d487bef1de15143a7b80a40396e96118?s=256&d=mm&r=g 2x"}

![](https://secure.gravatar.com/avatar/d487bef1de15143a7b80a40396e96118?s=128&d=mm&r=g){.avatar
.avatar-128 .photo width="128" height="128"
srcset="https://secure.gravatar.com/avatar/d487bef1de15143a7b80a40396e96118?s=256&d=mm&r=g 2x"}
:::

Magesh Maruthamuthu

Love to play with all Linux distribution

::: {.clear}
:::
:::

-   -   [**Previous story** How To Empty a File, Delete N Lines From a
    File, Remove Matching String From a File, And Remove Empty/Blank
    Lines From a File In
    Linux?](https://www.2daygeek.com/empty-a-file-delete-contents-lines-from-a-file-remove-matching-string-from-a-file-remove-empty-blank-lines-from-a-file/)

#### You may also like\... {#you-may-also-like... .heading}

-   ::: {.post-thumbnail}
    ![](data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7){.attachment-thumb-medium
    .size-thumb-medium .wp-post-image width="520" height="245"}
    ![](data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7){.attachment-thumb-medium
    .size-thumb-medium .wp-post-image width="520" height="245"}
    :::

    ::: {.related-inner}
    #### [wikipedia2text -- A Command Line Tool For Querying The Wikipedia Article](https://www.2daygeek.com/wikipedia2text-wiki-cli-access-query-read-wikipedia-page-article-in-linux-command-line/ "wikipedia2text – A Command Line Tool For Querying The Wikipedia Article") {#wikipedia2text-a-command-line-tool-for-querying-the-wikipedia-article .post-title .entry-title}

    ::: {.post-meta .group}
    October 17, 2017
    :::
    :::

-   ::: {.post-thumbnail}
    ![](data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7){.attachment-thumb-medium
    .size-thumb-medium .wp-post-image width="520" height="245"}
    ![](data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7){.attachment-thumb-medium
    .size-thumb-medium .wp-post-image width="520" height="245"}
    :::

    ::: {.related-inner}
    #### [RTV (Reddit Terminal Viewer) -- A Simple Terminal Viewer For Reddit](https://www.2daygeek.com/rtv-reddit-terminal-viewer-a-simple-terminal-viewer-for-reddit/ "RTV (Reddit Terminal Viewer) – A Simple Terminal Viewer For Reddit") {#rtv-reddit-terminal-viewer-a-simple-terminal-viewer-for-reddit .post-title .entry-title}

    ::: {.post-meta .group}
    October 13, 2017
    :::
    :::

-   ::: {.post-thumbnail}
    ![](data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7){.attachment-thumb-medium
    .size-thumb-medium .wp-post-image width="520" height="245"}
    ![](data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7){.attachment-thumb-medium
    .size-thumb-medium .wp-post-image width="520" height="245"}
    :::

    ::: {.related-inner}
    #### [Teleconsole -- A Tool To Share Your Terminal Session Instantly To Anyone In Seconds](https://www.2daygeek.com/teleconsole-share-terminal-session-instantly-to-anyone-in-seconds/ "Teleconsole – A Tool To Share Your Terminal Session Instantly To Anyone In Seconds") {#teleconsole-a-tool-to-share-your-terminal-session-instantly-to-anyone-in-seconds .post-title .entry-title}

    ::: {.post-meta .group}
    November 6, 2017
    :::
    :::

::: {#disqus_thread}
:::
:::
:::

::: {.sidebar .s1 .collapsed data-position="right" data-layout="col-2cl" data-sb-id="s1"}
[]{.sidebar-toggle}

::: {.sidebar-content}
::: {.sidebar-top .group}
Follow:

-   [](https://www.facebook.com/2daygeek "Facebook"){.social-tooltip}
-   [](https://www.twitter.com/2daygeek "Twitter"){.social-tooltip}
-   [](https://www.google.com/+2daygeeks "Google+"){.social-tooltip}
-   [](https://www.linkedin.com/company/2daygeek "Linkein"){.social-tooltip}
-   [](javascript:void(0) "Pinterest"){.social-tooltip}
-   [](http://2daygeek.tumblr.com/ "Tumblr"){.social-tooltip}
:::

::: {#text-8 .widget .widget_text}
### -- Click Here To Get Offers -- {#click-here-to-get-offers .widget-title}

::: {.textwidget}
[]{.underline}
:::
:::

::: {#text-10 .widget .widget_text}
### -- For Better Offers -- {#for-better-offers .widget-title}

::: {.textwidget}
:::
:::

::: {#text-12 .widget .widget_text}
### -Unmatched Offers For Linux Users- {#unmatched-offers-for-linux-users- .widget-title}

::: {.textwidget}
:::
:::

::: {#wp_subscribe-3 .widget .wp_subscribe}
::: {#wp-subscribe .wp-subscribe-wrap .wp-subscribe .wp-subscribe-1 data-thanks_page="0" data-thanks_page_url="" data-thanks_page_new_window="0"}
#### Get Latest LINUX Tips {#get-latest-linux-tips .title}

::: {.wp-subscribe-loader}
:::

Thank you for subscribing.

Something went wrong.

::: {.clear}
:::
:::
:::

::: {#text-3 .widget .widget_text}
::: {.textwidget}
:::
:::

::: {#text-6 .widget .widget_text}
::: {.textwidget}
::: {#google_translate_element}
:::
:::
:::

::: {#text-5 .widget .widget_text}
### Follow us {#follow-us .widget-title}

::: {.textwidget}
::: {.g-page data-href="//plus.google.com/107364365185869631781" data-layout="landscape" data-rel="publisher"}
:::
:::
:::
:::
:::
:::
:::
:::
:::

::: {#footer-bottom .section .container}
::: {.container-inner}
[](#){#back-to-top}

::: {.pad .group}
::: {.grid .one-half}
::: {#copyright}
2daygeek.com © 2017. All Rights Reserved.
:::

::: {#credit style=""}
[2daygeek](https://www.2daygeek.com) :- Linux Tips & Tricks, Linux
How-to Guides & Tutorials is licensed under a [(cc)
BY-NC](https://creativecommons.org/licenses/by-nc/4.0/)
:::
:::

::: {.grid .one-half .last}
-   [](https://www.facebook.com/2daygeek "Facebook"){.social-tooltip}
-   [](https://www.twitter.com/2daygeek "Twitter"){.social-tooltip}
-   [](https://www.google.com/+2daygeeks "Google+"){.social-tooltip}
-   [](https://www.linkedin.com/company/2daygeek "Linkein"){.social-tooltip}
-   [](javascript:void(0) "Pinterest"){.social-tooltip}
-   [](http://2daygeek.tumblr.com/ "Tumblr"){.social-tooltip}
:::
:::
:::
:::
:::

::: {#crestashareicon .cresta-share-icon .sameColors .first_style .show-count-active}
::: {#facebook-cresta .sbutton .crestaShadow .facebook-cresta-share .float}
[](https://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.2daygeek.com%2Ftmate-instantly-share-your-terminal-session-to-anyone-in-seconds%2F&t=tmate+%E2%80%93++Instantly+Share+Your+Terminal+Session+To+Anyone+In+Seconds "Share to Facebook")
:::

::: {#twitter-cresta .sbutton .crestaShadow .twitter-cresta-share .float .withCount}
[](https://twitter.com/share?text=tmate+%E2%80%93++Instantly+Share+Your+Terminal+Session+To+Anyone+In+Seconds&url=https%3A%2F%2Fwww.2daygeek.com%2Ftmate-instantly-share-your-terminal-session-to-anyone-in-seconds%2F&via=2daygeek "Share to Twitter")
:::

::: {#googleplus-cresta .sbutton .crestaShadow .googleplus-cresta-share .float}
[](https://plus.google.com/share?url=https%3A%2F%2Fwww.2daygeek.com%2Ftmate-instantly-share-your-terminal-session-to-anyone-in-seconds%2F "Share to Google Plus")
:::

::: {#linkedin-cresta .sbutton .crestaShadow .linkedin-cresta-share .float}
[](https://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.2daygeek.com%2Ftmate-instantly-share-your-terminal-session-to-anyone-in-seconds%2F&title=tmate+%E2%80%93++Instantly+Share+Your+Terminal+Session+To+Anyone+In+Seconds&source=https://www.2daygeek.com/ "Share to LinkedIn")
:::

::: {#pinterest-cresta .sbutton .crestaShadow .pinterest-cresta-share .float}
[](https://pinterest.com/pin/create/bookmarklet/?url=https%3A%2F%2Fwww.2daygeek.com%2Ftmate-instantly-share-your-terminal-session-to-anyone-in-seconds%2F&media=https://www.2daygeek.com/wp-content/uploads/2017/11/tmate-instantly-share-your-terminal-session-to-anyone-in-seconds.png&description=tmate+%E2%80%93++Instantly+Share+Your+Terminal+Session+To+Anyone+In+Seconds "Share to Pinterest")
:::

::: {#total-shares .sbutton}
[]{#total-count .cresta-the-total-count}[Shares]{.cresta-the-total-text}
:::

::: {style="clear: both;"}
:::
:::

::: {#spu-bg}
:::

::: {#spu-main}
[Close](#){#spu-close}

::: {#spu-title}
Please support the site
:::

::: {#spu-msg-cont}
::: {#spu-msg}
By clicking any of these buttons you help our site to get better

::: {.spu-button .spu-twitter}
[Follow Me](https://twitter.com/2daygeek){.twitter-follow-button}
:::

::: {.spu-button .spu-facebook}
::: {#fb-root}
:::

::: {.fb-like data-href="https://www.facebook.com/2daygeek" data-send="false" data-width="450" data-show-faces="true" data-layout="button_count"}
:::
:::

::: {.spu-button .spu-google}
::: {.g-plusone data-callback="googleCB" data-onendinteraction="closeGoogle" data-recommendations="false" data-annotation="bubble" data-size="medium" data-href="https://www.google.com/+2daygeeks"}
:::
:::
:::

::: {.step-clear}
:::
:::

[]{#spu-timer}

::: {#spu-bottom}
:::
:::

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/tmate-instantly-share-your-terminal-session-to-anyone-in-seconds/

作者：[ ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

