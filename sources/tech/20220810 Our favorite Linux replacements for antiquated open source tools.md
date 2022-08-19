[#]: subject: "Our favorite Linux replacements for antiquated open source tools"
[#]: via: "https://opensource.com/article/22/8/replace-antiquated-linux-tools"
[#]: author: "Opensource.com https://opensource.com/users/admin"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Our favorite Linux replacements for antiquated open source tools
======
We asked our community of contributors what open source tools they are using in place of those that feel outdated or antiquated.

Here at [Opensource.com][2], we thought it would be interesting to survey some of our authors to get a feel for what tools they feel are antiquated (but perhaps still useful!) and what they think of the replacement utilities. What follows is a series of responses and a bit of fun, too.

We sent out the following prompt:

* Have you discovered some of your favorite tools have become outdated or deprecated? Or maybe you just switched it up for something new?
* What do you use now? Tell us a little about how you feel it is helpful to have made the switch.

### Firewalls

A biggie for me is iptables. I sweated blood learning how to use iptables, and ebtables, and arptables, and how to manipulate MAC addresses, and more. I built dozens of firewalls around scripts to set up rulesets, and I eventually got pretty good at it. Now nftables makes all that obsolete. The fun never stops. I still think somebody with marketing clout could make software-defined boundaries work. —[Greg Scott][3]

#### +1 on iptables

I have been using iptables since I first learned Linux 25+ years ago. The newest tool is firewalld, but that and all other firewall tools I have seen for Red Hat-based distros are still based on and wrap around the kernel-level netfilter modules. I find the [firewalld][4] tool creates huge sets of rules that don't do anything more for me than the older iptables. I am sure some large environments need those complex rulesets, but they could also be implemented using iptables or scripts like Greg's.

I do like `nmcli`, but it is taking me some time to learn it. In fact, I prefer it to the old `ifcfg` and `ip` commands. It feels more integrated into the system than the older ones. But I do like the older `ifcfg-` interface configuration files. Those are easy to create and understand. They don't require the INI-style format that requires section headers. In fact, the old-style files are not even sequence sensitive. —[David Both][5]

#### ipchains?

To further underscore this example, are you sure you weren't using ipchains back then? (The ipfirewall and ipfwadm successor, ipchains wasn't supplanted by iptables until around 2001.) —[Jeremy Stanley][6]

*In response to Jeremy. ^^*

My very first firewall was ipchains, circa late 1999. Everything after that was iptables. Back then, I had to build my own kernel to get all the netfilter modules I needed. Modern conveniences like flat-panel monitors and DSL were science fiction in those days. And don't even think about fiber. I had to ride a horse uphill through blizzards every day to visit customers. And then it was uphill back home, too. —[Greg Scott][7]

### Text editing

I just have to ask—who's still using troff (groff) and who has moved on to... hmm, shall we say, LibreOffice or AsciiDoctor or...?

I have a dear friend who continues with a troff-based product on his Sun SPARCStation V. —[Chris Hermansen][8]

**[[ Related read Old-school technical writing with groff ]][9]**

#### Editing man pages

*^^ In response to Chris*

Anyone maintaining man pages! Though lots of people are probably generating those from other markup these days. Some folks (like me) do still compose or edit the troff files directly instead. —[Jeremy Stanley][10]

#### Markup stacks

There are always people who use older things, but there are superior tools nowadays. I wouldn't use LibreOffice for the kind of stuff you'd use troff/groff for—if you are writing at that level, you probably depend on a text editor you know well, source-control for managing your inputs, and you are comfortable with markup languages.

That means you want to use a markup stack. There are many, including:

* Sphinx + ReST + GitHub Actions + GitHub Pages
* MkDocs + Markdown + GitLab CI + GitLab Pages
* Nikola + Jupyter Notebooks + Jenkins + (AWS S3 + CloudFront)

What is common to all the stacks is:

* A thing that pulls different input files into one coherent whole (Sphinx/MkDocs/Nikola)
* A reasonably high-level text markup language (ReST/Markdown/MD embedded in Jupyter Notebooks)
* A CI pipeline to transform those into the output format (usually a tree of HTML files, but sometimes a PDF or something)
* A place where people can download the published version (GitHub Pages, GitLab Pages, AWS S3 + CloudFront)

I'll note that these are pretty much orthogonal choices. Any reasonable generator can take any input (even MkDocs, for which it is least true, has the mkdocs-gen-files plugin so you can use Pandoc to convert stuff to Markdown). Any reasonable CI can run any generator and push to any target.

So even with the list above, there are 81 stacks available.

(Sphinx/MkDocs/Nikola) x (ReST/Markdown/Jupyter Notebooks) x (GHA/GitLab CI/Jenkins) x (GHP/GLP/S3+CF)

Because Pandoc understands troff (ms/man), you can plug troff+ms or troff+man into the "markup" slot if you really want to. You can probably install Jenkins on the Sun SPARCStation V and keep using the same machine and format. But why? :)

There's probably an article for OSDC there: "How I converted troff docs to a modern stack using mkdocs+mkdocs-gen-files and GitLab CI." —[Moshe Zadka][11]

#### Other groff examples

Actually, I'm writing an article right now about "Old school technical writing with groff" (part of a larger series I'm writing about tech writing tools). I don't use groff for serious tech writing, but it's in my toolkit of things I learned and will probably never forget. And I review groff when I teach "Writing with Digital Technologies."

While writing the article, I recalled that when I installed Linux in 1993, there weren't *any* writing apps on Linux. No word processors, just groff and LaTeX. I used LaTeX to write my physics lab reports (because it could do math easily) and groff to write papers for other classes (because I could opt to print to a line printer instead, which I thought was a clever way to make my paper look longer). If I wanted to write with a word processor, I had to dual-boot back to DOS to run WordPerfect or Galaxy Write. StarOffice came out for Linux in 1996. I bought StarOffice.

Interestingly, Brian Kernighan still writes all his books in groff. "Unix: A History and a Memoir" (2020) and "Understanding the Digital World" (2021) were both completely processed in groff. —[Jim Hall][12]

### Revisiting the fmt command

I use the `fmt` command a lot these days. It's really handy for a ton of stuff. If you write Readme documentation (or other docs) in plain text, you know the pain when you insert some new text in the middle of a line, and then the lines don't end at the same column. You can run `fmt` to clean that up.

More commonly, I'm on an email list where list members prefer to receive emails in plain text, so my email client is set for plain text most of the time. If I need to reply to someone's list email (and they didn't send it in plain text), a paragraph is usually just one long line, and my email client doesn't correctly line-wrap when I reply. It's just `>` at the start of a long sentence.

So I do this:

```
$ fmt -p '>' > /tmp/f
{copy & paste ">" quoted text}
^D
```

And then:

```
$ cat /tmp/f
```

And then copy and paste the result into my email. —[Jim Hall][13]

### Changes to bootloaders

Just when your *foo* is sufficiently sharp, there are reasonable odds the tools will be replaced.

LILO to GRUB was painful until my GRUB-foo reached a sufficient level. GRUB2 is awesome, but a new learning curve.

Muscle memory is also an issue — `ipconfig`, `nslookup`, and `netstat` are on auto-pilot. Plus, if you're using other Linux environments, like Tiny Core Linux, you might not always have the latest and greatest tools.

Switching from `if-cfg` -style scripts to `nmcli` is the new learning curve, so this never really ends. —[Steven Ellis][14]

**[[ Related read 6 deprecated Linux commands and the tools you should be using instead ]][15]**

### Quick FIPS set up

Often things change for the better; my two cents. The question was asked, *Have you discovered some of your favorite tools have become outdated or deprecated? Or maybe you just switched it up for something new?*

A colleague recently asked me how to enable FIPS on Linux, and it's something I had not done in a while. I remember how arcane this process was, which involved enabling a repo, installing a package (dracut-fips), running commands (`dracut` ) to regenerate initramfs, modifying the GRUB bootloader config file (fips=1), etc.

Also, *What do you use now? Tell us a little about how you feel it is helpful to have made the switch.*

Luckily on RHEL9, the above has been replaced by the `fips-mode-setup` command with two handy flags, `--check` and `--setup`. That's it! Run those commands, reboot the system, and your machine boots up with FIPS enabled. Super easy! —[Gaurav Kamathe][16]

### Old and comfortable

Clearly, both the fun of open source and the strong opinions are still present, as is the variety of tools and the freedom to choose what works best for you. Perhaps these tools and others like them are old—even antiquated—but they may still serve a purpose. Some of these older utilities inspired more modern solutions without losing their own inherent value. Finally, there's something to be said for user comfort and familiarity. With open source, all those hours spent developing your foo need not be lost just because some vendor decided it was time for a new release.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/replace-antiquated-linux-tools

作者：[Opensource.com][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/admin
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/GOV_2dot0.png
[2]: https://opensource.com/
[3]: https://opensource.com/users/greg-scott
[4]: https://www.redhat.com/sysadmin/secure-linux-network-firewall-cmd
[5]: https://opensource.com/users/dboth
[6]: https://opensource.com/users/fungi
[7]: https://opensource.com/users/greg-scott
[8]: https://opensource.com/users/clhermansen
[9]: https://opensource.com/article/22/8/old-school-technical-writing-groff
[10]: https://opensource.com/users/fungi
[11]: https://opensource.com/users/moshez
[12]: https://opensource.com/users/jim-hall
[13]: https://opensource.com/users/jim-hall
[14]: https://opensource.com/users/steven-ellis
[15]: https://www.redhat.com/sysadmin/deprecated-linux-command-replacements?intcmp=7013a000002qLH8AAM
[16]: https://opensource.com/users/gkamathe
