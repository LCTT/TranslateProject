[#]: subject: "Encrypting and decrypting files with OpenSSL"
[#]: via: "https://opensource.com/article/21/4/encryption-decryption-openssl"
[#]: author: "Gaurav Kamathe https://opensource.com/users/gkamathe"
[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13368-1.html"

使用 OpenSSL 加密和解密文件
======

> OpenSSL 是一个实用工具，它可以确保其他人员无法打开你的敏感和机密消息。

![](https://img.linux.net.cn/data/attachment/album/202105/07/163825a9yh74h9yh4h77y2.jpg)

加密是对消息进行编码的一种方法，这样可以保护消息的内容免遭他人窥视。一般有两种类型：

  1. 密钥加密或对称加密
  2. 公钥加密或非对称加密

<ruby>密钥加密<rt>secret-key encryption</rt></ruby>使用相同的密钥进行加密和解密，而<ruby>公钥加密<rt>public-key encryption</rt></ruby>使用不同的密钥进行加密和解密。每种方法各有利弊。密钥加密速度更快，而公钥加密更安全，因为它解决了安全共享密钥的问题，将它们结合在一起可以最大限度地利用每种类型的优势。

### 公钥加密

公钥加密使用两组密钥，称为密钥对。一个是公钥，可以与你想要秘密通信的任何人自由共享。另一个是私钥，应该是一个秘密，永远不会共享。

公钥用于加密。如果某人想与你交流敏感信息，你可以将你的公钥发送给他们，他们可以使用公钥加密消息或文件，然后再将其发送给你。私钥用于解密。解密发件人加密的消息的唯一方法是使用私钥。因此，它们被称为“密钥对”，它们是相互关联的。

### 如何使用 OpenSSL 加密文件

[OpenSSL][2] 是一个了不起的工具，可以执行各种任务，例如加密文件。本文使用安装了 OpenSSL 的 Fedora 计算机。如果你的机器上没有，则可以使用软件包管理器进行安装：

```
alice $ cat /etc/fedora-release
Fedora release 33 (Thirty Three)
alice $
alice $ openssl version
OpenSSL 1.1.1i FIPS  8 Dec 2020
alice $
```

要探索文件加密和解密，假如有两个用户 Alice 和 Bob，他们想通过使用 OpenSSL 交换加密文件来相互通信。

#### 步骤 1：生成密钥对

在加密文件之前，你需要生成密钥对。你还需要一个<ruby>密码短语<rt>passphrase</rt></ruby>，每当你使用 OpenSSL 时都必须使用该密码短语，因此务必记住它。

Alice 使用以下命令生成她的一组密钥对：

```
alice $ openssl genrsa -aes128 -out alice_private.pem 1024
```

此命令使用 OpenSSL 的 [genrsa][3] 命令生成一个 1024 位的公钥/私钥对。这是可以的，因为 RSA 算法是不对称的。它还使用了 aes128 对称密钥算法来加密 Alice 生成的私钥。

输入命令后，OpenSSL 会提示 Alice 输入密码，每次使用密钥时，她都必须输入该密码：

```
alice $ openssl genrsa -aes128 -out alice_private.pem 1024
Generating RSA private key, 1024 bit long modulus (2 primes)
..........+++++
..................................+++++
e is 65537 (0x010001)
Enter pass phrase for alice_private.pem:
Verifying - Enter pass phrase for alice_private.pem:
alice $
alice $
alice $ ls -l alice_private.pem
-rw-------. 1 alice alice 966 Mar 22 17:44 alice_private.pem
alice $
alice $ file alice_private.pem
alice_private.pem: PEM RSA private key
alice $
```

Bob 使用相同的步骤来创建他的密钥对：

```
bob $ openssl genrsa -aes128 -out bob_private.pem 1024
Generating RSA private key, 1024 bit long modulus (2 primes)
..................+++++
............................+++++
e is 65537 (0x010001)
Enter pass phrase for bob_private.pem:
Verifying - Enter pass phrase for bob_private.pem:
bob $
bob $ ls -l bob_private.pem
-rw-------. 1 bob bob 986 Mar 22 13:48 bob_private.pem
bob $
bob $ file bob_private.pem
bob_private.pem: PEM RSA private key
bob $
```

如果你对密钥文件感到好奇，可以打开命令生成的 .pem 文件，但是你会看到屏幕上的一堆文本：


```
alice $ head alice_private.pem
-----BEGIN RSA PRIVATE KEY-----
Proc-Type: 4,ENCRYPTED
DEK-Info: AES-128-CBC,E26FAC1F143A30632203F09C259200B9

pdKj8Gm5eeAOF0RHzBx8l1tjmA1HSSvy0RF42bOeb7sEVZtJ6pMnrJ26ouwTQnkL
JJjUVPPHoKZ7j4QpwzbPGrz/hVeMXVT/y33ZEEA+3nrobwisLKz+Q+C9TVJU3m7M
/veiBO9xHMGV01YBNeic7MqXBkhIrNZW6pPRfrbjsBMBGSsL8nwJbb3wvHhzPkeM
e+wtt9S5PWhcnGMj3T+2mtFfW6HWpd8Kdp60z7Nh5mhA9+5aDWREfJhJYzl1zfcv
Bmxjf2wZ3sFJNty+sQVajYfk6UXMyJIuWgAjnqjw6c3vxQi0KE3NUNZYO93GQgEF
pyAnN9uGUTBCDYeTwdw8TEzkyaL08FkzLfFbS2N9BDksA3rpI1cxpxRVFr9+jDBz
alice $
```

要查看密钥的详细信息，可以使用以下 OpenSSL 命令打开 .pem 文件并显示内容。你可能想知道在哪里可以找到另一个配对的密钥，因为这是单个文件。你观察的很细致，获取公钥的方法如下：

```
alice $ openssl rsa -in alice_private.pem -noout -text
Enter pass phrase for alice_private.pem:
RSA Private-Key: (1024 bit, 2 primes)
modulus:
    00:bd:e8:61:72:f8:f6:c8:f2:cc:05:fa:07:aa:99:
    47:a6:d8:06:cf:09:bf:d1:66:b7:f9:37:29:5d:dc:
    c7:11:56:59:d7:83:b4:81:f6:cf:e2:5f:16:0d:47:
    81:fe:62:9a:63:c5:20:df:ee:d3:95:73:dc:0a:3f:
    65:d3:36:1d:c1:7d:8b:7d:0f:79:de:80:fc:d2:c0:
    e4:27:fc:e9:66:2d:e2:7e:fc:e6:73:d1:c9:28:6b:
    6a:8a:e8:96:9d:65:a0:8a:46:e0:b8:1f:b0:48:d4:
    db:d4:a3:7f:0d:53:36:9a:7d:2e:e7:d8:f2:16:d3:
    ff:1b:12:af:53:22:c0:41:51
publicExponent: 65537 (0x10001)

<< 截断 >>

exponent2:
    6e:aa:8c:6e:37:d0:57:37:13:c0:08:7e:75:43:96:
    33:01:99:25:24:75:9c:0b:45:3c:a2:39:44:69:84:
    a4:64:48:f4:5c:bc:40:40:bf:84:b8:f8:0f:1d:7b:
    96:7e:16:00:eb:49:da:6b:20:65:fc:a9:20:d9:98:
    76:ca:59:e1
coefficient:
    68:9e:2e:fa:a3:a4:72:1d:2b:60:61:11:b1:8b:30:
    6e:7e:2d:f9:79:79:f2:27:ab:a0:a0:b6:45:08:df:
    12:f7:a4:3b:d9:df:c5:6e:c7:e8:81:29:07:cd:7e:
    47:99:5d:33:8c:b7:fb:3b:a9:bb:52:c0:47:7a:1c:
    e3:64:90:26
alice $
```

#### 步骤 2：提取公钥

注意，公钥是你可以与他人自由共享的密钥，而你必须将私钥保密。因此，Alice 必须提取她的公钥，并将其保存到文件中：

```
alice $ openssl rsa -in alice_private.pem -pubout > alice_public.pem
Enter pass phrase for alice_private.pem:
writing RSA key
alice $
alice $ ls -l *.pem
-rw-------. 1 alice alice 966 Mar 22 17:44 alice_private.pem
-rw-rw-r--. 1 alice alice 272 Mar 22 17:47 alice_public.pem
alice $
```

你可以使用与之前相同的方式查看公钥详细信息，但是这次，输入公钥 .pem 文件：

```
alice $
alice $ openssl rsa -in alice_public.pem -pubin -text -noout
RSA Public-Key: (1024 bit)
Modulus:
    00:bd:e8:61:72:f8:f6:c8:f2:cc:05:fa:07:aa:99:
    47:a6:d8:06:cf:09:bf:d1:66:b7:f9:37:29:5d:dc:
    c7:11:56:59:d7:83:b4:81:f6:cf:e2:5f:16:0d:47:
    81:fe:62:9a:63:c5:20:df:ee:d3:95:73:dc:0a:3f:
$
```

Bob 可以按照相同的过程来提取他的公钥并将其保存到文件中：

```
bob $ openssl rsa -in bob_private.pem -pubout > bob_public.pem
Enter pass phrase for bob_private.pem:
writing RSA key
bob $
bob $ ls -l *.pem
-rw-------. 1 bob bob 986 Mar 22 13:48 bob_private.pem
-rw-r--r--. 1 bob bob 272 Mar 22 13:51 bob_public.pem
bob $
```

#### 步骤 3：交换公钥

这些公钥在 Alice 和 Bob 彼此交换之前没有太大用处。有几种共享公钥的方法，例如使用 `scp` 命令将密钥复制到彼此的工作站。

将 Alice 的公钥发送到 Bob 的工作站：

```
alice $ scp alice_public.pem bob@bob-machine-or-ip:/path/
```

将 Bob 的公钥发送到 Alice 的工作站：

```
bob $ scp bob_public.pem alice@alice-machine-or-ip:/path/
```

现在，Alice 有了 Bob 的公钥，反之亦然：

```
alice $ ls -l bob_public.pem
-rw-r--r--. 1 alice alice 272 Mar 22 17:51 bob_public.pem
alice $
```

```
bob $ ls -l alice_public.pem
-rw-r--r--. 1 bob bob 272 Mar 22 13:54 alice_public.pem
bob $
```

#### 步骤 4：使用公钥交换加密的消息

假设 Alice 需要与 Bob 秘密交流。她将秘密信息写入文件中，并将其保存到 `top_secret.txt` 中。由于这是一个普通文件，因此任何人都可以打开它并查看其内容，这里并没有太多保护：


```
alice $
alice $ echo "vim or emacs ?" > top_secret.txt
alice $
alice $ cat top_secret.txt
vim or emacs ?
alice $
```

要加密此秘密消息，Alice 需要使用 `openssls -encrypt` 命令。她需要为该工具提供三个输入：

  1. 秘密消息文件的名称
  2. Bob 的公钥（文件）
  3. 加密后新文件的名称

```
alice $ openssl rsautl -encrypt -inkey bob_public.pem -pubin -in top_secret.txt -out top_secret.enc
alice $
alice $ ls -l top_secret.*
-rw-rw-r--. 1 alice alice 128 Mar 22 17:54 top_secret.enc
-rw-rw-r--. 1 alice alice  15 Mar 22 17:53 top_secret.txt
alice $
alice $
```

加密后，原始文件仍然是可见的，而新创建的加密文件在屏幕上看起来像乱码。这样，你可以确定秘密消息已被加密：

```
alice $ cat top_secret.txt
vim or emacs ?
alice $
alice $ cat top_secret.enc
�s��uM)M&>��N��}dmCy92#1X�q󺕦��v���M��@��E�~��1�k~&PU�VhHL�@^P��(��zi�M�4p�e��g+R�1�Ԁ���s�������q_8�lr����C�I-��alice $
alice $
alice $
alice $ hexdump -C ./top_secret.enc
00000000  9e 73 12 8f e3 75 4d 29  4d 26 3e bf 80 4e a0 c5  |.s...uM)M&>..N..|
00000010  7d 64 6d 43 79 39 32 23  31 58 ce 71 f3 ba 95 a6  |}dmCy92#1X.q....|
00000020  c0 c0 76 17 fb f7 bf 4d  ce fc 40 e6 f4 45 7f db  |..v....M..@..E..|
00000030  7e ae c0 31 f8 6b 10 06  7e 26 50 55 b5 05 56 68  |~..1.k..~&PU..Vh|
00000040  48 4c eb 40 5e 50 fe 19  ea 28 a8 b8 7a 13 69 d7  |HL.@^P...(..z.i.|
00000050  4d b0 34 70 d8 65 d5 07  95 67 2b 52 ea 31 aa d4  |M.4p.e...g+R.1..|
00000060  80 b3 a8 ec a1 73 ed a7  f9 17 c3 13 d4 fa c1 71  |.....s.........q|
00000070  5f 38 b9 6c 07 72 81 a6  fe af 43 a6 49 2d c4 ee  |_8.l.r....C.I-..|
00000080
alice $
alice $ file top_secret.enc
top_secret.enc: data
alice $
```

删除秘密消息的原始文件是安全的，这样确保任何痕迹都没有：

```
alice $ rm -f top_secret.txt
```

现在，Alice 需要再次使用 `scp` 命令将此加密文件通过网络发送给 Bob 的工作站。注意，即使文件被截获，其内容也会是加密的，因此内容不会被泄露：

```
alice $  scp top_secret.enc bob@bob-machine-or-ip:/path/
```

如果 Bob 使用常规方法尝试打开并查看加密的消息，他将无法看懂该消息：

```
bob $ ls -l top_secret.enc
-rw-r--r--. 1 bob bob 128 Mar 22 13:59 top_secret.enc
bob $
bob $ cat top_secret.enc
�s��uM)M&>��N��}dmCy92#1X�q󺕦��v���M��@��E�~��1�k~&PU�VhHL�@^P��(��zi�M�4p�e��g+R�1�Ԁ���s�������q_8�lr����C�I-��bob $
bob $
bob $ hexdump -C top_secret.enc
00000000  9e 73 12 8f e3 75 4d 29  4d 26 3e bf 80 4e a0 c5  |.s...uM)M&>..N..|
00000010  7d 64 6d 43 79 39 32 23  31 58 ce 71 f3 ba 95 a6  |}dmCy92#1X.q....|
00000020  c0 c0 76 17 fb f7 bf 4d  ce fc 40 e6 f4 45 7f db  |..v....M..@..E..|
00000030  7e ae c0 31 f8 6b 10 06  7e 26 50 55 b5 05 56 68  |~..1.k..~&PU..Vh|
00000040  48 4c eb 40 5e 50 fe 19  ea 28 a8 b8 7a 13 69 d7  |HL.@^P...(..z.i.|
00000050  4d b0 34 70 d8 65 d5 07  95 67 2b 52 ea 31 aa d4  |M.4p.e...g+R.1..|
00000060  80 b3 a8 ec a1 73 ed a7  f9 17 c3 13 d4 fa c1 71  |.....s.........q|
00000070  5f 38 b9 6c 07 72 81 a6  fe af 43 a6 49 2d c4 ee  |_8.l.r....C.I-..|
00000080
bob $
```

#### 步骤 5：使用私钥解密文件

Bob 需要使用 OpenSSL 来解密消息，但是这次使用的是 `-decrypt` 命令行参数。他需要向工具程序提供以下信息：

  1. 加密的文件（从 Alice 那里得到）
  2. Bob 的私钥（用于解密，因为文件是用 Bob 的公钥加密的）
  3. 通过重定向保存解密输出的文件名

```
bob $ openssl rsautl -decrypt -inkey bob_private.pem -in top_secret.enc > top_secret.txt
Enter pass phrase for bob_private.pem:
bob $
```

现在，Bob 可以阅读 Alice 发送给他的秘密消息：

```
bob $ ls -l top_secret.txt
-rw-r--r--. 1 bob bob 15 Mar 22 14:02 top_secret.txt
bob $
bob $ cat top_secret.txt
vim or emacs ?
bob $
```

Bob 需要回复 Alice，因此他将秘密回复写在一个文件中：

```
bob $ echo "nano for life" > reply_secret.txt
bob $
bob $ cat reply_secret.txt
nano for life
bob $
```

#### 步骤 6：使用其他密钥重复该过程

为了发送消息，Bob 采用和 Alice 相同的步骤，但是由于该消息是发送给 Alice 的，因此他需要使用 Alice 的公钥来加密文件：

```
bob $ openssl rsautl -encrypt -inkey alice_public.pem -pubin -in reply_secret.txt -out reply_secret.enc
bob $
bob $ ls -l reply_secret.enc
-rw-r--r--. 1 bob bob 128 Mar 22 14:03 reply_secret.enc
bob $
bob $ cat reply_secret.enc
�F݇��.4"f�1��\��{o԰$�M��I{5�|�\�l͂�e��Y�V��{�|!$c^a
                                                 �*Ԫ\vQ�Ϡ9����'��ٮsP��'��Z�1W�n��k���J�0�I;P8������&:bob $
bob $
bob $ hexdump -C ./reply_secret.enc
00000000  92 46 dd 87 04 bc a7 2e  34 22 01 66 1a 13 31 db  |.F......4".f..1.|
00000010  c4 5c b4 8e 7b 6f d4 b0  24 d2 4d 92 9b 49 7b 35  |.\..{o..$.M..I{5|
00000020  da 7c ee 5c bb 6c cd 82  f1 1b 92 65 f1 8d f2 59  |.|.\.l.....e...Y|
00000030  82 56 81 80 7b 89 07 7c  21 24 63 5e 61 0c ae 2a  |.V..{..|!$c^a..*|
00000040  d4 aa 5c 76 51 8d cf a0  39 04 c1 d7 dc f0 ad 99  |..\vQ...9.......|
00000050  27 ed 8e de d9 ae 02 73  50 e0 dd 27 13 ae 8e 5a  |'......sP..'...Z|
00000060  12 e4 9a 31 57 b3 03 6e  dd e1 16 7f 6b c0 b3 8b  |...1W..n....k...|
00000070  4a cf 30 b8 49 3b 50 38  e0 9f 84 f6 83 da 26 3a  |J.0.I;P8......&:|
00000080
bob $
bob $ # remove clear text secret message file
bob $ rm -f reply_secret.txt
```

Bob 通过 `scp` 将加密的文件发送至 Alice 的工作站：

```
$ scp reply_secret.enc alice@alice-machine-or-ip:/path/
```

如果 Alice 尝试使用常规工具去阅读加密的文本，她将无法理解加密的文本：

```
alice $
alice $ ls -l reply_secret.enc
-rw-r--r--. 1 alice alice 128 Mar 22 18:01 reply_secret.enc
alice $
alice $ cat reply_secret.enc
�F݇��.4"f�1��\��{o԰$�M��I{5�|�\�l͂�e��Y�V��{�|!$c^a
                                                 �*Ԫ\vQ�Ϡ9����'��ٮsP��'��Z�1W�n��k���J�0�I;P8������&:alice $
alice $
alice $
alice $ hexdump -C ./reply_secret.enc
00000000  92 46 dd 87 04 bc a7 2e  34 22 01 66 1a 13 31 db  |.F......4".f..1.|
00000010  c4 5c b4 8e 7b 6f d4 b0  24 d2 4d 92 9b 49 7b 35  |.\..{o..$.M..I{5|
00000020  da 7c ee 5c bb 6c cd 82  f1 1b 92 65 f1 8d f2 59  |.|.\.l.....e...Y|
00000030  82 56 81 80 7b 89 07 7c  21 24 63 5e 61 0c ae 2a  |.V..{..|!$c^a..*|
00000040  d4 aa 5c 76 51 8d cf a0  39 04 c1 d7 dc f0 ad 99  |..\vQ...9.......|
00000050  27 ed 8e de d9 ae 02 73  50 e0 dd 27 13 ae 8e 5a  |'......sP..'...Z|
00000060  12 e4 9a 31 57 b3 03 6e  dd e1 16 7f 6b c0 b3 8b  |...1W..n....k...|
00000070  4a cf 30 b8 49 3b 50 38  e0 9f 84 f6 83 da 26 3a  |J.0.I;P8......&:|
00000080
alice $
```

所以，她使用 OpenSSL 解密消息，只不过这次她提供了自己的私钥并将输出保存到文件中：

```
alice $ openssl rsautl -decrypt -inkey alice_private.pem -in reply_secret.enc > reply_secret.txt
Enter pass phrase for alice_private.pem:
alice $
alice $ ls -l reply_secret.txt
-rw-rw-r--. 1 alice alice 14 Mar 22 18:02 reply_secret.txt
alice $
alice $ cat reply_secret.txt
nano for life
alice $
```

### 了解 OpenSSL 的更多信息

OpenSSL 在加密界是真正的瑞士军刀。除了加密文件外，它还可以执行许多任务，你可以通过访问 OpenSSL [文档页面][4]来找到使用它的所有方式，包括手册的链接、 《OpenSSL Cookbook》、常见问题解答等。要了解更多信息，尝试使用其自带的各种加密算法，看看它是如何工作的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/encryption-decryption-openssl

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003601_05_mech_osyearbook2016_security_cc.png?itok=3V07Lpko "A secure lock."
[2]: https://www.openssl.org/
[3]: https://www.openssl.org/docs/man1.0.2/man1/genrsa.html
[4]: https://www.openssl.org/docs/