[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to conveniently unsubscribe from a mailing list)
[#]: via: (https://opensource.com/article/20/2/how-unsubscribe-mailing-list)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

How to conveniently unsubscribe from a mailing list
======
Cut down on your email clutter by removing yourself from email lists you
no longer need.
![Photo by Anthony Intraversato on Unsplash][1]

If you're on an email discussion group long enough, at some point, you'll see an email from a list member asking to be unsubscribed. Typically, at least 10 other people on the list will respond with instructions on how to unsubscribe, and those 10 responses will be answered by 10 more people confirming or commenting on the instructions. That's a _lot_ of traffic to a mailing list just so one person can unsubscribe.

But unsubscribing from a list can be confusing, especially if you've gotten on the list by accident. It's frustrating to discover that you've been added to a list, and it's annoying that you have to take time out of your day to extricate yourself. This article is here to help make unsubscribing fast, easy, and graceful.

Never send an unsubscribe email to the same email address you use to post messages

### Unsubscribe by email

Mailing lists are controlled by mailing list software (like [GNU Mailman][2]) on a server. You probably aren't aware of the software controlling a mailing list you're on, because they're usually designed to stay out of the way and just deliver mail. But as a member of a mailing list, you actually have some user control over the software.

Some mailing lists allow you to unsubscribe using an automated email address. It can be a little confusing because the email address you use to unsubscribe is NOT the email address you use to send messages to the list. Essentially, you're sending a special command to the email server, telling it to take you off the list. This is a convenient method of unsubscribing because it means you don't have to compose a message or wait for anyone to take action. You speak directly to the computer sending the email, and it does exactly as it's told.

To unsubscribe from a list, take the email address of the list, add **-leave** just before the **@** symbol, and send a message. You can email a blank message; the computer doesn't care. The fact that you're emailing the list with the **-leave** command in front of the **@** symbol is all it needs.

Here's an example.

Say you've joined the mailing list Funny Squirrels. You send a few messages to [funnysquirrels@example.com][3] but soon find that squirrels are not as amusing as you'd hoped. To unsubscribe, you can send an email to:


```
`funnysquirrels-leave@example.com`
```

You may get a final confirmation email back, and then you'll hear from the mailing list no more.

#### Custom email commands

Sometimes the administrator of a mail server changes the command for unsubscribing. Ideally, they'll include the unsubscribe email address in the footer of emails sent to the mailing list, so check for that before sending your parting email.

The thing to keep in mind is that an unsubscribe email _never_ goes to the actual list, meaning you should never send an unsubscribe email to the same email address you use to post messages. There's a special, separate email address reserved for the unsubscribe command.

### Unsubscribing by webform

Some mailing lists have a webform for unsubscribing, and ideally, it can be found in the footer of each mailing list message. You can navigate to the webform and opt out of your subscription.

This method is common for commercial mailing lists, and it's sometimes a way for them to capture any feedback you have about the list, why you're leaving, and so on. Like the automated email method, the intent is for you to maintain full control of your own subscription. You never have to wait for a human to take you off of a list; instead, you can issue commands directly to a computer.

![Example unsubscribe web form][4]

A webform may send you a final confirmation email, and after that, you should hear nothing from that mailing list ever again.

### Unsubscribing like a pro

Leaving a mailing list is a guilt-free and nonaggressive act. When you want to leave a mailing list, you should be able to find an unsubscribe email address or webform to make it automated and final.

If, in spite of using the methods above, you can't leave a mailing list, don't email the list. Very few people on the mailing list have control over who is subscribed, and sometimes the people who have access to the list of subscribers are not monitoring the list—they're only maintaining the server. Instead, find out what server hosts the mailing list, and contact the hosting provider to alert them of the abuse.

You can find the host of a mailing list by searching for the server name (the part of the email address to the _right_ of the **@** symbol) on a **whois** service. If you're running Linux, you can do this from a terminal:


```
`$ whois <example.com>`
```

Otherwise, use the [Whois.net][5] website.

Whois provides the internet hosting provider of any email server plus the abuse and support contact information.

Remember: you are always free to leave a mailing list for any reason, without getting permission from anyone else. And now that you know how, you'll be able to unsubscribe like a pro!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/how-unsubscribe-mailing-list

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/anthony-intraversato-pt_wqgzaiu8-unsplash.jpg?itok=5bbMlgt8 (Photo by Anthony Intraversato on Unsplash)
[2]: https://www.list.org/
[3]: mailto:funnysquirrels@example.com
[4]: https://opensource.com/sites/default/files/uploads/mail-webform.jpg (Example unsubscribe web form)
[5]: http://whois.net
