[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with Python's cryptography library)
[#]: via: (https://opensource.com/article/19/4/cryptography-python)
[#]: author: (Moshe Zadka  https://opensource.com/users/moshez)

Getting started with Python's cryptography library
======
Encrypt your data and keep it safe from attackers.
![lock on world map][1]

The first rule of cryptography club is: never _invent_ a cryptography system yourself. The second rule of cryptography club is: never _implement_ a cryptography system yourself: many real-world holes are found in the _implementation_ phase of a cryptosystem as well as in the design.

One useful library for cryptographic primitives in Python is called simply [**cryptography**][2]. It has both "secure" primitives as well as a "hazmat" layer. The "hazmat" layer requires care and knowledge of cryptography and it is easy to implement security holes using it. We will not cover anything in the "hazmat" layer in this introductory article!

The most useful high-level secure primitive in **cryptography** is the Fernet implementation. Fernet is a standard for encrypting buffers in a way that follows best-practices cryptography. It is not suitable for very big files—anything in the gigabyte range and above—since it requires you to load the whole buffer that you want to encrypt or decrypt into memory at once.

Fernet supports _symmetric_ , or _secret key_ , cryptography: the same key is used for encryption and decryption, and therefore must be kept safe.

Generating a key is easy:


```
>>> k = fernet.Fernet.generate_key()
>>> type(k)
<class 'bytes'>
```

Those bytes can be written to a file with appropriate permissions, ideally on a secure machine.

Once you have key material, encrypting is easy as well:


```
>>> frn = fernet.Fernet(k)
>>> encrypted = frn.encrypt(b"x marks the spot")
>>> encrypted[:10]
b'gAAAAABb1'
```

You will get slightly different values if you encrypt on your machine. Not only because (I hope) you generated a different key from me, but because Fernet concatenates the value to be encrypted with some randomly generated buffer. This is one of the "best practices" I alluded to earlier: it will prevent an adversary from being able to tell which encrypted values are identical, which is sometimes an important part of an attack.

Decryption is equally simple:


```
>>> frn = fernet.Fernet(k)
>>> frn.decrypt(encrypted)
b'x marks the spot'
```

Note that this only encrypts and decrypts _byte strings_. In order to encrypt and decrypt _text strings_ , they will need to be encoded and decoded, usually with [UTF-8][3].

One of the most interesting advances in cryptography in the mid-20th century was _public key_ cryptography. It allows the encryption key to be published while the _decryption key_ is kept secret. It can, for example, be used to store API keys to be used by a server: the server is the only thing with access to the decryption key, but anyone can add to the store by using the public encryption key.

While **cryptography** does not have any public key cryptographic _secure_ primitives, the [**PyNaCl**][4] library does. PyNaCl wraps and offers some nice ways to use the [**NaCl**][5] encryption system invented by Daniel J. Bernstein.

NaCl always _encrypts_ and _signs_ or _decrypts_ and _verifies signatures_ simultaneously. This is a way to prevent malleability-based attacks, where an adversary modifies the encrypted value.

Encryption is done with a public key, while signing is done with a secret key:


```
>>> from nacl.public import PrivateKey, PublicKey, Box
>>> source = PrivateKey.generate()
>>> with open("target.pubkey", "rb") as fpin:
... target_public_key = PublicKey(fpin.read())
>>> enc_box = Box(source, target_public_key)
>>> result = enc_box.encrypt(b"x marks the spot")
>>> result[:4]
b'\xe2\x1c0\xa4'
```

Decryption reverses the roles: it needs the private key for decryption and the public key to verify the signature:


```
>>> from nacl.public import PrivateKey, PublicKey, Box
>>> with open("source.pubkey", "rb") as fpin:
... source_public_key = PublicKey(fpin.read())
>>> with open("target.private_key", "rb") as fpin:
... target = PrivateKey(fpin.read())
>>> dec_box = Box(target, source_public_key)
>>> dec_box.decrypt(result)
b'x marks the spot'
```

The [**PocketProtector**][6] library builds on top of PyNaCl and contains a complete secrets management solution.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/cryptography-python

作者：[Moshe Zadka (Community Moderator)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-cloud-safe.png?itok=yj2TFPzq (lock on world map)
[2]: https://cryptography.io/en/latest/
[3]: https://en.wikipedia.org/wiki/UTF-8
[4]: https://pynacl.readthedocs.io/en/stable/
[5]: https://nacl.cr.yp.to/
[6]: https://github.com/SimpleLegal/pocket_protector/blob/master/USER_GUIDE.md
