4 add-ons to improve your privacy on Thunderbird
======

![](https://fedoramagazine.org/wp-content/uploads/2017/08/tb-privacy-addons-816x345.jpg)
Thunderbird is a popular free email client developed by [Mozilla][1]. Similar to Firefox, Thunderbird offers a large choice of add-ons for extra features and customization. This article focuses on four add-ons to improve your privacy.

### Enigmail

Encrypting emails using GPG (GNU Privacy Guard) is the best way to keep their contents private. If you aren’t familiar with GPG, [check out our primer right here][2] on the Magazine.

[Enigmail][3] is the go-to add-on for using OpenPGP with Thunderbird. Indeed, Enigmail integrates well with Thunderbird, and lets you encrypt, decrypt, and digitally sign and verify emails.

### Paranoia

[Paranoia][4] gives you access to critical information about your incoming emails. An emoticon shows the encryption state between servers an email traveled through before reaching your inbox.

A yellow, happy emoticon tells you all connections were encrypted. A blue, sad emoticon means one connection was not encrypted. Finally, a red, scared emoticon shows on more than one connection the message wasn’t encrypted.

More details about these connections are available, so you can check which servers were used to deliver the email.

### Sensitivity Header

[Sensitivity Header][5] is a simple add-on that lets you select the privacy level of an outgoing email. Using the option menu, you can select a sensitivity: Normal, Personal, Private and Confidential.

Adding this header doesn’t add extra security to email. However, some email clients or mail transport/user agents (MTA/MUA) can use this header to process the message differently based on the sensitivity.

Note that this add-on is marked as experimental by its developers.

### TorBirdy

If you’re really concerned about your privacy, [TorBirdy][6] is the add-on for you. It configures Thunderbird to use the [Tor][7] network.

TorBirdy offers less privacy on email accounts that have been used without Tor before, as noted in the [documentation][8].

> Please bear in mind that email accounts that have been used without Tor before offer **less** privacy/anonymity/weaker pseudonyms than email accounts that have always been accessed with Tor. But nevertheless, TorBirdy is still useful for existing accounts or real-name email addresses. For example, if you are looking for location anonymity — you travel a lot and don’t want to disclose all your locations by sending emails — TorBirdy works wonderfully!

Note that to use this add-on, you must have Tor installed on your system.

Photo by [Braydon Anderson][9] on [Unsplash][10].


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-addons-privacy-thunderbird/

作者：[Clément Verna][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:https://www.mozilla.org/en-US/
[2]:https://fedoramagazine.org/gnupg-a-fedora-primer/
[3]:https://addons.mozilla.org/en-US/thunderbird/addon/enigmail/
[4]:https://addons.mozilla.org/en-US/thunderbird/addon/paranoia/?src=cb-dl-users
[5]:https://addons.mozilla.org/en-US/thunderbird/addon/sensitivity-header/?src=cb-dl-users
[6]:https://addons.mozilla.org/en-US/thunderbird/addon/torbirdy/?src=cb-dl-users
[7]:https://www.torproject.org/
[8]:https://trac.torproject.org/projects/tor/wiki/torbirdy
[9]:https://unsplash.com/photos/wOHH-NUTvVc?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[10]:https://unsplash.com/search/photos/privacy?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
