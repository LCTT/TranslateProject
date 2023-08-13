[#]: subject: "Notes on using a single-person Mastodon server"
[#]: via: "https://jvns.ca/blog/2023/08/11/some-notes-on-mastodon/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Notes on using a single-person Mastodon server
======

I started using Mastodon back in November, and it’s the Twitter alternative where I’ve been spending most of my time recently, mostly because the Fediverse is where a lot of the Linux nerds seem to be right now.

I’ve found Mastodon quite a bit more confusing than Twitter because it’s a distributed system, so here are a few technical things I’ve learned about it over the last 10 months. I’ll mostly talk about what using a single-person server has been like for me, as well as a couple of notes about the API, DMs and ActivityPub.

I might have made some mistakes, please let me know if I’ve gotten anything wrong!

### what’s a mastodon instance?

First: Mastodon is a decentralized collection of independently run servers instead of One Big Server. The software is [open source][1].

In general, if you have an account on one server (like `ruby.social`), you **can** follow people on another server (like `hachyderm.io`), and they can follow you.

I’m going to use the terms “Mastodon server” and “Mastodon instance” interchangeably in this post.

### on choosing a Mastodon instance

These were the things I was concerned about when choosing an instance:

  1. An instance name that I was comfortable being part of my online identity. For example, I probably wouldn’t want to be `@b0rk@infosec.exchange` because I’m not an infosec person.
  2. The server’s stability. Most servers are volunteer-run, and volunteer moderation work can be exhausting – will the server really be around in a few years? For example [mastodon.technology][2] and mastodon.lol shut down.
  3. The admins’ moderation policies.
  4. That server’s general reputation with other servers. I started out on `mastodon.social`, but some servers choose to block or limit mastodon.social for various reasons
  5. The community: every Mastodon instance has a local timeline with all posts from users on that instance, would I be interested in reading the local timeline?
  6. Whether my account would be a burden for the admin of that server (since I have a lot of followers)



In the end, I chose to run my own mastodon server because it seemed simplest – I could pick a domain I liked, and I knew I’d definitely agree with the moderation decisions because I’d be in charge.

I’m not going to give server recommendations here, but here’s a list of the [top 200 most common servers people who follow me use][3].

### using your own domain

One big thing I wondered was – can I use my own domain (and have the username `@b0rk@jvns.ca` or something) but be on someone else’s Mastodon server?

The answer to this seems to be basically “no”: if you want to use your own domain on Mastodon, you need to run your own server. (you can [kind of do this][4], but it’s more like an alias or redirect – if I used that method to direct `b0rk@jvns.ca` to `b0rk@mastodon.social`, my posts would still show up as being from `b0rk@mastodon.social`)

There’s also other ActivityPub software ([Takahē][5]) that supports people bringing their own domain in a first-class way.

### notes on having my own server

I really wanted to have a way to use my own domain name for identity, but to share server hosting costs with other people. This isn’t possible on Mastodon right now, so I decided to set up my own server instead.

I chose to run a Mastodon server (instead of some other ActivityPub implementation) because Mastodon is the most popular one. Good managed Mastodon hosting is readily available, there are tons of options for client apps, and I know for sure that my server will work well with other people’s servers.

I use [masto.host][6] for Mastodon hosting, and it’s been great so far. I have nothing interesting to say about what it’s like to operate a Mastodon instance because I know literally nothing about it. Masto.host handles all of the server administration and Mastodon updates, and I never think about it at all.

Right now I’m on their $19/month (“Star”) plan, but it’s possible I could use a smaller plan with no problems. Right now their cheapest plan is $6/month and I expect that would be fine for someone with a smaller account.

Some things I was worried about when embarking on my own Mastodon server:

  * I wanted to run the server at `social.jvns.ca`, but I wanted my username to be `b0rk@jvns.ca` instead of `b0rk@social.jvns.ca`. To get this to work I followed these [Setting up a personal fediverse ID][7] directions from Jacob Kaplan-Moss and it’s been fine.
  * The administration burden of running my own server. I imported a small list of servers to block/defederate from but didn’t do anything else. That’s been fine.
  * Reply and profile visibility. This has been annoying and we’ll talk about it next



### downsides to being on a single-person server

Being on a 1-person server has some significant downsides. To understand why, you need to understand a little about how Mastodon works.

Every Mastodon server has a database of posts. Servers only have posts that they were explicitly sent by another server in their database.

Some reasons that servers might receive posts:

  * someone on the server follows a user
  * a post mentions someone on the server



As a 1-person server, my server does not receive that many posts! I only get posts from people I follow or posts that explicitly mention me in some way.

The causes several problems:

  1. when I visit someone’s profile on Mastodon who I don’t already follow, my server will not fetch the profile’s content (it’ll fetch their profile picture, description, and pinned posts, but not any of their post history). So their profile appears as if they’ve never posted anything
  2. bad reply visibility: when I look at the replies to somebody else’s post (even if I follow them!), I don’t see all of the replies, only the ones which have made it to my server. If you want to understand the exact rules about who can see which replies (which are quite complicated!), [here’s a great deep dive][8] by Sebastian Jambor. I think it’s possible to end up in a state where no one person can see all of the replies, including the original poster.
  3. favourite and boost accounts are inaccurate – usually posts show up having at most 1 or 2 favourites / boosts, even if the post was actually favourite or boosted hundreds of times. I think this is because it only counts favourites/boosts from people I follow.



All of these things will happen to users of any small Mastodon server, not just 1-person servers.

### bad reply visibility makes conversations harder

A lot of people are on smaller servers, so when they’re participating in a conversation, they can’t see all the replies to the post.

This means that replies can get pretty repetitive because people literally cannot see each other’s replies. This is especially annoying for posts that are popular or controversial, because the person who made the post has to keep reading similar replies over and over again by people who think they’re making the point for the first time.

To get around this (as a reader), you can click “open link to post” or something in your Mastodon client, which will open up the page on the poster’s server where you can read all of the replies. It’s pretty annoying though.

As a poster, I’ve tried to reduce repetitiveness in replies by:

  * putting requests in my posts like “(no need to reply if you don’t remember, or if you’ve been using the command line comfortably for 15 years — this question isn’t for you :) )”
  * occasionally editing my posts to include very common replies
  * very occasionally deleting the post if it gets too out of hand



The Mastodon devs are extremely aware of these issues, there are a bunch of github issues about them:

  * [backfill statuses when first subscribed][9]
  * [fetch whole conversation threads][10]



My guess is that there are technical reasons these features are difficult to add because those issues have been open for 5-7 years.

### some visibility workarounds

Some people have built workarounds for fetching profiles / replies.

  * [Fedifetcher][11]
  * [combine.social][12]



Also, there are a couple of Mastodon clients which will proactively fetch replies. For iOS:

  * Mammoth does it automatically
  * Mona will fetch posts if I click “load from remote server” manually



I haven’t tried those yet though.

### other downsides of running your own server: discovery is much harder

Mastodon instances have a “local timeline” where you can see everything other people on the server are posting, and a “federated timeline” which shows sort of a combined feed from everyone followed by anyone on the server. This means that you can see trending posts and get an idea of what’s going on and find people to follow. You don’t get that if you’re on a 1-person server – it’s just me talking to myself! (plus occasional interjections from [my reruns bot][13]).

Some workarounds people mentioned for this:

  * you can populate your federated timeline with posts from another instance by using a **relay**. I haven’t done this but someone else said they use [FediBuzz][14] and I might try it out.
  * some mastodon clients (like apparently Moshidon on Android) let you follow other instances



If anyone else on small servers has suggestions for how to make discovery easier I’d love to hear them.

### account migration

When I moved to my own server from `mastodon.social`, I needed to run an account migration to move over my followers. First, here’s how migration works:

  1. Account migration **does not** move over your posts. All of my posts stayed on my old account. This is part of why I moved to running my own server – I didn’t want to ever lose my posts a second time.
  2. Account migration **does not** move over the list of people you follow/mute/block. But you can import/export that list in your Mastodon settings so it’s not a big deal. If you follow private accounts they’ll have to re-approve your follow request.
  3. Account migration **does** move over your followers



The follower move was the part I was most worried about. Here’s how it turned out:

  * over ~24 hours, most of my followers moved to the new account
  * one or two servers did not get the message about the account migration for some reason, so about 2000 followers were “stuck” and didn’t migrate. I fixed this by waiting 30 days and re-running the account migration, which moved over most of the remaining followers. There’s also a [tootctl command][15] that the admin of the **old instance** can run to retry the migration
  * about 200 of my followers never migrated over, I think because they’re using ActivityPub software other than Mastodon which doesn’t support account migration. You can see the [old account here][16]



### using the Mastodon API is great

One thing I love about Mastodon is – it has an API that’s MUCH easier to use than Twitter’s API. I’ve always been frustrated with how difficult it is to navigate large Twitter threads, so I made a small [mastodon thread view][17] website that lets you log into your Mastodon account. It’s pretty janky and it’s really only made for me to use, but I’ve really appreciated the ability to write my own janky software to improve my Mastodon experience.

Some notes on the Mastodon API:

  * You can build Mastodon client software totally on the frontend in Javascript, which is really cool.
  * I couldn’t find a vanilla Javascript Mastodon client, so I [wrote a crappy one][18]
  * [API docs are here][19]
  * Here’s a [tiny Python script I used to list all my Mastodon followers][20], which also serves as a simple example of how easy using the API is.
  * The best documenation I could find for which OAuth scopes correspond to which API endpoints is [this github issue][21]



Next I’ll talk about a few general things about Mastodon that confused or surprised me that aren’t specific to being on a single-person instance.

### DMs are weird

The way Mastodon DMs work surprised me in a few ways:

  * Technically DMs are just regular posts with visibility limited to the people mentioned in the post. This means that if you accidentaly mention someone in a DM (“@x is such a jerk”), it’s possible to accidentally send the message to them
  * DMs aren’t very private: the admins on the sending and receiving servers can technically read your DMs if they have access to the database. So they’re not appropriate for sensitive information.
  * Turning off DMs is weird. Personally I don’t like receiving DMs from strangers – it’s too much to keep track of and I’d prefer that people email me. On Twitter, I can just turn it off and people won’t see an option to DM me. But on Mastodon, when I turn off notifications for DMs, anyone can still “DM” me, but the message will go into a black hole and I’ll never see it. I put a note in my profile about this.



### defederation and limiting

There are a couple of different ways for a server to block another Mastodon server. I haven’t really had to do this much but people talk about it a lot and I was confused about the difference, so:

  * A server can **defederate** from another server (this seems to be called [suspend][22] in the Mastodon docs). This means that nobody on a server can follow someone from the other server.
  * A server can **[limit][23]** (also known as “silence”) a user or server. This means that content from that user is only visible to that user’s followers – people can’t discover the user through retweets (aka “boosts” on Mastodon).



One thing that wasn’t obvious to me is that who servers defederate / limit is sometimes hidden, so it’s hard to suss out what’s going on if you’re considering joining a server, or trying to understand why you can’t see certain posts.

### there’s no search for posts

There’s no way to search past posts you’ve read. If I see something interesting on my timeline and want to find it later, I usually can’t. (Mastodon has a [Elasticsearch-based search feature][24], but it only allows you to search your own posts, your mentions, your favourites, and your bookmarks)

These limitations on search are intentional (and a very common source of arguments) – it’s a privacy / safety issue. Here’s a [summary from Tim Bray][25] with lots of links.

It would be personally convenient for me to be able to search more easily but I respect folks’ safety concerns so I’ll leave it at that.

### other ActivityPub software

We’ve been talking about Mastodon a lot, but not everyone who I follow is using Mastodon: Mastodon uses a protocol called [ActivityPub][26] to distribute messages.

Here are some examples of other software I see people talking about, in no particular order:

  * [Calckey][27]
  * [Akkoma][28]
  * [gotosocial][29]
  * [Takahē][5]
  * [writefreely][30]
  * [pixelfed][31] (for images)



I’m probably missing a bunch of important ones.

### what’s the difference between Mastodon and other ActivityPub software?

This confused me for a while, and I’m still not super clear on how ActivityPub works. What I’ve understood is:

  * ActivityPub is a protocol (you can explore how it works with blinry’s nice [JSON explorer][32])
  * Mastodon **servers** communicate with each other (and with other ActivityPub servers) using ActivityPub
  * Mastodon **clients** communicate with their server using the Mastodon API, which is its own thing
  * There’s also software like [GoToSocial][33] that aims to be compatible with the Mastodon API, so that you can use a Mastodon client with it



### more mastodon resources

  * [Fedi.Tips][34] seems to be a great introduction
  * I think you can still use [FediFinder][35] to find folks you followed on Twitter on Mastodon
  * I’ve been using the [Ivory][36] client on iOS, but there are lots of great clients. [Elk][37] is an alternative web client that folks seem to like.



I haven’t written here about what Mastodon culture is like because other people have done a much better job of talking about it than me, but of course it’s is the biggest thing that affects your experience and it was the thing that took me longest to get a handle on. A few links:

  * Erin Kissane on [frictions people run into when joining Mastodon][38]
  * Kyle Kingsbury wrote some great [moderation guidelines for woof.group][39] (note: woof.group is a LGBTQ+ leather instance, be prepared to see lots of NSFW posts if you visit it)
  * Mekka Okereke writes [lots of great posts about issues Black people encounter on Mastodon][40] (though they’re all on Mastodon so it’s a little hard to navigate)



### that’s all!

I don’t regret setting up a single-user server – even though it’s inconvenient, it’s important to me to have control over my social media. I think “have control over my social media” is more important to me than it is to most other people though, because I use Twitter/Mastodon a lot for work.

I am happy that I didn’t _start out_ on a single-user server though – I think it would have made getting started on Mastodon a lot more difficult.

Mastodon is pretty rough around the edges sometimes but I’m able to have more interesting conversations about computers there than I am on Twitter (or Bluesky), so that’s where I’m staying for now.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2023/08/11/some-notes-on-mastodon/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://github.com/mastodon/mastodon
[2]: https://ashfurrow.com/blog/mastodon-technology-shutdown/
[3]: https://gist.github.com/jvns/5eb0a58319b93049a8c014433766edd3
[4]: https://blog.maartenballiauw.be/post/2022/11/05/mastodon-own-donain-without-hosting-server.html
[5]: https://jointakahe.org/
[6]: https://masto.host/
[7]: https://jacobian.org/til/my-mastodon-instance/
[8]: https://seb.jambor.dev/posts/understanding-activitypub-part-3-the-state-of-mastodon/
[9]: https://github.com/mastodon/mastodon/issues/34
[10]: https://github.com/mastodon/mastodon/issues/9409
[11]: https://blog.thms.uk/fedifetcher
[12]: https://combine.social/
[13]: https://social.jvns.ca/@b0rk_reruns
[14]: https://relay.fedi.buzz
[15]: https://github.com/mastodon/mastodon/issues/22281
[16]: https://mastodon.social/@b0rk
[17]: https://mastodon-thread-view.jvns.ca/
[18]: https://github.com/jvns/mastodon-threaded-replies/blob/main/mastodon.js
[19]: https://docs.joinmastodon.org/client/intro/
[20]: https://gist.github.com/jvns/0fe51383cbbb63e94177c60f1e0371c6
[21]: https://github.com/mastodon/mastodon/pull/7929
[22]: https://docs.joinmastodon.org/admin/moderation/#suspend-server
[23]: https://docs.joinmastodon.org/admin/moderation/#limit-user
[24]: https://docs.joinmastodon.org/admin/optional/elasticsearch/
[25]: https://www.tbray.org/ongoing/When/202x/2022/12/30/Mastodon-Privacy-and-Search
[26]: https://activitypub.rocks/
[27]: https://calckey.org/
[28]: https://akkoma.social/
[29]: https://gotosocial.org/
[30]: https://writefreely.org/
[31]: https://pixelfed.org/
[32]: https://json.blinry.org/#https://chaos.social/users/blinry
[33]: https://github.com/superseriousbusiness/gotosocial
[34]: https://fedi.tips/
[35]: https://fedifinder.glitch.me/
[36]: https://tapbots.com/ivory/
[37]: https://elk.zone/
[38]: https://erinkissane.com/mastodon-is-easy-and-fun-except-when-it-isnt
[39]: https://blog.woof.group/mods/
[40]: https://hachyderm.io/@mekkaokereke/110273797004251326
