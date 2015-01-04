Docker Image Insecurity
================================================================================
Recently while downloading an “official” container image with Docker I saw this line:

    ubuntu:14.04: The image you are pulling has been verified

I assumed this referenced Docker’s [heavily promoted][1] image signing system and didn’t investigate further at the time. Later, while researching the cryptographic digest system that Docker tries to secure images with, I had the opportunity to explore further. What I found was a total systemic failure of all logic related to image security.

Docker’s report that a downloaded image is “verified” is based solely on the presence of a signed manifest, and Docker never verifies the image checksum from the manifest. An attacker could provide any image alongside a signed manifest. This opens the door to a number of serious vulnerabilities.

Images are downloaded from an HTTPS server and go through an insecure streaming processing pipeline in the Docker daemon:

    [decompress] -> [tarsum] -> [unpack]

This pipeline is performant but completely insecure. Untrusted input should not be processed before verifying its signature. Unfortunately Docker processes images three times before checksum verification is supposed to occur.

However, despite [Docker’s claims][2], image checksums are never actually checked. This is the only section[0][3] of Docker’s code related to verifying image checksums, and I was unable to trigger the warning even when presenting images with mismatched checksums.

    if img.Checksum != "" && img.Checksum != checksum {
      log.Warnf("image layer checksum mismatch: computed %q,
                 expected %q", checksum, img.Checksum)
    }

### Insecure processing pipeline ###

**Decompress**

Docker supports three compression algorithms: gzip, bzip2, and xz. The first two use the Go standard library implementations, which are [memory-safe][4], so the exploit types I’d expect to see here are denial of service attacks like crashes and excessive CPU and memory usage.

The third compression algorithm, xz, is more interesting. Since there is no native Go implementation, Docker [execs][5] the `xz` binary to do the decompression.

The xz binary comes from the [XZ Utils][6] project, and is built from approximately[1][7] twenty thousand lines of C code. C is not a memory-safe language. This means malicious input to a C program, in this case the Docker image XZ Utils is unpacking, could potentially execute arbitrary code.

Docker exacerbates this situation by *running* `xz` as root. This means that if there is a single vulnerability in `xz`, a call to `docker pull` could result in the complete compromise of your entire system.

**Tarsum**

The use of tarsum is well-meaning but completely flawed. In order to get a deterministic checksum of the contents of an arbitrarily encoded tar file, Docker decodes the tar and then hashes specific portions, while excluding others, in a [deterministic order][8].

Since this processing is done in order to generate the checksum, it is decoding untrusted data which could be designed to exploit the tarsum code[2][9]. Potential exploits here are denial of service as well as logic flaws that could cause files to be injected, skipped, processed differently, modified, appended to, etc. without the checksum changing.

**Unpacking**

Unpacking consists of decoding the tar and placing files on the disk. This is extraordinarily dangerous as there have been three other vulnerabilities reported[3][10] in the unpack stage at the time of writing.

There is no situation where data that has not been verified should be unpacked onto disk.

### libtrust ###

[libtrust][11] is a Docker package that claims to provide “authorization and access control through a distributed trust graph.” Unfortunately no specification appears to exist, however it looks like it implements some parts of the [Javascript Object Signing and Encryption][12] specifications along with other unspecified algorithms.

Downloading an image with a manifest signed and verified using libtrust is what triggers this inaccurate message (only the manifest is checked, not the actual image contents):

    ubuntu:14.04: The image you are pulling has been verified

Currently only “official” image manifests published by Docker, Inc are signed using this system, but from discussions I participated in at the last Docker Governance Advisory Board meeting[4][13], my understanding is that Docker, Inc is planning on deploying this more widely in the future. The intended goal is centralization with Docker, Inc controlling a Certificate Authority that then signs images and/or client certificates.

I looked for the signing key in Docker’s code but was unable to find it. As it turns out the key is not embedded in the binary as one would expect. Instead the Docker daemon fetches it [over HTTPS from a CDN][14] before each image download. This is a terrible approach as a variety of attacks could lead to trusted keys being replaced with malicious ones. These attacks include but are not limited to: compromise of the CDN vendor, compromise of the CDN origin serving the key, and man in the middle attacks on clients downloading the keys.

### Remediation ###

I [reported][15] some of the issues I found with the tarsum system before I finished this research, but so far nothing I have reported has been fixed.

Some steps I believe should be taken to improve the security of the Docker image download system:
Drop tarsum and actually verify image digests

Tarsum should not be used for security. Instead, images must be fully downloaded and their cryptographic signatures verified before any processing takes place.

**Add privilege isolation**

Image processing steps that involve decompression or unpacking should be run in isolated processes (containers?) that have only the bare minimum required privileges to operate. There is no scenario where a decompression tool like `xz` should be run as root.

**Replace libtrust**

Libtrust should be replaced with [The Update Framework][16] which is explicitly designed to solve the real problems around signing software binaries. The threat model is very comprehensive and addresses many things that have not been considered in libtrust. There is a complete specification as well as a reference implementation written in Python, and I have begun work on a [Go implementation][17] and welcome contributions.

As part of adding TUF to Docker, a local keystore should be added that maps root keys to registry URLs so that users can have their own signing keys that are not managed by Docker, Inc.

I would like to note that using non-Docker, Inc hosted registries is a very poor user experience in general. Docker, Inc seems content with relegating third party registries to second class status when there is no technical reason to do so. This is a problem both for the ecosystem in general and the security of end users. A comprehensive, decentralized security model for third party registries is both necessary and desirable. I encourage Docker, Inc to take this into consideration when redesigning their security model and image verification system.

### Conclusion ###

Docker users should be aware that the code responsible for downloading images is shockingly insecure. Users should only download images whose provenance is without question. At present, this does *not* include “trusted” images hosted by Docker, Inc including the official Ubuntu and other base images.

The best option is to block `index.docker.io` locally, and download and verify images manually before importing them into Docker using `docker load`. Red Hat’s security blog has [a good post about this][18].

Thanks to Lewis Marshall for pointing out the tarsums are never verified.

- [Checksum code context][19].
- [cloc][20] says 18,141 non-blank, non-comment lines of C and 5,900 lines of headers in v5.2.0.
- Very similar bugs been [found in Android][21], which allowed arbitrary files to be injected into signed packages, and [the Windows Authenticode][22] signature system, which allowed binary modification.
- Specifically: [CVE-2014-6407][23], [CVE-2014-9356][24], and [CVE-2014-9357][25]. There were two Docker [security releases][26] in response.
- See page 8 of the [notes from the 2014-10-28 DGAB meeting][27].

--------------------------------------------------------------------------------

via: https://titanous.com/posts/docker-insecurity

作者：[titanous][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://twitter.com/titanous
[1]:https://blog.docker.com/2014/10/docker-1-3-signed-images-process-injection-security-options-mac-shared-directories/
[2]:https://blog.docker.com/2014/10/docker-1-3-signed-images-process-injection-security-options-mac-shared-directories/
[3]:https://titanous.com/posts/docker-insecurity#fn:0
[4]:https://en.wikipedia.org/wiki/Memory_safety
[5]:https://github.com/docker/docker/blob/0874f9ab77a7957633cd835241a76ee4406196d8/pkg/archive/archive.go#L91-L95
[6]:http://tukaani.org/xz/
[7]:https://titanous.com/posts/docker-insecurity#fn:1
[8]:https://github.com/docker/docker/blob/0874f9ab77a7957633cd835241a76ee4406196d8/pkg/tarsum/tarsum_spec.md
[9]:https://titanous.com/posts/docker-insecurity#fn:2
[10]:https://titanous.com/posts/docker-insecurity#fn:3
[11]:https://github.com/docker/libtrust
[12]:https://tools.ietf.org/html/draft-ietf-jose-json-web-signature-11
[13]:https://titanous.com/posts/docker-insecurity#fn:4
[14]:https://github.com/docker/docker/blob/0874f9ab77a7957633cd835241a76ee4406196d8/trust/trusts.go#L38
[15]:https://github.com/docker/docker/issues/9719
[16]:http://theupdateframework.com/
[17]:https://github.com/flynn/go-tuf
[18]:https://securityblog.redhat.com/2014/12/18/before-you-initiate-a-docker-pull/
[19]:https://github.com/docker/docker/blob/0874f9ab77a7957633cd835241a76ee4406196d8/image/image.go#L114-L116
[20]:http://cloc.sourceforge.net/
[21]:http://www.saurik.com/id/17
[22]:http://blogs.technet.com/b/srd/archive/2013/12/10/ms13-098-update-to-enhance-the-security-of-authenticode.aspx
[23]:https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-6407
[24]:https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9356
[25]:https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9357
[26]:https://groups.google.com/d/topic/docker-user/nFAz-B-n4Bw/discussion
[27]:https://docs.google.com/document/d/1JfWNzfwptsMgSx82QyWH_Aj0DRKyZKxYQ1aursxNorg/edit?pli=1