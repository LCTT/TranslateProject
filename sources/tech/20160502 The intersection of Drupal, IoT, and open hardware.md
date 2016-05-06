The intersection of Drupal, IoT, and open hardware
=======================================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/drupal_blue_gray_lead.jpeg?itok=t7W_KD-D)


Meet [Amber Matz][1], a Production Manager and Trainer at [Drupalize.Me][3], a service of Lullabot Education. When she's not tinkering around with Arduinos, Raspberry Pis, and electronic wearables, you can find her wrangling presenters for the Portland Drupal User Group.

Coming up at [DrupalCon NOLA][3], Amber will host a session about Drupal and IoT. If you're attending and want to learn about the intersection of open hardware, IoT, and Drupal, this session is for you. If you're not able to join us in New Orleans, Amber has some pretty cool things to share. In this interview, she tells us how she got involved with Drupal, a few of her favorite open hardware projects, and what the future holds for IoT and Drupal.

![](https://opensource.com/sites/default/files/images/life/Interview%20banner%20Q%26A.png)

**How did you get involved with the Drupal community?**

Back in the day, I was working at a large nonprofit in the "webmaster's office" of the marketing department and was churning out custom PHP/MySQL forms like nobody's business. I finally got weary of that and starting hunting around the web for a better way. I found Drupal 6 and starting diving in on my own. Years later, after a career shift and a move, I discovered the Portland Drupal User Group and landed a job as a full-time Drupal developer. I continued to regularly attend the meetups in Portland, which I found to be a great source of community, friendships, and professional development. Eventually, I landed a job with Lullabot as a trainer creating content for Drupalize.Me. Now, I'm managing the Drupalize.Me content pipeline, creating Drupal 8 content, and am very much involved in the Portland Drupal community. I'm this year's coordinator, finding and scheduling speakers.

**We have to know: What is Arduino prototyping, how did you discover it, and what's the coolest thing you've done with an Arduino?**

Arduino, Raspberry Pi, and wearable electronics have been these terms that I've heard thrown around for years. I found [Adafruit's Wearable Electronics][4] with Becky Stern YouTube show years ago (which, up until recently, when Becky moved on, aired every Wednesday). I was fascinated by wearables and even ordered an LED sewing kit but never did anything with it. I just didn't get it. I had no background in electronics whatsoever, and while I was fascinated by the projects I was finding, I didn't see how I could ever make anything like that. It seemed so out of reach.

Finally, I found a Coursera "Internet of Things" specialization. (So trendy, right?) But I was immediately hooked! I finally got an explanation of what an Arduino was, along with all these other important terms and concepts. I ordered the recommended Arduino starter kit, which came with a getting started booklet. When I made that first LED blink, it was pure delight. I had two weeks' vacation over the holidays and after Christmas, and I did nothing but make and program Arduino circuits from the getting started booklet. It was oddly so relaxing! I enjoyed it so much.

In January, I started creating my own prototypes. When I found out I was emceeing our company retreat's lightning talks, I created a Lightning Talk Visual Timer prototype with five LEDs and an Arduino.

![](https://opensource.com/sites/default/files/resize/amber-arduino-lightning-talk-timer-400x400.jpg)

It was a huge hit. I also made my first wearable project, a glowing hoodie, using the Arduino IDE compatible Gemma microcontroller, a tiny round sewable component, to which I sewed using conductive thread, a conductive slider connected to a hoodie's drawstring, which controlled the colors of five NeoPixels sewn around the inside of the hood. So that's what I mean by prototyping: Making crazy projects that are fun and maybe even a little practical.

**What are the biggest opportunities for Drupal and IoT?**

IoT isn't that much different than the web services and decoupling Drupal trends. It's the movement of data from thing one to thing two and the rendering of that data into something useful. But how does it get there? And what do you do with it? You think there are a lot of solutions, and apps, and frameworks, and APIs out there now? With IoT, that's only going to continue to increase—exponentially. What I've found is that given any device or any "thing", there is a way to connect it to the Internet—many ways. And there are plenty of code libraries out there to help makers get their data from thing one to thing two.

So where does Drupal fit in? Web services, for one, is going to be the first obvious place. But as a maker, I don't want to spend my time coding custom modules in Drupal. I want to plug and play! So I would love to see modules emerge that connect with IoT Cloud APIs and services like ThingSpeak and Adafruit.io and IFTTT and others. I think there's an opportunity, too, for a business to build an IoT cloud service in Drupal that allows people to send and store their sensor data, visualize it charts and graphs, and build widgets that react to certain values or thresholds. Each of these IoT Cloud API services fill a slightly different niche, and there's plenty of room for others.

**What are a few things you're looking forward to at DrupalCon?**

I love reconnecting with Drupal friends, meeting new people, and also seeing Lullabot and Drupalize.Me co-workers (we're distributed companies)! There's so much to learn with Drupal 8 and it's been overwhelming at times to put together training materials for our customers. So, I'm looking forward to attending Drupal 8-related sessions and getting up-to-speed on the latest developments. Finally, I'm really curious about New Orleans! I haven't been there since 2004 and I'm excited to see what's changed.

**Tell us about your DrupalCon talk Beyond the blink: Add Drupal to your IoT playground. Why should someone attend? What are the major takeaways?**

My session title, Beyond the blink: Add Drupal to your IoT playground, in itself is so full of assumptions that first off I'm going to get everyone up to speed and on the same page. You don't need to know anything about Arduino, the Internet of Things, or even Drupal to follow along. We'll start with making an LED blink with an Arduino, and then I want to talk about what the main takeaways have been for me: Play, learn, teach, and make. I'll show examples that have inspired me and that will hopefully inspire and encourage others in the audience to give it a try. Then, it's demo time!

First, thing one. Thing one is a Build Notifier Tower Light. In this demo, I'll show how I connected the Tower Light to the Internet and how I got it to respond to data received from a Cloud API service. Next, Thing two. Thing two is a "weather watch" in the form of a steampunk iPhone case. It's got small LED matrix that displays an icon of the local-to-me weather, a barometric pressure and temperature sensor, a GPS module, and a Bluetooth LE module, all connected and controlled with an Adafruit Flora microcontroller. Thing two sends weather and location data to Adafruit.io by connecting to an app on my iPhone over Bluetooth and sends it up to the cloud using an MQTT protocol! Then, on the Drupal side, I'm pulling down that data from the cloud, updating a block with the weather, and updating a map. So folks will get a taste of what you can do with web services, maps, and blocks in Drupal 8, too.

It's been a brain-melting adventure learning and making these demo prototypes, and I hope others will come to the session and catch a little of this contagious enthusiasm I have for this intersection of technologies! I'm very excited to share what I've discovered.



[1]: https://www.drupal.org/u/amber-himes-matz
[2]: https://drupalize.me/
[3]: https://events.drupal.org/neworleans2016/
[4]: https://www.adafruit.com/beckystern
