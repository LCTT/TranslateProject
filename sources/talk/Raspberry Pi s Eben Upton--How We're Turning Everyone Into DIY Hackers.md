zpl1025, so loooooooooooooooog........... 
Raspberry Pi's Eben Upton: How We're Turning Everyone Into DIY Hackers
================================================================================
> Inside the mind that prototyped a $35 computer for tinkerers.

I’ll never forget my first time seeing a Raspberry Pi. The tiny, credit-card sized computer is powerful enough to operate as a home PC, a media center, a gaming console, or anything you can dream up. At only $35, it’s a bargain for tinkerers of all ages who want to try out hardware and software experiments without worrying about bricking their pricier family computers.

[Eben Upton][1], cofounder of the Raspberry Pi Foundation, is generally credited as the magician behind this incredible machine. While working on his doctorate in philosophy at the University of Cambridge's computer laboratory, Upton painstakingly put together Raspberry Pi prototypes by hand.

Today, Upton is CEO of the Raspberry Pi Foundation’s trading company, where he oversees production and sales of the Raspberry Pi. The foundation has now sold more than 2.5 million units.

### Pi In The Sky ###

ReadWrite: What got you really interested in technology in the first place? How did that lead you eventually to the Raspberry Pi project?

**Eben Upton**: So I actually got started when I was a kid. I have a father who has a certain amount of interest in engineering. He’s not an engineer, he’s an English academic. There were always piles of electrical stuff around the house that I used to play with before I understood what it did. Little things like making a light to have by your bed so you could read after “lights out” and stuff.

![](http://readwrite.com/files/raspberry%20pi%20black-and-white%20flickr%20johan%20larsson.jpg)

And then I got a computer. In the UK we have these machines called [BBC Microcomputers][2], which were 8-bit micros that were build for education. We had them at school, I got into programming at school, and I enjoyed it.

These things weren’t necessarily in school for programming, or at least they didn’t tend to get used for programming. They would get used to run educational software. But I used to program on them. And then I bought one to program at home. I mean, the day I got my BBC micro, I went in my room, turned it on, and never came out again. [Laughs]

Programming is amazing for a kid. When you’re a kid you don’t have a lot of power. You don’t have a lot of agency, a lot of control over the world around you. The great thing about programming is it’s a little world where you do whatever you want. And I certainly found that very compelling.

I’d always been interested in science, math, kind of hard science subjects. Did a lot of computing, did a lot of programming on my BBC. I had a Commodore Amiga after that.

At university I did a mixture of physics, engineering, and computer science. And then that really kind of led me to the Pi. Because after I’d been at university for a decade [while getting a doctorate], I realized that the kids who were arriving hadn’t had the chance to have that set of experiences as a child. You could still get Legos but … that ladder. 

We’d kind of pulled the ladder up after us. We built these very sophisticated and user-friendly computers for children to use now. Or not even computers—game consoles and phones and tablets, kind of appliances. But people were being denied that opportunity to tinker. So really Raspberry Pi is an attempt to get back—without kind of being too retro—some of what we kind of feel was lost from the evolution of computers over the last 25 years.

**RW:** What were some of the biggest hurdles you had to overcome?

**EU:** Well, we didn’t have any investors, so that was one nice thing. We’ve been trying to do this since 2006 so you can see it took us a long time to get from the idea of a Raspberry Pi to something you could sell. Finding something that had the right tradeoff between price and performance, or price and programmability was a big deal.

Getting the money together. We’re a not-for-profit, so we had to go find some money, and there ended up being a few of us on the board of trustees just loaning money out of our own pockets. So we had about a quarter of a million dollars of startup funding which was entirely loans from me and a couple of other people. So having the guts to do that, I guess.

![](http://readwrite.com/files/raspberry%20pi%20flickr%20clive%20darra.jpg)

### From East To West ###

Finding a way to get it manufactured at the right price. We ended up taking an unusual route. Generally when people make more conventional products, what they do is make them locally, when they’re low volume. And they [manufacturers] charge a high price. Most people have thicker margins than Raspberry Pi.

So what people do is manufacture in the west. Later on, in search of a squeeze, they got the volume and are looking to improve their production costs, so they go to the far east.

The issue for us was that, because we didn’t have enough margin to support that kind of order, we built our very first units in China. Which was of course, at first a slightly daunting prospect. I knew nothing about manufacturing in China, and we ended up sending $50,000 of chips and $50,000 to some guy in Hong Kong. And he sent us back 2,000 working Raspberry Pis.

It got to the point where there was a little bit of a delay and we were convinced that we’d gotten shafted. And then one day, the first 2,000 of now 2.5 million Raspberry Pis turned up on the doorstep on a pallet.

This UPS guy comes out of his truck with a pallet and a pallet jack and jacks this pallet into the garage. It’s got 2,000 Raspberry Pis on it and each one of those is massively more powerful than any computer I had when I was a kid. And we were just picking them out at random out of the pallet just to sample them and they all worked perfectly. 

So getting lucky, I guess, with China, and then finally having got the volume, we went in the other direction from everyone else. I guess the other defining moment in the project was when we realized that, having got the volume, we could now build in the west for the same price we would have been able to build in China. So we were able to repatriate, to reshore all the manufacturing back to Wales, which is where I was born. Kind of a nice sort of circle.

**RW:** Were there any precursors to the Pi that didn’t work out?

**EU:** Yeah, we built a number of different prototype devices. We were trying to build something that was programmable but interesting to kids. “Interesting to kids” means kind of … powerful in some respects. Able to play video and games and go on the Web.

We had a number of prototypes that met the price goal and the programmability goal, but it was only very late, post 2010 and 2011, that we were able to identify a path that allowed us to build something that was also powerful enough that kids were going to engage with it. 

### Whence The Pi Was Baked ###

**RW:** Tell me about inventing the Raspberry Pi.

**EU:** We tried building some units based on what you’d call microcontroller technology. I don’t know if you’ve come across an [open source electronics prototyping] platform called Arduino? Sort of a similar level of performance to the Arduino. The nice thing about those chips is they’re very available, they’re commodity parts, they’re very cheap and easy to get ahold of.

![](http://readwrite.com/files/raspberry%20pi%20pibow%20flickr%20peet%20sneekes.jpg)

So we tried that. And we ended up with something which was technically a computer—you plug it into your television and stuff. But it was kind of primitive and it was clear that kids weren’t going to engage with it. So that was prototype one, and that prototype is coming to a museum in Ireland in an exhibition called “Fail.” [Laughs] I’m going to go see it next month. It’s in a glass cabinet as an example of a glorious failure.

The nice thing about that was that was hand built. You can’t really build a modern Raspberry Pi by hand. But this one was primitive enough that you could actually solder it together and I soldered it together in a week. And it was a nice little toy.

After I’d been at university for a decade of so, I went to work for a company called Broadcom, which is based in southern California but has a big office in Cambridge. They make cellphone chips. And we realized that cell phone chips are quite a good fit. They’re quite a good platform for building a Pi-like device, since they have a lot of graphics performance.

I built a prototype based on that, based on a Broadcom dev kit. And that was much more powerful, much more capable, again at the same price point. But the challenge we had with that was that it was really a custom environment. It wasn’t a standards based platform.

We were writing our own SD card drivers, our own file system, our own text editor. You find yourself doing a lot of basic work and although you end up with a platform which is powerful and programmable, it's completely nonstandard [and] completely unlike any other machine. You don’t get to leverage any of the work that’s already been done by people on desktop platforms. That was prototype two.

The real breakthrough for us was with prototype three. We got hold of another chip from Broadcom which had an ARM processor which was able to run standard Linux. That was really the point where we realized we had something that met all our goals. And that was the product we went to market with. 

### Hacking The Next Generation Of Hackers ###

**RW:** Kids as young as eight have built projects using the Raspberry Pi. Did you intend that, or did it take you by surprise? 

**EU:** Eight is a good age. I think everyone defines the right age as being the age when they started programming. I was eight when I started programming. To some extent, all a child needs is to be old enough to have the relevant suite of cognitive skills, kind of problem solving type skills. A little bit of math maybe, at school.

![](http://readwrite.com/files/raspberry%20pi%20lego%20flickr%20luca%20sbardella.jpg)

To be old enough to be able to plan activities—programming is the ultimate planned activity. You need to have the mental equipment to do that. By the age of eight, a lot of children are quite mature in their way of thinking. You also need mechanical dexterity; another challenge that younger children have is the lack of mechanical dexterity required to use a keyboard. 

So eight’s a great age. You’ve got the physical equipment, the mental equipment, and you’re still at that point in your life where you’re able to learn new things very easily. Your brain’s very plastic, you’re able to learn languages....

I mean, if you want a child to learn French, start teaching them at eight, don’t start teaching them at 16. One of the weaknesses we have historically in our formal teaching of computing is we start people incredibly late, and then are surprised when people have difficulty picking up the concepts. So I think the younger you can get them the better and eight is a fantastic age. Eight, 10, 12—12 is maybe a little bit late.

Our foundation CEO, [Lance][3] [Howarth], is particularly passionate about primary education. He really perceives a real opportunity there to do something quite special. 

**RW:** So that was an intention of the Raspberry Pi, to get really young kids programming?

**EU:** I think we’ve always thought that young kids could do programming just by example. But the intention of the Raspberry Pi was to make this thing available and just see who buys it. We always believed that at least a subset of young children would find it exciting. Now we have the breadth and scale to get it to young kids with support. 

There’s a big difference between [just] making a platform like Raspberry Pi available and offering support for it. I think if you just make it available, you’ll find one percent of eight-year-olds will be the one percent who love that sort of thing and will get into it, regardless of how much or how little support you give them. 

I think the real opportunity for the foundation right now is that, since we can afford to pay for the development of educational material, we can afford to advocate for good training for teachers throughout this. There’s an opportunity to get more than one percent. There’s an opportunity to reach the bright kids who don’t quite have the natural inclination to personally tackle complicated technical tasks. If you give them good teaching and compelling material that’s relevant and interesting to them, you can reach ten percent, twenty percent, fifty percent, many more. 

We look back to the 1980s as this golden era [of learning to program], and in practice, only a very few percent of people were learning to program to any great degree. Most people could probably write a couple of lines. But doing any significant programming was still rare.

I think the real opportunity for us now, because we can intervene on the material and teacher training levels, we can potentially blow past where we were in the 1980s. There’s much more participation, there’s much more gender equality. Programming was largely a boy’s activity in the 1980s, and that’s now reflected in the makeup of our engineering community. I think there’s a real opportunity to get more girls programming computers. That’s the lowest of low hanging fruit. If we do that, we instantly double the number of people. 

There are a lot of opportunities and I think the most satisfying thing for Pi is we’re kind of at the scale where we can start to attack some of them.

### Pi For Everyone ###

**RW:** What does that say to you about the potential demand for DIY projects like the Pi? Are we all going to be DIY hackers one day?

**EU:** Yeah, I mean, that’s the thing. There is an enormous demand for it. And I think that there is a tie to the maker community. The maker community is much more developed in American than it is in the UK. We do have maker fairs and hackerspaces now, but it’s probably five years behind where it is in the U.S.

So one thing we found when we started talking about Raspberry Pi, when it started getting international attention, we found we were launching into this very well established community of people who like doing all sorts of DIY activity: knitting, or, you know, woodworking.

So that’s one of the things that led to that surprise increase in volume for the Pi. Makers who see it as a component they can use to build their projects. Which is great!

**RW:** What do you think about the emergence of mainstream hardware-hacking culture?

**EU:** I mean, it’s fantastic, right? It’s something we would never have predicted on the software engineering front. I’ve come to this stuff from a software background, so the fact that most of the cool stuff people do with the Raspberry Pi is hardware related is surprising to me. It’s not surprising to me anymore, but it was surprising to me originally. 

![](http://readwrite.com/files/raspberry%20pi%20robot%20flickr%20ashley%20basil.jpg)

I think it’s a very positive trend, for all sorts of reasons. It’s positive because it provides children with relevant experiences. In my mind, moving pixels around on the screen is still cool, but in reality, it’s much less cool than it was in the 1980s. I think moving objects around in the world, like robots, is what’s cool for kids now.

When you get more relevance, you attract more girls. There’s a really insidious tendency to try and design activities for girls around tech, and it actually isn’t about girls. It’s about appealing to a broader audience.

There is this tiny segment—I’ve talked about the one percent, the kids who find the abstract computer programming exciting. “Let’s learn about variables!” And I was one of those kids. But that’s only a small number of people, and it seems to be boys, more often. I don’t know whether that’s a cultural thing or what but it just seems to be the way the world is.

Quite often when people are talking about pursuing relevance in order to attract girls, it’s not about attracting girls at all. It’s about attracting anyone other than that tiny little sliver of boys. You’re not just attracting girls, you’re attracting all the other boys as well.

One of the wonderful things from an education standpoint is that part of actually doing stuff in the real world with a computer is automatically more relevant than just doing things on the computer itself. So it gives you a route to attract girls into the subject, it gives you a route to track more than one percent of boys into the subject. 

It’s great not to be alone. It’s fantastic to be launching into this tidal wave of interest, of people doing stuff in the real world. I know a guy in southern California whose two hobbies are Pi hacking and making his own chainmail. It’s just a wonderful thing that people are doing that sort of stuff.

### Sharing The Pi ###

**RW:** Can you give me an example of the sort of “relevant” projects that attract more than the one percent?

**EU:** The whole broad area of robotics is one. There are just vast numbers of people using the Pi as a base to make little robots that run around and do stuff, particularly now that we have the camera module, which acts as kind of computer vision.

I think other camera-based projects as well tend to get a lot of play. People doing wildlife photography type things, people doing time lapse photography, a wide range of stuff because we have this $25 camera module, and an infrared version so you can do nighttime animal photography—writing scripts to take pictures at night and save away the ones that have some motion in them. So those ones are nice.

I’m particularly fond of anything that has to do with high altitude ballooning. Environmental monitoring—there are some high school kids in the UK who did an IndieGoGo called [AirPi][4], which is a pollution monitoring shield that would sit on top of the Pi. So lots of those things that let you do physics or chemistry or biology using the Pi—those are the things that I think have relevance. Those are the things that are much easier to justify to the bulk of kids as a thing that’s worth paying attention to. 

**RW:** When will we be seeing a Raspberry Pi Model C?

**EU:** We have no plans at the moment. We are mostly doing software work at the moment. I think we’ve discovered that there is a large amount of performance gain available by nickel and diming the software, buffing it a little bit.

If we go and make a Model C, we orphan 2.5 million people who are committed to the current platform. So I think we are, at least for now, pretty committed to trying to do software work because that helps all of those people who are in the field. We feel there is still significant performance gain available through software optimization.

Obviously, we’ll have to do something [about hardware] at some point. I don’t really known when. If we’re still shipping the Pi Model B in 2017, 2018, that would be bad. But I think we’re probably a year away from giving any serious consideration to what to do next.

**RW:** Lots of people are building projects using both the Pi and Arduino, the DIY electronics-hacking kit. Did you design Pi with kits like Arduino in mind?

**EU:** Not really, but we realized very early on there could sometimes be a tendency in the press to see us as a competitor to the Arduino. We were always skeptical, I think, as to whether that was really the case because I think the Pi and Arduino do different things and do them well.

We didn’t design it to work with the Arduino, but the Arduino is designed to work with a house PC. We make a great low power house PC for the Arduino. So yeah, it was just lucky, I guess.

**RW:** What do you use Raspberry Pi for at home? At work?

**EU:** At home, I use it as a media center; that’s a fairly common use of the Pi. It’s an interesting thing that you have people doing actual consumer electronics, using it as a piece of consumer electronics. And I’m certainly one of those. 

I don’t have anywhere near as much time to play with it at work as I would like. Usually when I get a Pi at work it’s because I’m testing some new piece of software that I’ve commissioned. Mostly I’m just using it to check that the contractors I’ve paid to do work have done a good job.

I’m really hoping that I will get some more downtime over the next year. Sometimes it feels like, aside from the media center, I’ve been involved with making this fantastic toy, and because it’s been so successful I don’t get much time to play with it. 

But it’s really gratifying to see how many people are having fun with it, to see it show up in different places. I understand we got mentioned on The Big Bang Theory, I need to track down the episode. It shows up in all these unusual places. It’s really nice to see how many people have taken it to heart and started doing stuff with it.

Eben Upton image courtesy of the Raspberry Pi Foundation; Raspberry Pi images by Flickr users [Johan Larsson][5], [Clive Darra][6], [Pete Sneekes][7], [Luca Sbardella][8] and [Ashley Basil][9]

--------------------------------------------------------------------------------

via: http://readwrite.com/2014/04/08/raspberry-pi-eben-upton-builders#awesm=~oBGnazhOCOfaUd

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://twitter.com/EbenUpton
[2]:http://en.wikipedia.org/wiki/BBC_Micro
[3]:http://www.raspberrypi.org/welcome-lance/
[4]:http://airpi.es/
[5]:https://www.flickr.com/photos/johanl/8384790662
[6]:https://www.flickr.com/photos/osde-info/8626662243
[7]:https://www.flickr.com/photos/p8/7950485168
[8]:https://www.flickr.com/photos/sbardella/7473604878
[9]:https://www.flickr.com/photos/28438417@N08/8006786385/in/photolist-dcwSD8-d8PKa3-bmosVm-bmosWG-bz3YJF-e8NRQD-btyqN1-dorXrE-hTF7id-hTF7jL-hTF4mJ-hTF4jj-hTF4q1-hTF7jA-hTF7gj-gKRLrn-ftALdo-c7Qnjs-c7Qnyh-c7QmZj-c7QnY1-c7QmNY-cu8zs3-cu8BWm-cu8u5S-cu8yC3-cu8DBN-cu8wRq-cu8xNL-cu8CJj-cu8tss-cu8BcG-cu8uVL-cu8AoW-hTF7dU-hTEzCr-hTFBCp-hTFBvR-hTFBBH-hTF4hA-hTF7c1-hTEzza-hTFBM2-cdtf1b-bz7n87-gKQSJ7-gKQUko-ds8x8q-dqweVP-cVwvJq
