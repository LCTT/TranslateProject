[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why the future of IoT depends on open source)
[#]: via: (https://opensource.com/article/20/9/open-source-ai-iot)
[#]: author: (Pin Xue https://opensource.com/users/pinxue)

Why the future of IoT depends on open source
======
We're quickly moving from the Internet of Things (IoT) to the Artificial
Intelligence of Things (AIoT).
![Brain on a computer screen][1]

Most people are familiar with the [Internet of Things (IoT)][2], which refers to smart objects in a connected network, as this diagram shows.

![IoT diagram][3]

(PinXue, [CC BY-SA 4.0][4])

A "smart" object has a sense of its environment, and it makes decisions (locally or together with peers and a cloud server), then puts those decisions into action.

To be smart, the object must have a brain to carry intelligence. So far, the way to do this is to embed a computer in the object. For example, you can put a Cortex-M CPU with Bluetooth 5.1 in a chip smaller than 2x2mm and embed it into almost anything. This tiny device is more powerful than my first desktop PC.

A developer can write software for this tiny computer that uses the device's ability to gather input from all kinds of sensors (e.g., heat, light, moisture, and so on) and share and act on it using the device's screen, speaker, actuators (step motors, servos, and so on), and network.

### AI + IoT = AIoT

We often associate IoT with small programmable objects, like a smart lightbulb or door lock. While those are good uses of IoT, IoT is bigger than this. IoT is driving the next stage of our information-centric society.

Information systems have become a natural part of our everyday lives. You no longer have to sit in front of a computer to surf the internet because a smartphone can bring the whole world into the palm of your hand. Soon, you won't even need a phone—the popularization of smartwatches and other wearables is proving that. The convenience of these information systems encourages us to collect and use more data from everything. For instance, why couldn't a red light tell your car it will turn
green in 5 seconds, so it is not a smart move to release the brake
just yet.

![Relationships between computers, people, and things][5]

(PinXue, [CC BY-SA 4.0][4])

In a few years, humans won't be the major data producers and consumers. "Things" will be.

The abundance of data these things will create means we can no longer expect people to be able to analyze all the patterns and contents or even to write parsers to process the data. Based on the sheer amount of data, we need artificial intelligence (AI) to deal with it. AI will be applied to the entire data-processing process, and AI can transmit results instead of raw data. This will also reduce network traffic. Ideally, an AI will be able to drive smart objects to make decisions based on analyzed data on the spot.

Eventually, the goal is for smart objects to be able to live on their own, as you can see in _[This one owns itself][6]_, a story about a drone earning money to pay its recharging bill by making deliveries for a coffee company. The focus of this story is about the smart contract powered by blockchain, but in my opinion, it's achievable with the artificial intelligence of things (AIoT), the most fundamental element in smart devices.

### Open source AIoT operating systems

In the past, smart objects were programmed on bare metal. Now the scenario is a lot more complex. When creating a real-life AIoT system, there are too many details to account for on your own—all of the types of Systems on a Chip (SoC), sensors, actuators, network protocols, AI modeling, performance optimization, reliability, power management, firmware over the air (FOTA), security, and more. However, using an AIoT operating system enables all of this hard work to be accumulated and reused instead of starting over for each hardware or project.

AIoT is an open world, by its nature. The diversity of smart objects means no one can dominate the entire market, and we must work together to make things talk to each other. There are many levels of openness, such as file formats, protocol stacks, and APIs. These are all dependent upon the openness of the interface and the implementation of the source code.

Open source makes it possible to customize, reuse, and improve our code. This flexibility is important. The original author of an AIoT operating system cannot be an expert on everything. Other developers have different types of expertise they can use to build upon an open foundation.

If an operating system is well-designed and has an active community, it can provide reusable drivers, protocols, libraries, frameworks, middleware, and all manner of tools. All these components can speed product development dramatically. Without an open source platform, people have to build those parts again and again.

The [RT-Thread project][7] has been working toward this goal. RT-Thread is an open source IoT OS that started in 2006 and currently powers 600 million devices. Its IoTOS project is part of the general AIoT blueprint. It also comes with more than 200 open source packages and some commercial packages—and the number of each keeps increasing—that make it easier to develop for the AIoT.

If you're interested in building the IoT and working toward a better, smarter, and open future of AIoT, visit the [RT-Thread website][8] and see how you can lend a hand.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/open-source-ai-iot

作者：[Pin Xue][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pinxue
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brain_computer_solve_fix_tool.png?itok=okq8joti (Brain on a computer screen)
[2]: https://opensource.com/resources/internet-of-things
[3]: https://opensource.com/sites/default/files/uploads/iot-diagram.png (IoT diagram)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/computer-people-things.png (Relationships between computers, people, and things)
[6]: https://medium.com/@creole/6-this-one-owns-itself-9f6a3aa4382d
[7]: https://github.com/RT-Thread/rt-thread
[8]: https://www.rt-thread.io/
