Python 3: 加密简介
===================================

Python 3 的标准库中没多少用来解决加密的，不过却有用于处理哈希的库。在这里我们会对其进行一个简单的介绍，但重点会放在两个第三方的软件包：PyCrypto 和 cryptography 上。我们将学习如何使用这两个库，来加密和解密字符串。

### 哈希

如果需要用到安全哈希算法或是消息摘要算法，那么你可以使用标准库中的 **hashlib** 模块。这个模块包含了符合 FIPS（美国联邦信息处理标准）的安全哈希算法，包括 SHA1，SHA224，SHA256，SHA384，SHA512 以及 RSA 的 MD5 算法。Python 也支持 adler32 以及 crc32 哈希函数，不过它们在 **zlib** 模块中。

哈希的一个最常见的用法是，存储密码的哈希值而非密码本身。当然了，使用的哈希函数需要稳健一点，否则容易被破解。另一个常见的用法是，计算一个文件的哈希值，然后将这个文件和它的哈希值分别发送。接收到文件的人可以计算文件的哈希值，检验是否与接受到的哈希值相符。如果两者相符，就说明文件在传送的过程中未经篡改。

让我们试着创建一个 md5 哈希：

```
>>> import hashlib
>>> md5 = hashlib.md5()
>>> md5.update('Python rocks!')
Traceback (most recent call last):
  File "<pyshell#5>", line 1, in <module>
    md5.update('Python rocks!')
TypeError: Unicode-objects must be encoded before hashing
>>> md5.update(b'Python rocks!')
>>> md5.digest()
b'\x14\x82\xec\x1b#d\xf6N}\x16*+[\x16\xf4w'
```

让我们花点时间一行一行来讲解。首先，我们导入 **hashlib** ，然后创建一个 md5 哈希对象的实例。接着，我们向这个实例中添加一个字符串后，却得到了报错信息。原来，计算 md5 哈希时，需要使用字节形式的字符串而非普通字符串。正确添加字符串后，我们调用它的 **digest** 函数来得到哈希值。如果你想要十六进制的哈希值，也可以用以下方法：

```
>>> md5.hexdigest()
'1482ec1b2364f64e7d162a2b5b16f477'
```

实际上，有一种精简的方法来创建哈希，下面我们看一下用这种方法创建一个 sha1 哈希：

```
>>> sha = hashlib.sha1(b'Hello Python').hexdigest()
>>> sha
'422fbfbc67fe17c86642c5eaaa48f8b670cbed1b'
```

可以看到，我们可以同时创建一个哈希实例并且调用其 digest 函数。然后，我们打印出这个哈希值看一下。这里我使用 sha1 哈希函数作为例子，但它不是特别安全，读者可以随意尝试其他的哈希函数。

### 密钥导出

Python 的标准库对密钥导出支持较弱。实际上，hashlib 函数库提供的唯一方法就是 **pbkdf2_hmac** 函数。它是 PKCS#5 的基于口令的第二个密钥导出函数，并使用 HMAC 作为伪随机函数。因为它支持“加盐（salt）”和迭代操作，你可以使用类似的方法来哈希你的密码。例如，如果你打算使用 SHA-256 加密方法，你将需要至少 16 个字节的“盐”，以及最少 100000 次的迭代操作。

简单来说，“盐”就是随机的数据，被用来加入到哈希的过程中，以加大破解的难度。这基本可以保护你的密码免受字典和彩虹表（rainbow table）的攻击。

让我们看一个简单的例子：

```
>>> import binascii
>>> dk = hashlib.pbkdf2_hmac(hash_name='sha256',
	   	password=b'bad_password34', 
		salt=b'bad_salt', 
		iterations=100000)
>>> binascii.hexlify(dk)
b'6e97bad21f6200f9087036a71e7ca9fa01a59e1d697f7e0284cd7f9b897d7c02'
```

这里，我们用 SHA256 对一个密码进行哈希，使用了一个糟糕的盐，但经过了 100000 次迭代操作。当然，SHA 实际上并不被推荐用来创建密码的密钥。你应该使用类似 **scrypt** 的算法来替代。另一个不错的选择是使用一个叫 **bcrypt** 的第三方库，它是被专门设计出来哈希密码的。

### PyCryptodome

PyCrypto 可能是 Python 中密码学方面最有名的第三方软件包。可惜的是，它的开发工作于 2012 年就已停止。其他人还在继续发布最新版本的 PyCrypto，如果你不介意使用第三方的二进制包，仍可以取得 Python 3.5 的相应版本。比如，我在 Github (https://github.com/sfbahr/PyCrypto-Wheels) 上找到了对应 Python 3.5 的 PyCrypto 二进制包。

幸运的是，有一个该项目的分支 PyCrytodome 取代了 PyCrypto 。为了在 Linux 上安装它，你可以使用以下 pip 命令：

```
pip install pycryptodome
```

在 Windows 系统上安装则稍有不同：

```
pip install pycryptodomex
```

如果你遇到了问题，可能是因为你没有安装正确的依赖包（LCTT 译注：如 python-devel），或者你的 Windows 系统需要一个编译器。如果你需要安装上的帮助或技术支持，可以访问 PyCryptodome 的[网站][1]。

还值得注意的是，PyCryptodome 在 PyCrypto 最后版本的基础上有很多改进。非常值得去访问它们的主页，看看有什么新的特性。

#### 加密字符串

访问了他们的主页之后，我们可以看一些例子。在第一个例子中，我们将使用 DES 算法来加密一个字符串：

```
>>> from Crypto.Cipher import DES
>>> key = 'abcdefgh'
>>> def pad(text):
        while len(text) % 8 != 0:
            text += ' '
        return text
>>> des = DES.new(key, DES.MODE_ECB)
>>> text = 'Python rocks!'
>>> padded_text = pad(text)
>>> encrypted_text = des.encrypt(text)
Traceback (most recent call last):
  File "<pyshell#35>", line 1, in <module>
    encrypted_text = des.encrypt(text)
  File "C:\Programs\Python\Python35-32\lib\site-packages\Crypto\Cipher\blockalgo.py", line 244, in encrypt
    return self._cipher.encrypt(plaintext)
ValueError: Input strings must be a multiple of 8 in length
>>> encrypted_text = des.encrypt(padded_text)
>>> encrypted_text
b'>\xfc\x1f\x16x\x87\xb2\x93\x0e\xfcH\x02\xd59VQ'
```

这段代码稍有些复杂，让我们一点点来看。首先需要注意的是，DES 加密使用的密钥长度为 8 个字节，这也是我们将密钥变量设置为 8 个字符的原因。而我们需要加密的字符串的长度必须是 8 的倍数，所以我们创建了一个名为 **pad** 的函数，来给一个字符串末尾填充空格，直到它的长度是 8 的倍数。然后，我们创建了一个 DES 的实例，以及我们需要加密的文本。我们还创建了一个经过填充处理的文本。我们尝试着对未经填充处理的文本进行加密，啊欧，报了一个 ValueError 错误！我们需要对经过填充处理的文本进行加密，然后得到加密的字符串。（LCTT 译注：encrypt 函数的参数应为 byte 类型字符串，代码为：`encrypted_text = des.encrypt(padded_text.encode('utf-8'))`）

知道了如何加密，还要知道如何解密：

```
>>> des.decrypt(encrypted_text)
b'Python rocks!   '
```

幸运的是，解密非常容易，我们只需要调用 des 对象的 **decrypt** 方法就可以得到我们原来的 byte 类型字符串了。下一个任务是学习如何用 RSA 算法加密和解密一个文件。首先，我们需要创建一些 RSA 密钥。

#### 创建 RSA 密钥

如果你希望使用 RSA 算法加密数据，那么你需要拥有访问 RAS 公钥和私钥的权限，否则你需要生成一组自己的密钥对。在这个例子中，我们将生成自己的密钥对。创建 RSA 密钥非常容易，所以我们将在 Python 解释器中完成。

```
>>> from Crypto.PublicKey import RSA
>>> code = 'nooneknows'
>>> key = RSA.generate(2048)
>>> encrypted_key = key.exportKey(passphrase=code, pkcs=8, 
        protection="scryptAndAES128-CBC")
>>> with open('/path_to_private_key/my_private_rsa_key.bin', 'wb') as f:
        f.write(encrypted_key)
>>> with open('/path_to_public_key/my_rsa_public.pem', 'wb') as f:
        f.write(key.publickey().exportKey())
```

首先我们从 **Crypto.PublicKey** 包中导入 **RSA**，然后创建一个傻傻的密码。接着我们生成 2048 位的 RSA 密钥。现在我们到了关键的部分。为了生成私钥，我们需要调用 RSA 密钥实例的 **exportKey** 方法，然后传入密码，使用的 PKCS 标准，以及加密方案这三个参数。之后，我们把私钥写入磁盘的文件中。

接下来，我们通过 RSA 密钥实例的 **publickey** 方法创建我们的公钥。我们使用方法链调用 publickey 和 exportKey 方法生成公钥，同样将它写入磁盘上的文件。

#### 加密文件

有了私钥和公钥之后，我们就可以加密一些数据，并写入文件了。这里有个比较标准的例子：

```
from Crypto.PublicKey import RSA
from Crypto.Random import get_random_bytes
from Crypto.Cipher import AES, PKCS1_OAEP
 
with open('/path/to/encrypted_data.bin', 'wb') as out_file:
    recipient_key = RSA.import_key(
        open('/path_to_public_key/my_rsa_public.pem').read())
    session_key = get_random_bytes(16)
 
    cipher_rsa = PKCS1_OAEP.new(recipient_key)
    out_file.write(cipher_rsa.encrypt(session_key))
 
    cipher_aes = AES.new(session_key, AES.MODE_EAX)
    data = b'blah blah blah Python blah blah'
    ciphertext, tag = cipher_aes.encrypt_and_digest(data)
 
    out_file.write(cipher_aes.nonce)
    out_file.write(tag)
    out_file.write(ciphertext)
```

代码的前三行导入 PyCryptodome 包。然后我们打开一个文件用于写入数据。接着我们导入公钥赋给一个变量，创建一个 16 字节的会话密钥。在这个例子中，我们将使用混合加密方法，即 PKCS#1 OAEP ，也就是最优非对称加密填充。这允许我们向文件中写入任意长度的数据。接着我们创建 AES 加密，要加密的数据，然后加密数据。我们将得到加密的文本和消息认证码。最后，我们将随机数，消息认证码和加密的文本写入文件。

顺便提一下，随机数通常是真随机或伪随机数，只是用来进行密码通信的。对于 AES 加密，其密钥长度最少是 16 个字节。随意用一个你喜欢的编辑器试着打开这个被加密的文件，你应该只能看到乱码。

现在让我们学习如何解密我们的数据。

```
from Crypto.PublicKey import RSA
from Crypto.Cipher import AES, PKCS1_OAEP
 
code = 'nooneknows'
 
with open('/path/to/encrypted_data.bin', 'rb') as fobj:
    private_key = RSA.import_key(
        open('/path_to_private_key/my_rsa_key.pem').read(),
        passphrase=code)
 
    enc_session_key, nonce, tag, ciphertext = [ fobj.read(x) 
                                                for x in (private_key.size_in_bytes(), 
                                                16, 16, -1) ]
 
    cipher_rsa = PKCS1_OAEP.new(private_key)
    session_key = cipher_rsa.decrypt(enc_session_key)
 
    cipher_aes = AES.new(session_key, AES.MODE_EAX, nonce)
    data = cipher_aes.decrypt_and_verify(ciphertext, tag)
 
print(data)
```

如果你认真看了上一个例子，这段代码应该很容易解析。在这里，我们先以二进制模式读取我们的加密文件，然后导入私钥。注意，当你导入私钥时，需要提供一个密码，否则会出现错误。然后，我们文件中读取数据，首先是加密的会话密钥，然后是 16 字节的随机数和 16 字节的消息认证码，最后是剩下的加密的数据。

接下来我们需要解密出会话密钥，重新创建 AES 密钥，然后解密出数据。

你还可以用 PyCryptodome 库做更多的事。不过我们要接着讨论在 Python 中还可以用什么来满足我们加密解密的需求。

### cryptography 包

**cryptography** 的目标是成为“人类易于使用的密码学包（cryptography for humans）”，就像 **requests** 是“人类易于使用的 HTTP 库（HTTP for Humans）”一样。这个想法使你能够创建简单安全、易于使用的加密方案。如果有需要的话，你也可以使用一些底层的密码学基元，但这也需要你知道更多的细节，否则创建的东西将是不安全的。

如果你使用的 Python 版本是 3.5, 你可以使用 pip 安装，如下：

```
pip install cryptography
```

你会看到 cryptography 包还安装了一些依赖包（LCTT 译注：如 libopenssl-devel）。如果安装都顺利，我们就可以试着加密一些文本了。让我们使用 **Fernet** 对称加密算法，它保证了你加密的任何信息在不知道密码的情况下不能被篡改或读取。Fernet 还通过 **MultiFernet** 支持密钥轮换。下面让我们看一个简单的例子：

```
>>> from cryptography.fernet import Fernet
>>> cipher_key = Fernet.generate_key()
>>> cipher_key
b'APM1JDVgT8WDGOWBgQv6EIhvxl4vDYvUnVdg-Vjdt0o='
>>> cipher = Fernet(cipher_key)
>>> text = b'My super secret message'
>>> encrypted_text = cipher.encrypt(text)
>>> encrypted_text
(b'gAAAAABXOnV86aeUGADA6mTe9xEL92y_m0_TlC9vcqaF6NzHqRKkjEqh4d21PInEP3C9HuiUkS9f'
 b'6bdHsSlRiCNWbSkPuRd_62zfEv3eaZjJvLAm3omnya8=')
>>> decrypted_text = cipher.decrypt(encrypted_text)
>>> decrypted_text
b'My super secret message'
```

首先我们需要导入 Fernet，然后生成一个密钥。我们输出密钥看看它是什么样儿。如你所见，它是一个随机的字节串。如果你愿意的话，可以试着多运行 **generate_key** 方法几次，生成的密钥会是不同的。然后我们使用这个密钥生成 Fernet 密码实例。

现在我们有了用来加密和解密消息的密码。下一步是创建一个需要加密的消息，然后使用 **encrypt** 方法对它加密。我打印出加密的文本，然后你可以看到你再也读不懂它了。为了解密出我们的秘密消息，我们只需调用 **decrypt** 方法，并传入加密的文本作为参数。结果就是我们得到了消息字节串形式的纯文本。


### 小结

这一章仅仅浅显地介绍了 PyCryptodome 和 cryptography 这两个包的使用。不过这也确实给了你一个关于如何加密解密字符串和文件的简述。请务必阅读文档，做做实验，看看还能做些什么！

---

### 相关阅读

[Github][2] 上 Python 3 的 PyCrypto Wheels

PyCryptodome 的 [文档][3]

Python’s 加密 [服务][4]

Cryptography 包的 [官网][5]

------------------------------------------------------------------------------

via: http://www.blog.pythonlibrary.org/2016/05/18/python-3-an-intro-to-encryption/

作者：[Mike][a]
译者：[Cathon](https://github.com/Cathon)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.blog.pythonlibrary.org/author/mld/
[1]: http://pycryptodome.readthedocs.io/en/latest/
[2]: https://github.com/sfbahr/PyCrypto-Wheels
[3]: http://pycryptodome.readthedocs.io/en/latest/src/introduction.html
[4]: https://docs.python.org/3/library/crypto.html
[5]: https://cryptography.io/en/latest/
