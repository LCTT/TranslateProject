[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Firefox 69 available in Fedora)
[#]: via: (https://fedoramagazine.org/firefox-69-available-in-fedora/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

Firefox 69 available in Fedora
======

![][1]

When you install the Fedora Workstation, you’ll find the world-renowned Firefox browser included. The Mozilla Foundation underwrites work on Firefox, as well as other projects that promote an open, safe, and privacy respecting Internet. Firefox already features a fast browsing engine and numerous privacy features.

A community of developers continues to improve and enhance Firefox. The latest version, Firefox 69, was released recently and you can get it for your stable Fedora system (30 and later). Read on for more details.

### New features in Firefox 69

The newest version of Firefox includes [Enhanced Tracking Protection][2] (or ETP). When you use Firefox 69 with a new (or reset) settings profile, the browser makes it harder for sites to track your information or misuse your computer resources.

For instance, less scrupulous websites use scripts that cause your system to do lots of intense calculations to produce cryptocurrency results, called _[cryptomining][3]_. Cryptomining happens without your knowledge or permission and is therefore a misuse of your system. The new standard setting in Firefox 69 prevents sites from this kind of abuse.

Firefox 69 has additional settings to prevent sites from identifying or fingerprinting your browser for later use. These improvements give you additional protection from having your activities tracked online.

Another common annoyance is videos that start in your browser without warning. Video playback also uses extra CPU power and you may not want this happening on your laptop without permission. Firefox already stops this from happening using the [Block Autoplay][4] feature. But Firefox 69 also lets you stop videos from playing even if they start without sound. This feature prevents unwanted sudden noise. It also solves more of the real problem — having your computer’s power used without permission.

There are numerous other new features in the new release. Read more about them in the [Firefox release notes][5].

### How to get the update

Firefox 69 is available in the stable Fedora 30 and pre-release Fedora 31 repositories, as well as Rawhide. The update is provided by Fedora’s maintainers of the Firefox package. The maintainers also ensured an update to Mozilla’s Network Security Services (the nss package). We appreciate the hard work of the Mozilla project and Firefox community in providing this new release.

If you’re using Fedora 30 or later, use the _Software_ tool on Fedora Workstation, or run the following command on any Fedora system:

```
$ sudo dnf --refresh upgrade firefox
```

If you’re on Fedora 29, [help test the update][6] for that release so it can become stable and easily available for all users.

Firefox may prompt you to upgrade your profile to use the new settings. To take advantage of new features, you should do this.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/firefox-69-available-in-fedora/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/09/firefox-v69-816x345.jpg
[2]: https://blog.mozilla.org/blog/2019/09/03/todays-firefox-blocks-third-party-tracking-cookies-and-cryptomining-by-default/
[3]: https://www.webopedia.com/TERM/C/cryptocurrency-mining.html
[4]: https://support.mozilla.org/kb/block-autoplay
[5]: https://www.mozilla.org/en-US/firefox/69.0/releasenotes/
[6]: https://bodhi.fedoraproject.org/updates/FEDORA-2019-89ae5bb576
