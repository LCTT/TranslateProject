[#]: subject: "Building the metaverse with open source"
[#]: via: "https://opensource.com/article/22/6/open-source-metaverse"
[#]: author: "Liv Erickson https://opensource.com/users/liverickson"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Building the metaverse with open source
======
Ensuring that virtual worlds are open, accessible, and safe to all is paramount to a successful metaverse.

![Why and how to handle exceptions in Python Flask][1]

Image by: Image from Unsplash.com, Creative Commons Zero

The word metaverse has been thrown around a lot these days. Whether you believe it's a reality or not, the adoption of the term has signaled a significant shift in the way people think about the future of online interactions. With today's technological advancements and an increase in geographically distributed social circles, the idea of seamlessly connected virtual worlds as part of a metaverse has never felt more appealing.

Virtual worlds enable a wide range of scenarios, and brings to life a rich and vibrant array of experiences. Students can explore the past by stepping inside a past time period, embodying historic figures, and interacting with buildings that were built centuries ago. [Coworkers][2] can gather for coffee chats, regardless of where in the world they're working. Musicians and artists can interact with fans from around the world in small or large digital venues. Conferences can reach new audiences, and friends can connect to explore interactive spaces.

When we built virtual world platforms (the predecessors to today's metaverse applications) in the past, there was only limited access to powerful graphics hardware, scalable servers, and high-bandwidth network infrastructure. However, recent advancements in cloud computing and hardware optimization have allowed virtual worlds to reach new audiences. The complexity of what we're able to simulate has increased significantly.

Today, there are several companies investing in new online virtual worlds and technologies. To me, this is indicative of a fundamental shift in the way people interact with one another, create, and consume content online.

Some tenets associated with the concept of the metaverse and virtual worlds are familiar through the traditional web, including identity systems, communication protocols, social networks, and online economies. Other elements, though, are newer. The metaverse is already starting to see a proliferation of 3D environments (often created and shared by users), the use of digital bodies, or "avatars", and the incorporation of virtual and augmented reality technology.

### Building virtual worlds the open source way

With this shift in computing paradigms, there's an opportunity to drive forward open standards and projects encouraging the development of decentralized, distributed, and interoperable virtual worlds. This can begin at the hardware level with projects like Razer's [Open source virtual reality (OSVR)][3] schematics encouraging experimentation for headset development, and go all the way up the stack. At the device layer, the Khronos Group's [OpenXR][4] standard has been widely adopted by headset manufacturers, which allows applications and engines to target a single API, with device-specific capabilities supported through extensions.

This allows creators and developers of virtual worlds to focus on mechanics and content. While the techniques used to build 3D experiences aren't new, the increased interest in metaverse applications has resulted in new tools and engines for creating immersive experiences. Although there are many libraries and engines that have differences in how they run their virtual worlds, most virtual worlds share the same underlying development concepts.

At the core of a virtual world is the 3D graphics and simulation engine (such as [Babylon.js][5] and the WebGL libraries it interacts with). This code is responsible for managing the game state of the world, so that interactions manipulating the state of the world are shared between the visitors of the space, and drawing updates to the environment on screen. Game simulation states can include objects in the world and avatar movement, so that when one user moves through a space, everyone else sees it happening in real time. The rendering engine uses the perspective of a virtual camera to draw a 2D image on the screen, mapped to what a user is looking at in digital space.

The video game world is made up of 2D and 3D objects that represent a virtual location. These experiences can vary, ranging from small rooms to entire planets, limited only by the creator's imagination. Inside of the virtual world, objects have *transforms* that instantiate the object to a particular place in the world's 3D coordinate system. The transform represents the object's position, rotation, and scale within the digital environment. These objects, which can have mesh geometry created in a 3D modeling program, materials, and textures assigned to them, can trigger other events in the world, play sounds, or interact with the user.

Once a virtual world has been created, the application renders content to the screen using a virtual camera. Like a camera in the real world, a camera inside of a game engine has a viewport and settings that change the way a frame is captured. For immersive experiences, the camera draws many updates every second (up to 120 frames per second for some high-end virtual reality headsets) to reflect the way you're moving within the space. Virtual reality experiences specifically also require that the camera draws twice: once for each eye, slightly offset by your *interpupillary distance* (the distance between the center of your pupils in each eye).

If camera rendering components of developing a virtual world sound complex, don't fret. Most libraries and frameworks for authoring immersive content have these capabilities available so you can focus on the content and interactivity. Open source game engines, such as [Open 3D Engine (O3de)][6] and [Godot Engine][7] offer these rendering capabilities and many other tools as built-in features. With open source engines, developers have the additional flexibility of extending or changing core systems, which allows for more control over the end experience.

Other key characteristics that make up the metaverse include users taking on digital bodies (often referred to as *avatars*), user-generated content that's created and shared by users of the platform, voice and text chat, and the ability to navigate between differently themed worlds and rooms.

### Approaches to building the metaverse

Before choosing a development environment for building the metaverse, you should consider what tenets are most critical for the types of experiences and worlds your users are going to experience. The first choice you're faced with is whether to target a native experience or the browser. Both have different considerations for how a virtual world unfolds.

A proprietary metaverse necessarily offers limited connections to virtual worlds. Open source and browser-based platforms have emerged, building on top of web standards and operating through the [Khronos group and][8][W3C][9] to ensure interoperability and content portability.

Web applications such as [Mozilla Hubs][10] and Element's [Third Room][11] build on existing web protocols to create open source options for building browser-based virtual world applications. These experiences, linking together 3D spaces embedded into web pages, utilize open source technologies including [three.js][12], [Babylon.js][13], and [A-Frame][14] for content authoring. They also utilize open source realtime communication protocols for voice and synchronized avatar movement.

### Open access

As with all emerging technologies, it's critical to consider the use case and impact to the humans who use it. Immersive virtual and augmented reality devices have unprecedented capabilities to capture, process, store, and utilize data about an individual, including their physical movement patterns, cognitive state, and attention. Additionally, virtual worlds themselves significantly amplify the benefits and problems of today's social media, and require careful implementation of trust and safety systems, moderation techniques, and appropriate access permissions to ensure that users have a positive experience when they venture into these spaces.

As the web evolves and encompasses immersive content and spatial computing devices, it's important to think critically and carefully about the experiences being created, and interoperability across different applications. Ensuring that these virtual worlds are open, accessible, and safe to all is paramount. The prospect of the metaverse is an exciting one, and one that can only be realized through collaborative open source software movements.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/open-source-metaverse

作者：[Liv Erickson][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/liverickson
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/computer_code_programming_laptop.jpg
[2]: https://enterprisersproject.com/article/2022/2/4-metaverse-tools-workplace-collaboration
[3]: https://www2.razer.com/osvr
[4]: https://www.khronos.org/OpenXR/
[5]: https://www.babylonjs.com/community/
[6]: https://www.o3de.org/
[7]: https://godotengine.org/
[8]: https://www.khronos.org
[9]: http://www.w3c.org
[10]: http://github.com/mozilla/hubs/
[11]: https://github.com/matrix-org/thirdroom
[12]: http://threejs.org
[13]: http://babylonjs.com
[14]: http://aframe.io
