translating-----geekpi

5 of the Best Bitcoin Clients for Linux
======
By now you have probably heard of [Bitcoin][1] or the [Blockchain][2]. The price of Bitcoin has skyrocketed several times in the past months, and the trend continues almost daily. The demand for Bitcoin seems to grow astronomically by the minute.

Accompanying the demand for the digital currency is the demand for software to manage the currency: Bitcoin clients. A quick search of "Bitcoin client" on Google Play or the App Store will yield quite a number of results. There are many Bitcoin clients that support Linux, but only 5 interesting ones are mentioned here, in no particular order.

### Why Use a Client?
A client makes it easy to manage your Bitcoin or Bitcoins. Many provide different levels of security to make sure you don't lose your precious digital currency. In short, you'll find it helpful, trust me.

#### 1. Bitcoin Core

![Bitcoin Core][3]

This is the core Bitcoin client, as the name suggests. It is has a very simple interface. It is secure and provides the best privacy compared to other popular clients. On the down side, it has to download all Bitcoin transaction history, which is over a 150 GB of data. Hence, it uses more resources than many other clients.

To get the Bitcoin Core client, visit the download [page][4]. Ubuntu users can install it via PPA:
```
sudo add-apt-repository ppa:bitcoin / bitcoin 
sudo apt update 
sudo apt install bitcoin*
```

#### 2. Electrum
![Electrum][5]

Electrum is another interesting Bitcoin client. It is more forgiving than most clients as funds can be recovered from a secret passphrase - no need to ever worry about forgetting keys. It provides several other features that make it convenient to manage Bitcoins such as multisig and cold storage. A plus for Electrum is the ability to see the fiat currency equivalent of your Bitcoins. Unlike Bitcoin Core, it does not require a full copy of your Bitcoin transaction history.

The following is how to get Electrum:
```
sudo apt-get install python3-setuptools python3-pyqt5 python3-pip
sudo pip3 install https://download.electrum.org/3.0.3/Electrum-3.0.3.tar.gz
```

Make sure to check out the appropriate version you want to install on the [website][6].

#### 3. Bitcoin Knots

![Bitcoin Knots][13]

Bitcoin Knots is only different from Bitcoin Core in that it provides more advanced features than Bitcoin Core. In fact, it is derived from Bitcoin Core. It is important to know some of these features are not well-tested.

As with Bitcoin Core, Bitcoin Knots also uses a huge amount of space, as a copy of the full Bitcoin transaction is downloaded.

The PPA and tar files can be found [here][7].

#### 4. Bither

![Bither][8]

Bither has a really simple user interface and is very simple to use. It allows password access and has an exchange rate viewer and cold/hot modes. The client is simple, and it works!

Download Bither [here][9].

#### 5. Armory

![Armory][10]

Armory is another common Bitcoin client. It includes numerous features such as cold storage. This enables you to manage your Bitcoins without connecting to the Internet. Moreover, there are additional security measures to ensure private keys are fully secured from attacks.

You can get the deb file from this download [site][11]. Open the deb file and install on Ubuntu or Debian. You can also get the project on [GitHub][12].

Now that you know a Bitcoin client to manage your digital currency, sit back, relax, and watch your Bitcoin value grow.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/bitcoin-clients-for-linux/

作者：[Bruno Edoh][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
[13]:https://www.maketecheasier.com/assets/uploads/2017/12/bitcoin-core-interface.png
