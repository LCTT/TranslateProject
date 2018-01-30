Being open about data privacy
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/GOV_opendata.png?itok=M8L2HGVx)


Image by : opensource.com

Today is [Data Privacy Day][1], ("Data Protection Day" in Europe), and you might think that those of us in the open source world should think that all data should be free, [as information supposedly wants to be][2], but life's not that simple. That's for two main reasons:

  1. Most of us (and not just in open source) believe there's at least some data about us that we might not feel happy sharing (I compiled an example list in [a post][3] I published a while ago).
  2. Many of us working in open source actually work for commercial companies or other organisations subject to legal requirements around what they can share.



So actually, data privacy is something that's important for pretty much everybody.

It turns out that the starting point for what data people and governments believe should be available for organisations to use is somewhat different between the U.S. and Europe, with the former generally providing more latitude for entities--particularly, the more cynical might suggest, large commercial entities--to use data they've collected about us as they will. Europe, on the other hand, has historically taken a more restrictive view, and on the 25th of May, Europe's view arguably will have triumphed.

### The impact of GDPR

That's a rather sweeping statement, but the fact remains that this is the date on which a piece of legislation called the General Data Protection Regulation (GDPR), enacted by the European Union in 2016, becomes enforceable. The GDPR basically provides a stringent set of rules about how personal data can be stored, what it can be used for, who can see it, and how long it can be kept. It also describes what personal data is--and it's a pretty broad set of items, from your name and home address to your medical records and on through to your computer's IP address.

What is important about the GDPR, though, is that it doesn't apply just to European companies, but to any organisation processing data about EU citizens. If you're an Argentinian, Japanese, U.S., or Russian company and you're collecting data about an EU citizen, you're subject to it.

"Pah!" you may say,1 "I'm not based in the EU: what can they do to me?" The answer is simple: If you want to continue doing any business in the EU, you'd better comply, because if you breach GDPR rules, you could be liable for up to four percent of your global revenues. Yes, that's global revenues: not just revenues in a particular country in Europe or across the EU, not just profits, but global revenues. Those are the sorts of numbers that should lead you to talk to your legal team, who will direct you to your exec team, who will almost immediately direct you to your IT group to make sure you're compliant in pretty short order.

This may seem like it's not particularly relevant to non-EU citizens, but it is. For most companies, it's going to be simpler and more efficient to implement the same protection measures for data associated with all customers, partners, and employees they deal with, rather than just targeting specific measures at EU citizens. This has got to be a good thing.2

However, just because GDPR will soon be applied to organisations across the globe doesn't mean that everything's fine and dandy3: it's not. We give away information about ourselves all the time--and permission for companies to use it.

There's a telling (though disputed) saying: "If you're not paying, you're the product." What this suggests is that if you're not paying for a service, then somebody else is paying to use your data. Do you pay to use Facebook? Twitter? Gmail? How do you think they make their money? Well, partly through advertising, and some might argue that's a service they provide to you, but actually that's them using your data to get money from the advertisers. You're not really a customer of advertising--it's only once you buy something from the advertiser that you become their customer, but until you do, the relationship is between the the owner of the advertising platform and the advertiser.

Some of these services allow you to pay to reduce or remove advertising (Spotify is a good example), but on the other hand, advertising may be enabled even for services that you think you do pay for (Amazon is apparently working to allow adverts via Alexa, for instance). Unless we want to start paying to use all of these "free" services, we need to be aware of what we're giving up, and making some choices about what we expose and what we don't.

### Who's the customer?

There's another issue around data that should be exercising us, and it's a direct consequence of the amounts of data that are being generated. There are many organisations out there--including "public" ones like universities, hospitals, or government departments4--who generate enormous quantities of data all the time, and who just don't have the capacity to store it. It would be a different matter if this data didn't have long-term value, but it does, as the tools for handling Big Data are developing, and organisations are realising they can be mining this now and in the future.

The problem they face, though, as the amount of data increases and their capacity to store it fails to keep up, is what to do with it. Luckily--and I use this word with a very heavy dose of irony,5 big corporations are stepping in to help them. "Give us your data," they say, "and we'll host it for free. We'll even let you use the data you collected when you want to!" Sounds like a great deal, yes? A fantastic example of big corporations6 taking a philanthropic stance and helping out public organisations that have collected all of that lovely data about us.

Sadly, philanthropy isn't the only reason. These hosting deals come with a price: in exchange for agreeing to host the data, these corporations get to sell access to it to third parties. And do you think the public organisations, or those whose data is collected, will get a say in who these third parties are or how they will use it? I'll leave this as an exercise for the reader.7

### Open and positive

It's not all bad news, however. There's a growing "open data" movement among governments to encourage departments to make much of their data available to the public and other bodies for free. In some cases, this is being specifically legislated. Many voluntary organisations--particularly those receiving public funding--are starting to do the same. There are glimmerings of interest even from commercial organisations. What's more, there are techniques becoming available, such as those around differential privacy and multi-party computation, that are beginning to allow us to mine data across data sets without revealing too much about individuals--a computing problem that has historically been much less tractable than you might otherwise expect.

What does this all mean to us? Well, I've written before on Opensource.com about the [commonwealth of open source][4], and I'm increasingly convinced that we need to look beyond just software to other areas: hardware, organisations, and, relevant to this discussion, data. Let's imagine that you're a company (A) that provides a service to another company, a customer (B).8 There are four different types of data in play:

  1. Data that's fully open: visible to A, B, and the rest of the world
  2. Data that's known, shared, and confidential: visible to A and B, but nobody else
  3. Data that's company-confidential: visible to A, but not B
  4. Data that's customer-confidential: visible to B, but not A



First of all, maybe we should be a bit more open about data and default to putting it into bucket 1. That data--on self-driving cars, voice recognition, mineral deposits, demographic statistics--could be enormously useful if it were available to everyone.9 Also, wouldn't it be great if we could find ways to make the data in buckets 2, 3, and 4--or at least some of it--available in bucket 1, whilst still keeping the details confidential? That's the hope for some of these new techniques being researched. They're a way off, though, so don't get too excited, and in the meantime, start thinking about making more of your data open by default.

### Some concrete steps

So, what can we do around data privacy and being open? Here are a few concrete steps that occurred to me: please use the comments to contribute more.

  * Check to see whether your organisation is taking GDPR seriously. If it isn't, push for it.
  * Default to encrypting sensitive data (or hashing where appropriate), and deleting when it's no longer required--there's really no excuse for data to be in the clear to these days except for when it's actually being processed.
  * Consider what information you disclose when you sign up to services, particularly social media.
  * Discuss this with your non-technical friends.
  * Educate your children, your friends' children, and their friends. Better yet, go and talk to their teachers about it and present something in their schools.
  * Encourage the organisations you work for, volunteer for, or interact with to make data open by default. Rather than thinking, "why should I make this public?" start with "why shouldn't I make this public?"
  * Try accessing some of the open data sources out there. Mine it, create apps that use it, perform statistical analyses, draw pretty graphs,10 make interesting music, but consider doing something with it. Tell the organisations that sourced it, thank them, and encourage them to do more.



1. Though you probably won't, I admit.

2. Assuming that you believe that your personal data should be protected.

3. If you're wondering what "dandy" means, you're not alone at this point.

4. Exactly how public these institutions seem to you will probably depend on where you live: [YMMV][5].

5. And given that I'm British, that's a really very, very heavy dose.

6. And they're likely to be big corporations: nobody else can afford all of that storage and the infrastructure to keep it available.

7. No. The answer's "no."

8. Although the example works for people, too. Oh, look: A could be Alice, B could be Bob…

9. Not that we should be exposing personal data or data that actually needs to be confidential, of course--not that type of data.

10. A friend of mine decided that it always seemed to rain when she picked her children up from school, so to avoid confirmation bias, she accessed rainfall information across the school year and created graphs that she shared on social media.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/being-open-about-data-privacy

作者：[Mike Bursell][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mikecamel
[1]:https://en.wikipedia.org/wiki/Data_Privacy_Day
[2]:https://en.wikipedia.org/wiki/Information_wants_to_be_free
[3]:https://aliceevebob.wordpress.com/2017/06/06/helping-our-governments-differently/
[4]:https://opensource.com/article/17/11/commonwealth-open-source
[5]:http://www.outpost9.com/reference/jargon/jargon_40.html#TAG2036
