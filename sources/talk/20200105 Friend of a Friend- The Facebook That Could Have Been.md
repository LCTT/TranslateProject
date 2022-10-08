[#]: subject: "Friend of a Friend: The Facebook That Could Have Been"
[#]: via: "https://twobithistory.org/2020/01/05/foaf.html"
[#]: author: "Two-Bit History https://twobithistory.org"
[#]: collector: "lujun9972"
[#]: translator: "aREversez"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Friend of a Friend: The Facebook That Could Have Been
======

> _I express my network in a FOAF file, and that is the start of the revolution._ —Tim Berners-Lee (2007)

The FOAF standard, or Friend of a Friend standard, is a now largely defunct/ignored/superseded[1][1] web standard dating from the early 2000s that hints at what social networking might have looked like had Facebook not conquered the world. Before we talk about FOAF though, I want to talk about the New York City Subway.

The New York City Subway is controlled by a single entity, the Metropolitan Transportation Agency, better known as the MTA. The MTA has a monopoly on subway travel in New York City. There is no legal way to travel in New York City by subway without purchasing a ticket from the MTA. The MTA has no competitors, at least not in the “subway space.”

This wasn’t always true. Surprisingly, the subway system was once run by two corporations that competed with each other. The Inter-borough Rapid Transit Company (IRT) operated lines that ran mostly through Manhattan, while the Brooklyn-Manhattan Transit Corporation (BMT) operated lines in Brooklyn, some of which extended into Manhattan also. In 1932, the City opened its own service called the Independent Subway System to compete with the IRT and BMT, and so for a while there were _three_ different organizations running subway lines in New York City.

One imagines that this was not an effective way to run a subway. It was not. Constructing interchanges between the various systems was challenging because the IRT and BMT used trains of different widths. Interchange stations also had to have at least two different fare-collection areas since passengers switching trains would have to pay multiple operators. The City eventually took over the IRT and BMT in 1940, bringing the whole system together under one operator, but some of the inefficiencies that the original division entailed are still problems today: Trains designed to run along lines inherited from the BMT (e.g. the A, C, or E) cannot run along lines inherited from the IRT (e.g. the 1, 2, or 3) because the IRT tunnels are too narrow. As a result, the MTA has to maintain two different fleets of mutually incompatible subway cars, presumably at significant additional expense relative to other subway systems in the world that only have to deal with a single tunnel width.

This legacy of the competition between the IRT and BMT suggests that subway systems naturally tend toward monopoly. It just makes more sense for there to be a single operator than for there to be competing operators. Average passengers are amply compensated for the loss of choice by never having to worry about whether they brought their IRT MetroCard today but forgot their BMT MetroCard at home.

Okay, so what does the Subway have to do with social networking? Well, I have wondered for a while now whether Facebook has, like the MTA, a natural monopoly. Facebook does seem to have _a_ monopoly, whether natural or unnatural—not over social media per se (I spend much more time on Twitter), but over my internet social connections with real people I know. It has a monopoly over, as they call it, my digitized “social graph”; I would quit Facebook tomorrow if I didn’t worry that by doing so I might lose many of those connections. I get angry about this power that Facebook has over me. I get angry in a way that I do not get angry about the MTA, even though the Subway is, metaphorically and literally, a sprawling trash fire. And I suppose I get angry because at root I believe that Facebook’s monopoly, unlike the MTA’s, is not a natural one.

What this must mean is that I think Facebook owns all of our social data now because they happened to get there first and then dig a big moat around themselves, not because a world with competing Facebook-like platforms is inefficient or impossible. Is that true, though? There are some good reasons to think it isn’t: Did Facebook simply get there first, or did they instead just do social networking better than everyone else? Isn’t the fact that there is only one Facebook actually convenient if you are trying to figure out how to contact an old friend? In a world of competing Facebooks, what would it mean if you and your boyfriend are now Facebook official, but he still hasn’t gotten around to updating his relationship status on VisageBook, which still says he is in a relationship with his college ex? Which site will people trust? Also, if there were multiple sites, wouldn’t everyone spend a lot more time filling out web forms?

In the last few years, as the disadvantages of centralized social networks have dramatically made themselves apparent, many people have attempted to create decentralized alternatives. These alternatives are based on open standards that could potentially support an ecosystem of inter-operating social networks (see e.g. [the Fediverse][2]). But none of these alternatives has yet supplanted a dominant social network. One obvious explanation for why this hasn’t happened is the power of network effects: With everyone already on Facebook, any one person thinking of leaving faces a high cost for doing so. Some might say this proves that social networks are natural monopolies and stop there; I would say that Facebook, Twitter, et al. chose to be walled gardens, and given that people have envisioned and even built social networks that inter-operate, the network effects that closed platforms enjoy tell us little about the inherent nature of social networks.

So the real question, in my mind, is: Do platforms like Facebook continue to dominate merely because of their network effects, or is having a single dominant social network more efficient in the same way that having a single operator for a subway system is more efficient?

Which finally brings me back to FOAF. Much of the world seems to have forgotten about the FOAF standard, but FOAF was an attempt to build a decentralized and open social network before anyone had even heard of Facebook. If any decentralized social network ever had a chance of occupying the redoubt that Facebook now occupies before Facebook got there, it was FOAF. Given that a large fraction of humanity now has a Facebook account, and given that relatively few people know about FOAF, should we conclude that social networking, like subway travel, really does lend itself to centralization and natural monopoly? Or does the FOAF project demonstrate that decentralized social networking was a feasible alternative that never became popular for other reasons?

### The Future from the Early Aughts

The FOAF project, begun in 2000, set out to create a universal standard for describing people and the relationships between them. That might strike you as a wildly ambitious goal today, but aspirations like that were par for the course in the late 1990s and early 2000s. The web (as people still called it then) had just trounced closed systems like America Online and [Prodigy][3]. It could only have been natural to assume that further innovation in computing would involve the open, standards-based approach embodied by the web.

Many people believed that the next big thing was for the web to evolve into something called the Semantic Web. [I have written about][4] what exactly the Semantic Web was supposed to be and how it was supposed to work before, so I won’t go into detail here. But I will sketch the basic vision motivating the people who worked on Semantic Web technologies, because the FOAF standard was an application of that vision to social networking.

There is an essay called [“How Google beat Amazon and Ebay to the Semantic Web”][5] that captures the lofty dream of the Semantic Web well. It was written by Paul Ford in 2002. The essay imagines a future (as imminent as 2009) in which Google, by embracing the Semantic Web, has replaced Amazon and eBay as the dominant e-commerce platform. In this future, you can search for something you want to purchase—perhaps a second-hand Martin guitar—by entering `buy:martin guitar` into Google. Google then shows you all the people near your zipcode selling Martin guitars. Google knows about these people and their guitars because Google can read RDF, a markup language and core Semantic Web technology focused on expressing relationships. Regular people can embed RDF on their web pages to advertise (among many other things) the items they have to sell. Ford predicts that as the number of people searching for and advertising products this way grows, Amazon and eBay will lose their near-monopolies over, respectively, first-hand and second-hand e-commerce. Nobody will want to search a single centralized database for something to buy when they could instead search the whole web. Even Google, Ford writes, will eventually lose its advantage, because in theory anyone could crawl the web reading RDF and offer a search feature similar to Google’s. At the very least, if Google wanted to make money from its Semantic Web marketplace by charging a percentage of each transaction, that percentage would probably by forced down over time by competitors offering a more attractive deal.

Ford’s imagined future was an application of RDF, or the Resource Description Framework, to e-commerce, but the exciting thing about RDF was that hypothetically it could be used for anything. The RDF standard, along with a constellation of related standards, once widely adopted, was supposed to blow open database-backed software services on the internet the same way HTML had blown open document publishing on the internet.

One arena that RDF and other Semantic Web technologies seemed poised to takeover immediately was social networking. The FOAF project, known originally as “RDF Web Ring” before being renamed, was the Semantic Web effort offshoot that sought to accomplish this. FOAF was so promising in its infancy that some people thought it would inevitably make all other social networking sites obsolete. A 2004 Guardian article about the project introduced FOAF this way:

> In the beginning, way back in 1996, it was SixDegrees. Last year, it was Friendster. Last week, it was Orkut. Next week, it could be Flickr. All these websites, and dozens more, are designed to build networks of friends, and they are currently at the forefront of the trendiest internet development: social networking. But unless they can start to offer more substantial benefits, it is hard to see them all surviving, once the Friend Of A Friend (FOAF) standard becomes a normal part of life on the net.[2][6]

The article goes on to complain that the biggest problem with social networking is that there are too many social networking sites. Something is needed that can connect all of the different networks together. FOAF is the solution, and it will revolutionize social networking as a result.

FOAF, according to the article, would tie the different networks together by doing three key things:

  * It would establish a machine-readable format for social data that could be read by any social networking site, saving users from having to enter this information over and over again
  * It would allow “personal information management programs,” i.e. your “Contacts” application, to generate a file in this machine-readable format that you could feed to social networking sites
  * It would further allow this machine-readable format to be hosted on personal homepages and read remotely by social networking sites, meaning that you would be able to keep your various profiles up-to-date by just pushing changes to your own homepage



It is hard to believe today, but the problem in 2004, at least for savvy webizens and technology columnists aware of all the latest sites, was not the lack of alternative social networks but instead the proliferation of them. Given _that_ problem—so alien to us now—one can see why it made sense to pursue a single standard that promised to make the proliferation of networks less of a burden.

### The FOAF Spec

According to the description currently given on the FOAF project’s website, FOAF is “a computer language defining a dictionary of people-related terms that can be used in structured data.” Back in 2000, in a document they wrote to explain the project’s goals, Dan Brickley and Libby Miller, FOAF’s creators, offered a different description that suggests more about the technology’s ultimate purpose—they introduced FOAF as a tool that would allow computers to read the personal information you put on your homepage the same way that other humans do.[3][7] FOAF would “help the web do the sorts of things that are currently the proprietary offering of centralised services.”[4][8] By defining a standard vocabulary for people and the relationships between them, FOAF would allow you to ask the web questions such as, “Find me today’s web recommendations made by people who work for Medical organizations,” or “Find me recent publications by people I’ve co-authored documents with.”

Since FOAF is a standardized vocabulary, the most important output of the FOAF project was the FOAF specification. The FOAF specification defines a small collection of RDF _classes_ and RDF _properties_. (I’m not going to explain RDF here, but again see [my post about the Semantic Web][4] if you want to know more.) The RDF _classes_ defined by the FOAF specification represent subjects you might want to describe, such as people (the `Person` class) and organizations (the `Organization` class). The RDF _properties_ defined by the FOAF specification represent logical statements you might make about the different subjects. A person could have, for example, a first name (the `givenName` property), a last name (the `familyName` property), perhaps even a personality type (the `myersBriggs` property), and be near another person or location (the `based_near` property). The idea was that these classes and properties would be sufficient to represent the kind of the things people say about themselves and their friends on their personal homepage.

The FOAF specification gives the following as an example of a well-formed FOAF document. This example uses XML, though an equivalent document could be written using JSON or a number of other formats:

```

    <foaf:Person rdf:about="#danbri" xmlns:foaf="http://xmlns.com/foaf/0.1/">
      <foaf:name>Dan Brickley</foaf:name>
      <foaf:homepage rdf:resource="http://danbri.org/" />
      <foaf:openid rdf:resource="http://danbri.org/" />
      <foaf:img rdf:resource="/images/me.jpg" />
    </foaf:Person>

```

This FOAF document describes a person named “Dan Brickley” (one of the specification’s authors) that has a homepage at `http://danbri.org`, something called an “open ID,” and a picture available at `/images/me.jpg`, presumably relative to the base address of Brickley’s homepage. The FOAF-specific terms are prefixed by `foaf:`, indicating that they are part of the FOAF namespace, while the more general RDF terms are prefixed by `rdf:`.

Just to persuade you that FOAF isn’t tied to XML, here is a similar FOAF example from Wikipedia, expressed using a format called JSON-LD[5][9]:

```

    {
      "@context": {
        "name": "http://xmlns.com/foaf/0.1/name",
        "homepage": {
          "@id": "http://xmlns.com/foaf/0.1/workplaceHomepage",
          "@type": "@id"
        },
        "Person": "http://xmlns.com/foaf/0.1/Person"
      },
      "@id": "https://me.example.com",
      "@type": "Person",
      "name": "John Smith",
      "homepage": "https://www.example.com/"
    }

```

This FOAF document describes a person named John Smith with a homepage at `www.example.com`.

Perhaps the best way to get a feel for how FOAF works is to play around with [FOAF-a-matic][10], a web tool for generating FOAF documents. It allows you to enter information about yourself using a web form, then uses that information to create the FOAF document (in XML) that represents you. FOAF-a-matic demonstrates how FOAF could have been used to save everyone from having to enter their social information into a web form ever again—if every social networking site could read FOAF, all you’d need to do to sign up for a new site is point the site to the FOAF document that FOAF-a-matic generated for you.

Here is a slightly more complicated FOAF example, representing me, that I created using FOAF-a-matic:

```

    <rdf:RDF
          xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
          xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
          xmlns:foaf="http://xmlns.com/foaf/0.1/"
          xmlns:admin="http://webns.net/mvcb/">
      <foaf:PersonalProfileDocument rdf:about="">
        <foaf:maker rdf:resource="#me"/>
        <foaf:primaryTopic rdf:resource="#me"/>
        <admin:generatorAgent rdf:resource="http://www.ldodds.com/foaf/foaf-a-matic"/>
        <admin:errorReportsTo rdf:resource="mailto:leigh@ldodds.com"/>
      </foaf:PersonalProfileDocument>
      <foaf:Person rdf:ID="me">
        <foaf:name>Sinclair Target</foaf:name>
        <foaf:givenname>Sinclair</foaf:givenname>
        <foaf:family_name>Target</foaf:family_name>
        <foaf:mbox rdf:resource="mailto:sinclairtarget@example.com"/>
        <foaf:homepage rdf:resource="sinclairtarget.com"/>
        <foaf:knows>
          <foaf:Person>
            <foaf:name>John Smith</foaf:name>
            <foaf:mbox rdf:resource="mailto:johnsmith@example.com"/>
            <rdfs:seeAlso rdf:resource="www.example.com/foaf.rdf"/>
          </foaf:Person>
        </foaf:knows>
      </foaf:Person>
    </rdf:RDF>

```

This example has quite a lot of preamble setting up the various XML namespaces used by the document. There is also a section containing data about the tool that was used to generate the document, largely so that, it seems, people know whom to email with complaints. The `foaf:Person` element describing me tells you my name, email address, and homepage. There is also a nested `foaf:knows` element telling you that I am friends with John Smith.

This example illustrates another important feature of FOAF documents: They can link to each other. If you remember from the previous example, my friend John Smith has a homepage at `www.example.com`. In this example, where I list John Smith as a `foaf:person` with whom I have a `foaf:knows` relationship, I also provide a `rdfs:seeAlso` element that points to John Smith’s FOAF document hosted on his homepage. Because I have provided this link, any program reading my FOAF document could find out more about John Smith by following the link and reading his FOAF document. In the FOAF document we have for John Smith above, John did not provide any information about his friends (including me, meaning, tragically, that our friendship is unidirectional). But if he had, then the program reading my document could find out not only about me but also about John, his friends, their friends, and so on, until the program has crawled the whole social graph that John and I inhabit.

This functionality will seem familiar to anyone that has used Facebook, which is to say that this functionality will seem familiar to you. There is no `foaf:wall` property or `foaf:poke` property to replicate Facebook’s feature set exactly. Obviously, there is also no slick blue user interface that everyone can use to visualize their FOAF social network; FOAF is just a vocabulary. But Facebook’s core feature—the feature that I have argued is key to Facebook’s monopoly power over, at the very least, myself—is here provided in a distributed way. FOAF allows a group of friends to represent their real-life social graph digitally by hosting FOAF documents on their own homepages. It allows them to do this without surrendering control of their data to a centralized database in the sky run by a billionaire android-man who spends much of his time apologizing before congressional committees.

### FOAF on Ice

If you visit the current FOAF project homepage, you will notice that, in the top right corner, there is an image of the character Fry from the TV series Futurama, stuck inside some sort of stasis chamber. This is a still from the pilot episode of Futurama, in which Fry gets frozen in a cryogenic tank in 1999 only to awake a millennium later in 2999. Brickley, whom I messaged briefly on Twitter, told me that he put that image there as a way communicating that the FOAF project is currently “in stasis,” though he hopes that there will be a future opportunity to resuscitate the project along with its early 2000s optimism about how the web should work.

FOAF never revolutionized social networking the way that the 2004 Guardian article about it expected it would. Some social networking sites decided to support the standard: LiveJournal and MyOpera are examples.[6][11] FOAF even played a role in Howard Dean’s presidential campaign in 2004—a group of bloggers and programmers got together to create a network of websites they called “DeanSpace” to promote the campaign, and these sites used FOAF to keep track of supporters and volunteers.[7][12] But today FOAF is known primarily for being one of the more widely used vocabularies of RDF, itself a niche standard on the modern web. If FOAF is part of your experience of the web today at all, then it is as an ancestor to the technology that powers Google’s “knowledge panels” (the little sidebars that tell you the basics about a person or a thing if you searched for something simple). Google uses vocabularies published by the schema.org project—the modern heir to the Semantic Web effort—to populate its knowledge panels.[8][13] The schema.org vocabulary for describing people seems to be somewhat inspired by FOAF and serves many of the same purposes.

So why didn’t FOAF succeed? Why do we all use Facebook now instead? Let’s ignore that FOAF is a simple standard with nowhere near as many features as Facebook—that’s true today, clearly, but if FOAF had enjoyed more momentum it’s possible that applications could have been built on top of it to deliver a Facebook-like experience. The interesting question is: Why didn’t this nascent form of distributed social networking catch fire when Facebook was not yet around to compete with it?

There probably is no single answer to that question, but if I had to pick one, I think the biggest issue is that FOAF only makes sense on a web where everyone has a personal website. In the late 1990s and early 2000s, it might have been easy to assume the web would eventually look like this, especially since so many of the web’s early adopters were, as far as I can tell, prolific bloggers or politically engaged technologists excited to have a platform. But the reality is that regular people don’t want to have to learn how to host a website. FOAF allows you to control your own social information and broadcast it to social networks instead of filling out endless web forms, which sounds pretty great if you already have somewhere to host that information. But most people in practice found it easier to just fill out the web form and sign up for Facebook than to figure out how to buy a domain and host some XML.

What does this mean for my original question about whether or not Facebook’s monopoly is a natural one? I think I have to concede that the FOAF example is evidence that social networking _does_ naturally lend itself to monopoly.

That people did not want to host their own data isn’t especially meaningful itself—modern distributed social networks like [Mastodon][14] have solved that problem by letting regular users host their profiles on nodes set up by more savvy users. It is a sign, however, of just how much people hate complexity. This is bad news for decentralized social networks, because they are inherently more complex under the hood than centralized networks in a way that is often impossible to hide from users.

Consider FOAF: If I were to write an application that read FOAF data from personal websites, what would I do if Sally’s FOAF document mentions a John Smith with a homepage at `example.com`, and Sue’s FOAF document mentions a John Smith with a homepage at `example.net`? Are we talking about a single John Smith with two websites or two entirely different John Smiths? What if the both FOAF documents list John Smith’s email as `johnsmith@gmail.com`? This issue of identity was an acute one for FOAF. In a 2003 email, Brickley wrote that because there does not exist and probably should not exist a “planet-wide system for identifying people,” the approach taken by FOAF is “pluralistic.”[9][15] Some properties of FOAF people, such as email addresses and homepage addresses, are special in that their values are globally unique. So these different properties can be used to merge (or, as Libby Miller called it, “smoosh”) FOAF documents about people together. But none of these special properties are privileged above the others, so it’s not obvious how to handle our John Smith case. Do we trust the homepages and conclude we have two different people? Or do we trust the email addresses and conclude we have a single person? Could I really write an application capable of resolving this conflict without involving (and inconveniencing) the user?

Facebook, with its single database and lack of political qualms, could create a “planet-wide system for identifying people” and so just gave every person a unique Facebook ID. Problem solved.

Complexity alone might not doom distributed social networks if people cared about being able to own and control their data. But FOAF’s failure to take off demonstrates that people have never valued control very highly. As one blogger has put it, “‘Users want to own their own data’ is an ideology, not a use case.”[10][16] If users do not value control enough to stomach additional complexity, and if centralized systems are more simple than distributed ones—and if, further, centralized systems tend to be closed and thus the successful ones enjoy powerful network effects—then social networks are indeed natural monopolies.

That said, I think there is still a distinction to be drawn between the subway system case and the social networking case. I am comfortable with the MTA’s monopoly on subway travel because I expect subway systems to be natural monopolies for a long time to come. If there is going to be only one operator of the New York City Subway, then it ought to be the government, which is at least nominally more accountable than a private company with no competitors. But I do not expect social networks to stay natural monopolies. The Subway is carved in granite; the digital world is writ in water. Distributed social networks may now be more complicated than centralized networks in the same way that carrying two MetroCards is more complicated than carrying one. In the future, though, the web, or even the internet, could change in fundamental ways that make distributed technology much easier to use.

If that happens, perhaps FOAF will be remembered as the first attempt to build the kind of social network that humanity, after a brief experiment with corporate mega-databases, does and always will prefer.

_If you enjoyed this post, more like it come out every four weeks! Follow [@TwoBitHistory][17] on Twitter or subscribe to the [RSS feed][18] to make sure you know when a new post is out._

_Previously on TwoBitHistory…_

> I know it's been too long since my last post, but my new one is here! I wrote almost 5000 words on John Carmack, Doom, and the history of the binary space partitioning tree.<https://t.co/SVunDZ0hZ1>
>
> — TwoBitHistory (@TwoBitHistory) [November 6, 2019][19]

  1. Please note that I did not dare say “dead.” [↩︎][20]

  2. Jack Schofield, “Let’s be Friendsters,” The Guardian, February 19, 2004, accessed January 5, 2020, <https://www.theguardian.com/technology/2004/feb/19/newmedia.media>. [↩︎][21]

  3. Dan Brickley and Libby Miller, “Introducing FOAF,” FOAF Project, 2008, accessed January 5, 2020, <https://web.archive.org/web/20140331104046/http://www.foaf-project.org/original-intro>. [↩︎][22]

  4. ibid. [↩︎][23]

  5. Wikipedia contributors, “JSON-LD,” Wikipedia: The Free Encyclopedia, December 13, 2019, accessed January 5, 2020, <https://en.wikipedia.org/wiki/JSON-LD>. [↩︎][24]

  6. “Data Sources,” FOAF Project Wiki, December 11 2009, accessed January 5, 2020, <https://web.archive.org/web/20100226072731/http://wiki.foaf-project.org/w/DataSources>. [↩︎][25]

  7. Aldon Hynes, “What is Dean Space?”, Extreme Democracy, accessed January 5, 2020, <http://www.extremedemocracy.com/chapters/Chapter18-Hynes.pdf>. [↩︎][26]

  8. “Understand how structured data works,” Google Developer Portal, accessed January 5, 2020, <https://developers.google.com/search/docs/guides/intro-structured-data>. [↩︎][27]

  9. tef, “Why your distributed network will not work,” Progamming is Terrible, January 2, 2013, <https://programmingisterrible.com/post/39438834308/distributed-social-network>. [↩︎][28]

  10. Dan Brickley, “Identifying things in FOAF,” rdfweb-dev Mailing List, July 10, 2003, accessed on January 5, 2020, <http://lists.foaf-project.org/pipermail/foaf-dev/2003-July/005463.html>. [↩︎][29]




--------------------------------------------------------------------------------

via: https://twobithistory.org/2020/01/05/foaf.html

作者：[Two-Bit History][a]
选题：[lujun9972][b]
译者：[aREversez](https://github.com/aREversez)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twobithistory.org
[b]: https://github.com/lujun9972
[1]: tmp.mJHAgyVHGr#fn:1
[2]: https://en.wikipedia.org/wiki/Fediverse
[3]: https://en.wikipedia.org/wiki/Prodigy_(online_service)
[4]: https://twobithistory.org/2018/05/27/semantic-web.html
[5]: https://www.ftrain.com/google_takes_all
[6]: tmp.mJHAgyVHGr#fn:2
[7]: tmp.mJHAgyVHGr#fn:3
[8]: tmp.mJHAgyVHGr#fn:4
[9]: tmp.mJHAgyVHGr#fn:5
[10]: http://www.ldodds.com/foaf/foaf-a-matic
[11]: tmp.mJHAgyVHGr#fn:6
[12]: tmp.mJHAgyVHGr#fn:7
[13]: tmp.mJHAgyVHGr#fn:8
[14]: https://en.wikipedia.org/wiki/Mastodon_(software)
[15]: tmp.mJHAgyVHGr#fn:9
[16]: tmp.mJHAgyVHGr#fn:10
[17]: https://twitter.com/TwoBitHistory
[18]: https://twobithistory.org/feed.xml
[19]: https://twitter.com/TwoBitHistory/status/1192196764239093760?ref_src=twsrc%5Etfw
[20]: tmp.mJHAgyVHGr#fnref:1
[21]: tmp.mJHAgyVHGr#fnref:2
[22]: tmp.mJHAgyVHGr#fnref:3
[23]: tmp.mJHAgyVHGr#fnref:4
[24]: tmp.mJHAgyVHGr#fnref:5
[25]: tmp.mJHAgyVHGr#fnref:6
[26]: tmp.mJHAgyVHGr#fnref:7
[27]: tmp.mJHAgyVHGr#fnref:8
[28]: tmp.mJHAgyVHGr#fnref:9
[29]: tmp.mJHAgyVHGr#fnref:10
