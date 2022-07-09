[#]: subject: "Google Summer of Code + Zephyr RTOS"
[#]: via: "https://www.linux.com/news/google-summer-of-code-zephyr-rtos/"
[#]: author: "The Linux Foundation https://www.linuxfoundation.org/blog/google-summer-of-code-zephyr-rtos/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Google Summer of Code + Zephyr RTOS
======

The **Google Summer of Code** (**GSoC)** is an international annual program in which [Google][1] awards [stipends][2] to contributors who successfully complete a [free and open source software][3] coding project during the summer. Launched in 2005, GSoC takes place from May to August. Project ideas are submitted by host organizations involved in open source software development, though students can also propose their own project ideas.

This year, the program was opened to anyone 18 years or older – not just students and recent graduates. Participants get paid to write software, with the amount of their [stipend][4] depending on the [purchasing power parity][5] of the country where they are located.

This is also the first time the Zephyr Project is participating in GSoC under The Linux Foundation umbrella. Please join us in welcoming these contributors and their projects:

### Project #1: Arduino module based on Zephyr

1 contributor full-size (350 hours).

[Arduino][6]’s popularity is renowned as a popular framework for providing a simplified interface to program embedded devices. Recently, Arduino adopted mbed OS as the base RTOS for some of their newer devices. With that work, they separated out [Arduino Core][7] as an independent abstraction layer from [Arduino Core for mbed][8]. This opens up the possibility for leveraging Arduino Core on other OSes. The project idea is to create a Zephyr module that leverages the Arduino Core so that a developer can use Zephyr as the underlying OS when they use the Arduino framework on Arduino-compatible devices. The benefits to the user include:

* Access to Arduino APIs as well as advanced Zephyr capabilities
* Broader set of devices than the standard Arduino ecosystem thanks to Zephyrs’ device support
* Ability to re-use Arduino tools like the Arduino IDE and wealth of libraries

Arduino Core is licensed under the GNU Lesser General Public License and Zephyr is licensed under Apache 2. That means this project will most likely need to be developed out of tree and in a separate repo to keep code and license separation. See [#22247][9] for a historic discussion & [soburi/arduino-on-zephyr][10] for an earlier attempt prior to the Arduino Core architecture.

**The contributor’s task is thus:**

* Implement a bare-bones Module based on Arduino Core that can compile for any target (no functionality, possibly in QEMU)
* Implement a common peripheral from the Arduino API based on Zephyr such as [Serial][11]
* Target one physical board, such as the Arduino Zero

**Mentors:**

[Jonathan Beri][12]– CEO of Golioth and Zephyr TSC
[Alvaro Viebrantz][13] – Founding Engineer of Golioth and Google GDE

**Code License:** LGPL

**Contributor Details:**

* Name: Dhruva Gole
* Project Blog: [https://dhruvag2000.github.io/Blog-GSoC22/][14]
* Project Poster: 

![][15]

**About the contributor:** 

![][16]

Dhruva is an undergraduate student majoring in Electrical engineering. He has a broad range of interests from embedded software development to hardware design and has experience in working on SBCs, microcontrollers, and embedded Linux platforms.

### Project #2: Apache Thrift Module for Zephyr

1 contributor full-size (350 hours).

[Apache Thrift][17] is an [IDL][18] specification,[RPC][19] framework, and code generator that abstracts away transport and protocol details to let developers focus on application logic.It works across all major operating systems, supports over 27 programming languages, 7 protocols, and 6 low-level transports. Originally [developed at Facebook in 2007][20], it was subsequently shared with the Apache Software Foundation.

![][21]

![][22]

Supporting Thrift in the Zephyr RTOS would benefit the community greatly. It would lead to new software and hardware technologies, new products, and additional means for cloud integration. Thrift can be used over virtually any transport as well and for that reason, it is a natural choice for the many different physical communication layers supported by Zephyr. The project idea is to get the proof-of-concept [Thrift for Zephyr Module][23] into shape for upstreaming. To achieve that, the contributor must:

Perform additional integration for Thrift features (protocols, transports)
Author additional sample applications using [supported boards][24] or [Qemu][25]
Author additional tests and generate coverage reports using the [Zephyr Test Framework][26]
Ensure the module follows appropriate [coding guidelines][27] and satisfies [module requirements][28]
Contribute any necessary improvements back to the Apache Thrift Project.
Contribute any necessary improvements back to the Zephyr Project.

**Mentors:**

* [Christopher Friedt][29] – SWE / ASIC FW at Meta and Zephyr TSC member
* [Stephanos Ioannidis][30] – Zephyr CXX Subsystem Maintainer

**Code License:** Apache 2.0.

**Contributor Details:**

**Name:** Young

**About the contributor:** Young is a student majoring in  communication engineering, and he will pursue his Master’s degree in computer engineering. He has a broad range of interests from front-end development to hardware design, and has experience in working on the Web, IoT and embedded platforms. A low-cost single-board computer with a RISC-V 64 processor designed by him in 2021 was reported by several geek media.

The post [Google Summer of Code + Zephyr RTOS][31] appeared first on [Linux Foundation][32].

--------------------------------------------------------------------------------

via: https://www.linux.com/news/google-summer-of-code-zephyr-rtos/

作者：[The Linux Foundation][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxfoundation.org/blog/google-summer-of-code-zephyr-rtos/
[b]: https://github.com/lkxed
[1]: https://en.wikipedia.org/wiki/Google
[2]: https://en.wikipedia.org/wiki/Stipend
[3]: https://en.wikipedia.org/wiki/Free_and_open-source_software
[4]: https://en.wikipedia.org/wiki/Stipend
[5]: https://en.wikipedia.org/wiki/Purchasing_power_parity
[6]: https://www.arduino.cc/
[7]: https://github.com/arduino/ArduinoCore-API
[8]: https://github.com/arduino/ArduinoCore-mbed
[9]: https://github.com/zephyrproject-rtos/zephyr/issues/22247
[10]: https://github.com/soburi/arduino-on-zephyr
[11]: https://www.arduino.cc/reference/en/language/functions/communication/serial/
[12]: https://www.linkedin.com/in/jonathanberi/
[13]: https://www.linkedin.com/in/alvaro-viebrantz-55119048/
[14]: https://dhruvag2000.github.io/Blog-GSoC22/
[15]: https://www.linuxfoundation.org/wp-content/uploads/project-poster.png
[16]: https://www.linuxfoundation.org/wp-content/uploads/dhruva.jpeg
[17]: https://github.com/apache/thrift
[18]: https://en.wikipedia.org/wiki/Interface_description_language
[19]: https://en.wikipedia.org/wiki/Remote_procedure_call
[20]: https://thrift.apache.org/static/files/thrift-20070401.pdf
[21]: https://www.linuxfoundation.org/wp-content/uploads/apache-thrift-layered-architecture.png
[22]: https://www.linuxfoundation.org/wp-content/uploads/SPDX-license.png
[23]: https://github.com/cfriedt/thrift-for-zephyr
[24]: https://docs.zephyrproject.org/latest/boards/index.html
[25]: https://docs.zephyrproject.org/latest/guides/networking/qemu_user_setup.html
[26]: https://docs.zephyrproject.org/latest/guides/test/ztest.html
[27]: https://docs.zephyrproject.org/latest/contribute/coding_guidelines/index.html
[28]: https://docs.zephyrproject.org/latest/guides/modules.html
[29]: https://www.linkedin.com/in/christopher-friedt/
[30]: https://www.linkedin.com/in/stephanosio/
[31]: https://www.linuxfoundation.org/blog/google-summer-of-code-zephyr-rtos/
[32]: https://www.linuxfoundation.org/
