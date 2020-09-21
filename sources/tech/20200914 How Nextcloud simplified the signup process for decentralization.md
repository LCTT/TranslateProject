[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How Nextcloud simplified the signup process for decentralization)
[#]: via: (https://opensource.com/article/20/9/decentralization-signup)
[#]: author: (Jan C. Borchardt https://opensource.com/users/jancborchardt)

How Nextcloud simplified the signup process for decentralization
======
Nextcloud is open source software and we don’t provide a hosted service,
yet we managed to radically simplify the signup experience.
![clouds in the sky with blue pattern][1]

We always had a nice list of dozens of Nextcloud providers, yet the most common question I heard, even from technically apt friends of mine, was:

> "Hi, Jan, umm…so, which Nextcloud provider do you recommend?"

Which is, of course, understandable. If you have a long list of providers, how do you choose? Hosted nearby? Cute name? Biggest logo?

Every decentralized open source solution using servers struggles with this:

  * Mastodon has [joinmastodon.org][2] for choosing a community, but clearly a main instance with mastodon.social.
  * Diaspora has [joindiaspora.com][3], which is also the main instance.
  * Matrix has [matrix.to][4] and an app (for multiple platforms) at [Element.io][5].
  * WordPress has [wordpress.com][6]—and I'm not sure any provider comes close to its popularity.
  * PeerTube has a bunch of instances, all with different technical details.
  * Pixelfed has an early version of an instance picker at [beta.joinpixelfed.org][7], as well as a large instance at [pixelfed.social][8]
  * … lots more examples of decentralized open source apps, which list how you can access it via the terminal, set up the Rust implementation, or make it run on your networked printer.



This leads to problems:

  * 🔮 People don't know which one to pick, have FOMO (Fear Of Missing Out), and then don't pick at all. It's the paradox of choice!
  * 🕸 The network is not really decentralized because the majority of people are on a handful of servers, or mainly just a single one.



Nextcloud does not have any of these problems.

### Our solution: Simple Signup

How it works:

When you download the mobile or desktop app, the first thing you see is a choice for "Log in" or "Sign up with a provider." This is what any proprietary app does:

![Android client][9]

Choosing "Sign up" opens [the Simple Signup page][10] in the app.

![Web client][11]

You put in your email address and click "sign up."

Enter a password, and you're done! 🎉

> "Wait a second; how is this so simple?"

I know, right? ✨

In fact, it's even simpler than lots of centralized apps where you need to put in your full name and phone number and then click on pictures of fire hydrants for Google.

It basically boils down to this:

### We choose for you

Instead of being faced with a list of providers where you could not possibly judge what works for you, we only show you one option. It's as if I'm your friend, and I answer that question about which provider I recommend.

Neat! 😊

Just to clarify: You do have the ability to change the provider, but the default should suit you fine. For now, it's simply the provider geographically closest to you.

On top of that, we have some requirements for the providers which are listed through Simple Signup to ensure a good user experience no matter which one you get:

  * 🎁 2 GB of free storage minimum, and not only for a trial period.
  * 🍱 A core set of apps: Files, Calendar, Contacts, Mail, Talk, Tasks, Notes. Some providers offer even more.
  * 🛡 The latest version, so you are always up to date with the latest features, fixes, and security updates.



Beyond that, we came up with a privacy respecting process. When you click "sign up," your email is not sent to us but directly to the provider you chose, which seamlessly transitions you to their setup step where you choose a password. This means no data leaks to us at Nextcloud—we don't even know which provider you picked!

So, while we offer this service, and while it is super easy to use, we only do the absolute minimum in terms of data handling to connect you with your ideal provider.

### Decentralized projects need simple signup

A lot of open source software projects could benefit from an onboarding experience like Simple Signup. We [wrote about it when we initially released it][12], and we hope this post clarifies the design decisions that make it successful so it can be adopted by more projects.

Decentralization is empowering, but only truly revolutionary when people can simply sign up even if they don't know what a server is.

Of course, it's not perfect just yet, either. For example, if you already have an account on a Nextcloud instance, the login process in any of the apps asks you to put in a server address, and a lot of people have no idea what that even is. In lots of email apps, for example, there is a list of the most popular providers at this step, with a "custom server" entry on the bottom. This could be a possibility as well, but again brings the risk of centralizing the system too much or leaving people confused as to what to pick.

So, we constantly try to improve this for any of the Nextcloud desktop and mobile apps, like Nextcloud Talk or all of the great community-developed apps. On Android, we have tight integration with DAVx5 (Calendar and Contact sync on Android), and, for other Android apps, there is a [single sign-on library][13]. On iOS, it is, unfortunately, not so easy, since apps have to be from the same developer to share credentials.

If you want to collaborate on solving interesting challenges like these, [come join our Nextcloud design team][14]!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/decentralization-signup

作者：[Jan C. Borchardt][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jancborchardt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003601_05_mech_osyearbook2016_cloud_cc.png?itok=XSV7yR9e (clouds in the sky with blue pattern)
[2]: https://joinmastodon.org/
[3]: https://joindiaspora.com
[4]: https://matrix.to
[5]: http://Element.io
[6]: https://wordpress.com
[7]: http://beta.joinpixelfed.org
[8]: http://pixelfed.social
[9]: https://opensource.com/sites/default/files/nextcloud-android-small.png (Android client)
[10]: https://nextcloud.com/signup
[11]: https://opensource.com/sites/default/files/nextcloud-web-small.png (Web client)
[12]: https://nextcloud.com/blog/introducing-simple-signup-you-can-now-get-started-with-nextcloud-in-2-steps/
[13]: https://github.com/nextcloud/Android-SingleSignOn
[14]: https://nextcloud.com/design
