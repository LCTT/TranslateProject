[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What measured boot and trusted boot means for Linux)
[#]: via: (https://opensource.com/article/20/10/measured-trusted-boot)
[#]: author: (Mike Bursell https://opensource.com/users/mikecamel)

What measured boot and trusted boot means for Linux
======
When a trusted boot process is performed, the process not only measures
each value but also performs a check against a known (and expected!)
good value at the same time.
![Brain on a computer screen][1]

Sometimes I'm looking around for a subject to write about, and realise that there's one that I assume that I've covered, but, on searching, discover that I haven't. One of those topics is measured boot and trusted boot—sometimes misleadingly referred to as "secure boot." There are specific procedures that use these terms with capital letters (e.g., Secure Boot), which I'm going to try to avoid discussing in this article. I'm more interested in the generic processes—and a major potential downfall—than in trying to go into the ins and outs of specifics. What follows is a (heavily edited) excerpt from my forthcoming book on trust in computing and the cloud for [Wiley][2].

In order to understand what measured boot and trusted boot aim to achieve, look at the Linux virtualisation stack: the components you run if you want to use virtual machines (VMs) on a Linux machine. This description is arguably over-simplified, but (as I noted above) I'm not interested in the specifics but in what I'm trying to achieve. I'll concentrate on the bottom four layers (at a rather simple level of abstraction): CPU/management engine; BIOS/EFI; firmware; and hypervisor, but I'll also consider a layer _just_ above the CPU/management engine, which interposes a Trusted Platform Module (TPM) and some instructions for how to perform one of the two processes (_measured boot_ and _trusted boot_). Once the system starts to boot, the TPM is triggered and starts its work. Alternative roots of trust, such as hardware security modules (HSMs), might also be used, but I will use TPMs, the most common example in this context, in my example.

In both cases (trusted boot and the measured boot), the basic flow starts with the TPM performing a measurement of the BIOS/EFI layer. This measurement involves checking the binary instructions to be carried out by this layer and creating a cryptographic hash of the binary image. The hash that's produced is then stored in one of several Platform Configuration Register (PCR) "slots" in the TPM. These can be thought of as pieces of memory that can be read later on - either by the TPM for its purposes or by entities external to the TPM - but that cannot be changed once they have been written. These pieces of memory are integrity protected from the time of their initially being written. This provides assurances that once a value is written to a PCR by the TPM, it can be considered constant for the lifetime of the system until power off or reboot.

After measuring the BIOS/EFI layer, the next layer (firmware) is measured. In this case, the resulting hash is combined with the previous hash (which was stored in the PCR slot) and then also stored in a PCR slot. The process continues until all the layers involved in the process have been measured and the hashes' results have been stored. There are (sometimes quite complex) processes to set up the original TPM values (I've skipped some of the more low-level steps in the process for simplicity) and to allow (hopefully authorised) changes to the layers for upgrading or security patching, for example. This "measured boot" process allows for entities to query the TPM after the process has completed and to check whether the values in the PCR slots correspond to the expected values, pre-calculated with "known good" versions of the various layers—that is, pre-checked versions whose provenance and integrity have already been established.

Various protocols exist to allow parties _external_ to the system to check the values (e.g., via a network connection) that the TPM attests to be correct: the process of receiving and checking such values from an external system is known as "remote attestation."

This process—measured boot—allows you to find out whether the underpinnings of your system—the lowest layers—are what you think they are. But what if they're not? Measured boot (unsurprisingly, given the name) measures but doesn't perform any other actions.

The alternative, "trusted boot," goes a step further. When a trusted boot process is performed, the process not only measures each value but also performs a check against a known (and expected!) good value at the same time. If the check fails, then the process will halt, and the booting of the system will fail. This may sound like a rather extreme approach to take on a system, but sometimes it is absolutely the right one. Where the system under consideration may have been compromised—which is one likely inference you can make from the failure of a trusted boot process—it is better for it to not be available at all than to be running based on flawed expectations.

This is all very well if I am the owner of the system being measured, have checked all of the various components being measured (and the measurements), and am happy that what's being booted is what I want.[1][3] But what if I'm using a system on the cloud, for instance, or any system owned and managed by someone else? In that case, I'm trusting the cloud provider (or owner/manager) with two things:

  1. Doing all the measuring correctly and reporting correct results to me
  2. Building something I should trust in the first place



This is the problem with the nomenclature "trusted boot" and, even worse, "secure boot." Both imply that an absolute, objective property of a system has been established—it is "trusted" or "secure"—when this is clearly not the case. Obviously, it would be unfair to expect the designers of such processes to name them after the failure states—"untrusted boot" or "insecure boot"—but, unless I can be very certain that I trust the owner of the system to do step two entirely correctly (and in my best interests as the user of the system, rather than theirs as the owner), then I can make no stronger assertions.

There is an enormous temptation to take a system that has gone through a trusted boot process and label it a "trusted system" when _the very best_ assertion you can make is that the particular layers measured in the measured and/or trusted boot process have been asserted to be those the process expects to be present. Such a process says nothing at all about the fitness of the layers to provide assurances of behaviour nor about the correctness (or fitness to provide assurances of behaviour) of any subsequent layers on top of those.

It's important to note that designers of TPMs are quite clear what is being asserted and that assertions about trust should be made carefully and sparingly. Unluckily, however, the complexities of systems, the general low level of understanding of trust, and the complexities of context and transitive trust make it very easy for systems designers and implementors to do the wrong thing and assume that any system that has successfully performed a trusted boot process can be considered "trusted." It is also extremely important to remember that TPMs, as hardware roots of trust, offer one of the best mechanisms available for establishing a chain of trust in systems that you may be designing or implementing, and I plan to write an article about them soon.

* * *

  1. Although this turns out to be _much_ harder to do than you might expect!



* * *

_This article was originally published on [Alice, Eve, and Bob][4] and is reprinted with the author's permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/measured-trusted-boot

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brain_computer_solve_fix_tool.png?itok=okq8joti (Brain on a computer screen)
[2]: https://wiley.com/
[3]: tmp.HkXCfJwlpF#1
[4]: https://aliceevebob.com/2020/09/08/measured-and-trusted-boot/
