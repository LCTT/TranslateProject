[#]: subject: "3 things to know about planning for OTA updates in your homelab"
[#]: via: "https://opensource.com/article/22/9/plan-ota-updates-edge"
[#]: author: "Alan Smithee https://opensource.com/users/alansmithee"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

3 things to know about planning for OTA updates in your homelab
======
Define your over-the-air update plan for mobile phones, IoT devices, and edge computing before you even start coding your app.

![Why and how to handle exceptions in Python Flask][1]

Image from Unsplash.com, Creative Commons Zero

Updates to a system used to be relatively straightforward. When a developer needed to revise something that they'd already distributed to the public, an updater would be released for people to run. Users would run the updater, allowing old files to be replaced by new files and new files to be added. Even with these "relatively straightforward" updates, though, there was a catch. What happens when a user's installation is in an unexpected state? What happens when an upgrade is interrupted? These questions are just as relevant now when all kinds of devices are online, and sometimes in need of important security updates. Many updates today are delivered wirelessly, over-the-air (OTA), and the potential for poor connections, sudden loss of signal, or loss of power, can potentially be disastrous to what should be a minor update. These are the top three strategies you need to consider when planning to deliver over-the-air updates.

### 1. Verification

The TCP protocol has a lot of verification built in, so it's usually true that when you [send packets to a device][2], you can be confident that each packet has been received intact. However, TCP can't report errors on something it doesn't know about, so it's up to you to verify things like:

* Have you sent all files required for the update? A device can't receive what wasn't sent in the first place.
* Are the files received the same as the files you sent? At the very least, check SHA sums to verify file integrity.
* When possible, use [digital signing][3] to ensure that a file is from a trusted source.
* You must verify that the device is able to apply an update before you allow the update to begin. Check permissions and battery state before committing to an update, and ensure that your update process overrides any unexpected user events, like a scheduled reboot or hibernation.
* Finally, you must verify that an update that claims to have completed successfully has actually completed. Check file locations and integrity on the target device before allowing the update to officially be marked as resolved by the system.

### 2. Fallback and failstates

The worst-case scenario for an update is that a device is left in a broken state, such that it can't even be used to continue an aborted update. In that scenario, the updater files exist on the target device, but the process has been interrupted. This can leave a device in an unknown state, where some files have been replaced with updated versions, while others haven't been touched. In the worst case, files that have been updated are incompatible with files that haven't yet been updated, and so the device cannot function as expected.

There are a few strategies to handle this. The initial update step could be to install a special boot image or environment dedicated to completing the update, and setting a "flag" on the system to establish that an update is in progress. This ensures that even when a device suddenly loses power in the middle of an update, the update process is started fresh during the next boot. The flag signaling a successful update is removed only once the update has been verified.

A special boot image may not be feasible or necessary, depending on the security policy of the target device and what you're updating. The principle remains the same, though. Once it has been started, an update must establish an environment in which the pending update is the only way forward until it's resolved.

Up until an update has been granted permission to start, though, a user (when there is one) should have the ability to delay or ignore the update.

### 3. Additive

In many edge and IoT devices, the foundation of the target device is immutable. Updates only add to a known state of a system. Projects like [Fedora Silverblue][4] are demonstrating that this model can work across many markets, so that luxury might become commonplace. Until then, though, part of successfully applying an update is understanding the environment you're about to affect.

You don't need an immutable core to apply additive updates, though. You may be able to architect a system to use the same concept, using update as a way to add libraries or packages without revising the old versions. As the final step of such an update, the executable with updated paths is the only actual revision you make.

### OTA updates

The world is increasingly wireless. For mobile phones, IoT devices, and [edge computing][5], over-the-air updates are often the only option. Implementing an OTA update policy takes careful planning and careful accounting for improbable scenarios. You know your target devices best, so map out your update schema well before you begin coding so that your initial architecture is designed for robust and safe OTA.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/plan-ota-updates-edge

作者：[Alan Smithee][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/computer_code_programming_laptop.jpg
[2]: https://www.redhat.com/sysadmin/beginners-guide-network-troubleshooting-linux
[3]: https://www.redhat.com/sysadmin/digital-signatures-gnupg
[4]: https://silverblue.fedoraproject.org
[5]: https://www.redhat.com/en/topics/edge-computing/what-is-edge-computing?intcmp=7013a000002qLH8AAM
