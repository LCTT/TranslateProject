[#]: subject: "What is Firefox Multi-Account Containers? Why and How to Use It?"
[#]: via: "https://itsfoss.com/firefox-containers/"
[#]: author: "Hunter Wittenborn https://itsfoss.com/author/hunter/"
[#]: collector: "lujun9972"
[#]: translator: "hanszhao80"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What is Firefox Multi-Account Containers? Why and How to Use It?
======

As the needs of users who use various programs on their devices becomes increasingly complex, the programs themselves are also needing to follow suit to keep up with the demand that users are wanting and expecting.

Something that I find I need on a daily basis is an easy way to be able to stay logged in to multiple accounts inside my web browser at the same time. I _could_ just log in and out of each of my accounts as needed, but this becomes extremely tedious when I’m moving across multiple accounts in a short period of time.

Originally, I was using Google Chrome’s ability to have multiple accounts, which worked, but was a tad too tedious to manage, and it felt a bit clunky to create an entire new Google account just to do what I considered something that should be able to be done from a _single_ account.

This is the point where I moved to Firefox’s Multi-Account Containers feature. Not only is it so much more flexible than my setup on Google Chrome, but I am also using something that is created by my browser’s developers themselves, making for an overall smoother and simpler experience.

![Illustration of containers in Firefox][1]

### What is Multi-Account Container in Firefox?

Mutli-Account Containers also works tremendously well if you want to separate parts of your digital life from each other. When you are using containers, your browsing activity from one container is not shared with other containers. This isolation means that you can log into two separate accounts on the same website in different containers. Your login session, site preference and tracking data will be confined to the container where you used a certain website.

What other advantage does it have? Imagine you were shopping on Amazon or some other e-commerce. You browsed a few items but did not buy anything. Now if you browse the web, you’ll see ads related to products you browsed. Some websites show ads despite ad-blockers. With containers, you can separate your shopping websites with other websites.

Let me share another example with you. Firefox provides a Facebook container by default. This container includes Facebook, Messenger and Instagram websites by default. This means when you open any of these three websites, they are opened in ‘Facebook container’. Thus, Facebook won’t be able to track your activity on other websites.

This is one of the [Firefox features that not many people know or use][2].

### Using Multi-Account Containers

Installing Firefox Multi-Account containers is an extremely simple process, and only takes a few clicks.

First, head over to the [extension’s page][3] on the Firefox Add-ons website. The only thing you need to do after that is click the `Add to Firefox` button.

![][4]

And you’re done! Now we can get straight into actually using the new extension.

If you didn’t notice already, there should now be a new icon to the right of your search bar:

![][5]

This is the icon that you’ll use to interact with Firefox Multi-Account containers. If you then click the icon, you’ll be greeted with a little menu:

![][6]

With that, let’s try some examples out so we can see how Multi-Account Containers actually works.

#### Setting up the container

First off, we need to make a container. We can do this by going to `Manage Containers -> New Container` in the Multi-Account Containers menu.

![][7]

![][8]

Next, enter the name for the new container, and select a color and icon. Then, hit `OK` to save the new container.

![][9]

And that’s it! We can now go back to the main menu to open a new tab inside the new container:

![][10]

You will also notice that the new tab has some styling to denote that it’s running inside of a container:

![][11]

#### Watching the container work in action

Let’s now look at what the container actually does when you use it.

We’re going to go to the Linode manager website in a normal browser tab, where I’m currently signed in:

![][12]

Let’s now try opening the same page inside our Firefox container, at which point I’m redirected to the Linode login screen:

![][13]

Why was I redirected? Because now I am not logged in. That’s one of the joys of Firefox containers: be able to be signed in inside of one browser session, and then enter a container, and it’s like you’ve never visited the site before.

If you were to sign in to a website within the container however, you would stay signed in while vising websites from the container. You could also use this feature to sign in to a website from inside the container, thus keeping all the data from that site away from your normal browser data.

Note

Things like your browser history itself will still be exposed to your normal browser session. The container feature simply provides a way to separate things like signed-in accounts as mentioned in this article.

### Wrapping Up

Mutli-Account Containers prove to be a wonderful feature for those who are conscious about their privacy, or just want to really try to get stringent on the security of their systems.

For example, you could sign in to your Google account inside of a container, and Google would never know who you whenever you aren’t inside the container.

And then lastly, this extension is just a great choice for people who want to sign into to multiple accounts at once, without resorting to making separate browser accounts for each thing you want to use.

And there you go, that’s the premise of Firefox’s Multi-Account Containers.

Need any help getting everything going, or just got a general question? Feel free to leave any of it in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/firefox-containers/

作者：[Hunter Wittenborn][a]
选题：[lujun9972][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/hunter/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/Firefox-container.png?resize=800%2C450&ssl=1
[2]: https://itsfoss.com/firefox-useful-features/
[3]: https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/firefox-containers-install-page.png?resize=800%2C366&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/firefox-containers-searchbar-icon-1.png?resize=800%2C48&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/firefox-containers-main-menu.png?resize=302%2C474&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/firefox-containers-manage-containers-1.png?resize=291%2C402&ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/firefox-containers-new-container.png?resize=290%2C399&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/firefox-containers-new-container-itsfoss.png?resize=292%2C401&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/firefox-containers-opening-new-container.png?resize=290%2C398&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/firefox-containers-new-container-styling.png?resize=800%2C370&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/firefox-containers-linode.png?resize=800%2C114&ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/firefox-containers-linode-login.png?resize=800%2C405&ssl=1
