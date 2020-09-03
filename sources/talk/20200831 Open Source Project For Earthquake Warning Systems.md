[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Open Source Project For Earthquake Warning Systems)
[#]: via: (https://www.linux.com/featured/open-source-project-for-earthquake-warning-systems/)
[#]: author: (Swapnil Bhartiya https://www.linux.com/author/swapnil/)

Open Source Project For Earthquake Warning Systems
======

Earthquakes or the shaking doesn’t kill people, buildings do. If we can get people out of buildings in time, we can save lives. Grillo has founded OpenEEW in partnership with IBM and the Linux Foundation to allow anyone to build their own earthquake early-warning system. Swapnil Bhartiya, the founder of TFiR, talked to the founder of Grillo on behalf of The Linux Foundation to learn more about the project.

Here is the transcript of the interview:

**Swapnil Bhartiya: If you look at these natural phenomena like earthquakes, there’s no way to fight with nature. We have to learn to coexist with them. Early warnings are the best thing to do. And we have all these technologies – IoTs and AI/ML. All those things are there, but we still don’t know much about these phenomena. So, what I do want to understand is if you look at an earthquake, we’ll see that in some countries the damage is much more than some other places. What is the reason for that?**

Andres Meira: earthquakes disproportionately affect countries that don’t have great construction. And so, if you look at places like Mexico, the Caribbean, much of Latin America, Nepal, even some parts of India in the North and the Himalayas, you find that earthquakes can cause more damage than say in California or in Tokyo. The reason is it is buildings that ultimately kill people, not the shaking itself. So, if you can find a way to get people out of buildings before the shaking that’s really the solution here. There are many things that we don’t know about earthquakes. It’s obviously a whole field of study, but we can’t tell you for example, that an earthquake can happen in 10 years or five years. We can give you some probabilities, but not enough for you to act on.

What we can say is that an earthquake is happening right now. These technologies are all about reducing the latency so that when we know an earthquake is happening in milliseconds we can be telling people who will be affected by that event.

**Swapnil Bhartiya: What kind of work is going on to better understand earthquakes themselves?**

Andres Meira: I have a very narrow focus. I’m not a seismologist and I have a very narrow focus related to detecting earthquakes and alerting people. I think in the world of seismology, there are a lot of efforts to understand the tectonic movement, but I would say there are a few interesting things happening that I know of. For example, undersea cables. People in Chile and other places are looking at undersea telecommunications cables and the effects that any sort of seismic movement have on the signals. They can actually use that as a detection system. But when you talk about some of the really deep earthquakes, 60-100 miles beneath the surface, man has not yet created holes deep enough for us to place sensors. So we’re very limited as to actually detecting earthquakes at a great depth. We have to wait for them to affect us near the surface.

**Swapnil Bhartiya: So then how do these earthquake early warning systems work? I want to understand from a couple of points: What does the device itself look like? What do those sensors look like? What does the software look like? And how do you kind of share data and interact with each other?**

Andres Meira: The sensors that we use, we’ve developed several iterations over the last couple of years and effectively, they are a small microcontroller, an accelerometer, this is the core component and some other components. What the device does is it records accelerations. So, it looks on the X, Y, and Z axes and just records accelerations from the ground so we are very fussy about how we install our sensors. Anybody can install it in their home through this OpenEEW initiative that we’re doing.

The sensors themselves record shaking accelerations and we send all of those accelerations in quite large messages using MQTT. We send them every second from every sensor and all of this data is collected in the cloud, and in real-time we run algorithms. We want to know that the shaking, which the accelerometer is getting is not a passing truck. It’s actually an earthquake.

So we’ve developed the algorithms that can tell those things apart. And of course, we wait for one or two sensors to confirm the same event so that we don’t get any false positives because you can still get some errors. Once we have that confirmation in the cloud we can send a message to all of the client devices. If you have an app, you will be receiving a message saying, there’s an earthquake at this location, and your device will then be calculating how long it will take to reach it. Therefore, how much energy will be lost and therefore, what shaking you’re going to be expecting very soon.

**Swapnil Bhartiya: Where are these devices installed?**

Andres Meira: They are installed at the moment in several countries – Mexico, Chile, Costa Rica, and Puerto Rico. We are very fussy about how people install them, and in fact, on the OpenEEW website, we have a guide for this. We really require that they’re installed on the ground floor because the higher up you go, the different the frequencies of the building movement, which affects the recordings. We need it to be fixed to a solid structural element. So this could be a column or a reinforced wall, something which is rigid and it needs to be away from the noise. So it wouldn’t be great if it’s near a door that was constantly opening and closing. Although we can handle that to some extent. As long as you are within the parameters, and ideally we look for good internet connections, although we have cellular versions as well, then that’s all we need.

The real name of the game here is a quantity more than quality. If you can have a lot of sensors, it doesn’t matter if one is out. It doesn’t matter if the quality is down because we’re waiting for confirmation from other ones and redundancy is how you achieve a stable network.

**Swapnil Bhartiya: What is the latency between the time when sensors detect an earthquake and the warning is sent out? Does it also mean that the further you are from the epicenter, the more time you will get to leave a building?**

Andres Meira: So the time that a user gaps in terms of what we call the window of opportunity for them to actually act on the information is a variable and it depends on where the earthquake is relative to the user. So, I’ll give you an example. Right now, I’m in Mexico City. If we are detecting an earthquake in Acapulco, then you might get 60 seconds of advanced warning because an earthquake travels at more or less a fixed velocity, which is unknown and so the distance and the velocity gives you the time that you’re going to be getting.

If that earthquake was in the South of Mexico in Oaxaca, we might get two minutes. Now, this is a variable. So of course, if you are in Istanbul, you might be very near the fault line or Kathmandu. You might be near the fault line. If the distance is less than what I just described, the time goes down. But even if you only have five seconds or 10 seconds, which might happen in the Bay area, for example, that’s still okay. You can still ask children in a school to get underneath the furniture. You can still ask surgeons in a hospital to stop doing the surgery. There’s many things you can do and there are also automated things. You can shut off elevators or turn off gas pipes. So anytime is good, but the actual time itself is a variable.
**
Swapnil Bhartiya: The most interesting thing that you are doing is that you are also open sourcing some of these technologies. Talk about what components you have open source and why.**

Andres Meira: Open sourcing was a tough decision for us. It wasn’t something we felt comfortable with initially because we spent several years developing these tools, and we’re obviously very proud. I think that there came a point where we realized why are we doing this? Are we doing this to develop cool technologies to make some money or to save lives? All of us live in Mexico, all of us have seen the devastation of these things. We realized that open source was the only way to really accelerate what we’re doing.

If we want to reach people in these countries that I’ve mentioned; if we really want people to work on our technology as well and make it better, which means better alert times, less false positives. If we want to really take this to the next level, then we can’t do it on our own. It will take a long time and we may never get there.

So that was the idea for the open source. And then we thought about what we could do with open source. We identified three of our core technologies and by that I mean the sensors, the detection system, which lives in the cloud, but could also live on a Raspberry Pi, and then the way we alert people. The last part is really quite open. It depends on the context. It could be a radio station. It could be a mobile app, which we’ve got on the website, on the GitHub. It could be many things. Loudspeakers. So those three core components, we now have published in our repo, which is OpenEEW on GitHub. And from there, people can pick and choose.

It might be that some people are data scientists so they might go just for the data because we also publish over a terabyte of accelerometer data from our networks. So people might be developing new detection systems using machine learning, and we’ve got instructions for that and we would very much welcome it. Then we have something for the people who do front end development. So they might be helping us with the applications and then we also have people something for the makers and the hardware guys. So they might be interested in working on the census and the firmware. There’s really a whole suite of technologies that we published.

**Swapnil Bhartiya: There are other earthquake warning systems. How is OpenEEW different?**

Andres Meira: I would divide the other systems into two categories. I would look at the national systems. I would look at say the Japanese or the California and the West coast system called Shake Alert. Those are systems with significant public funding and have taken decades to develop. I would put those into one category and another category I would look at some applications that people have developed. My Shake or Skylert, or there’s many of them.

If you look at the first category, I would say that the main difference is that we understand the limitations of those systems because an earthquake in Northern Mexico is going to affect California and vice versa. An earthquake in Guatemala is going to affect Mexico and vice versa. An earthquake in Dominican Republic is going to affect Puerto Rico. The point is that earthquakes don’t respect geography or political boundaries. And so we think national systems are limited, and so far they are limited by their borders. So, that was the first thing.

In terms of the technology, actually in many ways, the MEMS accelerometers that we use now are streets ahead of where we were a couple of years ago. And it really allows us to detect earthquakes hundreds of kilometers away. And actually, we can perform as well as these national systems. We’ve studied our system versus the Mexican national system called SASMEX, and more often than not, we are faster and more accurate. It’s on our website. So there’s no reason to say that our technology is worse. In fact, having cheaper sensors means you can have huge networks and these arrays are what make all the difference.

In terms of the private ones, the problems with those are that sometimes they don’t have the investment to really do wide coverage. So the open sources are our strength there because we can rely on many people to add to the project.

**Swapnil Bhartiya: What kind of roadmap do you have for the project? How do you see the evolution of the project itself?**

Andres Meira: So this has been a new area for me; I’ve had to learn. The governance of OpenEEW as of today, like you mentioned, is now under the umbrella of the Linux Foundation. So this is now a Linux Foundation project and they have certain prerequisites. So we had to form a technical committee. This committee makes the steering decisions and creates the roadmap you mentioned. So, the roadmap is now published on the GitHub, and it’s a work in progress, but effectively we’re looking 12 months ahead and we’ve identified some areas that really need priority. Machine learning, as you mentioned, is definitely something that will be a huge change in this world because if we can detect earthquakes, potentially with just a single station with a much higher degree of certainty, then we can create networks that are less dense. So you can have something in Northern India and in Nepal, in Ecuador, with just a handful of sensors. So that’s a real Holy grail for us.

We also are asking on the roadmap for people to work with us in lots of other areas. In terms of the sensors themselves, we want to do more detection on the edge. We feel that edge computing with the sensors is obviously a much better solution than what we do now, which has a lot of cloud detection. But if we can move a lot of that work to the actual devices, then I think we’re going to have much smarter networks and less telemetry, which opens up new connectivity options. So, the sensors as well are another area of priority on the road map.

**Swapnil Bhartiya: What kind of people would you like to get involved with and how can they get involved?**

Andres Meira: So as of today, we’re formally announcing the initiative and I would really invite people to go to OpenEEW.com, where we’ve got a site that outlines some areas that people can get involved with. We’ve tried to consider what type of people would join the project. So you’re going to get seismologists. We have seismologists from Harvard University and from other areas. They’re most interested in the data from what we’ve seen so far. They’re going to be looking at the data sets that we’ve offered and some of them are already looking at machine learning. So there’s many things that they might be looking at. Of course, anyone involved with Python and machine learning, data scientists in general, might also do similar things. Ultimately, you can be agnostic about seismology. It shouldn’t put you off because we’ve tried to abstract it away. We’ve got down to the point where this is really just data.

Then we’ve also identified the engineers and the makers, and we’ve tried to guide them towards the repos, like the sensory posts. We are asking them to help us with the firmware and the hardware. And then we’ve got for your more typical full stack or front end developer, we’ve got some other repos that deal with the actual applications. How does the user get the data? How does the user get the alerts? There’s a lot of work we can be doing there as well.

So, different people might have different interests. Someone might just want to take it all. Maybe someone might want to start a network in the community, but isn’t technical and that’s fine. We have a Slack channel where people can join and people can say, “Hey, I’m in this part of the world and I’m looking for people to help me with the sensors. I can do this part.” Maybe an entrepreneur might want to join and look for the technical people.

So, we’re just open to anybody who is keen on the mission, and they’re welcome to join.
--------------------------------------------------------------------------------

via: https://www.linux.com/featured/open-source-project-for-earthquake-warning-systems/

作者：[Swapnil Bhartiya][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/swapnil/
[b]: https://github.com/lujun9972
