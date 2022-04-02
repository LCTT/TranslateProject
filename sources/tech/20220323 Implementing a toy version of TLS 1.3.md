[#]: subject: "Implementing a toy version of TLS 1.3"
[#]: via: "https://jvns.ca/blog/2022/03/23/a-toy-version-of-tls/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Implementing a toy version of TLS 1.3
======

Hello! Recently I’ve been thinking about how I find it fun to learn computer networking by implementing working versions of real network protocols.

And it made me wonder – I’ve implemented toy versions of [traceroute][1], [TCP][2] and [DNS][3]. What about TLS? Could I implement a toy version of that to learn more about how it works?

I asked on Twitter if this would be hard, got [some encouragement and pointers for where to start][4], so I decided to go for it.

This was really fun and I learned a little more about how involved real cryptography is – thanks to [cryptopals][5], I already 100% believed that I should not invent my own crypto implementations, and seeing how the crypto in TLS 1.3 works gave me even more of an appreciation for why I shouldn’t :)

As a warning: I am really not a cryptography person, I will probably say some incorrect things about cryptography in this post and I absolutely do not know the history of past TLS vulnerabilities that informed TLS 1.3’s design.

All of that said, let’s go implement some cryptography! All of my hacky code is [on github][6]. I decided to use Go because I heard that Go has good crypto libraries.

### the simplifications

I only wanted to work on this for a few days at most, so I needed to make some pretty dramatic simplifications to make it possible to get it done quickly.

I decided my goal was going to be to download this blog’s homepage with TLS. So I don’t need to implement a fully general TLS implementation, I just need to successfully connect to one website.

Specifically, this means that:

  * I only support one cipher suite
  * I don’t verify the server’s certificate at all, I just ignore it
  * my parsing and message formatting can be extremely janky and fragile because I only need to be able to talk to one specific TLS implementation (and believe me, they are)



### an amazing TLS resource: tls13.ulfheim.net

Luckily, before starting this I remembered vaguely that I’d seen a website that explained every single byte in a TLS 1.3 connection, with detailed code examples to reproduce every part. Some googling revealed that it was [The New Illustrated TLS Connection][7].

I can’t stress enough how helpful this was, I looked at probably more than a hundred times and I only looked at the TLS 1.3 RFC for a few small things.

### some cryptography basics

Before I started working on this, my understanding of TLS was:

  1. at the beginning there’s some sort of Diffie-Hellman key exchange
  2. you use the key exchange to somehow (how???) get an AES symmetric key and encrypt the rest of the connection with AES



This was sort of right, but it turns out it’s more complicated than that.

Okay, let’s get into my hacky toy TLS implementation. It hopefully goes without saying that you should absolutely not use this code for anything.

### step 1: say hello

First we need to send a “Client Hello” message. For my purposes this has just 4 pieces of information in it:

  1. A randomly generated public key
  2. 32 bytes of random data (the “Client Random”)
  3. The domain name I want to connect to (`jvns.ca`)
  4. The cipher suites/signature algorithms we want to use (which I just copied from tls.ulfheim.net). This negotiation process is pretty important in general but I’m ignoring it because I only support one signature algorithm / cipher suite.



The most interesting part of this to me was part 1 – how do I generate the public key?

I was confused about this for a while but it ended up being just 2 lines of code.

```

    privateKey := random(32)
    publicKey, err := curve25519.X25519(privateKey, curve25519.Basepoint)

```

You can see the rest of the code to generate the [client hello message here][8] but it’s very boring, it’s just a lot of bit fiddling.

### elliptic curve cryptography is cool

I am not going to give an explanation of elliptic curve cryptography here, but I just want to say how point out how cool it is that you can:

  * generate a random 32-byte string as a private key
  * “multiply” the private key by the curve’s base point to get the public key (this is elliptic curve “multiplication”, where `n * P` means “add P to itself n times”)
  * that’s it!!



I am not going to say more about elliptic curve cryptography here but I love how simple this is to use – it seems a lot straightforward than RSA where your private keys have to be prime numbers.

I don’t know if “you can use any 32-byte string as a private key” is true for all elliptic curves or just for this specific elliptic curve ([Curve25519][9]).

### step 2: parse the server hello

Next the server says hello. This is very boring, basically we just need to parse it to get the server’s public key which is 32 bytes. [Here’s the code though][10].

### step 3: calculate the keys to encrypt the handshake

Now that we have the server’s public key and we’ve sent the server our public key, we can start to calculate the keys we’re going to use to actually encrypt data.

I was surprised to learn that there are at least 4 different symmetric keys involved in TLS:

  * client handshake key/iv (for the data the client sends in the handshake)
  * server handshake key/iv (for the data the server sends in the handshaek)
  * client application key/iv (for the rest of the data the client sends)
  * server application key/iv (for the rest of the data the server sends)
  * I think also another key for session resumption, but I didn’t implement that



We start out by combining the server’s public key and our private key to get a shared secret. This is called “elliptic curve diffie hellman” or ECDH and it’s pretty simple: “multiply” the server’s private key by our public key:

```

    sharedSecret, err := curve25519.X25519(session.Keys.Private, session.ServerHello.PublicKey)

```

This gives us a 32-byte secret key that both the client and the server has. Yay!

But we need 96 bytes (16 + 12) * 4 of keys in total. That’s more than 32 bytes!

### time for key derivation

Apparently the way you turn a small key into more keys is called “key derivation”, and TLS 1.3 uses an algorithm called “HKDF” to do this. I honestly do not understand this but here is what my code to do it looks like.

It seems to involve alternately calling `hkdf.Expand` and `hkdf.Extract` over and over again a bunch of times.

```

    func (session *Session) MakeHandshakeKeys() {
        zeros := make([]byte, 32)
        psk := make([]byte, 32)
        // ok so far
        if err != nil {
            panic(err)
        }
        earlySecret := hkdf.Extract(sha256.New, psk, zeros) // TODO: psk might be wrong
        derivedSecret := deriveSecret(earlySecret, "derived", []byte{})
        session.Keys.HandshakeSecret = hkdf.Extract(sha256.New, sharedSecret, derivedSecret)
        handshakeMessages := concatenate(session.Messages.ClientHello.Contents(), session.Messages.ServerHello.Contents())

        cHsSecret := deriveSecret(session.Keys.HandshakeSecret, "c hs traffic", handshakeMessages)
        session.Keys.ClientHandshakeSecret = cHsSecret
        session.Keys.ClientHandshakeKey = hkdfExpandLabel(cHsSecret, "key", []byte{}, 16)
        session.Keys.ClientHandshakeIV = hkdfExpandLabel(cHsSecret, "iv", []byte{}, 12)

        sHsSecret := deriveSecret(session.Keys.HandshakeSecret, "s hs traffic", handshakeMessages)
        session.Keys.ServerHandshakeKey = hkdfExpandLabel(sHsSecret, "key", []byte{}, 16)
        session.Keys.ServerHandshakeIV = hkdfExpandLabel(sHsSecret, "iv", []byte{}, 12)
    }

```

This was pretty annoying to get working because I kept passing the wrong arguments to things. The only reason I managed it was because <https://tls13.ulfheim.net> provided a bunch of example inputs and outputs and example code so I was able to write some unit tests and check my code against the site’s example implementation.

Anyway, eventually I got all my keys calculated and it was time to start decrypting!

### an aside on IVs

For each key there’s also an “IV” which stands for “initialization vector”. The idea seems to be to use a different initialization vector for every message we encrypt/decrypt, for More Security ™.

In this implementation the way we get a different IV for each message is by xoring the IV with the number of messages sent/received so far.

### step 4: write some decryption code

Now that we have all these keys and IVs, we can write a `decrypt` function.

I thought that TLS just used AES, but apparently it uses something called “authentication encryption” on top of AES that I hadn’t heard of before.

The wikipedia article explanation of authenticated encryption is actually pretty clear:

> … authenticated encryption can provide security against **chosen ciphertext** attack. In these attacks, an adversary attempts to gain an advantage against a cryptosystem (e.g., information about the secret decryption key) by submitting carefully chosen ciphertexts to some “decryption oracle” and analyzing the decrypted results. Authenticated encryption schemes can recognize improperly-constructed ciphertexts and refuse to decrypt them. This, in turn, prevents the attacker from requesting the decryption of any ciphertext unless it was generated correctly using the encryption algorithm

This makes sense to me because I did some of the cryptopals challenges and there’s an attack a bit like this in [cryptopals set 2][11] (I don’t know if it’s the exact same thing).

Anyway, here’s some code that uses authenticated encryption the way the TLS 1.3 spec says it should. I think GCM is an authenticated encryption algorithm.

```

    func decrypt(key, iv, wrapper []byte) []byte {

        block, err := aes.NewCipher(key)
        if err != nil {
            panic(err.Error())
        }

        aesgcm, err := cipher.NewGCM(block)
        if err != nil {
            panic(err.Error())
        }

        additional := wrapper[:5]
        ciphertext := wrapper[5:]

        plaintext, err := aesgcm.Open(nil, iv, ciphertext, additional)
        if err != nil {
            panic(err.Error())
        }
        return plaintext
    }

```

### step 5: decrypt the server handshake

Next the server sends some more handshake data. This contains the certificate and some other stuff.

Here’s my code for decrypting the handshake. Basically it just reads the encrypted data from the network, decrypts it, and saves it.

```

    record := readRecord(session.Conn)
    if record.Type() != 0x17 {
        panic("expected wrapper")
    }
    session.Messages.ServerHandshake = decrypt(session.Keys.ServerHandshakeKey, session.Keys.ServerHandshakeIV, record)

```

You might notice that we don’t actually _parse_ this data at all – that’s because we don’t need the contents, since we’re not verifying the server’s certificate.

I was surprised that you don’t technically need to look at the server’s certificate at all to make a TLS connection (though obviously you should verify it!). I thought you would need to at least parse it to get a key out of it or something.

We do need to be able to hash the handshake for the next step though, so we have to store it.

### step 6: derive more keys

We use a hash of the SHA256 handshake data we just got from the server to generate even more symmetric keys. This is almost the last step!

This is almost exactly the same as the key derivation code from before, but I’m including it because I was surprised by how much work needed to be done to generate all these keys.

```

    func (session *Session) MakeApplicationKeys() {
        handshakeMessages := concatenate(
            session.Messages.ClientHello.Contents(),
            session.Messages.ServerHello.Contents(),
            session.Messages.ServerHandshake.Contents())

        zeros := make([]byte, 32)
        derivedSecret := deriveSecret(session.Keys.HandshakeSecret, "derived", []byte{})
        masterSecret := hkdf.Extract(sha256.New, zeros, derivedSecret)

        cApSecret := deriveSecret(masterSecret, "c ap traffic", handshakeMessages)
        session.Keys.ClientApplicationKey = hkdfExpandLabel(cApSecret, "key", []byte{}, 16)
        session.Keys.ClientApplicationIV = hkdfExpandLabel(cApSecret, "iv", []byte{}, 12)

        sApSecret := deriveSecret(masterSecret, "s ap traffic", handshakeMessages)
        session.Keys.ServerApplicationKey = hkdfExpandLabel(sApSecret, "key", []byte{}, 16)
        session.Keys.ServerApplicationIV = hkdfExpandLabel(sApSecret, "iv", []byte{}, 12)
    }

```

### step 7: finish the handshake

Next we need to send a “handshake finished” message to the server to verify that everything is done. That code is [here][12].

And now we’re done the handshake! That was the hard part, sending and receiving the data is relatively easy.

### step 8: make a HTTP request

I wrote a `SendData` function that encrypts and sends data using our keys. This time we’re using the “application” keys and not the handshake keys. This made making a HTTP request pretty simple:

```

    req := fmt.Sprintf("GET / HTTP/1.1\r\nHost: %s\r\n\r\n", domain)
    session.SendData([]byte(req))

```

### step 9: we can actually decrypt the response!!!

Now comes the moment I’d been waiting for — actually decrypting the response from the server!!! But here I needed to learn something else about TLS.

### TLS data comes in blocks

I previously thought that once you established the connection, encrypted TLS data was just a stream. But that’s not how it works – instead, it’s transmitted in blocks. Like, you’ll get a chunk of ~1400 bytes to decrypt, and then another chunk, and then another chunk.

I’m not sure why the blocks have the size they do (maybe it’s so that each one will fit inside a TCP packet ???), but in theory I think they could be up to 65535 bytes, since their size field is 2 bytes. The blocks I got were all 1386 bytes each.

Every time we get a block, we have to:

  * calculate a new IV as `old_iv xor num_records_received`
  * decrypt it using the key and the new IV
  * increment the count of records received



Here’s what the `ReceiveData()` function I wrote looks like.

The most interesting part of this is the `iv[11] ^= session.RecordsReceived` – that’s the part that adjusts the IV for each block.

```

    func (session *Session) ReceiveData() []byte {
        record := readRecord(session.Conn)
        iv := make([]byte, 12)
        copy(iv, session.Keys.ServerApplicationIV)
        iv[11] ^= session.RecordsReceived
        plaintext := decrypt(session.Keys.ServerApplicationKey, iv, record)
        session.RecordsReceived += 1
        return plaintext
    }

```

This `iv[11]` thing assumes that there are less than 255 blocks which obviously is not true in general in TLS, but I was lazy and to download my blog’s homepage I only needed 82 blocks.

We actually have to do this when we send data too, but I didn’t implement it because we only sent 1 packet.

### problem: getting the whole block of tLS data

I ran into one problem with TCP where sometimes I’d try to read a block of TLS data (~1386 bytes), but I wouldn’t get the whole thing. I guess the TLS blocks can be split up across multiple TCP packets.

I fixed this in a really dumb way, by just polling the TCP connection in a loop until it gave me the data I wanted. Here’s my code to do that:

```

    func read(length int, reader io.Reader) []byte {
        var buf []byte
        for len(buf) != length {
            buf = append(buf, readUpto(length-len(buf), reader)...)
        }
        return buf
    }

```

I assume a real TLS implementation would use a thread pool or coroutines or something to manage this.

### step 10: knowing when we’re done

When the HTTP response is done, we get these bytes: `[]byte{48, 13, 10, 13, 10, 23}`. I don’t know what this is supposed to mean exactly but it seems to signal the end of the connection.

So here’s the code to receive the HTTP response. Basically we just loop until we see those bytes, then we stop.

```

    func (session *Session) ReceiveHTTPResponse() []byte {
        var response []byte
        for {
            pt := session.ReceiveData()
            if string(pt) == string([]byte{48, 13, 10, 13, 10, 23}) {
                break
            }
            response = append(response, pt...)
        }
        return response
    }

```

### that’s it!

Finally, I ran the program and I downloaded my blog’s homepage! It worked! Here’s what the results look like:

```

    $ go build; ./tiny-tls
    HTTP/1.1 200 OK
    Date: Wed, 23 Mar 2022 19:37:47 GMT
    Content-Type: text/html
    Transfer-Encoding: chunked
    Connection: keep-alive
    ... lots more headers and HTML follow...

```

Okay, the results are kind of anticlimactic, it’s just the same as what you’d see if you ran `curl -i https://jvns.ca` except with no formatting. But I was extremely excited when I saw it.

### the block thing is kind of weird

I find it a bit weird that TLS data is sent/received in blocks. I assume it makes sense from a cryptography perspective (because you want to change your IVs frequently or something?).

But from a networking perspective it feels a bit strange. Like, TCP is built on top of a packet system, and then with TLS you sort of have another packet system on top of TCP.

Maybe one of the motivations for QUIC is to design a network protocol which has TLS as more of a first-class citizen, so you don’t have this weird packet/stream/packet thing?

### some things I learned

This was really fun! I learned that

  * elliptic curve diffie-hellman is very cool, and at least with Curve25519 you can use literally any 32-byte string as a private key
  * there are a LOT of different symmetric keys involved in TLS and the key derivation process is pretty complicated
  * TLS uses AES with some extra “authenticated encryption” algorithms on top
  * TLS data is sent/received as a bunch of blocks, not as a stream



My code truly is terrible, it can connect to my site (`jvns.ca`) and I think literally no other sites.

I won’t pretend to understand all the reasons TLS is designed this way, but it was a fun way to spend a couple of days, I feel a little more informed, and I think it’ll be easier for me to understand things I read about TLS in the future.

### a plug for cryptopals

If you want to learn about cryptography and you haven’t tried the [cryptopals][5] challenges, I really recommend them – you get to implement a lot of attacks on crypto systems and it’s very fun.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/03/23/a-toy-version-of-tls/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/blog/2013/10/31/day-20-scapy-and-traceroute/
[2]: https://jvns.ca/blog/2014/08/12/what-happens-if-you-write-a-tcp-stack-in-python/
[3]: https://jvns.ca/blog/2022/02/01/a-dns-resolver-in-80-lines-of-go/
[4]: https://twitter.com/Lukasaoz/status/1505593360521777157
[5]: https://cryptopals.com/
[6]: https://github.com/jvns/tiny-tls/
[7]: https://tls13.ulfheim.net
[8]: https://github.com/jvns/tiny-tls/blob/cb5a3665c3487ad1f1d5f917ad069c93dd44967e/format.go#L41
[9]: https://en.wikipedia.org/wiki/Curve25519
[10]: https://github.com/jvns/tiny-tls/blob/cb5a3665c3487ad1f1d5f917ad069c93dd44967e/format.go#L98-L131
[11]: https://cryptopals.com/sets/2/challenges/14
[12]: https://github.com/jvns/tiny-tls/blob/cb5a3665c3487ad1f1d5f917ad069c93dd44967e/crypto.go#L177-L183
