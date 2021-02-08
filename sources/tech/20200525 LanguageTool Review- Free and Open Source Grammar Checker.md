[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (LanguageTool Review: Free and Open Source Grammar Checker)
[#]: via: (https://itsfoss.com/languagetool-review/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

LanguageTool Review: Free and Open Source Grammar Checker
======

This week’s open source software highlight is [LanguageTool][1]. It is a proofreading software that checks the grammar, style and spelling in more than 20 languages.

I have been using it for past several days and I feel confident enough to review it and share my experience with it. I have used the popular proofreading tool [Grammarly][2] in the past and I’ll make some comparison between these two tools.

### LanguageTool: Open source proofreading software

![][3]

[LanguageTool][1] grammar checker is available in [multiple formats][4]:

  * You can copy-paste your text on its website.
  * You can install browser extension that will check for errors as you type anything, anywhere in the web browser.
  * You can install a Java-based desktop application for offline usage.
  * You can install add-on for LibreOffice and MS Office.
  * Add-ons are also [available for a number of other software][5] like Sublime Text, Thunderbird, Vim, Visual Studio Code etc.
  * [Android app][6] is also available.
  * API is also available if you want to use LanguageTool in your software or service. API offering comes under premium services.



You can find source code of LanguageTool and its related assets on [their GitHub repository][7].

[LanguageTool also has a premium version][8] that you can purchase. The premium version offers additional error checks.

I am using LanguageTool premium version as a browser extension. Almost all the writing I do is online and thus the browser extension is perfect for me.

The most convenient way to try LanguageTool is by using its browser extension. Install the browser add-on and next time you type anything in the browser, LanguageTool will start checking your text for grammatical and spelling errors. It will also check for styling errors.

### Experience with LanguageTool: How good is it?

LanguageTool leaves a good first impression. It starts checking for errors as you start typing.

Different types of errors have different color codes. Spelling mistakes are highlighted in red color, grammatical mistakes are in yellow colors and styling errors have a blueish shade.

Clicking on the error suggestion replaces your text with the suggested one. You may also ignore the suggestion. You’ll also see number of issues identified by LanguageTool in the current text check.

![Spelling mistake identified by LanguageTool][9]

#### Personal dictionary

You can also create your personal directory and add words in it. This is helpful because no proofreading tool can give a green light to technical terms like systemd, iptables and brand names like [WireGuard][10]. To avoid these words labeled as spelling mistakes, add them to your personal dictionary.

You may edit your personal dictionary from your LanguageTool account.

![LanguageTool Personal Dictionary][11]

#### Details on the error suggestion

If it finds grammatical errors, it also gives a quick explanation of the error. You can get more details by clicking the tool tip which takes you to a reputable external source.

![You can get additional details on the errors][12]

#### Synonym suggestion (in beta)

If you double-click on a word, it will also suggest synonyms.

![][13]

#### Are there any privacy issues?

If you use the online services of LanguageTool, your text is sent to their servers over an **encrypted** connection. All their servers are hosted at Hetzner Online GmbH in Germany.

LanguageTool states that it doesn’t store any text that you check using its services. You can read their privacy policy [here][14].

The free to use languagetool.org website shows ads (there are no third-party ads in the browser add-on). To test their claim of “sending text over an encrypted server”, I typed sample text containing words like vacuum cleaner, laptop etc.

Thankfully, the displayed ad on their website was nothing related to the text I typed. I haven’t noticed any vacuum cleaner ads on the websites I visit or on Facebook. That’s a good thing.

#### It doesn’t work flawlessly all the time

No software is perfect and LanguageTool is not an exception. While it is helpful in finding obvious spelling and grammatical mistakes, it struggles in some simple scenario.

For example, if a sentence contains several blank spaces together, LanguageTool failed to find an issue with that.

![Too many whitespaces and yet it went undetected][15]

This is weird because if I look at their ‘error rules’, I can see a [whitespace repetition rule][16]. I think this rule is applicable only for the Java-based LanguageTool apps, not the browser add-on I am using.

I also found some other cases where LanguageTool should have identified errors but it didn’t. For example, it didn’t alert for the missing ‘to’ in the text below:

![LanguageTool fails to find the missing “to”][17]

When I checked it against the [Grammarly free version][2], it was able to point it out.

![Grammarly was quick to identify it][18]

I also found an infinite loop of suggestion. It first suggests using syntaxes as plural of syntax.

![Suggestion for using ‘syntaxes’][19]

And then it doesn’t accept ‘syntaxes’ as a valid word.

![And then it doesn’t accept ‘syntaxes’][20]

I have seen such “infinite error loop” with Grammarly as well in the past, so I won’t be too hard on LanguageTool for such issues.

### Conclusion

Despite some hiccups, I am satisfied with LanguageTool proofreading tool. Both free and premium version are good enough for finding obvious spelling mistakes and grammatical errors.

The premium version offers over 2500 additional error checks and it costs around $15-$70 per year depending on your geographical region. This is a lot cheaper than [Grammarly][2] which costs $140 per year.

I opted for the premium version because it will help this open-source project. Premium users also get email support.

You are not forced to go premium, of course. You can use the free version and if you have some questions or need support, there is a [community forum][21] that you can join for free.

LanguageTool can certainly be considered one of the [essential open-source tools for writers][22]. I am going to continue using LanguageTool. If you find grammatical or spelling mistakes in It’s FOSS articles in the future, blame LanguageTool, not me. Just kidding :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/languagetool-review/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://languagetool.org/
[2]: https://itsfoss.com/recommends/grammarly/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/languagetool.png?fit=800%2C593&ssl=1
[4]: https://languagetool.org/compare
[5]: http://wiki.languagetool.org/software-that-supports-languagetool-as-a-plug-in-or-add-on
[6]: https://play.google.com/store/apps/details?id=org.softcatala.corrector
[7]: https://github.com/languagetool-org/
[8]: https://languagetoolplus.com/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/langaugetool-error-detection.png?ssl=1
[10]: https://itsfoss.com/wireguard/
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/languagetool-personal-dictionary.png?ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/languagetool-error-explanation.png?ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/languagetool-synonym-suggestion.png?ssl=1
[14]: https://languagetoolplus.com/legal/privacy
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/languagetool-whitespaces.png?ssl=1
[16]: https://community.languagetool.org/rule/show/WHITESPACE_RULE?lang=en
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/languagetool-suggestion-3.jpg?fit=800%2C219&ssl=1
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/languagetool-suggestion-grammarly.jpg?fit=800%2C272&ssl=1
[19]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/languagetool-suggestion.png?ssl=1
[20]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/languagetool-suggestion-1.png?ssl=1
[21]: https://forum.languagetool.org/
[22]: https://itsfoss.com/open-source-tools-writers/
