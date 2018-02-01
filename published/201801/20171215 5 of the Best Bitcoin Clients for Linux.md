Linux 下最好的 5 个比特币客户端
======

![](https://www.maketecheasier.com/assets/uploads/2017/12/bitcoin.jpg)

目前为止，你可能已经听说过[比特币][1]或[区块链][2]。比特币的价格在过去几个月里猛涨了几倍，而且这种趋势几乎每天都在持续。对比特币的需求似乎一分钟都在以天文数字增长。

随着对数字货币的需求，需要用软件来管理货币：比特币客户端。在 Google Play 或 App Store 上搜索“比特币客户端”会得到不少结果。有很多支持 Linux 的比特币客户端，但是这里只说其中 5 个，没有特别的顺序。

### 为什么使用客户端？

客户端可以轻松管理你的比特币。许多客户端提供了不同级别的安全性，以确保你不会失去宝贵的数字货币。总之，你会发现它是帮助的，相信我。

#### 1. Bitcoin Core

![Bitcoin Core][3]

顾名思义，这是核心的比特币客户端。它有一个非常简单的界面。与其他流行的客户相比，它是安全的，并提供了最好的隐私保护。不好的是，它必须下载所有的比特币交易记录，这有超过 150GB 的数据。因此，它比其他客户端使用更多的资源。

要下载 Bitcoin Core 客户端，请访问下载[页面][4]。Ubuntu 用户可以通过 PPA 安装它：

```
sudo add-apt-repository ppa:bitcoin / bitcoin 
sudo apt update 
sudo apt install bitcoin*
```

#### 2. Electrum

![Electrum][5]

Electrum 是另一个有趣的比特币客户端。它是比大多数客户端更宽松，因为资金可以从密码恢复 —— 你无需担心忘记密钥。它提供了其他一些功能，可以方便地管理比特币，如多重签名和冷存储。Electrum 的一个好处是能够看到你的比特币的等值的法定货币。与 Bitcoin Core 不同，它不需要比特币交易记录的完整副本。

以下是如何下载 Electrum：

```
sudo apt-get install python3-setuptools python3-pyqt5 python3-pip
sudo pip3 install https://download.electrum.org/3.0.3/Electrum-3.0.3.tar.gz
```

请确保在该 [网站][6] 上查看要安装的相应版本。

#### 3. Bitcoin Knots


Bitcoin Knots 与 Bitcoin Core 只有一点不同，它提供比 Bitcoin Core 更先进的功能。事实上，它衍生自 Bitcoin Core。不过重要的是要知道有些功能没有经过完善的测试。

与 Bitcoin Core 一样，Bitcoin Knots 也会使用大量空间，因为它下载完整比特币交易的副本。

PPA 和 tar 文件可以在[这里][7]下载。

#### 4. Bither

![Bither][8]

Bither 有一个非常简单的用户界面，使用起来非常简单。它允许通过密码访问，并有一个汇率查看器以及冷/热模式。客户端很简单，但是可以用！

在[这里][9]下载 Bither。

#### 5. Armory

![Armory][10]

Armory 是另一个常见的比特币客户端。它包括许多功能，如冷存储。这使你可以在不连接互联网的情况下管理你的比特币。此外，还有额外的安全措施，以确保私钥完全免受攻击。

你可以从这个下载[网站][11]得到 deb 文件。打开 deb 并安装在 Ubuntu 或 Debian 上。你也可以在 [GitHub][12] 上下载项目。

现在你了解了有一个比特币客户端可以来管理你的数字货币，接着那么坐下来，放松一下，看着你的比特币价值增长。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/bitcoin-clients-for-linux/

作者：[Bruno Edoh][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com
[1]:https://www.maketecheasier.com/what-is-bitcoin-and-how-you-can-utilize-it-online/
[2]:https://www.maketecheasier.com/bitcoin-blockchain-bundle-deals/
[3]:https://www.maketecheasier.com/assets/uploads/2017/12/bitcoin-core-interface.png (Bitcoin Core)
[4]:https://bitcoin.org/en/download
[5]:https://www.maketecheasier.com/assets/uploads/2017/12/electrum-interface.png (Electrum)
[6]:https://electrum.org/
[7]:https://bitcoinknots.org/
[8]:https://www.maketecheasier.com/assets/uploads/2017/12/bitter-interface.png (Bither)
[9]:https://bither.net/
[10]:https://www.maketecheasier.com/assets/uploads/2017/12/armory-logo2.png (Armory)
[11]:https://www.bitcoinarmory.com/download/
[12]:https://github.com/goatpig/BitcoinArmory
