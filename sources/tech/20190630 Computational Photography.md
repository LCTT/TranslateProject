[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Computational Photography)
[#]: via: (https://vas3k.com/blog/computational_photography/)
[#]: author: (vas3k https://vas3k.com/)

Computational Photography
======
![](https://i.vas3k.ru/full/853.png)

It's impossible to imagine a smartphone presentation today without dancing around its camera. Google makes Pixel shoot in the dark, Huawei zooms like a telescope, Samsung puts lidars inside, and Apple presents the new world's roundest corners. Illegal level of innovations happening here.

DSLRs, on the other hand, seems half dead. Sony showers everybody with a new sensor-megapixel rain every year, while manufacturers lazily update the minor version number and keep lying on piles of cash from movie makers. I have a $3000 Nikon on my desk, but I take an iPhone on my travels. Why?

I went online with this question. There, I saw a lot of debates about "algorithms" and "neural networks", though no one could explain how exactly they affect a photo. Journalists are loudly reading the number of megapixels from press releases, bloggers are shitting down the Internet with more unboxings, and the camera-nerds are overflowing it with "sensual perception of the sensor color palette". Ah, Internet. You gave us access to all the information. Love you.

Thus, I spent half of my life to understand the whole thing on my own. I'll try to explain everything I found in this article, otherwise I'll forget it in a month.

[📔 Download pdf, epub, mobi
convenient for reading offline][1] [❤️ Support me][2]

This article in other languages: [Russian][3]

### What is Computational Photography?

Everywhere, including [wikipedia][4], you get a definition like this: computational photography is a digital image capture and processing techniques that use digital computation instead of optical processes. Everything is fine with it except that's bullshit. It includes even an autofocus, but not plenoptic, which has already brought a lot of good stuff to us. The fuzziness of the official definitions kinda indicates that we still have no idea what are we doing.

Stanford Professor and pioneer of computational photography Marc Levoy (he's also in charge of Google Pixel's camera now) [gives][5] another definition - computational imaging techniques that enhance or extend the capabilities of digital photography in which the output is an ordinary photograph, but one that could not have been taken by a traditional camera. I like it more, and in the article, I will follow this definition.

So, the smartphones were to blame for everything.

> Smartphones had no choice but to give life to a new kind of photography — computational

They had little noisy sensors and tiny slow lenses. According to all the laws of physics, they could only bring us pain and suffering. And they did. Until some devs figured out how to use their strengths to overcome the weaknesses: fast electronic shutters, powerful processors, and software.

<https://i.vas3k.ru/88h.jpg>

Most of the significant research in computational photography field was done in 2005-2015, that counts yesterday in science. Means, right now, just in front of our eyes and inside our pockets, there's a new field of knowledge and technology is rising, that never existed before.

<https://i.vas3k.ru/87c.jpg>

Computational photography isn't just about the bokeh on selfies. A recent photograph of a black hole would not have been taken without using computational photography methods. To take such picture with a standard telescope, we would have to make it the size of the Earth. However, by combining the data of eight radio telescopes at different locations of our Earth-ball and writing [some cool Python scripts][6], we got the world's first picture of the event horizon.

It's still good for selfies though, don't worry.

📝 [Computational Photography: Principles and Practice][7]
📝 [Marc Levoy: New Techniques in Computational photography][8]

I'm going to insert such links in the course of the story. They will lead you to the rare brilliant articles 📝 or videos 🎥, that I found, and allow you to dive deeper into the topic if you suddenly became interested. Because I physically can't tell you everything in one blog post.

### The Beginning: Digital Processing

Let's get back to 2010. Justin Bieber released his first album, Burj Khalifa just opened in Dubai, but we couldn't even capture these two great universe events, because our photos were noisy 2-megapixel JPEGs. We got the first irresistible desire to hide the worthlessness of mobile cameras by using "vintage" presets. Instagram cames out.

<https://i.vas3k.ru/88i.jpg>

### Math and Instagram

With the release of Instagram, everyone got obsessed with filters. As the man who reverse engineered the X-Pro II, Lo-Fi, and Valencia for, of course, research (hehe) purposes, I still remember that they comprised three components:

<https://i.vas3k.ru/85k.jpg>

  * Color settings (Hue, Saturation, Lightness, Contrast, Levels, etc.) are simple coefficients, just like in any presets that photographers used since ancient times.



<https://i.vas3k.ru/85i.jpg>

  * Tone Mapping is a vector of values, each tells us that "red with a hue of 128 should be turned into a hue of 240". It often represented as a single-pixel picture, like [this one][9]. This is an example for the X-Pro II filter.



<https://i.vas3k.ru/85t.jpg>

  * Overlay — translucent picture with dust, grain, vignette, and everything else that can be applied from above to get (not at all, yeah) the banal effect of the old film. Used rarely.



Modern filters have not gone far from these three, but have become a little more complicated from the math perspective. With the advent of hardware shaders and [OpenCL][10] on smartphones, they were quickly rewritten under the GPU, and it was considered insanely cool. For 2012, of course. Today any kid can do the same thing [on CSS][11], but he still won't invite a girl to prom.

However, the progress in the area of filters has not stopped there. Guys from [Dehanсer][12], for example, are getting very hands-on with non-linear filters. Instead of poor-human tone-mapping, they use more posh and complex non-linear transformations, which opens up much more opportunities, according to them.

You can do a lot of things with non-linear transformations, but they are incredibly complex, and we humans are incredibly stupid. As soon as it comes to non-linear transformations, we prefer to go with numerical methods or run neural networks to do our job. The same thing happens here.

### Automation and Dreams of a "Masterpiece" Button

When everybody got used to filters, we started to integrate them right into our cameras. It's hidden in history whoever was the first manufacturer to implement this, but just to understand how long ago it was, think, that in iOS 5.0 released in 2011 we already had a public API for [Auto Enhancing Images][13]. Only Steve Jobs knows how long it was in use before it opened to the public.

The automation was doing the same thing that any of us does by opening the photo editor — it fixed the lights and shadows, increased the brightness, took away the red eyes, and fixed the face color. Users didn't even know that "dramatically improved camera" was just the merit of a couple of new lines of code.

<https://i.vas3k.ru/865.jpg>ML Enhance in Pixelmator

Today, the battles for the Masterpiece button have moved to the machine learning field. Tired of playing with tone-mapping everyone rushed to the hype train [CNN's and GAN's][14] and started, forcing computers to move the sliders for us. In other words, to use an input image to determine a set of optimal parameters that will bring the given image closer to a particular subjective understanding of "good photography". Check out how it's implemented in [Pixelmator Pro][15] and other editors who's luring you with their fancy "ML" features stated on a landing page. It doesn't always work well, as you can guess. But you can always take the datasets and train your own network to beat these guys, using the links below. Or not.

📝 [Image Enhancement Papers][16]
📝 [DSLR-Quality Photos on Mobile Devices with Deep Convolutional Networks][17]

### [Stacking 90% success of mobile cameras](#scroll50)

True computational photography began with stacking — a method of combining several photos on top of each other. It's not a big deal for a smartphone to shoot a dozen pics in half a second. There're no slow mechanical parts in their cameras: the aperture is fixed, and there is an electronic shutter instead of the "moving curtain". The processor simply tells the sensor how many microseconds it should catch the wild photons, and reads the result.

Technically, the phone can shoot photos at a speed of the video, and it can shoot video in a photo resolution, but all that is slowed down to the speed of the bus and processor. Therefore, there is always a software limitation.

Stacking has been with us for a while. Even the founders' fathers used plugins for Photoshop 7.0 to gather some crazy-sharpened HDR photos or to make a panorama of 18000x600 pixels, and… no one figured out what to do with them next. Good wild times.

Now, as grown-ups, we call it "[epsilon photography][18]", which means changing one of the camera parameters (exposure, focus, or position) and putting images together to get something that couldn't be captured in one shot. Although, in practice, we call it stacking. Nowadays, 90% of all mobile camera innovations are based on it.

<https://i.vas3k.ru/85d.jpeg>

There's a thing many people don't care, but it's crucial for understanding the entire mobile photography: **Modern smartphone camera starts taking photos as soon as you open it**. Which is logical, since it should show the image on screen somehow. But in addition to that, it saves high-resolution images to its cyclic buffer and stores them for a couple more seconds. No, not only for NSA.

> When you tap "take a photo" button, the photo has actually already been taken, and the camera is just using the last picture from the buffer

That's how any mobile camera works today. At least the top ones. Buffering allows implementing not only zero [shutter lag][19], which photographers begged for so long, but even a negative one. By pressing the button, the smartphone looks in the past, unloads 5-10 last photos from the buffer and starts to analyze and combine them furiously. No longer need to wait till phone snaps shots for HDR or a night mode — let's simply pick them up from the buffer, the user won't even realize.

In fact, that's how Live Photo implemented in iPhones, and HTC had it back in 2013 under a strange name [Zoe][20].

#### [Exposure Stacking HDR and brightness control](#scroll60)

<https://i.vas3k.ru/85x.jpg>

The old and hot topic is whether the camera sensors [can capture the entire brightness range available to our eyes][21]. Some people say no, as the eye can see up to 25 [f-stops][22] and even the top full-frame sensor can be stretched out to a maximum of 14. Others call the comparison incorrect, since our eyes are assisted by the brain, which automatically adjusts your pupils and completes the image with its neural networks. So the instantaneous dynamic range of the eye is actually no more than 10-14 f-stops. Too hard. Let's leave these disputes to scientists.

The fact remains — taking pictures of friends against a bright sky, without HDR, with any mobile camera, you get either a natural sky and dark faces of friends, or natural faces, but completely burned sky.

The solution was found a long time ago — to expand the brightness range using HDR (High-dynamic-range) process. When we can't get a wide range of brightness right away, we can do it in three steps (or more). We can shoot several pictures with different exposure — "normal" one, brighter, and darker one. Then we can fill in the shady spots using the bright photo, and restore overexposed spots from the dark one.

One last thing needs to be done here is solving the problem of automatic bracketing. How far do we shift the exposure of each photo so as not to overdo it? However, any second-year tech student can do it today using some Python libraries.

<https://i.vas3k.ru/86t.jpg>

The latest iPhone, Pixel and Galaxy turn on HDR mode automatically when a simple algorithm inside their cameras detects you're shooting on a sunny day. You can even see how the phone switches to buffer mode to save shifted images — fps drops down, and the picture on the screen becomes juicier. That moment of switching is every time clearly visible on my iPhone X. Take a closer look at your smartphone next time.

<https://i.vas3k.ru/87u.png>

The main disadvantage of HDR with exposure bracketing is its incredible uselessness in poor lighting. Even in the light of a home lamp, the images come out so dark that even the machine cannot level and stack them together. To solve the problem, Google announced a different approach to HDR in a Nexus smartphone back to 2013. It was using time stacking.

#### [Time Stacking Long exposure and time lapse](#scroll70)

<https://i.vas3k.ru/85v.jpg>

Time stacking allows you to get a long exposure look with a series of short shots. This approach pioneered by the guys, who liked to take pictures of star trails in the night sky. Even with a tripod, it was impossible to shot such pictures by opening the shutter once for two hours. You had to calculate all the settings beforehand, and the slightest shaking would spoil the whole shot. So they decided to divide the process into a few minute intervals and stack the pictures together later in Photoshop.

<https://i.vas3k.ru/86u.jpg>These star patterns are always glued together from a series of photos. That make it easier to control exposure

Thus, the camera never was shooting with a long exposure; we simulated the effect by combining several consecutive shots. Smartphones have a lot of apps using this trick for a long time, but now almost every manufacturer added it to standard camera tools.

<https://i.vas3k.ru/86f.jpg>A long exposure made of iPhone's Live Photo in 3 clicks

Let's get back to Google and its night-time HDR. It turned out that using time bracketing you can create a decent HDR in the dark. This technology appeared in Nexus 5 for the first time and was called HDR+. The technology is still so popular that [it is even praised][23] in the latest Pixel presentation.

HDR+ works quite simple: once the camera detects that you're shooting in the dark, it takes the last 8-15 RAW photos out of the buffer out and stacks them on top of each other. This way, the algorithm collects more information about the dark areas of the shot to minimize the noise — pixels, when due to some reasons the camera screwed up and failed to catch some photons on each particular frame.

Imagine that: you have no idea how [capybara][24] looks like, so you decided to ask five people about it. Their stories would be roughly the same, but each will mention any unique detail, and so you'd gather more information than if asking only one person. Same happens with pixels on photo. More information — more clarity and less noise.

📝 [HDR+: Low Light and High Dynamic Range photography in the Google Camera App][25]

Combining the images captured from the same point gives the same fake long exposure effect as in the example with the stars above. Exposure of dozens of pictures is summarized, and errors on one picture are minimized on the other. Imagine how many times you would have to slam the shutter in your DSLR to achieve this.

<https://i.vas3k.ru/86g.jpg>Pixel ad that glorifies HDR+ and Night Sight

Only one thing left, and this is an automatic color casting. Shots taken in the dark usually have broken color balance (yellowish or greenish), so we need to fix it manually. In earlier versions of HDR+, the issue was resolved by simple auto-toning fix, à la Instagram filters. Later, they brought a neural network to the rescue.

That's how [Night Sight][26] was born — "the night photography" technology in Pixel 2, 3, and later. The description says "machine learning techniques built on top of HDR+ that make Night Sight work". In fact, it's just a fancy name for a neural network and all the HDR+ post-processing steps. The machine was trained on "before" and "after" dataset of photos to make one beautiful image out of a set of dark and dirty ones.

<https://i.vas3k.ru/88k.jpg>

This dataset, by the way, was made public. Maybe Apple guys will take it and finally teach their "world-best cameras" to shoot in the dark?

Also, Night Sight calculates the [motion vector][27] of the objects in the shot to normalize the blurring, that's for sure will appear in a long exposure. Thus, the smartphone can take sharp parts from other shots and stack them.

📝 [Night Sight: Seeing in the Dark on Pixel Phones][28]
📝 [Introducing the HDR+ Burst Photography Dataset][29]

#### [Focus Stacking DoF and refocus in post-production](#scroll90)

<https://i.vas3k.ru/85y.jpg>

The method came from macro photography, where the depth of field has always been a problem. To keep the entire object in focus, you had to take several shots, moving focus back and forth, and combine them later into one sharp shot in photoshop. The same method is often used by landscape photographers to make the foreground and background sharp as shark.

<https://i.vas3k.ru/86c.jpg>Focus stacking in macro. DoF is too small and you can't shoot it one go

Of course, it all migrated to smartphones. With no hype, though. Nokia released Lumia 1020 with "Refocus App" in 2013, and Samsung Galaxy S5 did the same in 2014 with "[Selective Focus][30]". Both used the same approach — they quickly took 3 photos: focused one, focus shifted forth and shifted back. The camera then aligned the images and allowed you to choose one of them, which was introduced as a "real" focus control in the post-production.

There was no further processing, as even this simple hack was enough to hammer another nail in the coffin of Lytro and analogs that used a fair refocus. Let's talk about them, by the way (topic change master 80 lvl).

### [Computational Sensor Plenoptic and Light Fields](#scroll100)

Well, our sensors are shit. We simply got used to it and trying to do our best with them. They haven't changed much in their design from the beginning of time. Technical process was the only thing that improved — we reduced the distance between pixels, fought noise, and added specific pixels for [phase-detection autofocus system][31]. But even if we take the most expensive camera to try to photograph a running cat in the indoor light, the cat will win.

<https://i.vas3k.ru/88p.jpg>

🎥 [The Science of Camera Sensors][32]

<https://i.vas3k.ru/881.jpg>

We've been trying to invent a better sensor for a long time. You can google a lot of researches in this field by "computational sensor" or "non-Bayer sensor" queries. Even the Pixel Shifting example can be referred to as an attempt to improve sensors with calculations.

The most promising stories of the last twenty years, though, come to us from plenoptic cameras.

To calm your sense of impending boring math, I'll throw in the insider's note — the last Google Pixel camera is a little bit plenoptic. With only two pixels in one, there's still enough to calculate a fair optical depth of field map without having a second camera like everyone else.

Plenoptics is a powerful weapon that hasn't fired yet.

#### [Light Field More than a photo, less than VR](#scroll190)

Usually, the explanation of plenoptic starts from light fields. And yes, from the science perspective, the plenoptic camera captures the light field, not just the photo. Plenus comes from the Latin "full", i.e., collecting all the information about the rays of light. Just like a Parliament plenary session.

Let's get to the bottom of this to understand what is a light field is and why do we need it.

Traditional photo is two-dimensional. There, where ray hit a sensor will be a pixel on a photo. The camera doesn't give a shit where the ray came from, whether it accidentally fell from aside or was reflected by a lovely lady's ass. The photo captures only the point of intersection of the ray with the surface of the sensor. So it's kinda 2D.

Light field image is the same, but with a new component — the origin of the ray. Means, it captures the ray vector in 3D space. Like calculating the lighting of a video game, but the other way around — we're trying to catch the scene, not create it. The light field is a set of all the light rays in our scene — both coming from the light sources and reflected.

<https://i.vas3k.ru/86h.png>There are a lot of mathematical models of light fields. Here's one of the most representative

The light field is essentially a visual model of the space around it. We can easily compute any photo within this space mathematically. Point of view, depth of field, aperture — all these are also computable.

I love to draw an analogy with a city here. Photography is like your favourite path from your home to the bar you always remember, while the light field is a map of the whole town. Using the map, you can calculate any route from point A to B. In the same way, knowing the light field, we can calculate any photo.

For an ordinary photo it's an overkill, I agree. But here comes the VR, where the light fields there are one of the most promising areas.

Having a light field model of an object or a room allows you to see this object or a room from any point in space as if everything around is virtual reality. It's no longer necessary to build a 3D-model of the room if we want to walk through it. We can "simply" capture all the rays inside it and calculate a picture of the room. Simply, yeah. That's what we're fighting over.

📝 [Google AR and VR: Experimenting with Light Fields][33]

[![][34]][35]

Saying optics, I with the [guys from Stanford][36] mean not only lenses but everything in between the object and sensor. Even the aperture and shutter. Sorry, photography snobs. I feel your pain.

#### Multi-camera

<https://i.vas3k.ru/851.jpg>

In 2014, the HTC One (M8) was released and became the first smartphone with two cameras and amusing computational photography [features][37] such as replacing the background with rain or sparkles.

The race has begun. Everybody started putting two, three, five lenses into their smartphones, trying to argue whether telephoto or wide-angle lens is better. Eventually, we got the [Light L16][38] camera. 16-lensed, as you can guess.

<https://i.vas3k.ru/859.jpg>Light L16

L16 was no longer a smartphone, but rather a new kind of pocket camera. It promised to reach the quality of top DSLRs with a high-aperture lens and full-frame sensor while yet fitting into your pocket. The power of computational photography algorithms was the main selling point.

<https://i.vas3k.ru/854.jpg>Telephoto-periscope, P30 Pro

It had 16 lenses: 5 x 28mm wide-angle and 5 x 70mm and 6 x 150mm telephoto. Each telephoto was periscope-style, meaning that the light did not flow directly through the lens to the sensor, but was reflected by a mirror inside the body. This configuration made it possible to fit a sufficiently long telephoto into a flat body, rather than stick out a "pipe" from it. Huawei recently did the same thing in the P30 Pro.

Each L16 photo was shot simultaneously on 10 or more lenses, and then the camera combined them to get a 52-megapixel image. According to the creators' idea, simultaneous shooting with several lenses made it possible to catch the same amount of light as with the large digital camera lens, artfully bypassing all the laws of optics.

Talking of software features, the first version had a depth of field and focus control in post-production. Minimal set. Having photos from different perspectives made it possible to compute the depth of the image and apply a decent software blur. Everything seemed nice on paper, so before the release, everybody even had hope for a bright computing future.

<https://i.vas3k.ru/88y.jpg>

In March 2018, Light L16 penetrated the market and… [miserably failed][39]. Yes, technologically it was in the future. However, at a price of $2000 it had no optical stabilization, so that the photos were always blurred (no wonder with 70-150 mm lenses), the autofocus was tediously slow, the algorithms of combining several pictures gave strange sharpness fluctuations, and there was no use for the camera in the dark, as it had no algorithms such as Google's HDR+ or Night Sight. Modern $500 point-and-shoot cameras with RAW support were able to do it from the start, so sales were discontinued after the first batch.

However, Light did not shut down at this point (hehe, pun). It raised the cash and continues to work on the new version with redoubled force. For instance, their technologies used in the recent [Nokia 9][40], which is a terrible dream of trypophobe. The idea is encouraging, so we are waiting for further innovations.

🎥 [Light L16 Review: Optical Insanity][41]

#### [

Coded Aperture
Deplur + Depth Map](#scroll220)

We're entering the area of telescopes, X-rays, and other fog of war. We won't go deep, but it's safer to fasten your seatbelts. The story of the coded aperture began where it was physically impossible to focus the rays: for gamma and X-ray radiation. Ask your physics teacher; they will explain why.

The essence of the coded aperture is to replace the standard petal diaphragm with a pattern. The position of the holes should ensure that the overall shape is maximally varied depending on the defocus — the more diverse, the better. Astronomers invented the whole range of [such patterns][42] for their telescopes. I'll cite the very classical one here.

<https://i.vas3k.ru/88z.jpg>

How does this work?

When we focus on the object, everything beyond our depth of field is blurred. Physically, blur is when a lens projects one ray onto several pixels of the sensor due to defocus. So a street lamp turns into a bokeh pancake.

Mathematicians use the term convolution and deconvolution to refer to these operations. Let's remember these words cause they sound cool!

<https://i.vas3k.ru/890.jpg>

Technically, we can turn any convolution back if we know the kernel. That's what mathematicians say. In reality, we have a limited sensor range and non-ideal lens, so all of our bokeh is far from the mathematical ideal and cannot be fully restored.

📝 [High-quality Motion Deblurring from a Single Image][43]

We can still try if we know the kernel of the convolution. Not gonna keep you waiting — the kernel is actually the shape of the aperture. In other words, the aperture makes a mathematical convolution using pure optics.

The problem is that the standard round aperture remains round at any level of blurring. Our kernel is always about the same; it's stable, but not very useful. In case of encoded aperture, rays with different defocus degrees will be encoded with different kernels. Readers with IQ > 150 have already guessed what will happen next.

The only issue remains is to understand which kernel is encoded in each area of the image. You can try it on manually, by testing different kernels and looking where the convolution turns out to be more accurate, but this is not our way. A long time ago, people invented the Fourier transform for this. Don't want to abuse you with calculus, so I'll add a link to my favorite explanation for those who are interested.

🎥 [But what is the Fourier Transform? A visual introduction][44]

All you need to know is that the Fourier transform allows you to find out which waves are dominant in the pile of overlapped ones. In the case of music, the Fourier will show the frequency of the notes in the complex chord. In the case of photography, it is the main pattern of overlapping light rays, which is the kernel of the convolution.

Since the form of the coded aperture is always different depending on the distance to the object — we can calculate that distance mathematically using only one simple image shot with a regular sensor!

Using the inverse convolution on the kernel, we can restore the blurred areas of the image. Bring back all the scattered pixels.

<https://i.vas3k.ru/872.jpg>The convolution kernel is at the top right

That's how most deblur tools work. It works even with an average round aperture, yet the result is less accurate.

The downside of the coded aperture is the noise and light loss, which we can't ignore. Lidars and fairly accurate ToF-cameras have wholly negated all the ideas of using a coded aperture in consumer gadgets. If you've seen it somewhere, write in comments.

📝 [Image and Depth from a Conventional Camera with a Coded Aperture][45]
📝 [Coded Aperture. Computational Photography WS 07/08][46]
🎥 [Coded aperture projection (SIGGRAPH 2008 Talks)][47]

#### Phase Coding (Wavefront Coding)

According to the latest news, the light is half the wave. Coding the aperture, we control the transparency of the lens, means we control the wave amplitude. Besides the amplitude, there is a phase, which can also be coded.

And yes. It can be done with an additional lens, which reverses the phase of light passing through it. Like on the Pink Floyd cover.

<https://i.vas3k.ru/892.jpg>

Then everything works like any other optical encoding. Different areas of the image encoded in different ways, and we can algorithmically recognize and fix them somehow. To shift the focus, for example.

What is good about phase coding is that we don't lose brightness. All photons reach the sensor, unlike in the coded aperture, where they bump into impenetrable parts of it (after all in the other half of the standards said that light is a particle).

The bad part is that we will always lose sharpness, as even the utterly focused objects will be smoothly blurred in the sensor, and we will have to call Fourier to gather them together for us. I'll attach the link with more detailed description and examples of photos below.

📝 [Computational Optics by Jongmin Baek, 2012][36]

#### [Flutter Shutter Fighting the motion blur](#scroll240)

The last thing we can code throughout the path of light to the sensor is the shutter. Instead of usual "open — wait — close" cycle, we will move the shutter several times per shot to result with the desired shutter speed. Sort of as in a multi-exposure, where one shot is exposed several times.

Let's imagine we decided to take pictures of a fast-moving car at night to see its license plate afterward. We don't have a flash, we can't use slow shutter speed, either we'll blur everything. It is necessary to lower the shutter speed, but so we get to a completely black image, and won't recognize the car. What to do?

It also is possible to take this shot in flutter shutter movements, so that the car smear not evenly, but like a "ladder" with a known interval. Thus, we encode the blur with a random sequence of open-close of the shutter, and we can try to decode it with the same inverse convolution. Appears it works much better than trying to get back pixels, evenly blurred with long shutter speed.

<https://i.vas3k.ru/893.jpg>

There are several algorithms for that. For the hardcore details, I'll again include links to some smart Indian guys' work.

📝 [Coded exposure photography: motion deblurring using fluttered shutter][48]
🎥 [Flutter Shutter Coded Filter][49]

Soon we'll go so goddamn crazy, so we'd want to control the lighting after the photo was taken too. To change the cloudy weather to a sunny one, or to change the lights on a model's face after shooting. Now it seems a bit wild, but let's talk again in ten years.

We've already invented a dumb device to control the light — a flash. They have come a long way: from the large lamp boxes that helped avoid the technical limitations of early cameras, to the modern LED flashes that spoil our pictures, so we mainly use them as a flashlight.

[![][50]][51]

#### Programmable Flash

It's been a long time since all smartphones switched to Dual LED flashes — a combination of orange and blue LEDs with brightness being adjusted to the color temperature of the shot. In the iPhone, for example, it's called True Tone and controlled by a small piece of code with a hacky formula. Even developers are not allowed to control it.

📝 [Demystifying iPhone’s Amber Flashlight][52]

<https://i.vas3k.ru/87k.jpg>

Then we started to think about the problem of all flashes — the overexposed faces and foreground. Everyone did it in their own way. iPhone got [Slow Sync Flash][53], which made camera artificially increase shutter speed in the dark. Google Pixel and other Android smartphones start using their depth sensors to combine images with and without flash, quickly made one by one. The foreground was taken from the photo without the flash when the background remained illuminated.

<https://i.vas3k.ru/86r.jpg>

The further use of a programmable multi-flash is vague. The only interesting application was found in computer vision, where it was used once in assembly scheme (like for Ikea book shelves) to detect the borders of objects more accurately. See the article below.

📝 [Non-photorealistic Camera:
Depth Edge Detection and Stylized Rendering using Multi-Flash Imaging][54]

#### Lightstage

Light is fast. It's always made light coding an easy thing to do. We can change the lighting a hundred times per shot and still not get close to its speed. That's how Lighstage was created back in 2005.

<https://i.vas3k.ru/86d.jpg>

🎥 [Lighstage demo video][55]

The essence of the method is to highlight the object from all possible angles in each shot of a real 24 fps movie. To get this done, we use 150+ lamps and a high-speed camera that captures hundreds of shots with different lighting conditions per shot.

A similar approach is now used when shooting mixed CGI graphics in movies. It allows you to fully control the lighting of the object in the post-production, placing it in scenes with absolutely random lighting. We just grab the shots illuminated from the required angle, tint them a little, done.

<https://i.vas3k.ru/86s.jpg>

<https://i.vas3k.ru/86e.jpg>

Unfortunately, it's hard to do it on mobile devices, but probably someone will like the idea. I've seen the app from guys who shot a 3D face model, illuminating it with the phone flashlight from different sides.

#### Lidar and Time-of-Flight Camera

Lidar is a device that determines the distance to the object. Thanks to a recent hype of self-driving cars, now we can find a cheap lidar on any dumpster. You've probably seen these rotating thingys at their roof? These are lidars.

We still can't fit a laser lidar into a smartphone, but we can go with its younger brother — [time-of-light camera][56]. The idea is ridiculously simple — a special separate camera with an LED-flash above it. The camera measures how quickly the light reaches the objects and creates a depth map of the image.

<https://i.vas3k.ru/868.jpg>

The accuracy of modern ToF cameras is about a centimeter. The latest Samsung and Huawei top models use them to create a bokeh map and for better autofocus in the dark. The latter, by the way, is quite good. I wish everybody had one.

Knowing the exact depth of field will be useful in the coming era of augmented reality. It will be much more accurate and effortless to shoot at the surfaces with lidar to make the first mapping in 3D than analyzing camera images.

#### Projector Illumination

To finally get serious about the computational lighting, we have to switch from regular LED flashes to projectors — devices that can project a 2D picture on a surface. Even a simple monochrome grid will be a good start for smartphones.

The first benefit of the projector is that it can illuminate only the part of the image that needs to be illuminated. No more burnt faces in the foreground. Objects can be recognized and ignored, just like laser headlights of modern car don't blind the oncoming drivers but illuminate pedestrians. Even with the minimum resolution of the projector, such as 100x100 dots, the possibilities are exciting.

<https://i.vas3k.ru/86i.jpg>Today, you can't surprise a kid with a car with a controllable light

The second and more realistic use of the projector is to project an invisible grid on a scene to detect its depth map. With a grid like this, you can safely throw away all your neural networks and lidars. All the distances to the objects in the image now can be calculated with the simplest computer vision algorithms. It was done in Microsoft Kinect times (rest in peace), and it was great.

Of course, it's worth to remember here the Dot Projector for Face ID on iPhone X and above. That's our first small step towards projector technology, but quite a noticeable one.

<https://i.vas3k.ru/86j.jpg>Dot Projector in iPhone X

<https://j.gifs.com/wVrzx8.gif>

It's time to reflex a bit. Observing what major technology companies are doing, it becomes clear that our next 10 years will be tightly tied to augmented reality. Today AR still looks like a toy to play [with 3D wifey][57], to [try on sneakers][58], to see [how the makeup looks][59], or to train [the U.S. Army][60]. Tomorrow we won't even notice we're using it every day. Dense flows of cash in this area are already felt from the Google and Nvidia offices.

For photography, AR means the ability to control the 3D scene. Scan the area, like smartphones with [Tango][61] do, add new objects, like in [HoloLenz][62], all such things. Don't worry about the poor graphics of modern AR-apps. As soon as game dev companies invade the area with their battle royales, everything becomes much better than PS4.

<https://i.vas3k.ru/87f.jpg> <https://i.vas3k.ru/87h.jpg>

By [Defected Pixel][63]

Remember that epic [fake Moon Mode][64] presented by Huawei? If you missed it: when Huawei camera detects you're going to take a photo of moon, it puts a pre-prepared high-resolution moon picture on top of your photo. Because it looks cooler, indeed! True Chinese cyberpunk.

<https://i.vas3k.ru/869.jpg>Life goal: be able to bend the truth like Huawei

When all the jokes were joked in twitter, I thought about that situation — Huawei gave people exactly what they promised. The moon was real, and the camera lets you shoot it THIS awesome. No deception. Tomorrow, if you give people the opportunity to replace the sky on their photos with beautiful sunsets, half the planet will be amazed.

> In the future, machines will be "finishing up" and re-painting our photos for us

Pixel, Galaxy and other Android-phones have some stupid AR-mode today. Some let you add cartoon characters to take photos with them, others spread emojis all over the room, or put a mask on your face just like in a Snapchat.

These are just our first naive steps. Today, Google camera has Google Lens, that finds information about any object you point your camera at. Samsung does the same with Bixby. For now, these tricks are only made to humiliate the iPhone users, but it's easy to imagine the next time you're taking a pic with the Eiffel Tower, your phone says: you know, your selfie is shit. I'll put a nice sharp picture of the tower in the background, fix your hair, and remove a pimple above your lip. If you plan to post it to Instagram, VSCO L4 filter will work the best for it. You're welcome, leather bastard.

After a while, the camera will start to replace the grass with greener one, your friends with better ones, and boobs with bigger ones. Or something like that. A brave new world.

<https://i.vas3k.ru/894.jpg>

In the beginning it's gonna look ridiculous. Probably even terrible. The photo-aesthetes will be enraged, the fighters for natural beauty will launch a company to ban neural networks usage, but the mass audience will be delighted.

Because photography always was just a way to express and share emotions. Every time there is a tool to express more vividly and effectively, everyone starts using it — emoji, filters, stickers, masks, audio messages. Some will already find the list disgusting, but it can be easily continued.

Photos of the "objective reality" will seem as boring as your great-grandmother's pictures on the chair. They won't die but become something like paper books or vinyl records — a passion of enthusiasts, who see a special deep meaning in it. "Who cares of setting up the lighting and composition when my phone can do the same". That's our future. Sorry.

The mass audience doesn't give a shit about objectivity. It needs algorithms to make their faces younger, and vacations cooler than their coworker or neighbor. The augmented reality will re-draw the reality for them, even with a higher level of detail than it really is. It may sound funny, but we'll start to improve the graphics in the real world.

And yes, as it always does, it all starts with teenagers with their "strange, stupid hobbies for idiots". That's what happens all the time. When you stop understanding something — this IS the future.

It is hard to legibly compare the differences in modern smartphone cameras, as due to the huge competition in the market, everyone implements the new features almost simultaneously. There's no way to be objective in the world where Google announces a new Night Mode, then Samsung and Xiaomi just copy it in a new firmware after a month. So I'm not gonna even try to be objective here.

In the pictures below, I briefly described the main features that I found interesting (in the context of this article) — ignoring the most obvious things like Dual LED flashes, automatic white balance, or panorama mode. In the next section, you can share your insights about your favorite smartphone. Crowdsourcing!

#### A place to brag about your smartphone

For this comparison, I only took four phones that I tested myself. Of course, there are thousands more in the world. If you have or had an interesting phone, please tell us a few words about its camera and your experience below in comments.

Throughout history, each human technology becomes more advanced as soon as it stops copying living organisms. Today, it is hard to imagine a car with joints and muscles instead of wheels. Planes with fixed wings fly 800+ km/h — birds don't even try. There are no analogs to the computer processor in nature at all.

The most exciting part of the list is what's not in it. Camera sensors. We still haven't figured out anything better than imitating the eye structure. The same crystalline lens and a set of RGGB-cones as retina has.

Computational photography has added a "brain" to this process. A processor that handles visual information not only by reading pixels through the optic nerve but also by complementing the picture based on its experience. Yes, it opens up a lot of possibilities for us today, but there is a hunch we're still trying to wave with hand-made wings instead of inventing a plane. One that will leave behind all these shutters, apertures, and Bayer filters.

The beauty of the situation is that we can't even imagine today what it's going to be.

Most of us will even die without knowing.

And it's wonderful.

--------------------------------------------------------------------------------

via: https://vas3k.com/blog/computational_photography/

作者：[vas3k][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://vas3k.com/
[b]: https://github.com/lujun9972
[1]: https://www.dropbox.com/sh/pqw8x5vepavffq5/AADEbPpQr71JUr31A6g96zHxa?dl=0
[2]: https://vas3k.com/donate/
[3]: https://vas3k.ru/blog/computational_photography/
[4]: https://en.wikipedia.org/wiki/Computational_photography
[5]: https://medium.com/hd-pro/computational-photography-will-revolutionize-digital-imaging-a25d34f37b11
[6]: https://achael.github.io/_pages/imaging/
[7]: http://alumni.media.mit.edu/~jaewonk/Publications/Comp_LectureNote_JaewonKim.pdf
[8]: https://graphics.stanford.edu/talks/compphot-publictalk-may08.pdf
[9]: https://github.com/danielgindi/Instagram-Filters/blob/master/InstaFilters/Resources_for_IF_Filters/xproMap.png
[10]: https://en.wikipedia.org/wiki/OpenCL
[11]: https://una.im/CSSgram/
[12]: http://blog.dehancer.com/category/examples/
[13]: https://developer.apple.com/library/archive/documentation/GraphicsImaging/Conceptual/CoreImaging/ci_autoadjustment/ci_autoadjustmentSAVE.html
[14]: http://vas3k.com/blog/machine_learning/
[15]: https://www.pixelmator.com/pro/machine-learning/
[16]: https://paperswithcode.com/task/image-enhancement
[17]: http://people.ee.ethz.ch/~ihnatova/#dataset
[18]: https://en.wikipedia.org/wiki/Epsilon_photography
[19]: https://en.wikipedia.org/wiki/Shutter_lag
[20]: https://www.youtube.com/watch?v=FmB1LztzEVM
[21]: https://www.cambridgeincolour.com/tutorials/cameras-vs-human-eye.htm
[22]: https://en.wikipedia.org/wiki/F-number
[23]: https://www.youtube.com/watch?v=iLtWyLVjDg0&t=0
[24]: https://en.wikipedia.org/wiki/Capybara
[25]: https://ai.googleblog.com/2014/10/hdr-low-light-and-high-dynamic-range.html
[26]: https://www.blog.google/products/pixel/see-light-night-sight/
[27]: https://en.wikipedia.org/wiki/Optical_flow
[28]: https://ai.googleblog.com/2018/11/night-sight-seeing-in-dark-on-pixel.html
[29]: https://ai.googleblog.com/2018/02/introducing-hdr-burst-photography.html
[30]: https://recombu.com/mobile/article/focus-shifting-explained_m20454-html
[31]: https://www.imaging-resource.com/news/2015/09/15/sony-mirrorless-cameras-will-soon-focus-as-fast-as-dslrs-if-this-patent-bec
[32]: https://www.youtube.com/watch?v=MytCfECfqWc
[33]: https://www.blog.google/products/google-ar-vr/experimenting-light-fields/
[34]: https://i.vas3k.ru/full/871.gif
[35]: https://i.vas3k.ru/full/full/871.gif
[36]: http://graphics.stanford.edu/courses/cs478/lectures/02292012_computational_optics.pdf
[37]: https://www.computerworld.com/article/2476104/in-pictures--here-s-what-the-htc-one-s-dual-cameras-can-do.html
[38]: https://light.co/camera
[39]: https://petapixel.com/2017/12/08/review-light-l16-brilliant-braindead/
[40]: https://www.nokia.com/phones/en_int/nokia-9-pureview/
[41]: https://www.youtube.com/watch?v=W3pBp12r-m0
[42]: http://ipl.uv.es/?q=es/content/page/ibis-coded-mask
[43]: http://jiaya.me/papers/deblur_siggraph08.pdf
[44]: https://www.youtube.com/watch?v=spUNpyF58BY
[45]: https://graphics.stanford.edu/courses/cs448a-08-spring/levin-coded-aperture-sig07.pdf
[46]: https://www.eecs.tu-berlin.de/fileadmin/fg144/Courses/07WS/compPhoto/Coded_Aperture.pdf
[47]: https://www.youtube.com/watch?v=4kh71S446FM
[48]: http://www.cs.cmu.edu/~ILIM/projects/IM/aagrawal/sig06/CodedExposureLowres.pdf
[49]: https://www.youtube.com/watch?v=gGvvqj-lF5o
[50]: https://i.vas3k.ru/full/87b.gif
[51]: https://i.vas3k.ru/full/full/87b.gif
[52]: https://medium.com/@thatchaponunprasert/demystifying-iphones-amber-flashlight-519352db10bd
[53]: https://www.reddit.com/r/iphone/comments/71myyp/a_feature_from_the_new_new_iphone_a_few_talk_about_is/
[54]: https://www.eecis.udel.edu/~jye/lab_research/SIG04/SIG_YU_RASKAR.pdf
[55]: https://www.youtube.com/watch?v=wT2uFlP0MlU
[56]: https://en.m.wikipedia.org/wiki/Time-of-flight_camera
[57]: https://youtu.be/p9oDlvOV3qs?t=161
[58]: https://www.youtube.com/watch?v=UmJriqzDUTo
[59]: https://www.youtube.com/watch?v=dpSP6ZM5XGo
[60]: https://www.youtube.com/watch?time_continue=87&v=x8p19j8C6VI
[61]: https://en.wikipedia.org/wiki/Tango_%28platform%29
[62]: https://youtu.be/e-n90xrVXh8?t=314
[63]: https://vk.com/pxirl
[64]: https://www.androidauthority.com/huawei-p30-pro-moon-mode-controversy-978486/
