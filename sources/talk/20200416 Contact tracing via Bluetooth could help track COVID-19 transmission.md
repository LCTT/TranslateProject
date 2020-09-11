[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Contact tracing via Bluetooth could help track COVID-19 transmission)
[#]: via: (https://www.networkworld.com/article/3538333/contact-tracing-via-bluetooth-could-help-track-covid-19-transmission.html)
[#]: author: (Jon Gold https://www.networkworld.com/author/Jon-Gold/)

Contact tracing via Bluetooth could help track COVID-19 transmission
======

Thinkstock

[[Get regularly scheduled insights by signing up for Network World newsletters.]][1]

A team of researchers from MIT has developed a novel method of tracking COVID-19 transmission among the population, using Bluetooth “chirps” that could automatically trace COVID-positive contacts and warn those who have potentially become infected, without violating their privacy.

The system is called PACT, or Private Automated Contact Tracing. It works by sending random strings of numbers via low-power Bluetooth from a user’s smartphone to other nearby devices using the system, creating a coded list of smartphones that a given user has been close to in the past 14 days.

If the user subsequently tests positive for COVID, he or she can upload that list of “chirps” to the database, so that other users can run a check to determine whether they might have exposed.

MIT said that the system uses advanced privacy protection methods to ensure the privacy of both COVID sufferers and those checking to see whether they’ve been exposed. People would need to opt in, and researchers specifically highlighted that PACT does not use any GPS, wireless location or phone ID information.

“For these broadcasts, we’re using cryptographic techniques to generate random, rotating numbers that are not just anonymous, but pseudonymous, constantly changing their ‘ID,’ and that can’t be traced back to an individual,” said MIT institute professor Ron Rivest, who led the project. (Rivest knows a  thing or two about cryptography: he’s the R in RSA, the first publicly available public-key cryptosystem.)

The idea behind PACT is to make sure that the system isn’t tracking any individuals specifically. Rather, it’s meant to be a yes/no resource for those wondering whether they may have been in proximity to someone with COVID. It’s currently at the proof-of-concept stage – the team recently overcame the hurdle of getting Androids and iPhones to speak to each other – and overtures have been made to smartphone makers, Apple, Google and Microsoft to try and get the system into the public’s hands as quickly as possible.

“The aim of the prototype is to prove to these developers that this is feasible for them to implement,” said Rivest.

**[ [Take this mobile device management course from PluralSight and learn how to secure devices in your company without degrading the user experience.][2] ]**

The team hopes that if PACT comes into widespread use it would enable a much more selective approach to quarantine and give communities the ability to return to normalcy more quickly. Tracking the spread of a disease like COVID with more speed and precision could let public health authorities suggest testing to specific groups of people if they notice a pattern emerging.

MIT also said that the team has demonstrated PACT to various government agencies, and coordinating similar efforts elsewhere in the U.S., as well as in Europe.

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3538333/contact-tracing-via-bluetooth-could-help-track-covid-19-transmission.html

作者：[Jon Gold][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Jon-Gold/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fcourses%2Fmobile-device-management-big-picture
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
