[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Some research on shipping print zines)
[#]: via: (https://jvns.ca/blog/2019/10/28/some-research-on-shipping-print-zines/)
[#]: author: (Julia Evans https://jvns.ca/)

Some research on shipping print zines
======

I’ve been doing some preliminary research on shipping printed zines, since [Your Linux Toolbox][1] is out now and a bunch more people have been asking about print copies of my other zines. I thought I’d write down what I’ve learned so far because it turns out shipping is pretty complicated!

My original question I was trying to answer was “can I ship a single zine anywhere in the world for less than $6 or so?“, so let’s start there.

Surprisingly the best single resource I found was this very extensive [PCMag article on e-commerce fulfillment services][2].

### why not use letter mail?

The most obvious way to send a zine inexpensively in the mail is with letter mail – letters smaller than 10” x 6” and under 60g or so can be sent by letter mail. My zines definitely fit that criteria, even when printed on nice paper. This would be really good because international package postage is EXPENSIVE, but sending a letter to Belgium only costs [$2.13 according to USPS’s website][3].

The issue with this is the small print on that USPS page:

> Value of contents can not exceed $0.00

So it seems like you’re not actually allowed to send things worth money via letter mail. Probably that’s related to customs or something. Or maybe letter mail is subsidized by the government? Not sure why.

### Option 0: Ship zines myself

I’ve done this before and it was actually really fun to do once but I think this is pretty unlikely to be a good idea because:

a. cost: I live in Canada, almost everyone I sell zines to is outside of Canada, and b. availability: I’d like for people to be able to get shipments when I’m out of town / on vacation

### Option 1: Amazon

One obvious answer to how to sell book-like things is “sell them on Amazon!”. Amazon actually has at least 3 different programs that you can use to sell books online (Amazon Advantage, Fulfilled By Amazon, Kindle Direct Publishing), and since Amazon is such a big thing I looked into all of them a little bit.

In general the forums on <https://sellercentral.amazon.com> seem to be a good way to understand how the various Amazon options work for people.

I wrote a lot about Amazon here but overall it doesn’t seem that great of an option – it’s really complicated, selling on Amazon’s website isn’t very appealing, and I think there would be a lot of additional fees.

**Kindle Direct Publishing**

Kindle Direct Publishing is a service where Amazon will take care of everything from printing to shipping. (It has “Kindle” in the same but they actually do printing as well). [Brian Kernighan’s new Unix book][4] is an example of a book published with KDP.

KDP won’t work for this project because they don’t support saddle stitching (stapling the zine), so I didn’t look into it too much. Here’s a link to their [paper and cover options][5] though.

**Amazon Advantage**

Amazon Advantage doesn’t do printing – you ship them books, and then they take care of shipping them to people. This seems great on its surface (“amazon just takes care of it!“).

advantages:

  * the book on Amazon looks the same as a book from a major publisher, it shows up as “ships and sold by Amazon”



disadvantages:

  * Amazon Advantage takes 55% and **they** decide how to price your book.
  * It costs $99/year
  * “You have to ship them your books every week or two depending on how many copies they want, you can’t just ship them a big shipment to keep in a warehouse”



The biggest issue for me here seems to be “you have to ship them books every week or two”, which seems like it could get very expensive if Amazon Advantage keeps asking you to ship them small quantities of zines.

**Fulfilled By Amazon**

Fulfilled By Amazon seems like the Amazon option that involves the least Amazon magic. Basically I’d ship books to their warehouses and then they ship the things from those warehouses.

how it works:

  * you just pay them for shipping and warehousing fees (no percentage cost)
  * you can ship them a big batch of things and they’ll store them until they’re sold
  * they have [FBA global selling][6] to sell in countries other than the US (by shipping to Amazon warehouses in those countries) or [FBA export][7] (to sell to other countries from the US store). There are a bunch of scary words on those pages about international taxes.



### Option 2: Blackbox

Blackbox is a shipping company by the Cards Against Humanity folks. This is their [Pricing PDF][8]. I’m not 100% sure if I can work with them – the first time I filled out the form on their website saying I was interested they said they weren’t accepting new customers, but I think now they may be?

Here’s the summary:

  * $6.64 for domestic US shipping
  * $11ish for domestic Canadian shipping
  * $10ish for domestic Australia shipping
  * $7ish for domestic UK shipping
  * $10ish for international shipping from their UK warehouse to anywhere in the world



### Option 3: Shipbob

Shipbob is an shipping company for smaller ecommerce companies. Here’s the [pricing PDF I found][9].

  * $6ish for domestic US shipping
  * $10ish for shipping to other countries



The main difference as far as I can tell between Shipbob and Blackbox is that Shipbox lets you include up to 5 items per order for free and Blackbox charges $0.70 per additional item in an order.

Shipbob advertises a 99.8% fulfillment accuracy rate which is pretty interesting – it means they expect 2 in 1000 orders to have a problem. That seems pretty good!

### Option 4: Whiplash

Similar to the other two above. [Their pricing page][10]. Shipbob and Blackbox both include everything (shipping, packaging materials, and someone packing your order) in their fee, and Whiplash seems to charge separately for shipping.

### Shipping 1 thing costs the same as shipping 5 things

Zines are pretty light – I just weighed some of my zines printed on high quality paper on my kitchen scale and they’re 40g each on average. Most of these shipping services seem to charge in increments of half a pound, so shipping 5 zines (about 200g) costs about the same as shipping 1 zine (about 40g).

This makes me think it would be more reasonable to focus on shipping packages of many zines – right now the [6 pack of all my zines][11] costs $58 for a PDF collection, and $6-$12 shipping for something around that price seems super reasonable (and I could probably even do “free” shipping, aka pay the shipping costs myself).

The other thing that I think could be work well is shipping packages of 5 or 10 of the same zine so that a group of people can each get a zine and save on shipping costs.

### this seems like it could work!

I still have no plan for how to print zines, but writing all this down makes me feel pretty optimistic about being able to ship zines to people. Even though shipping individual zines doesn’t seem that practical, I think shipping packs of 5-10 zines could be really reasonable!

Speaking of print – I printed a zine with Lulu last week and just got it in the mail yesterday. I didn’t think Lulu would be able to print it in the way I wanted, and they didn’t, so I’m really happy to know that and be able to move on to trying other non-print-on-demand printers.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2019/10/28/some-research-on-shipping-print-zines/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/blog/2019/10/21/print-collection-of-my-first-7-zines/
[2]: https://www.pcmag.com/roundup/360934/the-best-e-commerce-fulfillment-services
[3]: https://postcalc.usps.com/Calculator/MailServices?country=10033&ccode=BE&oz=90219&omil=False&dmil=False&mdt=10%2F28%2F2019&mdz=11%3A29&m=1&dvi=0&o=2
[4]: https://www.cs.princeton.edu/~bwk/
[5]: https://kdp.amazon.com/en_US/help/topic/G201834180
[6]: https://services.amazon.com/global-selling/global-selling-guide.html
[7]: https://sellercentral.amazon.fr/gp/help/external/200149570?language=en_GB&ref=efph_200149570_cont_201101640
[8]: https://www.blackbox.cool/downloads/Blackbox_2019_Pricing.pdf
[9]: https://shipbobcdn.azureedge.net/webassets/dashboard/files/ShipBob_GrowthPlan_Quote_2019.pdf
[10]: https://sales.getwhiplash.com/pricing
[11]: https://wizardzines.com/zines/all-the-zines/
