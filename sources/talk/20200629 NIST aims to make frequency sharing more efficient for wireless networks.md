[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (NIST aims to make frequency sharing more efficient for wireless networks)
[#]: via: (https://www.networkworld.com/article/3561618/nist-aims-to-make-frequency-sharing-more-efficient-for-wireless-networks.html)
[#]: author: (Patrick Nelson https://www.networkworld.com/author/Patrick-Nelson/)

NIST aims to make frequency sharing more efficient for wireless networks
======
Machine-learning formula will help different radio protocols, such as Wi-Fi and LTE, work together more efficiently in the same wireless spectrum.
Martyn Williams/IDG

A machine-learning formula developed by the National Institute of Standards and Technology ([NIST][1]) has the potential to significantly improve how [5G][2] and other wireless networks select and share communications frequencies. Compared to trial-and-error methods, NIST's formula could make the process of sharing communications frequencies as much as 5,000 times more efficient, researchers claim.

The NIST system is based the idea that radio equipment can learn its network environments from experience rather than, as is done now, simply select frequency channels based on trial-and-error.

"The algorithm learns which channel provides the best outcome" under specific environmental conditions, NIST says in an [article on its website][3].

**READ MORE:** [How beamforming makes wireless communication faster][4]

"The formula could be programmed into software on transmitters in many [different] types of real-world networks," the team says.

Essentially, the computer-modeled algorithm is a formula that maps prior experience in environmental RF conditions. Those conditions can include the number of transmitters operating within a channel (set of adjacent frequencies), for example.

"… if a transmitter selects a channel that is not occupied, then the probability of a successful transmission rises, leading to a higher data rate," the article says. Likewise, when a transmitter selects a channel that doesn't have much interference on it, the signal is stronger, and you get a better data rate. The transmitter remembers which channel provides the best outcome and learns to choose that spot on the dial when it next needs a clear signal.

That's different from the way things generally work today. That is, a radio simply tries to find an open frequency and then communicates with like-protocol radios. In sophisticated cases, like Wi-Fi, for example, frequency hopping and [beamforming][4] are used to optimize channels.

Where NIST's machine-learning technique shines is in the case of shared spectrum, such as sharing Wi-Fi with License Assisted Access (LAA), the researchers explain. LAA is LTE in unlicensed spectrum, known as LTE-U, at 5 GHz. In that combination of Wi-Fi with LAA, on the same frequencies, the protocols are disparate: the radios don't communicate with each other to function in harmony, and chaos could occur the busier the band got—transmissions would bump into other transmissions. But, if all the radios were better at choosing their slot, by learning what works and what doesn't, then things would be better.

"This could potentially make communications in the unlicensed bands much more efficient," says Jason Coder, a NIST engineer, in the article.

Indeed, it "could help 5G and other wireless networks select and share communications frequencies about 5,000 times more efficiently than trial-and-error methods," NIST claims.

The key word here is "share," because in order to increase communications in limited spectrum, more sharing must take place—the users, such as IoT, or media streaming, are all competing for the same metaphorical real estate. Combining unlicensed and licensed bands, as is the case in LAA, will likely become more common as IoT and digital continues to expand. (Unlicensed bands are those not assigned to a specific user, like a mobile network operator; licensed bands are won in auctions and allocated.)

In the NIST scenario, the competing transmitters "each learn to maximize the total network data rate without communicating with each other." Therefore, multiple protocols and data types, like video or sensor data, or Wi-Fi and mobile networks, can function alongside each other.

NIST's formula significantly simplifies the process of assigning optimum channels to transmitters, according to the article: "The study found that an exhaustive effort [using trial and error] to identify the best solution would require about 45,600 trials, whereas the formula could select a similar solution by trying only 10 channels, just 0.02 percent of the effort."

The NIST researchers recently presented their research at [IEEE's 91st Vehicular Technology Conference][5], held virtually this year.

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3561618/nist-aims-to-make-frequency-sharing-more-efficient-for-wireless-networks.html

作者：[Patrick Nelson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Patrick-Nelson/
[b]: https://github.com/lujun9972
[1]: https://www.nist.gov/
[2]: https://www.networkworld.com/article/3330603/5g-versus-4g-how-speed-latency-and-application-support-differ.html
[3]: https://www.nist.gov/news-events/news/2020/05/nist-formula-may-help-5g-wireless-networks-efficiently-share-communications
[4]: https://www.networkworld.com/article/3445039/beamforming-explained-how-it-makes-wireless-communication-faster.html
[5]: https://events.vtsociety.org/vtc2020-spring/conference-sessions/program/
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
