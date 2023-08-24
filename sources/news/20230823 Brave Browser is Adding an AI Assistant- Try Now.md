[#]: subject: "Brave Browser is Adding an AI Assistant: Try Now!"
[#]: via: "https://news.itsfoss.com/brave-browser-leo/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Brave Browser is Adding an AI Assistant: Try Now!
======
AI is everywhere. Now, on one of your favorite web browsers!
Like most [major web browsers][1], Brave Browser is now jumping into the **AI assistant bandwagon.**

The developers have built **a native AI assistant called 'Leo' for the Brave Browser** , now available for testing and feedback.

I took a look at Leo, and it seemed interesting. Allow me to take you through it.

🚧

Leo is not open-source, whereas Brave browser is.

### Brave Leo: What to Expect?

![][2]

Leo is your **run-of-the-mill AI assistant** that has been **integrated directly into the Brave Browser** , it can reply to your queries quickly, with mostly relevant results.

Hosted by Brave themselves, **Leo uses the recently released[Llama 2][3] open large language model (LLM)** by Meta and Microsoft as a foundation.

Brave also claims they have put a special focus on safety and privacy, ensuring that user inputs are always submitted through a [reverse-proxy][4] to their inference infrastructure.

They also mention:

> We’ve specifically tuned the model prompt to adhere to Brave’s core values. However, as with any other LLM, the outputs of the model should be treated with care for potential inaccuracies or errors.

**As for what Leo can do, allow me to demonstrate.**

I took Leo out for a spin on the nightly build of Brave, and it worked quite well.

After accepting the terms of use, I ran a random query to generate gibberish cat talk, and I was not disappointed!

![][5]

Leo also had a neat little button to **erase conversation history** , but I think that won't be required because whenever you close Leo or restart Brave, **all the conversation history is deleted by default**.

For now, this is because **Leo cannot be used for training purposes** , and **no data is ever stored on Brave's servers** , as conversations are discarded immediately after the reply is generated.

![][6]

That's not all Leo can do; if you visit a site, it **could provide you with a summary of the content**.

When I first tried it out, it showed me an option to **enable suggested questions;** I did that and then read an article.

![][7]

As you can see, it has quite a few options, one was to summarize the article, and the others were essential questions related to the article that it could answer.

**Suggested Read** 📖

![][8]

![][9]

Post that, I made Leo summarize the article, and it showed me a nice summary of the whole article. I wished it would organize the output more for readability, but that's just me. 😅

![][10]

Other than that, it can also **provide transcripts for videos** , **augment original content** , and **help with reading comprehension**.

The developers of Brave have shared that, for now, Leo won't have access to live information.

But, in the near future, they intend to release **a version of Leo with some level of access to current information**. They plan to power it with their in-house search engine, '[Brave Search][11]'.

![][8]

I suggest you go through [Brave's official blog post][12] for more details on how Leo works.

**Want to take it for a spin?**

Leo is **available right now as part of Brave's nightly builds**. You can head over to the [official website][13] to test it.

📋

After installing, look for the chat button on the sidebar and get started.

[Brave (Nightly)][14]

_💬 Are you looking forward to the native AI assistant on Brave's stable release? Share your thoughts in the comments below._

* * *

### More from It's FOSS...

  * Learn Bash scripting for FREE with this [Bash Tutorial series][15].
  * Join our [community forum][16].
  * 📩 Stay updated with the latest on Linux and Open Source. Get our [weekly Newsletter][17].



--------------------------------------------------------------------------------

via: https://news.itsfoss.com/brave-browser-leo/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-browsers-ubuntu-linux/?ref=news.itsfoss.com
[2]: https://news.itsfoss.com/content/images/2023/08/Brave_Leo_1.jpg
[3]: https://about.fb.com/news/2023/07/llama-2/?ref=news.itsfoss.com
[4]: https://en.wikipedia.org/wiki/Reverse_proxy?ref=news.itsfoss.com
[5]: https://news.itsfoss.com/content/images/2023/08/Brave_Leo_2.jpg
[6]: https://news.itsfoss.com/content/images/2023/08/Brave_Leo_3.jpg
[7]: https://news.itsfoss.com/content/images/2023/08/Brave_Leo_4.jpg
[8]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[9]: https://news.itsfoss.com/content/images/2023/08/Brave_Leo_5.jpg
[10]: https://news.itsfoss.com/content/images/2023/08/Brave_Leo_6.jpg
[11]: https://itsfoss.com/brave-search-features/?ref=news.itsfoss.com
[12]: https://brave.com/leo-release/?ref=news.itsfoss.com
[13]: https://brave.com/linux/?ref=news.itsfoss.com
[14]: https://brave.com/linux/?ref=news.itsfoss.com#nightly-channel-installation
[15]: https://linuxhandbook.com/tag/bash-beginner/
[16]: https://itsfoss.community/
[17]: https://itsfoss.com/newsletter/
