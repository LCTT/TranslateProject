[#]: subject: "DirectX 11/12 Games like Cyberpunk 2077 Can Use NVIDIA DLSS With Proton Experimental on Linux"
[#]: via: "https://news.itsfoss.com/nvidia-dlss-dx-11-12-proton/"
[#]: author: "Rishabh Moharir https://news.itsfoss.com/author/rishabh/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

DirectX 11/12 Games like Cyberpunk 2077 Can Use NVIDIA DLSS With Proton Experimental on Linux
======

In June, Nvidia [announced][1] the support for **DLSS** in Linux via Steam Proton and a beta driver for Vulkan-based games.

DLSS stands for Deep Learning Super Sampling. It utilizes deep learning algorithms powered by Tensor cores found in RTX GPUs to upscale images inside games. This results in clearer and sharper images along with higher framerates.

![Source: NVIDIA][2]

This [upscaling technology is similar][3] to AMD’s Fidelity FX and even closer to Intel’s upcoming XeSS, both open-source, unlike DLSS. Gamers already have the benefit of making use of Fidelity FX through [GloriousEggroll’s][4] custom Proton GE versions.

Moreover, NVIDIA also planned to expand support to DirectX games by this fall.

And, finally, with the latest Proton Experiment support, that’s happening. Linux gamers using Nvidia GPUs can now play their favorite DX11/12 based games with DLSS.

There couldn’t be a better time for this addition, considering we will be able to play various multiplayer games soon on Linux with the [support for BattleEye &amp; Easy-Anti Cheat added to Proton][5].

### Major Updates to Steam Play Proton

Along with a wave of improvements in Proton 6.3-7, Valve has finally managed to add DLSS support into Proton’s Experimental branch for DirectX 11/12 games a few days ago.

Previously, a beta driver was required to use DLSS for Vulkan-based games like DOOM Eternal.

But, that isn’t the case anymore—although the latest drivers are recommended.

To complement this, DXVK and the Steamworks SDK have also been updated to the latest development versions. Additionally, performance issues for specific games and other bugs have also been fixed.

You can check Proton’s [official GitHub changelog][6] to explore the list of improvements for all the games supported so far.

### Enabling DLSS for DX11/12 Games

Enabling DLSS is a straightforward process.

First, you have to make sure that your Windows game runs on Proton Experimental.

This can be done by right-clicking on the game and selecting Properties. Then under Compatibility, you need to tick the “Force the use of a specific Steam Play compatibility tool” checkbox. Next, choose Proton Experimental from the drop-down menu.

![][7]

Finally, you need to insert the command `PROTON_HIDE_NVIDIA_GPU=0 PROTON_ENABLE_NVAPI=1 %command%` in **Launch Options**.

![][8]

That’s it! You’re all set to play your games with DLSS!

### Summing Up

Nvidia DLSS is a much-needed feature for many games, given the difference it makes.

Linux did not have full-fledged support for DLSS from the get-go. But, it looks like it will soon be available in a future stable Proton version along with necessary improvements.

Linux gamers can finally experience better frame rates and visual quality for many games with their RTX-based GPUs.

Although I use Fidelity FX on my AMD graphics card, I still crave to try out DLSS on an RTX GPU!

_How do you feel about the arrival of Nvidia’s DLSS? Will you be trying it out soon? Feel free to share your comments below._

**Via:** [GamingOnLinux][9]

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/nvidia-dlss-dx-11-12-proton/

作者：[Rishabh Moharir][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/rishabh/
[b]: https://github.com/lujun9972
[1]: https://www.nvidia.com/en-us/geforce/news/june-2021-rtx-dlss-game-update/
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQwOCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[3]: https://news.itsfoss.com/intel-xess-open-source/
[4]: https://github.com/GloriousEggroll/proton-ge-custom
[5]: https://news.itsfoss.com/easy-anti-cheat-linux/
[6]: https://github.com/ValveSoftware/Proton/wiki/Changelog
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ3NCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[8]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ2OCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[9]: https://www.gamingonlinux.com/2021/10/proton-experimental-expands-nvidia-dlss-support-on-linux-to-directx-11-titles
