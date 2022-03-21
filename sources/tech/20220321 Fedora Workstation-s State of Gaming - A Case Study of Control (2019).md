[#]: subject: "Fedora Workstation’s State of Gaming – A Case Study of Control (2019)"
[#]: via: "https://fedoramagazine.org/fedora-workstations-state-of-gaming/"
[#]: author: "Akashdeep Dhar https://fedoramagazine.org/author/t0xic0der/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fedora Workstation’s State of Gaming – A Case Study of Control (2019)
======

![][1]

[Liam Dawe/GamingOnLinux, PNG version by Vulphere][2], [CC BY-SA 4.0][3], via Wikimedia Commons

Back in the day, it used to irk me as to how _GNU/Linux_[1] distributions could not be even considered to be in the proximity of video games enthusiasts – less because of the performance of the video games themselves and more because of how inconvenient it could be for them to set it all up. Admittedly, it had been quite a while since an avid video games fan like me did that, so it was almost a no-brainer for me to try it out and see if things have changed. What I ended up finding surprised me – I like to think that it would be just as pleasing to both enthusiasts who have been playing video games on _GNU/Linux_ distributions and to newcomers who have been scoping this, alike.

On a testing bench using an _AMD RDNA2-based_[2] GPU, the video game was configured to the _highest possible graphical preset_[3] to really stress the hardware into performing as much as its limiting factor. If the _RDNA2 architecture_ reminds you of something, allow me to share that it is what forms the foundation of the GPU that no other than the widely acclaimed _Steam Deck_[4] makes use of. For that matter, if you factor in some performance scaling with respect to the handheld nature of the device and the optimized Proton compatibility layer, this article can be representative of what the Steam Deck is capable of when you use _Fedora Workstation_[5] as a platform of your choice for playing your favourite video games.

![Figure 1 – GNOME Software helps to install Steam conveniently][4]

To have an apples to apples comparison, we set up two environments – one with _Windows 10 21H2_[6] and one with _Fedora Workstation 35_. On the former, I installed _MSI Afterburner_[7] and ensured that the graphics drivers are up-to-date while I did not have to bother doing the same on the latter as they came preinstalled. The only extra thing that I did was to configure the _Lutris v7.1 runner_[8] after clicking my way through installing _Lutris_[9] and _MangoHUD_[10] from _GNOME Software_[11]. It is downright astonishing how much you can do these days on _GNU/Linux_ distributions without actually having to interact with the command line, making the entry barrier very low and welcoming.

![Figure 2 – GNOME Software helps to install Lutris conveniently ][5]

Before we get into some actual performance testing and comparison results, let me talk a bit about the video game that is at the centre of the case study. _Control_[12] is an action-adventure video game developed by _Remedy Entertainment_[13] and published by _505 Games_[14]. The video game is centred around a fictitious organization about paranormal activities and takes inspiration from the likes of the _SCP Foundation_[15]. It is a well-optimized video game that exhibits great graphics and is a showcase of what the underlying hardware is capable of. I ran tests on both _DirectX 11_[16] and _DirectX 12_[17] versions of the video game with their _compatibility layers_[18], _DXVK_[19] and _VKD3D_[20], respectively.

![Figure 3 – Lutris configured to play Control \(2019\) using the Wine runner][6]

Following are the results of the tests. I made use of _OBS Studio_[21], which is available as both an installer binary and as a package in the _RPM Fusion_[22] repositories, to record around 15 seconds of in-menu gameplay and around 60 seconds of in-game gameplay. As the video game does not have any intrinsic benchmarking tool, the footage had to be broken down into segments of equal time periods to be able to pick up performance statistics on CPU usage, GPU usage and framerate. Please do note, even when _OBS Studio_ introduces a certain overhead to the performance, the comparison still remains valid as in both the platforms the recording software is configured identically.

### Metrics

  * Framerate
    * In the menus



![Figure 4 – Framerate in the menus][7]

  * In the game



![Figure 5 – Framerate in the game][8]

  * CPU usage
    * In the menus



![Figure 6 – CPU usage in the menus][9]

  * In the game



![Figure 7 – CPU usage in the game][10]

  * GPU usage
    * In the menus



![Figure 8 – GPU usage in the menus][11]

  * In the game



![Figure 9 – GPU usage in the game][12]

Please feel free to let your inner enthusiast loose in the statistics and try sharing as many performance differences as you have inferred so far in [the comments section below][13]. In the meanwhile, allow me to share mine –

  * With _DXVK_ (_DirectX 11_), the loss of average in-menu framerate is around 19.87% and the same for average in-game framerate is barely 6.26%. _DXVK_ is almost at the stage where a blind test of framerate smoothness could potentially confuse anyone as to which platform runs natively.
  * With _VKD3D_ (_DirectX 12_), the loss of average in-menu framerate is barely 8.67% and the same for average in-game framerate is around 24.51%. _VKD3D_ seems to be steadily catching up and very soon enough, video games would be able to run with minimal loss of performance.
  * With _DXVK_, there is only 1.40% of additional average CPU usage in the menus and around 17.88% of the same in the game. Closing this gap would help save battery life on handheld devices.
  * With _VKD3D_, the average CPU usage in the menus is around 1.47% less than the equivalent Windows platform and the same in the game is 1.62% more. _VKD3D_ is a great choice for handheld devices.
  * With _DXVK_, the average GPU usage in the menus is around 13.40% more than that on Windows and the same in the game is around 1.04% more, making it more efficient in geometry rendering and less so in sprites.
  * With _VKD3D_, the average GPU usage in the game is around 8.13% more than that on Windows and the same in the game is around 9.34% less, thus helping save battery on handheld devices running these video games.
  * The _CPU governor_[23] makes a marginal difference in performance and hence, it is something that can be left alone untweaked. The marginal difference noticed can also be considered in the margin of error.
  * _Fedora Workstation_ uses fewer system resources out of the box and hence, can easily dedicate a huge chunk of those to the video game in question but the same is not possible in _Windows 10 21H2_.



For someone who looked into _GNU/Linux_ distributions as a platform for using interactive and entertainment software applications without having any fancy hardware requirements, these results almost feel like a breath of fresh air. With _Valve_[24] working on strengthening _Proton_[25] and other communities working on great solutions like _Bottles_[26] and _Lutris_, gaming on _GNU/Linux_ distributions is no longer an elusive dream. Things are only going to get better with a great number of video games running at near-native performance as we go on. I do not know for certain if 2022 would be the year of Linux Desktop or not, but if you ask me whether 2022 would be the year of Linux Gaming – I would answer that with a resounding yes. Let me know your thoughts [down below][13]!

### Appendix

  1. _Highest possible graphical preset_[3]
  2. _Configuration differences_[27]
  3. _Performance measurements in the menus_[28]
  4. _Performance measurements in the game_[29]



### References

  1. <https://en.wikipedia.org/wiki/Linux>
  2. <https://www.amd.com/en/technologies/rdna-2>
  3. <https://gist.github.com/t0xic0der/e6958f9404d395705a8b67a1ab39d024#file-preset-csv>
  4. <https://en.wikipedia.org/wiki/Steam_Deck>
  5. <https://getfedora.org/>
  6. <https://docs.microsoft.com/en-us/windows/release-health/status-windows-10-21h2>
  7. <https://www.msi.com/Landing/afterburner/graphics-cards>
  8. <https://lutris.net/runners>
  9. <https://lutris.net/>
  10. <https://github.com/flightlessmango/MangoHud>
  11. <https://gitlab.gnome.org/GNOME/gnome-software>
  12. <https://en.wikipedia.org/wiki/Control_(video_game)>
  13. <https://www.remedygames.com/>
  14. <https://505games.com/>
  15. <https://scp-wiki.wikidot.com/>
  16. <https://en.wikipedia.org/wiki/DirectX#DirectX_11>
  17. <https://en.wikipedia.org/wiki/DirectX#DirectX_12>
  18. <https://en.wikipedia.org/wiki/Compatibility_layer>
  19. <https://github.com/doitsujin/dxvk>
  20. <https://source.winehq.org/git/vkd3d.git/>
  21. <https://obsproject.com/>
  22. <https://rpmfusion.org/>
  23. <https://wiki.archlinux.org/title/CPU_frequency_scaling#Scaling_governors>
  24. <https://www.valvesoftware.com/en/>
  25. <https://github.com/ValveSoftware/Proton>
  26. <https://usebottles.com/>
  27. <https://gist.github.com/t0xic0der/e6958f9404d395705a8b67a1ab39d024#file-config-csv>
  28. <https://gist.github.com/t0xic0der/e6958f9404d395705a8b67a1ab39d024#file-in-menu-csv>
  29. <https://gist.github.com/t0xic0der/e6958f9404d395705a8b67a1ab39d024#file-in-game-csv>



--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-workstations-state-of-gaming/

作者：[Akashdeep Dhar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/t0xic0der/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/03/gaming-816x345.jpg
[2]: https://commons.wikimedia.org/wiki/File:Steam_Deck_(front).png
[3]: https://creativecommons.org/licenses/by-sa/4.0
[4]: https://user-images.githubusercontent.com/49605954/158728951-5241a64c-ff94-4cc2-9532-ba4506510aad.png
[5]: https://user-images.githubusercontent.com/49605954/156971914-0a047b38-a37d-4d47-a54e-780394787bab.png
[6]: https://user-images.githubusercontent.com/49605954/158730065-b7f245e5-0f6c-44a7-bcfc-4e0f07b46d03.png
[7]: https://user-images.githubusercontent.com/49605954/156968347-39021f89-3387-466d-8eca-bb4b1b71c37b.svg
[8]: https://user-images.githubusercontent.com/49605954/156975902-169ab447-857e-4276-b710-8b3dc7fe5bf7.svg
[9]: https://user-images.githubusercontent.com/49605954/156976186-40bc2e53-2c04-4c9c-80bf-b4f5d9f74dd2.svg
[10]: https://user-images.githubusercontent.com/49605954/156976255-74d90b2b-2b33-4fc2-abaa-9d022d68b4d8.svg
[11]: https://user-images.githubusercontent.com/49605954/156976635-3b266cd6-e11d-4ed5-8548-52272f9de3f6.svg
[12]: https://user-images.githubusercontent.com/49605954/156976393-41a5be4e-d14c-4ad7-b9b5-bc5ebdca2b3e.svg
[13]: tmp.iibyzO3VB3#comments
