[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Open source fights against COVID-19, Google's new security tool written in Python, and more open source news)
[#]: via: (https://opensource.com/article/20/3/news-march-28)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

Open source fights against COVID-19, Google's new security tool written in Python, and more open source news
======
Catch up on the biggest open source headlines from the past two weeks.
![][1]

In this edition of our open source news roundup, we take a look open source solutions for COVID-19, Google's new security tool, code cleanup software from Uber, and more!

### Using open source in the fight against COVID-19

When COVID-19 started its march around the world, open source [stepped up][2] to try to help stop it. That includes using open data to [create tracking dashboards and apps][3], designing ventilators, and developing protective gear.

Scientists at the University of Waterloo in Canada have teamed with artificial intelligence firm DarwinAI to create an open source tool "[to identify signs of Covid-19 in chest x-rays][4]." Called COVID-Net, it's neural network "that is particularly good at recognizing images." The dataset the researchers are using is [available on GitHub][5], which includes a link the software.

Additionally, many [open source hardware projects][6] are underway to expedite the search for a cure. 

### Google releases tool to fight USB keystroke injection attacks

One of the sneakiest and potentially most malicious ways to hack a computer is a USB keystroke injection attack. Using a compromised USB device connected to a computer, a hacker can run commands without you even noticing. Google's making it easier for Linux users to fight back against these kinds of attacks by releasing [an open source detection tool][7].

Called USB Keystroke Injection Protection, the tool detects "if the keystrokes have been made without human involvement". It does that by measuring "the timing of keystrokes coming from connected USB devices." Sebastian Neuner of Google's Information Security Engineering Team said that while the USB Keystroke Injection Protection tool isn't the last word in defense against these kinds of attacks, but offers "another layer of protection and to defend a user sitting in front of their unlocked machine by them seeing the attack happening."

You can find the Python source code for the tool [on GitHub][8].

### Uber makes code deletion tool open source

As applications get bigger, they often contain code that's either no longer used or which is obsolete. That added code make software more difficult to maintain. To help solve the problem of quickly finding that redundant code, Uber recently [open sourced a tool called Pirhana][9].

Pirhana scans code for [feature flags][10], looking for ones that are no longer used. The software then deletes the unused flags from the code. At the moment, Pirhana works with software written in the Objective-C, Swift, and Java languages. Uber's developers hope the number of supported languages will increase "now that outside developers have an opportunity to contribute to the project."

You can grab [Pirhana's source code][11] from its repository on GitHub

#### In other news

  * [Singapore government to open source contact-tracing protocol][12]
  * [European Commission to use open source messaging service Signal][13]
  * [Spanish software to computerize healthcare in Cameroon and India][14]
  * [ING Open-Sources Lion, Its White-Label Web Component Library][15]
  * [Open Source Goes Mainstream – How Sharing Is Shaping The Future Of Music][16]



Thanks, as always, to Opensource.com staff members and [Correspondents][17] for their help this week.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/news-march-28

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/weekly_news_roundup_tv.png?itok=tibLvjBd
[2]: https://jaxenter.com/covid-19-open-source-170237.html
[3]: https://opensource.com/article/20/3/open-source-software-covid19
[4]: https://www.technologyreview.com/s/615399/coronavirus-neural-network-can-help-spot-covid-19-in-chest-x-ray-pneumonia/
[5]: https://github.com/lindawangg/COVID-Net
[6]: https://opensource.com/article/20/3/open-hardware-covid19
[7]: https://www.zdnet.com/article/google-linux-systems-can-use-this-new-tool-against-usb-keystroke-injection-attacks/
[8]: https://github.com/google/ukip
[9]: https://siliconangle.com/2020/03/17/ubers-open-source-piranha-tool-hunts-redundant-application-code/
[10]: https://en.wikipedia.org/wiki/Feature_toggle
[11]: https://github.com/uber/piranha
[12]: https://www.computerweekly.com/news/252480501/Singapore-government-to-open-source-contact-tracing-protocol
[13]: https://joinup.ec.europa.eu/collection/open-source-observatory-osor/news/signal-messaging-service
[14]: https://intallaght.ie/spanish-software-to-computerize-healthcare-in-cameroon-and-india/
[15]: https://www.infoq.com/articles/ing-open-sources-lion-web-component/
[16]: https://www.forbes.com/sites/andreazarczynski/2020/03/19/open-source-goes-mainstream--how-sharing-is-shaping-the-future-of-music/#9e1ca1290013
[17]: https://opensource.com/correspondent-program
