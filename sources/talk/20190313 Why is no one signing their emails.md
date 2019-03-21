[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why is no one signing their emails?)
[#]: via: (https://arp242.net/weblog/signing-emails.html)
[#]: author: (Martin Tournoij https://arp242.net/)

Why is no one signing their emails?
======


I received this email a while ago:

> Queensland University of Technology sent you an Amazon.com Gift Card!
>
> You’ve received an Amazon.com gift card! You’ll need the claim code below to place your order.
>
> Happy shopping!

Queensland University of Technology? Why would they send me anything? Where is that even? Australia right? That’s the other side of the world! Looks like spam!

It did look pretty good for spam, so I took a second look. And a very close third look, and then I decided it wasn’t spam.

I was still confused why they sent me this. A week later I remembered: half a year prior I had done an interview regarding my participation on Stack Overflow for someone’s paper; she was studying somewhere in Australia – presumably the university of Queensland. No one had ever mentioned anything about a reward or Amazon gift card so I wasn’t expecting it. It’s a nice bonus though.

Here’s the thing: I’ve spent several years professionally developing email systems; I administered email servers; I read all the relevant RFCs. While there are certainly people who are more knowledgable, I know more about email than the vast majority of the population. And I still had to take a careful look to verify the email wasn’t a phishing attempt.

And I’m not even a target; I’m just this guy, you know? [Ask John Podesta what it is to be targeted][1]:

> SecureWorks concluded Fancy Bear had sent Podesta an email on March 19, 2016, that had the appearance of a Google security alert, but actually contained a misleading link—a strategy known as spear-phishing. [..] The email was initially sent to the IT department as it was suspected of being a fake but was described as “legitimate” in an e-mail sent by a department employee, who later said he meant to write “illegitimate”.

Yikes! If I was even remotely high-profile I’d be crazy paranoid about all emails I get.

It seems to me that there is a fairly easy solution to verify the author of an email: sign it with a digital signature; PGP is probably the best existing solution right now. I don’t even care about encryption here, just signing to prevent phishing.

PGP has a well-deserved reputation for being hard, but that’s only for certain scenarios. A lot of the problems/difficulties stem from trying to accommodate the “random person A emails random person B” use case, but this isn’t really what I care about here. “Large company with millions of users sends thousands of emails daily” is a very different use case.

Much of the key exchange/web-of-trust dilemma can be bypassed by shipping email clients with keys for large organisations (PayPal, Google, etc.) baked in, like browsers do with some certificates. Even just publishing your key on your website (or, if you’re a bank, in local branches etc.) is already a lot better than not signing anything at all. Right now there seems to be a catch-22 scenario: clients don’t implement better support as very few people are using PGP, while very few companies bother signing their emails with PGP because so few people can benefit from it.

On the end-user side, things are also not very hard; we’re just conceded with validating signatures, nothing more. For this purpose PGP isn’t hard. It’s like verifying your Linux distro’s package system: all of them sign their packages (usually with PGP) and they get verified on installation, but as an end-user I never see it unless something goes wrong.

There are many aspects of PGP that are hard to set up and manage, but verifying signatures isn’t one of them. The user-visible part of this is very limited. Remember, no one is expected to sign their own emails: just verify that the signature is correct (which the software will do). Conceptually, it’s not that different from verifying a handwritten signature.

DKIM and SPF already exist and are useful, but limited. All both do is verify that an email which claims to be from `amazon.com` is really from `amazon.com`. If I send an email from `mail.amazon-account-security.com` or `amazonn.com` then it just verifies that it was sent from that domain, not that it was sent from the organisation Amazon.

What I am proposing is subtly different. In my (utopian) future every serious organisation will sign their email with PGP (just like every serious organisation uses https). Then every time I get an email which claims to be from Amazon I can see it’s either not signed, or not signed by a key I know. If adoption is broad enough we can start showing warnings such as “this email wasn’t signed, do you want to trust it?” and “this signature isn’t recognized, yikes!”

There’s also S/MIME, which has better client support and which works more or less the same as HTTPS: you get a certificate from the Certificate Authority Mafia, sign your email with it, and presto. The downside of this is that anyone can sign their emails with a valid key, which isn’t necessarily telling you much (just because haxx0r.ru has a certificate doesn’t mean it’s trustworthy).

Is it perfect? No. I understand stuff like key exchange is hard and that baking in keys isn’t perfect. Is it better? Hell yes. Would probably have avoided Podesta and the entire Democratic Party a lot of trouble. Here’s a “[sophisticated new phishing campaign][2]” targeted at PayPal users. How “sophisticated”? Well, by not having glaring stupid spelling errors, duplicating the PayPal layout in emails, duplicating the PayPal login screen, a few forms, and getting an SSL certificate. Truly, the pinnacle of Computer Science.

Okay sure, they spent some effort on it; but any nincompoop can do it; if this passes for “sophisticated phishing” where “it’s easy to see how users could be fooled” then the bar is pretty low.

I can’t recall receiving a single email from any organisation that is signed (much less encrypted). Banks, financial services, utilities, immigration services, governments, tax services, voting registration, Facebook, Twitter, a zillion websites … all happily sent me emails hoping I wouldn’t consider them spam and hoping I wouldn’t confuse a phishing email for one of theirs.

Interesting experiment: send invoices for, say, a utility bill for a local provider. Just copy the layout from the last utility bill you received. I’ll bet you’ll make more money than freelancing on UpWork if you do it right.

I’ve been intending to write this post for years, but never quite did because “surely not everyone is stupid?” I’m not a crypto expert, so perhaps I’m missing something here, but I wouldn’t know what. Let me know if I am.

In the meanwhile PayPal is attempting to solve the problem by publishing [articles which advise you to check for spelling errors][3]. Okay, it’s good advice, but do we really want this to be the barrier between an attacker and your money? Or Russian hacking groups and your emails? Anyone can sign any email with any key, but “unknown signature” warnings strike me as a lot better UX than “carefully look for spelling errors or misleading domain names”.

The way forward is to make it straight-forward to implement signing in apps and then just do it as a developer, whether asked or not; just as you set up https whether you’re asked or not. I’ll write a follow-up with more technical details later, assuming no one pokes holes in this article :-)

#### Response to some feedback

Some response to some feedback that I couldn’t be bothered to integrate in the article’s prose:

  * “You can’t trust webmail with crypto!”
If you use webmail then you’re already trusting the email provider with everything. What’s so bad with trusting them to verify a signature, too?

We’re not communicating state secrets over encrypted email here; we’re just verifying the signature on “PayPal sent you a message, click here to view it”-kind of emails.

  * “Isn’t this ignoring the massive problem that is key management?”
Yes, it’s hard problem; but that doesn’t mean it can’t be done. I already mentioned some possible solutions in the article.




**Footnotes**

  1. We could make something better; PGP contians a lot of cruft. But for now PGP is “good enough”.





--------------------------------------------------------------------------------

via: https://arp242.net/weblog/signing-emails.html

作者：[Martin Tournoij][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://arp242.net/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Podesta_emails#Data_theft
[2]: https://www.eset.com/us/about/newsroom/corporate-blog/paypal-users-targeted-in-sophisticated-new-phishing-campaign/
[3]: https://www.paypal.com/cs/smarthelp/article/how-to-spot-fake,-spoof,-or-phishing-emails-faq2340
