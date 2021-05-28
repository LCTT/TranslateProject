[#]: subject: (‘Have I been Pwned’ is Now Open Source to Check Passwords)
[#]: via: (https://news.itsfoss.com/pwned-passwords-open-source/)
[#]: author: (Ankush Das https://news.itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

‘Have I been Pwned’ is Now Open Source to Check Passwords
======

[Have I been Pwned][1] is a popular website to check if your email has been a part of a data breach.

A few years back, probably only the ones interested in their digital safety knew about it. But now — almost every service like [Firefox Monitor][2] utilizes the database of Have I been Pwned to check for security breaches and notify users.

While the creator (Troy Hunt) already [decided to make the entire project open source][3] last year, it is still something that will take time.

However, thanks to [.NET foundation][4], he managed to finally open-source “[Pwned Passwords][5]“.

You can find two repositories in [GitHub][6] for now which is only for the password portal. The codebase for monitoring emails and phone numbers in data breaches will follow in the near future.

![][7]

In other words, yes, you can host your instance to check for password breaches integrating it to your business or any other services that you can think of.

### Check New Compromised Passwords With the Help of FBI

![][8]

Not just limited to the open-source codebase available at [GitHub][6] for Pwned Passwords, FBI has also come up to help inject newly discovered passwords to the password search portal.

Fret not, FBI has nothing to do with how it works, but they will be providing more data. So, it will make the online portal more effective for users looking to see if their passphrase is a part of a data breach.

Troy mentioned more about it in his [blog post][9]:

> Their goal here is perfectly aligned with mine and, I dare say, with the goals of most people reading this: to protect people from account takeovers by proactively warning them when their password has been compromised. Feeding these passwords into HIBP gives the FBI the opportunity to do this almost 1 billion times every month. It’s good leverage ![][10]![🙂][11]

And, you get to self-host it if you want! Sounds exciting, right?

### Help Needed From the Open Source Community

Considering it as the first step of the project to be available for the community, Troy does have some ideas on the implementation of how a law enforcement agency can safely contribute password information to ‘**Pwned Passwords**‘.

The ability to let others contribute to the database will also open doors to other law enforcement agencies to join hands.

So, if you are interested in that, you can go through all the details shared in his [blog post][9] and contribute to the available repositories as per your expertise.

I think this is definitely an exciting addition to the open-source community which should play a key role in helping users to monitor their passwords, email addresses, and phone numbers whenever there is a data breach.

_What do you think? Let me know your thoughts in the comments._

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/pwned-passwords-open-source/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://haveibeenpwned.com
[2]: https://monitor.firefox.com
[3]: https://www.troyhunt.com/im-open-sourcing-the-have-i-been-pwned-code-base/
[4]: https://dotnetfoundation.org
[5]: https://haveibeenpwned.com/Passwords
[6]: https://github.com/HaveIBeenPwned
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjM4OCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[8]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjMzMiIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[9]: https://www.troyhunt.com/pwned-passwords-open-source-in-the-dot-net-foundation-and-working-with-the-fbi/
[10]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjcyIiB3aWR0aD0iNzIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[11]: https://i0.wp.com/s.w.org/images/core/emoji/13.0.1/72x72/1f642.png?w=780&ssl=1
