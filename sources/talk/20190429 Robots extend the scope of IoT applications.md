[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Robots extend the scope of IoT applications)
[#]: via: (https://www.networkworld.com/article/3391956/robots-extend-the-scope-of-iot-applications.html#tk.rss_all)
[#]: author: (Deepak Puri )

Robots extend the scope of IoT applications
======
IoT devices are generally designed to handle specific tasks. Robots need to react to unexpected conditions that their developer may not have anticipated. AI and machine learning help robots deal with such situations.
![Alex Knight \(CC0\)][1]

Robots and IoT devices are similar in that they both rely on sensors to understand their environment, rapidly process large streams of data and decide how to respond.

That’s where the similarities end. Most IoT applications handle well-defined tasks, whereas robots autonomously handle anticipated situations. Let’s consider both from six different vectors:

### 1\. Sensor

  * **IoT** – Binary output from stationary sensor. “Is the door open or closed?”
  * **Robots** – Complex output from multiple sensors. “What is in front of me? How do I navigate around it?”



### 2\. Processing

  * **IoT** – Simple data stream of signals handled with well-known programming methods.
  * **Robots** – Large complex data streams handled by neural network computing.



### 3\. Mobility

  * **IoT** – Sensors are stationary and signal processing is done in the cloud.
  * **Robots** – The sensor laden robot is mobile and signal processing is done locally and autonomously.



### 4\. Response

  * **IoT** – The action to take in response to a situation is well defined.
  * **Robots** – Multiple actions could be taken in response to a situation.



### 5\. Learning

  * **IoT** – The application typically does not ‘evolve’ on its own and develop new features.
  * **Robots** – Machine learning and other techniques are used to let the robots ‘learn’ and increase their capacity to deal with new situations. E.g. self-driving cars collectively get smarter as more situations are deal with.



### 6\. Design

  * **IoT** – Stationary sensors. Processing done centrally where power is readily available. Need for communication channels between sensor and the cloud.
  * **Robots** – Weight, size and power demand are important design considerations. Communication capability is less important.



### Topology

IoT applications are centralized with edge devices with little intelligence of their own. Low cost sensors transmit signals to a control center in the cloud which analyzes the data stream and decides the action to take. The cost of the central hub can be amortized over thousands of sensor-based applications making IoT applications more affordable. Network connectivity and latency limit the range of applications that IoT can meet.

  * [Why 802.11ax is the next big thing in wireless][2]
  * [FAQ: 802.11ax Wi-Fi][3]
  * [Wi-Fi 6 (802.11ax) is coming to a router near you][4]
  * [Wi-Fi 6 with OFDMA opens a world of new wireless possibilities][5]
  * [802.11ax preview: Access points and routers that support Wi-Fi 6 are on tap][6]



Robot and drones operate in a decentralized mode. They have a high degree of decision-making capability of their own and can function on their own even if they are disconnected. Robots typically only share details on unexpected situations they encounter. This allows their algorithms to be refined by applying machine learning to collected feedback.

### Thinking is hard

Consider what happens when you pick up a pen. Your eyes scan your surroundings and and your brain identifies the pen through [pattern matching][7]. Signals are sent through nerves to your arm muscles directing them to move to the pen. Visual signals from your eyes provide continuous feedback on your hand’s position to move it precisely to the pen. Tactile feedback from your hand confirms when the pen has been picked up. A great deal of signal processing and continuous motor control for such a simple task!

Programming a robot to do the same task requires visual sensors (cameras) to provide continuous visual input, a graphical processing unit (GPU) to processes the stream of visual signals and a central processing unit (CPU) to control the motor functions.

Robots rely on multiple high-resolution sensors that generate complex data streams. This requires a lot more processing power and multiple [neural networks][8] to process them in parallel. “Neural networks are loosely modeled on the human brain with thousands of small processing units (neurons) arranged in layers. They identify patterns based on a learning rule.”

### Learning as you go

IoT devices are generally designed to handle specific tasks. This could be as simple as a sensor detecting if a door is open or not and the central hub sending an alert to notify the owner that the door is open. Robots need to react to unexpected conditions that their developer may not have anticipated. This could be such as how to navigate around an obstacle in their path.

Artificial Intelligence (AI) platforms and machine learning help robots deal with such situations. They get progressively ‘smarter’ as more robots are deployed and share unexpected situations they encounter.

### Systems design

Hardware costs for designing robots are declining as their processing power increases. The [Jetson Nano Developer Kit][9] to build robots costs $99 and runs multiple neural networks in parallel for applications like image classification, object detection, segmentation, and speech processing. It includes an NVIDIA [CUDA-X™][10] AI computer which delivers 472 GFLOPS of compute performance for AI workloads on 5 watts power. This enables a robot to work longer before requiring a recharge.

Programming a robot requires specialized software. Developers break down complex robotic tasks into a network of smaller, simpler steps. This is done with computational [graphs][11] and an entity component system, such as the [Isaac Robot Engine][12]. The robotic application is built with smaller modules (Gems) for sensing, planning, and actuation. They let robots handle obstacle detection, stereo depth estimation, and human speech recognition.

### Teach your robots well

Robots like humans improve their motor skills with practice. Robots need a test bed where their instructions can be tested and debugged. Simulated test beds are better than physical ones as it is impossible to create a physical representation of every environment where the robot might operate. [Isaac Sim][13] is a virtual robotics laboratory and a high-fidelity 3D world simulator. Developers train and test their robots in a detailed, realistic simulation reducing the costs and development time.

Robots improve as their [decision model][14][s][14] are revised to cover new situations that they encounter. Robots operate based on models they were programmed with, but they also send details of unexpected situations back to the cloud for review. This enables developers to refine the robot’s decision-making model to deal with the new conditions. The amount of feedback increases as more robots are deployed, increasing the speed at which all the robots collectively get “smarter.”

NVIDIA Nano based robots can report new conditions they encounter to [AWS IoT Greengrass][15] modeling platform which lets them act locally on the data they generate, while still using the cloud for management, analytics, and storage. The robots can run AWS Lambda functions, execute predictions based on machine learning models, keep device data in sync, and communicate with other devices securely – even when not connected to the internet.

IoT applications now encompass both centralized and autonomous applications. Stationary and mobile ones. Some that stick to their program and others that learn and evolve.

**This article is published as part of the IDG Contributor Network.[Want to Join?][16]**

Join the Network World communities on [Facebook][17] and [LinkedIn][18] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3391956/robots-extend-the-scope-of-iot-applications.html#tk.rss_all

作者：[Deepak Puri][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: 
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/07/pepper_humanoid_robot_from_softbank_robotics_by_alex_knight_cc0_via_unsplash_1200x800-100763684-large.jpg
[2]: https://www.networkworld.com/article/3215907/mobile-wireless/why-80211ax-is-the-next-big-thing-in-wi-fi.html
[3]: https://%20https://www.networkworld.com/article/3048196/mobile-wireless/faq-802-11ax-wi-fi.html
[4]: https://www.networkworld.com/article/3311921/mobile-wireless/wi-fi-6-is-coming-to-a-router-near-you.html
[5]: https://www.networkworld.com/article/3332018/wi-fi/wi-fi-6-with-ofdma-opens-a-world-of-new-wireless-possibilities.html
[6]: https://www.networkworld.com/article/3309439/mobile-wireless/80211ax-preview-access-points-and-routers-that-support-the-wi-fi-6-protocol-on-tap.html
[7]: https://en.wikipedia.org/wiki/Pattern_matching
[8]: http://pages.cs.wisc.edu/~bolo/shipyard/neural/local.html
[9]: https://developer.nvidia.com/embedded/buy/jetson-nano-devkit
[10]: https://www.nvidia.com/en-us/technologies/cuda-x/#source=pr
[11]: https://developer.nvidia.com/discover/graph-analytics
[12]: https://developer.nvidia.com/isaac-sdk
[13]: https://blogs.nvidia.com/blog/2018/03/27/isaac-robotics-sdk/
[14]: http://research.engr.oregonstate.edu/rdml/home
[15]: https://aws.amazon.com/greengrass/
[16]: /contributor-network/signup.html
[17]: https://www.facebook.com/NetworkWorld/
[18]: https://www.linkedin.com/company/network-world
