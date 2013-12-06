Open Source Is Here To Stay On IBM i
================================================================================
For years, open source software has been a bit of a redheaded stepchild in the button-down IBM midrange community. IBM i shops were hesitant to use it, and vendors were afraid to adopt it. But with so much of the computing world now running on open source, the aversion to open source has gradually melted away, and it has steadily crept into use among large corporations, and the IBM i world too.

It is tough to measure the adoption of open source software, which flows freely across networks by its very nature. Nobody requires you to register to use open source software, and there's no central clearinghouse of information about open source software.

However, recent surveys and audits point to greater adoption of open source across all industries. Open source software components are widely used in in the financial services industry, according to Julian Brook, associate director at SQS Software, which conducts software quality audits for financial software vendors. "I would say that, arguably, open source is used in every organization that is developing software, especially in the financial services world," Brook [told Out-Law.com recently][1].

Governmental agencies lead the way in use of open source software, according to [Black Duck Software][2]'s 2013 Future of Open Source survey. More than 35 percent of government representatives queried for the survey say they use open source, followed by medical (15.2 percent), media (13 percent), financial (8.8 percent), and retail (5.9 percent). You can view more of the survey at [Slideshare][3].

Increasingly, users are adopting open source software because they expect higher software quality and security with open source, according to surveys like those from Black Duck. That's very interesting, because for many years, open source software was largely avoided for those two very reasons.

These are opinion surveys, mind you. They're not necessarily reflections of actual reality. But it is clear than many of the shortcomings that people previously associated with open source software products are disappearing. And slowly but surely, this trend is bleeding over into the competitive world of IBM i software, too.

### Open Source Impacts On IBM i ###

The IBM i server is one of the last great bastions of proprietary technology in a world heading in the direction of open source. IBM does not share with the world the guts of the IBM i OS and the System Licensed Internal Code (SLIC) it runs on. You can take what access IBM provides developers to the machine, or you can leave it, but you can't get access to the internals.

What goes on above the OS and SLIC layers is another matter entirely. We're not seeing a big influx of open source software in the world of ERP and business applications. But in many other software categories, open source options are proliferating.

One IBM i proponent of open source software is [Raz-Lee][4]. The security software vendor, which relies on the open source [ClamAV][5] offering to power its IBM i-based anti-virus offering, called iSecurity Anti-Virus, says ClamAV had an update for an evolving security threat--the W32/Autorun.worm.aaeh Trojan Horse--months before its competitor had updated the signature library for its IBM i-based antivirus offering.

"It turns out that ClamAV has been handling this threat . . . as of about eight to nine months ago," Raz-Lee vice president of business development Eli Spitz wrote in an email to IT Jungle last month. "In fact, one of our technicians here at Raz-Lee actually added his own unofficial signature to ClamAV's database before ClamAV included their formal signature for this virus."

Another IBM i software vendor using open source tools is [Arpeggio Software][6] . The Atlanta, Georgia-based company uses lots of open source components in its various IBM i utilities, which aren't available under an open source license, but which Arpeggio gives away and then charges customers to get technical support, a common approach taken by commercial open source vendors.

Arpeggio's latest offering, called ARP-DROP, uses the open source OAuth authentication method to help secure communication channels between IBM i servers and [DropBox][7] service running on the Internet. It also uses the OpenSSH encryption technology with ARP-SFTP client for IBM i. Arpeggio's founders (who also founded Trailblazer Systems, now part of [Liaison Technologies][8]) acknowledge that IBM i professionals could adopt the same open source tools to write similar tools. But they argue that Arpeggio does it better, so why not adopt their free tools and save yourself the time?

In many cases, an IBM i shop's first conscious exposure to open source is the server side scripting language PHP. IBM and [Zend Technology][9] have worked for years to make PHP run well on IBM i, and Zend's entry-level PHP runtime is shipped along with every Power Systems server and IBM i license.

One of the most popular PHP applications that run on IBM i servers is [SugarCRM][10]. Representatives with the Cupertino, California, company recently said that it has nearly 1,000 customers running the CRM software on IBM i servers. This includes paid enterprise licenses along with free community edition licenses.

### Fighting Perceptions ###

Most IBM i shops are big users of IBM i software, whether they know it or not. Some of the biggest, most important IT infrastructure components come from open source, including the Apache Web server, the Linux OS, the Java and PHP programming languages, the MySQL database, and the Eclipse development environment.

There's no reason not to call open source "commercial grade" anymore, Raz-Lee's Spitz said. "A few weeks ago Sourcefire, the owners of ClamAV, was purchased by [Cisco Systems][11]. That's obviously a 'certification' by a large commercial organization for open source software. So open source anti-virus software seems to be valuable to a multi-national company."

While open source software is making inroads in the IBM i community, it still has a ways to go to match the momentum that open source enjoys in the IT market as a whole. "It seems that the IBM i community is often less involved with open source and is not exposed to its importance and prevalence in the current computing area," Spitz said. "In many cases, open source is the 'playground' of very large companies who join to create a better arena for us all."

As the corporations of the world gradually becomes amenable to open source, the IBM i community will have no choice but to follow. 

--------------------------------------------------------------------------------

via: http://www.itjungle.com/tfh/tfh120213-story01.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.out-law.com/en/articles/2013/september/open-source-code-use-within-financial-services-organisations-visibility-only-50-at-best-says-software-quality-expert/
[2]:http://www.blackducksoftware.com/
[3]:http://www.slideshare.net/blackducksoftware/the-2013-future-of-open-source-survey-results
[4]:http://www.razlee.com/
[5]:http://www.clamav.net/
[6]:http://www.arpeggiosoftware.com/
[7]:http://www.dropbox.com/
[8]:http://www.liaison.com/
[9]:http://www.zend.com/
[10]:http://www.sugarcrm.com/
[11]:http://www.cisco.com/