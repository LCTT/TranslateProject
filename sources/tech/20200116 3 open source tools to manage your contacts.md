[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 open source tools to manage your contacts)
[#]: via: (https://opensource.com/article/20/1/sync-contacts-locally)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

3 open source tools to manage your contacts
======
Access your contacts more quickly by syncing them locally. Learn how in
the sixth in our series on 20 ways to be more productive with open
source in 2020.
![Team communication, chat][1]

Last year, I brought you 19 days of new (to you) productivity tools for 2019. This year, I'm taking a different approach: building an environment that will allow you to be more productive in the new year, using tools you may or may not already be using.

### Open source tools for contact management

In previous articles in this series, I explained how to synchronize your [mail][2] and [calendars][3] locally. Hopefully, that has sped up accessing your mail and calendar. Now I'll talk about contacts, which you can use to send mail and calendar invites.

![abook][4]

I have collected a lot of email addresses over the course of my, well, life so far. And managing all that data can be a bit of a pain. There are web-based services, but they aren't as fast as a local copy.

A few days ago, I talked about [vdirsyncer][5] for managing calendars. Vdirsyncer also handles contacts using the CardDAV protocol. Vdirsyncer supports **google_contacts** and **carddav** to do contact synchronizations in addition to the **filesystem** store it uses for calendars, but the **fileext** setting will change, so you won't be trying to store contacts in calendar files.

I added a configuration block to the config file and mirrored my contacts from Google. Extra steps are required to set it up. Once the Google setup is complete, the configuration is pretty simple:


```
[pair address_sync]
a = "googlecard"
b = "localcard"
collections = ["from a", "from b"]
conflict_resolution = "a wins"

[storage googlecard]
type = "google_contacts"
token_file = "~/.vdirsyncer/google_token"
client_id = "my_client_id"
client_secret = "my_client_secret"

[storage localcard]
type = "filesystem"
path = "~/.calendars/Addresses/"
fileext = ".vcf"
```

Now when I run **vdirsyncer discover**, it finds my Google contacts, and **vdirsyncer sync** copies them to my local machine. But again, that's only half the story. Now I want to read and use the contacts. Enter [khard][6] and [abook][7].

![khard search][8]

Why two applications? Each has its own use case, and in this case, more is better. Khard does for addresses what [khal][9] does for calendar entries. You'll probably want to install the latest release via pip if your distribution ships an older version. Once khard is installed, you need to create **~/.config/khard/khard.conf** because khard doesn't have a nifty configuration wizard the way khal does. Mine looks like this:


```
[addressbooks]
[[addresses]]
path = ~/.calendars/Addresses/default/

[general]
debug = no
default_action = list
editor = vim, -i, NONE
merge_editor = vimdiff

[contact table]
display = first_name
group_by_addressbook = no
reverse = no
show_nicknames = yes
show_uids = no
sort = last_name
localize_dates = yes

[vcard]
preferred_version = 3.0
search_in_source_files = yes
skip_unparsable = no
```

This defines the source address book (and gives it a friendly name), as well as what to display and what do use to edit contacts. Running **khard list** will list all the entries, and **khard list &lt;[some@email.adr][10]&gt;** will search for a specific entry. If you want to add or edit an entry, the **add** and **edit** commands launch the configured editor with the same basic template, the only difference being that the **add** template will be blank.

![editing in khard][11]

Abook requires you to import and export VCF files but offers some nice features for lookups. To convert your files to the abook format, first install abook and create the **~/.abook** default directory. Now tell abook to parse all the files and put them into the **~/.abook/addresses** file:


```
apt install abook
ls ~/.calendars/Addresses/default/* | xargs cat | abook --convert --informat vcard --outformat abook &gt; ~/.abook/addresses
```

Now run **abook**, and you'll have a very nice UI to browse, search, and edit the entries. Exporting them back to individual entries is a bit of a pain, so I do most of my edits with khard and have a cron job to import them into abook.

Abook can also search on the command line and has a lot of documentation about integrating it with mail clients. For example, you can use abook for lookups in the [Notmuch][12] email client [alot][13] by adding some information to the **.config/alot/config** file:


```
[accounts]
  [[Personal]]
     realname = Kevin Sonney
     address = [kevin@sonney.com][14]
     alias_regexp = kevin\[+.+@sonney.com][15]
     gpg_key = 7BB612C9
     sendmail_command = msmtp --account=Personal -t
     # ~ expansion works
     sent_box = maildir://~/Maildir/Sent
     draft_box = maildir://~/Maildir/Drafts
    [[[abook]]]
        type = abook
```

And there you have it: fast lookup of your contacts to go with your mail and calendars!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/sync-contacts-locally

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/talk_chat_team_mobile_desktop.png?itok=d7sRtKfQ (Team communication, chat)
[2]: https://opensource.com/article/20/1/sync-email-offlineimap
[3]: https://opensource.com/article/20/1/open-source-calendar
[4]: https://opensource.com/sites/default/files/uploads/productivity_6-1.png (abook)
[5]: https://github.com/pimutils/vdirsyncer
[6]: https://github.com/scheibler/khard
[7]: http://abook.sourceforge.net/
[8]: https://opensource.com/sites/default/files/uploads/productivity_6-2.png (khard search)
[9]: https://khal.readthedocs.io/en/v0.9.2/index.html
[10]: mailto:some@email.adr
[11]: https://opensource.com/sites/default/files/uploads/productivity_6-3.png (editing in khard)
[12]: https://opensource.com/article/20/1/organize-email-notmuch
[13]: https://github.com/pazz/alot
[14]: mailto:kevin@sonney.com
[15]: mailto:+.+@sonney.com
