[#]: subject: "Manage your Gmail filters from the Linux command line"
[#]: via: "https://opensource.com/article/22/5/gmailctl-linux-command-line-tool"
[#]: author: "Kevin Sonney https://opensource.com/users/ksonney"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Manage your Gmail filters from the Linux command line
======
The gmailctl command-line tool manages email filters with a simple standards-based configuration file.

![email or newsletters via inbox and browser][1]
Image by: [Ribkahn][2] via [Pixabay][3], [CCO][4]

Automation is a hot topic right now. In my day job as an SRE part of my remit is to automate as many repeating tasks as possible. But how many of us do that in our daily, not-work, lives? This year, I am focused on automating away the toil so that we can focus on the things that are important.

Server-side mail rules are one of the most efficient ways to pre-sort and filter mail. Sadly, Gmail, the most popular mail service in the world, doesn't use any of the standard protocols to allow users to manage their rules. Adding, editing, or removing a single rule can be a time-consuming task in the web interface, depending on how many rules the user has in place. The options for editing them "out of band" as provided by the company are limited to an XML export and import.

I have 109 mail filters, so I know what a chore it can be to manage them using the provided methods. At least until I discovered [gmailctl][5], the command-line tool for managing Gmail filters with a (relatively) simple standards-based configuration file.

```
$ gmailctl test
$ gmailctl diff
Filters:
--- Current
+++ TO BE APPLIED
@@ -1 +1,6 @@
+* Criteria:
+ from: @opensource.com 
+ Actions: 
+ mark as important 
+ never mark as spam

$ gmailctl apply
You are going to apply the following changes to your settings:
Filters:
--- Current
+++ TO BE APPLIED
@@ -1 +1,6 @@
+* Criteria: 
+ from: @opensource.com 
+ Actions: 
+ mark as important 
+ never mark as spam
Do you want to apply them? [y/N]:
```

To define rules in a flexible manner `gmailctl` uses the [jsonnet][6] templating language. Using `gmailctl` also allows the user to export the existing rules for modification.

To get started, install `gmailctl` via your system's package manager, or install from source with `go install github.com/mbrt/gmailctl/cmd/gmailctl@latest`. Follow that with `gmailctl init` which will walk you through the process of setting up your credentials and the correct permissions in Google. If you already have rules in Gmail, I recommend running `gmailctl download` next, in order to backup the existing rules. These will be saved in the default configuration file `~/.gmailctl/config.jsonnet`. Copy that file somewhere safe for future reference, or to restore your old rules just in case!

If you wish to start from a clean slate, or you don't have any rules yet, you need to create a new, empty `~/.gmailctl/config.jsonnet` file. The most basic structure for this file is:

```
local lib = import 'gmailctl.libsonnet';
{
  version: "v1alpha3",
  author: {
    name: "OSDC User",
    email: "your-email@gmail.com"
  },
  rules: [
    {
      filter: {
        or: [
          { from: "@opensource.com" },
        ]
      },
      actions: {
        markRead: false,
        markSpam: false,
        markImportant: true
      },
    },
  ]
}
```

As you can see, this file format is similar to, but not as strict as `JSON`. This file sets up a simple rule to mark any mail from `opensource.com` as important, leave it unread, and not mark it as spam. It does this by defining the criteria in the `filters` section, and then the rules to apply in the `actions` section. Actions include the following boolean commands: `markRead`, `markSpam`,`markImportant`, and `archive`. You can also use actions to specify a `category` for the mail, and assign folders, which we will get to later in the article.

Once the file is saved, the configuration file format can be verified with `gmailctl test`. If everything is good, then you can use `gmailctl diff` to view what changes are going to be made, and `gmailctl apply` to upload your new rule to Gmail.

```
$ gmailctl diff
Filters:
---
Current
+++ TO BE APPLIED
@@ -1,6 +1,8 @@
* Criteria:
from: @opensource.com Actions:
+ archive
  mark as important
  never mark as spam 
+ apply label: 1-Projects/2022-OSDC

$ gmailctl apply -y 
You are going to apply the following changes to your settings:
Filters:
--- Current
+++ TO BE APPLIED 
@@ -1,6 +1,8 @@ 
* Criteria:
  from: @opensource.com Actions: 
+ archive
  mark as important 
  never mark as spam
  apply label: 1-Projects/2022-OSDC

Applying the changes...
```

As mentioned previously, new mail messages can be auto-filed by setting labels in the configuration. I want to assign all mails from Opensource.com to a folder specifically for them, and remove them from the inbox (or `archive` in Gmail terms). To do that, I would change the `actions` section to be:

```
actions: {
        markRead: false,
        markSpam: false,
        markImportant: true,
        archive: true,
        labels: [
          "1-Projects/2022-OSDC"
        ]
      },
```

As you can see in the image above, `gmailctl diff` now shows only what is going to change. To apply it, I used `gmailctl apply -y` to skip the confirmation prompt. If the label doesn't exist, then an error is given, since a filter cannot be made for a label that does not already exist.

You can also make more complex rules that target specific conditions or multiple emails. For example, the following rule uses an `and` condition to look for messages from `Cloudflare` that are not purchase confirmations.

```
filter: {
        and: [
          { from: "noreply@notify.cloudflare.com" },
          { subject: "[cloudflare]" },
          { query: "-{Purchase Confirmation}" }
        ]
      },
```

In the case of a rule that performs the same action on multiple messages, you can use an `or` structure. I use that to file all emails relating to tabletop games to a single folder.

```
filter: {
        or: [
          { from: "no-reply@obsidianportal.com" },
          { from: "no-reply@roll20.net" },
          { from: "team@arcanegoods.com" },
          { from: "team@dndbeyond.com" },
          { from: "noreply@forge-vtt.com" },
          { from: "@elventower.com" },
          { from: "no-reply@dmsguild.com"},
          { from: "info@goodman-games.com" },
          { from: "contact@mg.ndhobbies.com" },
          { from: "@monkeyblooddesign.co.uk" },
        ]
      },
```

For people with multiple Gmail accounts that need their own sets of rules, you can specify a unique configuration file for them with the `--config` command line parameter. For example, my work uses Gmail, and I have a whole *other* set of rules for that. I can create a new `gmailctl` directory, and use that for the work configuration, like so:

```
$ gmailctl --config ~/.gmailctl-work/ diff
```

To make this easier on myself, I have two shell aliases to make it clear which configuration I'm using.

```
alias gmailctl-home="gmailctl --config $HOME/.gmailctl"
alias gmailctl-work="gmailctl --config $HOME/.gmailctl-work"
```

The one drawback `gmailctl` has is that it will not apply a new filter to existing messages, so you still have to manually do things for mail received before doing `gmailctl apply`. I hope they are able to sort that out in the future. Other than that, `gmailctl` has allowed me to make adding and updating Gmail filters fast and almost completely automatic, and I can use my favorite email client without having to constantly go back to the web UI to change or update a filter.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/gmailctl-linux-command-line-tool

作者：[Kevin Sonney][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/newsletter_email_mail_web_browser.jpg
[2]: https://pixabay.com/en/users/ribkhan-380399/
[3]: https://pixabay.com/en/email-newsletter-marketing-online-3249062/
[4]: https://pixabay.com/en/service/terms/#usage
[5]: https://github.com/mbrt/gmailctl
[6]: https://jsonnet.org/
