[#]: subject: "How to build an open source metaverse"
[#]: via: "https://opensource.com/article/22/1/open-source-metaverse"
[#]: author: "Josip Almasi https://opensource.com/users/jalmasi"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to build an open source metaverse
======
The world of open source is a prime place to build a metaverse.
![new techie gadgets representing innovation][1]

If I told you that all content and software you need to build the metaverse is already available and completely free, would you do it?

Hold that thought, and let's take a step back and explain the metaverse.

### What is the metaverse anyway?

Cyberpunk authors of the 20th century like Gibson and Stephenson imagined virtual reality-enabled internet, and in his novel _Snow Crash_, Stephenson called it Metaverse. With the growing availability of virtual reality (VR) devices and apps, Metaverse became a buzzword, especially since Mark Zuckerberg announced employing 10,000 workers to build it and changed the Facebook company name to Meta. Matthew Ball wrote a [serious analysis][2] of the topic that ends with the conclusion—Building together: "And in truth, it's most likely the Metaverse emerges from a network of different platforms, bodies, and technologies working together (however reluctantly) and embracing interoperability."

Interoperability. The word itself implicitly but clearly, points out how open source and open standards fit in the picture.

So, in short, it's about VR-enabled internet.

### How can an open source metaverse be built?

Like web servers on the internet, you need VR servers. But worry not, I wrote one, and [an article about it][3] was published right here about a year ago. Then, of course, you need VR-enabled web browsers, but web browsers already do support video/audio streaming (WebRTC) and VR and AR both (WebXR). Furthermore, you need a bunch of 3D content, preferably in open source standard glTF format. And luckily, [Sketchfab][4] hosts 500,000+ free 3D models, published under Creative Commons licenses by a huge number of authors. Sketchfab isn't the only company doing that, but they provide REST API to search and download any of these models.

### Don't forget the keyboard

Being in VR for quite a while now, I can tell you first hand what I miss the most: The keyboard! I write code on the keyboard, but it disappears when I put on my VR goggles. You can imagine how disruptive taking VR gear off and on is. And not just that, I need to see my code in VR. And then why stop there? Why wouldn't I see every application in VR? Many people are using two or more displays. In VR, arrange windows wherever you look. That's better than any number of screens. And once that happens, you'll be able to talk metaverse for real.

Truth be told, VR devices are still in their infancy, and there are undoubtedly many more functions missing. But VR devices will improve and eventually include keyboards, better cameras, and the ability to overlay virtual over real. In the meantime, we'll keep taking our goggles on and off and deal with other obstacles in other ways.

### So what am I waiting for?

You don't need to wait. People are working on it, enthusiasts and companies alike. And you can start building your virtual worlds on the web right now. The video below explains how to make virtual worlds using available free models.

Under the hood, the VRSpace web client uses Babylon.js, an open source JavaScript WebGL library to load glTF content and render with WebGL. It calls the search function of the Sketchfab REST API (server owner must have an account there). Once you click on a model, it asks the VRSpace server to fetch it. The server downloads it (only if it didn't do so earlier) and delivers it to the client. Everything that happens in the space is broadcast (multi-casted over WebSockets, actually) to all connected users, so they all see the same movement and resizing of objects. And sure, they can chat, either with text messages or voice. And by clicking on the VR goggles button in the bottom-right corner, the user instantly enters VR. Users can also share screens, though not in this space.

And this is all done using only existing standard web technologies and free software and content. It's not only available on PC and VR devices, but also on mobile devices. However, mobile Chrome doesn't come with VR functions enabled. It prompts for download of Google VR on the first attempt to enter VR.

As it's all open, this is as interoperable as it gets for the time being. But it's not nearly interoperable enough for the massive scale required for metaverse—the VR-enabled internet. Take avatars, for example. I use the same image for my avatar on LinkedIn, Facebook, as well as on Opensource.com. How can I upload my 3D avatar to VRSpace or elsewhere?

Well, I can't. Upload itself is not a problem. Of course, neither is the file format (glTF). Issues arise from the avatar structure, as it's not standardized. So, for example, different characters have a different number of bones. Then, must-have features that are supposed to be trivial, like holding something in your virtual hand, become extremely complicated. I have analyzed 100+ free characters and published my findings as a research paper: [Towards Automatic Skeleton Recognition of Humanoid 3D Character][5]—hopefully, it can help other authors with interoperability.

And that's just the beginning, the very first thing we need to do to enter a shared virtual world.

![Free avatars at VRSpace][6]

(Josip Almasi, [CC BY-SA 4.0][7])

### Intellectual property

What about intellectual property? What about it, you might say, it's all open source! Well, it is. Authors are so kind to let others use their creations. The least users can do is to give them credits. The actual terms of the Creative Commons licenses require users to credit authors explicitly. To that end, I've taken special care to display the author's name in the search results, and the author information is embedded in the metadata section of each glTF file. But even with free stuff that requires additional work, I can't imagine what nightmare it turns into with proprietary content.

### Non-Fungible Tokens and Blockchain Ledgers

On second thought, I can imagine that. It requires Non-Fungible Tokens, Blockchain Ledgers, and whatnot. Quick googling _Metaverse Blockchain_ offers me _excellent buy opportunities_ and advises the _best buy options_. Well, I'm not buying. Mark my words: Folks trying to sell cryptos aren't going to build the metaverse.

That's not to say that blockchain can't be helpful here, as even with free content, you have to keep track of authors. With hundreds of thousands of free models, this has to be automated somehow, and distributed ledger may be just the right solution.

Then again, digital content providers like Sketchfab do not provide only free models, they sell content. That's how they make a living, after all. Technically speaking, all you need to do to use this proprietary content in your virtual worlds is change one _true_ to _false_ in the code—literally. But once you download it, nobody can prevent you from sharing it. Yet, legally, the license forbids you to do so. Non-Fungible Tokens can prove ownership, be bought, sold, but can't enforce copyright. Content providers will figure it out eventually, but it's not them I'm worried about. This has practical implications for ordinary users, related to one specific question I have been asked repeatedly: Can I make/buy my own avatar that will be only mine and can't get used by anybody else? Well, you can, but technology can't prevent anybody from copying it. Just like I can copy your avatar picture from, say, LinkedIn, and use it as my picture on, say, Facebook. But think of it this way: Why would anyone want to do that?

Funny though, I've had one commercial implementation of VRSpace: A 3D multi-user video and audio streaming website powered by free software, serving proprietary content. Behind the locked door, pay to enter—as simple as that. And it doesn't get in the way of building the metaverse. Yet everyone has their own unique avatars that can't be used by anybody else ever: Video avatars.

![Author's video avatar in VRSpace][8]

(Josip Almasi, [CC BY-SA 4.0][7])

You want to be you and nobody else. Just click on the video button, as simple as that. Of course, the browser will prompt for your permission to stream your video and audio. This feature is so widely used in daily life that we don't really associate it with metaverse, and the cyberpunk authors did not envision it. In time, this _me being me_ approach will evolve into motion tracking and video stream mapping onto our 3D avatars, but it will remain in the domain of expensive movies and video games for a while.

By now, you have glanced at all the features of the VRSpace server, except Oauth2 authentication. You know how it works anyway. A website redirects you to another one of your choosing, where you log in and then get back authenticated. This is all of the above in a simplified diagram:

![VR components diagram][9]

(Josip Almasi, [CC BY-SA 4.0][7])

### Live demo

A live demo is available at [VRSpace][10][.org][10] at all times, running the latest code, and you are welcome to try it any time. It's completely anonymous, without ads and trackers of any kind. Try building your world in VRCraft world, but know that everything you do will disappear once you disconnect—the price of running an anonymous service open to the public. The home page provides all the relevant information, just follow the links, or join the project on [GitHub][11], [YouTube][12], or [Facebook][13].

Big thanks to early adopters for their help in bringing the project to this stage—all the authors for their free models, Sketchfab for providing access, and the Babylon.js community that makes it all just work across platforms.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/open-source-metaverse

作者：[Josip Almasi][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jalmasi
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/innovation_virtual_gadgets_device_drone.png?itok=JTAgRb-1 (new techie gadgets representing innovation)
[2]: https://www.matthewball.vc/all/themetaverse
[3]: https://opensource.com/article/20/12/virtual-reality-server
[4]: https://sketchfab.com/
[5]: https://www.researchgate.net/publication/356987355_TOWARDS_AUTOMATIC_SKELETON_RECOGNITION_OF_HUMANOID_3D_CHARACTER
[6]: https://opensource.com/sites/default/files/uploads/free-avatars-at-vrspace.png (Free avatars at VRSpace)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/uploads/author-in-vrspace.png (Author's video avatar in VRSpace)
[9]: https://opensource.com/sites/default/files/uploads/vr-components-diagram.png (VR components diagram)
[10]: https://www.vrspace.org/
[11]: https://github.com/jalmasi/vrspace
[12]: https://www.youtube.com/channel/UCLdSg22i9MZ3u7ityj_PBxw
[13]: https://www.facebook.com/vrspace.org
