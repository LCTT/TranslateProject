安装 Strongswan ：Linux 上一个基于 IPsec 的 VPN 工具
================================================================================

IPsec是一个提供网络层安全的标准。它包含认证头(AH)和安全负载封装(ESP)组件。AH提供包的完整性，ESP组件提供包的保密性。IPsec确保了在网络层的安全特性。

- 保密性
- 数据包完整性
- 来源不可抵赖性
- 重放攻击防护

[Strongswan][1]是一个IPsec协议的开源代码实现，Strongswan的意思是强安全广域网（StrongS/WAN）。它支持IPsec的VPN中的两个版本的密钥自动交换（网络密钥交换（IKE）V1和V2）。

Strongswan基本上提供了在VPN的两个节点/网关之间自动交换密钥的共享，然后它使用了Linux内核的IPsec（AH和ESP）实现。密钥共享使用了之后用于ESP数据加密的IKE 机制。在IKE阶段，strongswan使用OpenSSL的加密算法（AES，SHA等等）和其他加密类库。无论如何，IPsec中的ESP组件使用的安全算法是由Linux内核实现的。Strongswan的主要特性如下：

- x.509证书或基于预共享密钥认证
- 支持IKEv1和IKEv2密钥交换协议
- 可选的，对于插件和库的内置完整性和加密测试
- 支持椭圆曲线DH群和ECDSA证书
- 在智能卡上存储RSA私钥和证书

它能被使用在客户端/服务器（road warrior模式）和网关到网关的情景。

### 如何安装 ###

几乎所有的Linux发行版都支持Strongswan的二进制包。在这个教程，我们会从二进制包安装strongswan，也会从源代码编译带有合适的特性的strongswan。

### 使用二进制包 ###

可以使用以下命令安装Strongswan到Ubuntu 14.04 LTS

    $ sudo aptitude install strongswan

![安装strongswan](http://blog.linoxide.com/wp-content/uploads/2014/12/strongswan-binary.png)

strongswan的全局配置（strongswan.conf）文件和ipsec配置（ipsec.conf/ipsec.secrets）文件都在/etc/目录下。

### strongswan源码编译安装的依赖包 ###

- GMP（strongswan使用的高精度数学库）
- OpenSSL（加密算法来自这个库）
- PKCS（1，7，8，11，12）（证书编码和智能卡集成）

#### 步骤 ####

**1)** 在终端使用下面命令到/usr/src/目录

    $ cd /usr/src

**2)** 用下面命令从strongswan网站下载源代码

     $ sudo wget http://download.strongswan.org/strongswan-5.2.1.tar.gz

（strongswan-5.2.1.tar.gz 是当前最新版。）

![下载软件](http://blog.linoxide.com/wp-content/uploads/2014/12/download_strongswan.png)

**3)** 用下面命令提取下载的软件，然后进入目录。

    $ sudo tar –xvzf strongswan-5.2.1.tar.gz; cd strongswan-5.2.1

**4)** 使用configure命令配置strongswan每个想要的选项。

    $ ./configure --prefix=/usr/local -–enable-pkcs11 -–enable-openssl

![检查strongswan包](http://blog.linoxide.com/wp-content/uploads/2014/12/strongswan-configure.png)

如果GMP库没有安装，配置脚本将会发生下面的错误。

![GMP library error](http://blog.linoxide.com/wp-content/uploads/2014/12/gmp-error.png)

因此，首先，使用下面命令安装GMP库然后执行配置脚本。

![gmp installation](http://blog.linoxide.com/wp-content/uploads/2014/12/gmp-installation1.png)

不过，如果GMP已经安装还报上述错误的话，在Ubuntu上使用如下命令，给在路径 /usr/lib，/lib/，/usr/lib/x86_64-linux-gnu/ 下的libgmp.so库创建软连接。

    $ sudo ln -s /usr/lib/x86_64-linux-gnu/libgmp.so.10.1.3 /usr/lib/x86_64-linux-gnu/libgmp.so

![softlink of libgmp.so library](http://blog.linoxide.com/wp-content/uploads/2014/12/softlink.png)

创建libgmp.so软连接后，再执行./configure脚本也许就找到gmp库了。然而，如果gmp头文件发生其他错误，像下面这样。

![GMP header file issu](http://blog.linoxide.com/wp-content/uploads/2014/12/gmp-header.png)

为解决上面的错误，使用下面命令安装libgmp-dev包

    $ sudo aptitude install libgmp-dev

![Installation of Development library of GMP](http://blog.linoxide.com/wp-content/uploads/2014/12/gmp-dev.png)

安装gmp的开发库后，在运行一遍配置脚本，如果没有发生错误，则将看见下面的这些输出。

![Output of Configure scirpt](http://blog.linoxide.com/wp-content/uploads/2014/12/successful-run.png)

使用下面的命令编译安装strongswan。

    $ sudo make ; sudo make install 

安装strongswan后，全局配置（strongswan.conf）和ipsec策略/密码配置文件（ipsec.conf/ipsec.secretes）被放在**/usr/local/etc**目录。

根据我们的安全需要Strongswan可以用作隧道或者传输模式。它提供众所周知的site-2-site模式和road warrior模式的VPN。它很容易使用在Cisco，Juniper设备上。

--------------------------------------------------------------------------------

via: http://linoxide.com/security/install-strongswan/

作者：[nido][a]
译者：[wyangsun](https://github.com/wyangsun)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/naveeda/
[1]:https://www.strongswan.org/
