[#]: subject: "North Korean Hackers Use Open Source Software In A Recent Attack"
[#]: via: "https://www.opensourceforu.com/2022/09/north-korean-hackers-use-open-source-software-in-a-recent-attack/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

North Korean Hackers Use Open Source Software In A Recent Attack
======
*Open source software has been a tool used by North Korea in its social engineering attacks against enterprises throughout the world.*

Since June 2022, a “highly operational, destructive, and sophisticated nation-state action organisation” linked to North Korea has been using open source software as a weapon in their social engineering attacks against businesses all over the world. High confidence was placed in Zinc, which is also known as Labyrinth Chollima, as the source of the incursions by Microsoft’s threat intelligence teams and LinkedIn Threat Prevention and Defense.

Attacks targeted workers at businesses in a variety of sectors, including media, defence and aerospace, and IT services in the United States, the United Kingdom, India, and Russia. The technology behemoth claimed to have seen Zinc using a “wide range of open source software including PuTTY, KiTTY, TightVNC, Sumatra PDF Reader, and muPDF/Subliminal Recording software installer for these attacks.”

Zinc “has been active since 2009 in activities geared at gathering political, military, and economic intelligence on North Korea’s international opponents and executing money creation initiatives,” according to CrowdStrike. The most recent discoveries are consistent with a recent study from Google-owned Mandiant, which exposed the adversary’s exploitation of PuTTY through phoney employment lures distributed to potential targets on LinkedIn as part of an operation known as Operation Dream Job.

This entails making initial connections with people by assuming the identity of a recruitment specialist in order to gain their trust. After that, the conversation is moved to WhatsApp where a customised lure document or seemingly benign software is transmitted, so starting the infection sequence.

After a successful penetration, the threat actor moves laterally across the network and uses the ZetaNile backdoor to exfiltrate the gathered, valuable information (aka BLINDINGCAN OR AIRDRY). However, the implant is only downloaded when the victim uses the SSH clients to connect to a specific IP address using the credentials supplied in a separate text file. This is done to dodge security measures and prevent raising alarms.

Similar to this, assaults using the trojanized TightVNC Viewer are set up to only install the backdoor when the user chooses a specific remote host from the available alternatives.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/09/north-korean-hackers-use-open-source-software-in-a-recent-attack/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
