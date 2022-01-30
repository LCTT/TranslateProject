[#]: subject: "Open source tools to make your Wordle results accessible"
[#]: via: "https://opensource.com/article/22/1/open-source-accessibility-wordle"
[#]: author: "AmyJune Hineline https://opensource.com/users/amyjune"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Open source tools to make your Wordle results accessible
======
Sharing your Wordle results is fun. Make sure they are accessible by
trying these open source tips.
![Women in computing and open source v5][1]

Wordle seems to be popping up everywhere across social media feeds. Wordle is a quick word game that you can play once daily, and you can easily share results with friends over social media.

The aim of Wordle is to guess a secret word. To make a guess, enter a word, and Wordle displays the results of your guess in a grid of color-coded emoticons. Green indicates that a letter is in the correct location. Yellow indicates that the secret word contains the letter, but it is in the wrong location. And grey means that the letter isn't in the word at all.

![Sample of wordle results displaying colors for letter position][2]

AmyJune Hineline (CC BY-SA 4.0)

It's become common for people to share their progress in the game by pasting the resulting letter grid into social media, which is easy to do because the grid is just a [set of emoji][3]. However, emoticons and emoji have accessibility issues. While they're easy to copy and paste, the shared results can be hard to access for individuals who live with low vision or color blindness. The colors grey, yellow, green can be difficult for some to differentiate.

![Wordle results statistics][4]

AmyJune Hineline (CC BY-SA 4.0)

Inspired by a conversation I had with Mike Lim, I did some poking on the internet and discovered a couple of tips, including an open source project that helps improve the accessibility of shared game results.

### Use an open source accessibility app

The [wa11y app][5] is straightforward to use. You can find the wa11y GitHub project [here][6]. Copy your Wordle results and paste them into the app, and it converts your results into words.

![Emoji converted to words][7]

AmyJune Hineline (CC BY-SA 4.0)

You can include emoticons with a simple checkbox to indicate a successful guess, but maintainers warn against this. Assistive technology loves emoticons so much that it reads each and every emoticon. Inline. All of them. Although the technology loves to read them, folks who utilize assistive technology may find it cumbersome and often abandon a message with more than a few emoji.

![Words and emoji included in the output][8]

AmyJune Hineline (CC BY-SA 4.0)

![Emojis are beautiful, but can be frustrating for folks who use screen readers and other accessibility tools. Please consider your audience on social media.][9]

AmyJune Hineline (CC BY-SA 4.0)

### Provide accessible images

Perhaps you don't have access to the wal11y app and still want to ensure your results are accessible. You can take a screenshot, upload the image, and add alt text. There are a few ways you can do this:

  * Attach the image and write the alt text in the message field.
  * Attach the image and dive into the accessibility options for your specific social media app and enable alt text and add from there. The open source social network [Mastodon][10] enables actual alt text by default.
  * [@AltTxtReminde][11]r is an account you can follow that reminds you to add alt text to images when you forget.



If you do share the default results, there is always the option to add alt text before the emoticons. That way, your audience has access to the text information but can abort the rest of the message before repeating emoji becomes cumbersome.

![Twitter wordle results without text][12]

AmyJune Hineline (CC BY-SA 4.0)

![Twitter results with descriptive explanation of results][13]

AmyJune Hineline (CC BY-SA 4.0)

### Wrap up

Wordle is a hot game on the internet these days, so when sharing your results be sure to keep accessibility in mind. There are a few simple approaches using open source technology to make your results easier to share with everyone.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/open-source-accessibility-wordle

作者：[AmyJune Hineline][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/amyjune
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_5.png?itok=YHpNs_ss (Women in computing and open source v5)
[2]: https://opensource.com/sites/default/files/apple.png
[3]: https://opensource.com/article/19/10/how-type-emoji-linux
[4]: https://opensource.com/sites/default/files/statistics.png
[5]: http://wa11y.co/
[6]: https://github.com/cariad/wa11y.co
[7]: https://opensource.com/sites/default/files/do-not-include-emoji.png
[8]: https://opensource.com/sites/default/files/include-emoji.png
[9]: https://opensource.com/sites/default/files/wa11y_0.png
[10]: https://opensource.com/article/17/4/guide-to-mastodon
[11]: https://twitter.com/alttxtreminder
[12]: https://opensource.com/sites/default/files/twitter.png
[13]: https://opensource.com/sites/default/files/twitter-with-ords.png
