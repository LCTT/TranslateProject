[#]: collector: (lujun9972)
[#]: translator: (hopefully2333)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10568-1.html)
[#]: subject: (The Evil-Twin Framework: A tool for improving WiFi security)
[#]: via: (https://opensource.com/article/19/1/evil-twin-framework)
[#]: author: (André Esser https://opensource.com/users/andreesser)

Evil-Twin 框架：一个用于提升 WiFi 安全性的工具
======

> 了解一款用于对 WiFi 接入点安全进行渗透测试的工具。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-cloud-safe.png?itok=yj2TFPzq)

越来越多的设备通过无线传输的方式连接到互联网，以及，大范围可用的 WiFi 接入点为攻击者攻击用户提供了很多机会。通过欺骗用户连接到[虚假的 WiFi 接入点][1]，攻击者可以完全控制用户的网络连接，这将使得攻击者可以嗅探和篡改用户的数据包，将用户的连接重定向到一个恶意的网站，并通过网络发起其他的攻击。

为了保护用户并告诉他们如何避免线上的危险操作，安全审计人员和安全研究员必须评估用户的安全实践能力，用户常常在没有确认该 WiFi 接入点为安全的情况下就连接上了该网络，安全审计人员和研究员需要去了解这背后的原因。有很多工具都可以对 WiFi 的安全性进行审计，但是没有一款工具可以测试大量不同的攻击场景，也没有能和其他工具集成得很好的工具。

Evil-Twin Framework（ETF）用于解决 WiFi 审计过程中的这些问题。审计者能够使用 ETF 来集成多种工具并测试该 WiFi 在不同场景下的安全性。本文会介绍 ETF 的框架和功能，然后会提供一些案例来说明该如何使用这款工具。

### ETF 的架构

ETF 的框架是用 [Python][2] 写的，因为这门开发语言的代码非常易读，也方便其他开发者向这个项目贡献代码。除此之外，很多 ETF 的库，比如 [Scapy][3]，都是为 Python 开发的，很容易就能将它们用于 ETF。

ETF 的架构（图 1）分为不同的彼此交互的模块。该框架的设置都写在一个单独的配置文件里。用户可以通过 `ConfigurationManager` 类里的用户界面来验证并修改这些配置。其他模块只能读取这些设置并根据这些设置进行运行。

![Evil-Twin Framework Architecture][5]

*图 1：Evil-Twin 的框架架构*

ETF 支持多种与框架交互的用户界面，当前的默认界面是一个交互式控制台界面，类似于 [Metasploit][6] 那种。正在开发用于桌面/浏览器使用的图形用户界面（GUI）和命令行界面（CLI），移动端界面也是未来的一个备选项。用户可以使用交互式控制台界面来修改配置文件里的设置（最终会使用 GUI）。用户界面可以与存在于这个框架里的每个模块进行交互。

WiFi 模块（AirCommunicator）用于支持多种 WiFi 功能和攻击类型。该框架确定了 Wi-Fi 通信的三个基本支柱：数据包嗅探、自定义数据包注入和创建接入点。三个主要的 WiFi 通信模块 AirScanner、AirInjector，和 AirHost，分别用于数据包嗅探、数据包注入，和接入点创建。这三个类被封装在主 WiFi 模块 AirCommunicator 中，AirCommunicator 在启动这些服务之前会先读取这些服务的配置文件。使用这些核心功能的一个或多个就可以构造任意类型的 WiFi 攻击。

要使用中间人（MITM）攻击（这是一种攻击 WiFi 客户端的常见手法），ETF 有一个叫做 ETFITM（Evil-Twin Framework-in-the-Middle）的集成模块，这个模块用于创建一个 web 代理，来拦截和修改经过的 HTTP/HTTPS 数据包。

许多其他的工具也可以利用 ETF 创建的 MITM。通过它的可扩展性，ETF 能够支持它们，而不必单独地调用它们，你可以通过扩展 Spawner 类来将这些工具添加到框架里。这使得开发者和安全审计人员可以使用框架里预先配置好的参数字符来调用程序。

扩展 ETF 的另一种方法就是通过插件。有两类插件：WiFi 插件和 MITM 插件。MITM 插件是在 MITM 代理运行时可以执行的脚本。代理会将 HTTP(s) 请求和响应传递给可以记录和处理它们的插件。WiFi 插件遵循一个更加复杂的执行流程，但仍然会给想参与开发并且使用自己插件的贡献者提供一个相对简单的 API。WiFi 插件还可以进一步地划分为三类，其中每个对应一个核心 WiFi 通信模块。

每个核心模块都有一些特定事件能触发响应的插件的执行。举个例子，AirScanner 有三个已定义的事件，可以对其响应进行编程处理。事件通常对应于服务开始运行之前的设置阶段、服务正在运行时的中间执行阶段、服务完成后的卸载或清理阶段。因为 Python 允许多重继承，所以一个插件可以继承多个插件类。

上面的图 1 是框架架构的摘要。从 ConfigurationManager 指出的箭头意味着模块会从中读取信息，指向它的箭头意味着模块会写入/修改配置。

### 使用 ETF 的例子

ETF 可以通过多种方式对 WiFi 的网络安全或者终端用户的 WiFi 安全意识进行渗透测试。下面的例子描述了这个框架的一些渗透测试功能，例如接入点和客户端检测、对使用 WPA 和 WEP 类型协议的接入点进行攻击，和创建 evil twin 接入点。

这些例子是使用 ETF 和允许进行 WiFi 数据捕获的 WiFi 卡设计的。它们也在 ETF 设置命令中使用了下面这些缩写：

  * **APS** Access Point SSID
  * **APB** Access Point BSSID
  * **APC** Access Point Channel
  * **CM** Client MAC address

在实际的测试场景中，确保你使用了正确的信息来替换这些缩写。

#### 在解除认证攻击后捕获 WPA 四次握手的数据包。

这个场景（图 2）做了两个方面的考虑：<ruby>解除认证攻击<rt>de-authentication attack</rt></ruby>和捕获 WPA 四次握手数据包的可能性。这个场景从一个启用了 WPA/WPA2 的接入点开始，这个接入点有一个已经连上的客户端设备（在本例中是一台智能手机）。目的是通过常规的解除认证攻击（LCTT 译注：类似于 DoS 攻击）来让客户端断开和 WiFi 的网络，然后在客户端尝试重连的时候捕获 WPA 的握手包。重连会在断开连接后马上手动完成。

![Scenario for capturing a WPA handshake after a de-authentication attack][8]

*图 2：在解除认证攻击后捕获 WPA 握手包的场景*

在这个例子中需要考虑的是 ETF 的可靠性。目的是确认工具是否一直都能捕获 WPA 的握手数据包。每个工具都会用来多次复现这个场景，以此来检查它们在捕获 WPA 握手数据包时的可靠性。

使用 ETF 来捕获 WPA 握手数据包的方法不止一种。一种方法是使用 AirScanner 和 AirInjector 两个模块的组合；另一种方法是只使用 AirInjector。下面这个场景是使用了两个模块的组合。

ETF 启用了 AirScanner 模块并分析 IEEE 802.11 数据帧来发现 WPA 握手包。然后 AirInjecto 就可以使用解除认证攻击来强制客户端断开连接，以进行重连。必须在 ETF 上执行下面这些步骤才能完成上面的目标：

  1. 进入 AirScanner 配置模式：`config airscanner`
  2. 设置 AirScanner 不跳信道：`config airscanner`
  3. 设置信道以嗅探经过 WiFi 接入点信道的数据（APC）：`set fixed_sniffing_channel = <APC>`
  4. 使用 CredentialSniffer 插件来启动 AirScanner 模块：`start airscanner with credentialsniffer`
  5. 从已嗅探的接入点列表中添加目标接入点的 BSSID（APS）：`add aps where ssid = <APS>`
  6. 启用 AirInjector 模块，在默认情况下，它会启用解除认证攻击：`start airinjector`

这些简单的命令设置能让 ETF 在每次测试时执行成功且有效的解除认证攻击。ETF 也能在每次测试的时候捕获 WPA 的握手数据包。下面的代码能让我们看到 ETF 成功的执行情况。

```
███████╗████████╗███████╗
██╔════╝╚══██╔══╝██╔════╝
█████╗     ██║   █████╗  
██╔══╝     ██║   ██╔══╝  
███████╗   ██║   ██║    
╚══════╝   ╚═╝   ╚═╝    
                                       

[+] Do you want to load an older session? [Y/n]: n
[+] Creating new temporary session on 02/08/2018
[+] Enter the desired session name:
ETF[etf/aircommunicator/]::> config airscanner
ETF[etf/aircommunicator/airscanner]::> listargs
  sniffing_interface =               wlan1; (var)
              probes =                True; (var)
             beacons =                True; (var)
        hop_channels =               false; (var)
fixed_sniffing_channel =                  11; (var)
ETF[etf/aircommunicator/airscanner]::> start airscanner with
arpreplayer        caffelatte         credentialsniffer  packetlogger       selfishwifi        
ETF[etf/aircommunicator/airscanner]::> start airscanner with credentialsniffer
[+] Successfully added credentialsniffer plugin.
[+] Starting packet sniffer on interface 'wlan1'
[+] Set fixed channel to 11
ETF[etf/aircommunicator/airscanner]::> add aps where ssid = CrackWPA
ETF[etf/aircommunicator/airscanner]::> start airinjector
ETF[etf/aircommunicator/airscanner]::> [+] Starting deauthentication attack
                    - 1000 bursts of 1 packets
                    - 1 different packets
[+] Injection attacks finished executing.
[+] Starting post injection methods
[+] Post injection methods finished
[+] WPA Handshake found for client '70:3e:ac:bb:78:64' and network 'CrackWPA'
```

#### 使用 ARP 重放攻击并破解 WEP 无线网络

下面这个场景（图 3）将关注[地址解析协议][9]（ARP）重放攻击的效率和捕获包含初始化向量（IVs）的 WEP 数据包的速度。相同的网络可能需要破解不同数量的捕获的 IVs，所以这个场景的 IVs 上限是 50000。如果这个网络在首次测试期间，还未捕获到 50000 IVs 就崩溃了，那么实际捕获到的 IVs 数量会成为这个网络在接下来的测试里的新的上限。我们使用 `aircrack-ng` 对数据包进行破解。

测试场景从一个使用 WEP 协议进行加密的 WiFi 接入点和一台知道其密钥的离线客户端设备开始 —— 为了测试方便，密钥使用了 12345，但它可以是更长且更复杂的密钥。一旦客户端连接到了 WEP 接入点，它会发送一个不必要的 ARP 数据包；这是要捕获和重放的数据包。一旦被捕获的包含 IVs 的数据包数量达到了设置的上限，测试就结束了。

![Scenario for capturing a WPA handshake after a de-authentication attack][11]

*图 3：在进行解除认证攻击后捕获 WPA 握手包的场景*

ETF 使用 Python 的 Scapy 库来进行包嗅探和包注入。为了最大限度地解决 Scapy 里的已知的性能问题，ETF 微调了一些低级库，来大大加快包注入的速度。对于这个特定的场景，ETF 为了更有效率地嗅探，使用了 `tcpdump` 作为后台进程而不是 Scapy，Scapy 用于识别加密的 ARP 数据包。

这个场景需要在 ETF 上执行下面这些命令和操作：

  1. 进入 AirScanner 设置模式：`config airscanner`
  2. 设置 AirScanner 不跳信道：`set hop_channels = false`
  3. 设置信道以嗅探经过接入点信道的数据（APC）：`set fixed_sniffing_channel = <APC>`
  4. 进入 ARPReplayer 插件设置模式：`config arpreplayer`
  5. 设置 WEP 网络目标接入点的 BSSID（APB）：`set target_ap_bssid <APB>`
  6. 使用 ARPReplayer 插件启动 AirScanner 模块：`start airscanner with arpreplayer`

在执行完这些命令后，ETF 会正确地识别加密的 ARP 数据包，然后成功执行 ARP 重放攻击，以此破坏这个网络。

#### 使用一款全能型蜜罐

图 4 中的场景使用相同的 SSID 创建了多个接入点，对于那些可以探测到但是无法接入的 WiFi 网络，这个技术可以发现网络的加密类型。通过启动具有所有安全设置的多个接入点，客户端会自动连接和本地缓存的接入点信息相匹配的接入点。

![Scenario for capturing a WPA handshake after a de-authentication attack][13]

*图 4：在解除认证攻击后捕获 WPA 握手包数据。*

使用 ETF，可以去设置 `hostapd` 配置文件，然后在后台启动该程序。`hostapd` 支持在一张无线网卡上通过设置虚拟接口开启多个接入点，并且因为它支持所有类型的安全设置，因此可以设置完整的全能蜜罐。对于使用 WEP 和 WPA(2)-PSK 的网络，使用默认密码，和对于使用 WPA(2)-EAP 的网络，配置“全部接受”策略。

对于这个场景，必须在 ETF 上执行下面的命令和操作：

  1. 进入 APLauncher 设置模式：`config aplauncher`
  2. 设置目标接入点的 SSID(APS)：`set ssid = <APS>`
  3. 设置 APLauncher 为全部接收的蜜罐：`set catch_all_honeypot = true`
  4. 启动 AirHost 模块：`start airhost`

使用这些命令，ETF 可以启动一个包含所有类型安全配置的完整全能蜜罐。ETF 同样能自动启动 DHCP 和 DNS 服务器，从而让客户端能与互联网保持连接。ETF 提供了一个更好、更快、更完整的解决方案来创建全能蜜罐。下面的代码能够看到 ETF 的成功执行。

```
███████╗████████╗███████╗
██╔════╝╚══██╔══╝██╔════╝
█████╗     ██║   █████╗  
██╔══╝     ██║   ██╔══╝  
███████╗   ██║   ██║    
╚══════╝   ╚═╝   ╚═╝    
                                       

[+] Do you want to load an older session? [Y/n]: n
[+] Creating ne´,cxzw temporary session on 03/08/2018
[+] Enter the desired session name:
ETF[etf/aircommunicator/]::> config aplauncher
ETF[etf/aircommunicator/airhost/aplauncher]::> setconf ssid CatchMe
ssid = CatchMe
ETF[etf/aircommunicator/airhost/aplauncher]::> setconf catch_all_honeypot true
catch_all_honeypot = true
ETF[etf/aircommunicator/airhost/aplauncher]::> start airhost
[+] Killing already started processes and restarting network services
[+] Stopping dnsmasq and hostapd services
[+] Access Point stopped...
[+] Running airhost plugins pre_start
[+] Starting hostapd background process
[+] Starting dnsmasq service
[+] Running airhost plugins post_start
[+] Access Point launched successfully
[+] Starting dnsmasq service
```

### 结论和以后的工作

这些场景使用常见和众所周知的攻击方式来帮助验证 ETF 测试 WIFI 网络和客户端的能力。这个结果同样证明了该框架的架构能在平台现有功能的优势上开发新的攻击向量和功能。这会加快新的 WiFi 渗透测试工具的开发，因为很多的代码已经写好了。除此之外，将 WiFi 技术相关的东西都集成到一个单独的工具里，会使 WiFi 渗透测试更加简单高效。

ETF 的目标不是取代现有的工具，而是为它们提供补充，并为安全审计人员在进行 WiFi 渗透测试和提升用户安全意识时，提供一个更好的选择。

ETF 是 [GitHub][14] 上的一个开源项目，欢迎社区为它的开发做出贡献。下面是一些您可以提供帮助的方法。

当前 WiFi 渗透测试的一个限制是无法在测试期间记录重要的事件。这使得报告已经识别到的漏洞更加困难且准确性更低。这个框架可以实现一个记录器，每个类都可以来访问它并创建一个渗透测试会话报告。

ETF 工具的功能涵盖了 WiFi 渗透测试的方方面面。一方面，它让 WiFi 目标侦察、漏洞挖掘和攻击这些阶段变得更加容易。另一方面，它没有提供一个便于提交报告的功能。增加了会话的概念和会话报告的功能，比如在一个会话期间记录重要的事件，会极大地增加这个工具对于真实渗透测试场景的价值。

另一个有价值的贡献是扩展该框架来促进 WiFi 模糊测试。IEEE 802.11 协议非常的复杂，考虑到它在客户端和接入点两方面都会有多种实现方式。可以假设这些实现都包含 bug 甚至是安全漏洞。这些 bug 可以通过对 IEEE 802.11 协议的数据帧进行模糊测试来进行发现。因为 Scapy 允许自定义的数据包创建和数据包注入，可以通过它实现一个模糊测试器。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/evil-twin-framework

作者：[André Esser][a]
选题：[lujun9972][b]
译者：[hopefully2333](https://github.com/hopefully2333)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/andreesser
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Rogue_access_point
[2]: https://www.python.org/
[3]: https://scapy.net
[4]: /file/417776
[5]: https://opensource.com/sites/default/files/uploads/pic1.png (Evil-Twin Framework Architecture)
[6]: https://www.metasploit.com
[7]: /file/417781
[8]: https://opensource.com/sites/default/files/uploads/pic2.png (Scenario for capturing a WPA handshake after a de-authentication attack)
[9]: https://en.wikipedia.org/wiki/Address_Resolution_Protocol
[10]: /file/417786
[11]: https://opensource.com/sites/default/files/uploads/pic3.png (Scenario for capturing a WPA handshake after a de-authentication attack)
[12]: /file/417791
[13]: https://opensource.com/sites/default/files/uploads/pic4.png (Scenario for capturing a WPA handshake after a de-authentication attack)
[14]: https://github.com/Esser420/EvilTwinFramework
