Website operators are in the dark about privacy violations by third-party scripts
============================================================

JANUARY 12, 2018 

BY

 [ARVIND NARAYANAN][3] [5 COMMENTS][4]

by Steven Englehardt, Gunes Acar, and Arvind Narayanan.

Recently we [revealed][5] that “session replay” scripts on websites record everything you do, like someone looking over your shoulder, and send it to third-party servers. This en-masse data exfiltration inevitably scoops up sensitive, personal information — in real time, as you type it. We released the [data][6] behind our findings, including a list of 8,000 sites on which we observed session-replay scripts recording user data.

As one case study of these 8,000 sites, we found health conditions and prescription data being exfiltrated from walgreens.com. These are considered Protected Health Information under HIPAA. The number of affected sites is immense; contacting all of them and quantifying the severity of the privacy problems is beyond our means. We encourage you to check out our [data release][7] and hold your favorite websites accountable.

Student data exfiltration on Gradescope

As one example, a pair of researchers at UC San Diego read our study and then noticed that Gradescope, a website they used for grading assignments, embeds FullStory, one of the session replay scripts we analyzed. We investigated, and sure enough, we found that student names and emails, student grades, and instructor comments on students were being sent to FullStory’s servers. This is considered Student Data under FERPA (US educational privacy law). Ironically, Princeton’s own Information Security course was also affected. We notified Gradescope of our findings, and they removed FullStory from their website within a few hours.

You might wonder how the companies’ privacy policies square with our finding. As best as we can tell, Gradescope’s Terms of Service actually permit this data exfiltration [1], which is a telling comment about the ineffectiveness of Terms of Service as a way of regulating privacy.

FullStory’s Terms are a different matter, and include a clause stating: “Customer agrees that it will not provide any Sensitive Data to FullStory.” We argued [previously][8] that this repudiation of responsibility by session-replay scripts puts website operators in an impossible position, because preventing data leaks might require re-engineering the site substantially, negating the core value proposition of these services, which is drag-and-drop deployment. Interestingly, Gradescope’s CEO told us that they were not aware of this requirement in FullStory’s Terms, that the clause had not existed when they first signed up for FullStory, and that they (Gradescope) had not been notified when the Terms changed. [2]

Web publishers kept in the dark

Of the four websites we highlighted in our [previous post][9] and this one (Bonobos, Walgreens, Lenovo, and Gradescope), three have removed the third-party scripts in question (all except Lenovo). As far as we can tell, no publisher (website operator) was aware of the exfiltration of sensitive data on their own sites until our study. Further, as mentioned above, Gradescope was unaware of key provisions in FullStory’s Terms of Service. This is a pattern we’ve noticed over and over again in our six years of doing web privacy research.

Worse, in many cases the publisher has no direct relationship with the offending third-party script. In [Part 2][10] of our study we examined two third-party scripts which exploit a vulnerability in browsers’ built-in password managers to exfiltrate user identities. One web developer was unable to determine how the script was loaded and [asked us for help][11]. We pointed out that their site loaded an ad network (media-clic.com), which in turn loaded “themoneytizer.com”, which finally loaded the offending script from Audience Insights. These chains of redirects are ubiquitous on the web, and might involve half a dozen third parties. On some websites the majority of third parties have no direct relationship with the publisher.

Most of the advertising and analytics industry is premised on keeping not just users but also website operators in the dark about privacy violations. Indeed, the effort required by website operators to fully audit third parties would negate much of the benefit of offloading tasks to them. The ad tech industry creates a tremendous negative externality in terms of the privacy cost to users.

Can we turn the tables?

The silver lining is that if we can explain to web developers what third parties are doing on their sites, and empower them to take control, that might be one of the most effective ways to improve web privacy. But any such endeavor should keep in mind that web publishers everywhere are on tight budgets and may not have much privacy expertise.

To make things concrete, here’s a proposal for how to achieve this kind of impact:

*   Create a 1-pager summarizing the bare minimum that website operators need to know about web security, privacy, and third parties, with pointers to more information.

*   Create a tailored privacy report for each website based on data that is already publicly available through various sources including our own [data][1] [releases][2].

*   Build open-source tools for website operators to scan their own sites [3]. Ideally, the tool should make recommendations for privacy-protecting changes based on the known behavior of third parties.

*   Reach out to website operators to provide information and help make changes. This step doesn’t scale, but is crucial.

If you’re interested in working with us on this, we’d love to hear from you!

Endnotes

We are grateful to UCSD researchers Dimitar Bounov and Sorin Lerner for bringing the vulnerabilities on Gradescope.com to our attention.

[1] Gradescope’s [terms of use][12] state: “By submitting Student Data to Gradescope, you consent to allow Gradescope to provide access to Student Data to its employees and to certain third party service providers which have a legitimate need to access such information in connection with their responsibilities in providing the Service.”

[2] The [Wayback Machine][13] does not archive FullStory’s Terms page far enough back in time for us to independently verify Gradescope’s statement, nor does FullStory appear in [ToSBack][14], the EFF’s terms-of-service tracker.

[3] [Privacyscore.org][15] is one example of a nascent attempt at such a tool.

--------------------------------------------------------------------------------

via: https://freedom-to-tinker.com/2018/01/12/website-operators-are-in-the-dark-about-privacy-violations-by-third-party-scripts/

作者：[ ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:
[1]:https://webtransparency.cs.princeton.edu/webcensus/index.html#data
[2]:https://webtransparency.cs.princeton.edu/no_boundaries/session_replay_sites.html
[3]:https://freedom-to-tinker.com/author/randomwalker/
[4]:https://freedom-to-tinker.com/2018/01/12/website-operators-are-in-the-dark-about-privacy-violations-by-third-party-scripts/#comments
[5]:https://freedom-to-tinker.com/2017/11/15/no-boundaries-exfiltration-of-personal-data-by-session-replay-scripts/
[6]:https://webtransparency.cs.princeton.edu/no_boundaries/session_replay_sites.html
[7]:https://webtransparency.cs.princeton.edu/no_boundaries/session_replay_sites.html
[8]:https://freedom-to-tinker.com/2017/11/15/no-boundaries-exfiltration-of-personal-data-by-session-replay-scripts/
[9]:https://freedom-to-tinker.com/2017/11/15/no-boundaries-exfiltration-of-personal-data-by-session-replay-scripts/
[10]:https://freedom-to-tinker.com/2017/12/27/no-boundaries-for-user-identities-web-trackers-exploit-browser-login-managers/
[11]:https://freedom-to-tinker.com/2017/12/27/no-boundaries-for-user-identities-web-trackers-exploit-browser-login-managers/#comment-29002
[12]:https://web.archive.org/web/20180111185752/https://gradescope.com/tos
[13]:https://archive.org/
[14]:https://tosback.org/
[15]:https://privacyscore.org/
