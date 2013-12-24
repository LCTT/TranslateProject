27 The Linux Kernel: Configuring the Kernel Part 23
================================================================================
![](http://www.linux.org/attachments/slide-jpg.735/)

Aloha and welcome to the next kernel configuration article! In this article, we will configure the Cryptographic API, Virtualization, and Library Routines. Cryptography refers to encryption and secure communication between desired computers. Users may encrypt data to ensure only the recipient reads the data instead of hackers that may obtain the data.

The Linux kernel requires the "Cryptographic algorithm manager" to be enabled in the kernel. This feature provides the software needed to operate the cryptographic abilities of the kernel.

The userspace can configure the cryptography features when this driver is enabled (Userspace cryptographic algorithm configuration). NOTE: This configuration is referring to the cryptographic setup during kernel runtime, not the tool for making the kernel.

To enhance performance, enable this feature which stops self-tests on cryptographic algorithms (Disable run-time self tests).

The "GF(2^128) multiplication functions" is a specific algorithm used by some ciphers. GF stands for Galois field and is a set of finite numbers. These sets are called fields and they come in a variety of sizes.

"Null algorithms" are algorithms used in IPsec. Null encryption means no encryption, so this driver allows IPsec to use no encryption.

Arbitrary algorithms can be converted to parallel algorithms (Parallel crypto engine). This feature provides that converter.

Arbitrary algorithms can also be converted to asynchronous algorithms (Software async crypto daemon).

"Authenc support" is needed by IPsec. Authenc support stands for Authenticated Encryption and offers multiple encryptions to IPsec.

CCM stands for "Counter with CBC MAC" and is needed by IPsec (CCM support).

This driver offers "GCM/GMAC support". GCM is "Galois/Counter Mode" and GMAC is "Galois Message Authentication Code".

NOTE: I will not be able to explain specifically the use and details of some of these features. Cryptography is a detail field of computers and explaining cryptography is beyond the scope of this article.

The "Sequence Number IV Generator" is a special number generator used by some cryptography software.

The Linux kernel supports various cipher algorithms (CBC support), (CTR support), (CTS support), (ECB support), (LRW support), (PCBC support), (XTS support), (HMAC support), (XCBC support), and (VMAC support).

The "CRC32c CRC algorithm" is used specifically with SPARC64 processors.

"CRC32c INTEL hardware acceleration" is another processor specific algorithm. It works on Intel processors with SSE4.2.

The kernel also offers many digests, ciphers, and other cryptographic software. Generally, allow the defaults unless you have a specific reason for enabling or disabling features.

NOTE: A digest (like MD5) generates a hash (sequence of characters) based on a file. Hashes are then used to check files. For example, if you download the Ubuntu installation ISO file from Canonical's website, you may want to know if the file on your hard-drive is an exact replica of the server's file. Users do this because the ISO may become corrupted during the long download. The hash is used to prove that the file is unchanged.

NOTE: A cipher is an encryption/decryption algorithm. Encryption is the process of making a file unreadable to anyone other than the intended recipients/owners. Decryption is the process used to view an encrypted file.

The Linux kernel also supports various compression algorithms that users are strongly recommended to enable (Deflate compression algorithm), (Zlib compression algorithm), and (LZO compression algorithm).

The kernel can generate random numbers which are needed for cryptographic software (Pseudo Random Number Generation for Cryptographic modules), (User-space interface for hash algorithms), and (User-space interface for symmetric key cipher algorithms).

"Hardware crypto devices" is a sub-menu that contains a list of drivers for hardware-based cryptography tools. This is hardware that has the algorithms in the firmware.

Various drivers for asymmetric public-keys exist in the "Asymmetric (public-key cryptographic) key type" menu.

Now, we can move on to the next entry on the main menu of the configuration tool (on menu-based interfaces). Virtualization is the ability to host an operating system. This means Linux (and other systems) can run another operating system as if the guest system is an application.

"Kernel-based Virtual Machine (KVM) support" allows the kernel itself to manage the guest system. Computers with Intel processors need this driver (KVM for Intel processors support) and AMD processors need (KVM for AMD processors support).

The memory management unit (MMU) for the Kernel Virtual Machine (KVM) can have an auditing system.

The guest's network can become faster with this feature enabled (Host kernel accelerator for virtio net).

After configuring the virtual machine abilities for the kernel, the last menu on the main screen of the configuration tool (when using a menu interface) is the last portion of the kernel to configure. This menu is for the "Library Routines", also called library functions. Parts of the kernel can be used as a linkable library. For example, XZ filters (compression algorithms) can be accessed by external programs. The different libraries are listed below.

NOTE: The CRC functions are mostly the same but with different features or performance. Generally, it is best to allow the defaults.

CRC-CCITT functions - The Cyclic Redundancy Check function tests for changes in raw data

CRC16 functions - The Cyclic Redundancy Check function tests for changes in raw data

CRC calculation for the T10 Data Integrity Field - The Cyclic Redundancy Check function tests for changes in raw data

CRC ITU-T V.41 functions - The Cyclic Redundancy Check function tests for changes in raw data

CRC32/CRC32c functions - The Cyclic Redundancy Check function tests for changes in raw data

CRC32 perform self test on init - The Cyclic Redundancy Check function tests for changes in raw data

CRC32 implementation (Slice by 8 bytes) - The Cyclic Redundancy Check function tests for changes in raw data

CRC7 functions - The Cyclic Redundancy Check function tests for changes in raw data

CRC32c (Castagnoli, et al) Cyclic Redundancy-Check - The Cyclic Redundancy Check function tests for changes in raw data

CRC8 function - The Cyclic Redundancy Check function tests for changes in raw data

* BCJ filter decoder - XZ decoder design for a specific processor where "*" is the processor. The kernel lists a few different architectures.

XZ decompressor tester - Debug functions for testing the XZ decoder

Averaging functions - Load average as seen in the output of "uptime"

CORDIC algorithm - hyperbolic and trigonometry functions


JEDEC DDR data - JEDEC Double Data Rate SD-RAM specification


Guess what? You have finished configuring your kernel. I am sure after twenty-three articles, this is how you feel - 

Video link:[http://www.youtube.com/embed/barWV7RWkq0?wmode=opaque][1]

Next, we can compile and install.

In the far distance, I still hear this - 

Video link:[http://www.youtube.com/embed/ELoUppY1esw?wmode=opaque][2]

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-23.5112/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.youtube.com/embed/barWV7RWkq0?wmode=opaque
[2]:http://www.youtube.com/embed/ELoUppY1esw?wmode=opaque