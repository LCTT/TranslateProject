[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The bits and bytes of PKI)
[#]: via: (https://opensource.com/article/19/6/bits-and-bytes-pki)
[#]: author: (Alex Wood https://opensource.com/users/awood)

The bits and bytes of PKI
======
Take a look under the public key infrastructure's hood to get a better
understanding of its format.
![Computer keyboard typing][1]

In two previous articles— _[An introduction to cryptography and public key infrastructure][2]_ and _[How do private keys work in PKI and cryptography?][3]_ —I discussed cryptography and public key infrastructure (PKI) in a general way. I talked about how digital bundles called _certificates_ store public keys and identifying information. These bundles contain a lot of complexity, and it's useful to have a basic understanding of the format for when you need to look under the hood.

### Abstract art

Keys, certificate signing requests, certificates, and other PKI artifacts define themselves in a data description language called [Abstract Syntax Notation One][4] (ASN.1). ASN.1 defines a series of simple data types (integers, strings, dates, etc.) along with some structured types (sequences, sets). By using those types as building blocks, we can create surprisingly complex data formats.

ASN.1 contains plenty of pitfalls for the unwary, however. For example, it has two different ways of representing dates: GeneralizedTime ([ISO 8601][5] format) and UTCTime (which uses a two-digit year). Strings introduce even more confusion. We have IA5String for ASCII strings and UTF8String for Unicode strings. ASN.1 also defines several other string types, from the exotic [T61String][6] and [TeletexString][7] to the more innocuous sounding—but probably not what you wanted—PrintableString (only a small subset of ASCII) and UniversalString (encoded in [UTF-32][8]). If you're writing or reading ASN.1 data, I recommend referencing the [specification][9].

ASN.1 has another data type worth special mention: the object identifier (OID). OIDs are a series of integers. Commonly they are shown with periods delimiting them. Each integer represents a node in what is basically a "tree of things." For example, [1.3.6.1.4.1.2312][10] is the OID for my employer, Red Hat, where "1" is the node for the International Organization for Standardization (ISO), "3" is for ISO-identified organizations, "6" is for the US Department of Defense (which, for historical reasons, is the parent to the next node), "1" is for the internet, "4" is for private organizations, "1" is for enterprises, and finally "2312," which is Red Hat's own.

More commonly, OIDs are regularly used to identify specific algorithms in PKI objects. If you have a digital signature, it's not much use if you don't know what type of signature it is. The signature algorithm "sha256WithRSAEncryption" has the OID "1.2.840.113549.1.1.11," for example.

### ASN.1 at work

Suppose we own a factory that produces flying brooms, and we need to store some data about every broom. Our brooms have a model name, a serial number, and a series of inspections that have been made to ensure flight-worthiness. We could store this information using ASN.1 like so:


```
BroomInfo ::= SEQUENCE {
model UTF8String,
serialNumber INTEGER,
inspections SEQUENCE OF InspectionInfo
}

InspectionInfo ::= SEQUENCE {
inspectorName UTF8String,
inspectionDate GeneralizedTime
}
```

The example above defines the model name as a UTF8-encoded string, the serial number as an integer, and our inspections as a series of InspectionInfo items. Then we see that each InspectionInfo item comprises two pieces of data: the inspector's name and the time of the inspection.

An actual instance of BroomInfo data would look something like this in ASN.1's value assignment syntax:


```
broom BroomInfo ::= {
model "Nimbus 2000",
serialNumber 1066,
inspections {
{
inspectorName "Harry",
inspectionDate "201901011200Z"
}
{
inspectorName "Hagrid",
inspectionDate "201902011200Z"
}
}
}
```

Don't worry too much about the particulars of the syntax; for the average developer, having a basic grasp of how the pieces fit together is sufficient.

Now let's look at a real example from [RFC 8017][11] that I have abbreviated somewhat for clarity:


```
RSAPrivateKey ::= SEQUENCE {
version Version,
modulus INTEGER, -- n
publicExponent INTEGER, -- e
privateExponent INTEGER, -- d
prime1 INTEGER, -- p
prime2 INTEGER, -- q
exponent1 INTEGER, -- d mod (p-1)
exponent2 INTEGER, -- d mod (q-1)
coefficient INTEGER, -- (inverse of q) mod p
otherPrimeInfos OtherPrimeInfos OPTIONAL
}

Version ::= INTEGER { two-prime(0), multi(1) }
(CONSTRAINED BY
{-- version must be multi if otherPrimeInfos present --})

OtherPrimeInfos ::= SEQUENCE SIZE(1..MAX) OF OtherPrimeInfo

OtherPrimeInfo ::= SEQUENCE {
prime INTEGER, -- ri
exponent INTEGER, -- di
coefficient INTEGER -- ti
}
```

The ASN.1 above defines the PKCS #1 format used to store RSA keys. Looking at this, we can see the RSAPrivateKey sequence starts with a version type (either 0 or 1) followed by a bunch of integers and then an optional type called OtherPrimeInfos. The OtherPrimeInfos sequence contains one or more pieces of OtherPrimeInfo. And each OtherPrimeInfo is just a sequence of integers.

Let's look at an actual instance by asking OpenSSL to generate an RSA key and then pipe it into [asn1parse][12], which will print it out in a more human-friendly format. (By the way, the **genrsa** command I'm using here has been superseded by **genpkey** ; we'll see why a little later.)


```
% openssl genrsa 4096 2> /dev/null | openssl asn1parse
0:d=0 hl=4 l=2344 cons: SEQUENCE
4:d=1 hl=2 l= 1 prim: INTEGER :00
7:d=1 hl=4 l= 513 prim: INTEGER :B80B0C2443...
524:d=1 hl=2 l= 3 prim: INTEGER :010001
529:d=1 hl=4 l= 512 prim: INTEGER :59C609C626...
1045:d=1 hl=4 l= 257 prim: INTEGER :E8FC43002D...
1306:d=1 hl=4 l= 257 prim: INTEGER :CA39222DD2...
1567:d=1 hl=4 l= 256 prim: INTEGER :25F6CD181F...
1827:d=1 hl=4 l= 256 prim: INTEGER :38CCE374CB...
2087:d=1 hl=4 l= 257 prim: INTEGER :C80430E810...
```

Recall that RSA uses a modulus, _n_ ; a public exponent, _e_ ; and a private exponent, _d_. Now let's look at the sequence. First, we see the version set to 0 for a two-prime RSA key (what **genrsa** generates), an integer for the modulus, _n_ , and then 0x010001 for the public exponent, _e_. If we convert to decimal, we'll see our public exponent is 65537, a number [commonly][13] used as an RSA public exponent. Following the public exponent, we see the integer for the private exponent, _e_ , and then some other integers that are used to speed up decryption and signing. Explaining how this optimization works is beyond the scope of this article, but if you like math, there's a [good video on the subject][14].

What about that other stuff on the left side of the output? What does "h=4" and "l=513" mean? We'll cover that shortly.

### DERangement

We've seen the "abstract" part of Abstract Syntax Notation One, but how does this data get encoded and stored? For that, we turn to a binary format called Distinguished Encoding Rules (DER) defined in the [X.690][15] specification. DER is a stricter version of its parent, Basic Encoding Rules (BER), in that for any given data, there is only one way to encode it. If we're going to be digitally signing data, it makes things a lot easier if there is only one possible encoding that needs to be signed instead of dozens of functionally equivalent representations.

DER uses a [tag-length-value][16] (TLV) structure. The encoding of a piece of data begins with an identifier octet defining the data's type. ("Octet" is used rather than "byte" since the standard is very old and some early architectures didn't use 8 bits for a byte.) Next are the octets that encode the length of the data, and finally, there is the data. The data can be another TLV series. The left side of the **asn1parse** output makes a little more sense now. The first number indicates the absolute offset from the beginning. The "d=" tells us the depth of that item in the structure. The first line is a sequence, which we descend into on the next line (the depth _d_ goes from 0 to 1) whereupon **asn1parse** begins enumerating all the elements in that sequence. The "hl=" is the header length (the sum of the identifier and length octets), and the "l=" tells us the length of that particular piece of data.

How is header length determined? It's the sum of the identifier byte and the bytes encoding the length. In our example, the top sequence is 2344 octets long. If it were less than 128 octets, the length would be encoded in a single octet in the "short form": bit 8 would be a zero and bits 7 to 1 would hold the length value ( **2 7-1=127**). A value of 2344 needs more space, so the "long" form is used. The first octet has bit 8 set to one, and bits 7 to 1 contain the length of the length. In our case, a value of 2344 can be encoded in two octets (0x0928). Combined with the first "length of the length" octet, we have three octets total. Add the one identifier octet, and that gives us our total header length of four.

As a side exercise, let's consider the largest value we could possibly encode. We've seen that we have up to 127 octets to encode a length. At 8 bits per octet, we have a total of 1008 bits to use, so we can hold a number equal to **2 1008-1**. That would equate to a content length of **2.743062*10 279** yottabytes, staggeringly more than the estimated **10 80** atoms in the observable universe. If you're interested in all the details, I recommend reading "[A Layman's Guide to a Subset of ASN.1, BER, and DER][17]."

What about "cons" and "prim"? Those indicate whether the value is encoded with "constructed" or "primitive" encoding. Primitive encoding is used for simple types like "INTEGER" or "BOOLEAN," while constructed encoding is used for structured types like "SEQUENCE" or "SET." The actual difference between the two encoding methods is whether bit 6 in the identifier octet is a zero or one. If it's a one, the parser knows that the content octets are also DER-encoded and it can descend.

### PEM pals

While useful in a lot of cases, a binary format won't pass muster if we need to display the data as text. Before the [MIME][18] standard existed, attachment support was spotty. Commonly, if you wanted to attach data, you put it in the body of the email, and since SMTP only supported ASCII, that meant converting your binary data (like the DER of your public key, for example) into ASCII characters.

Thus, the PEM format emerged. PEM stands for "Privacy-Enhanced Email" and was an early standard for transmitting and storing PKI data. The standard never caught on, but the format it defined for storage did. PEM-encoded objects are just DER objects that are [base64][19]-encoded and wrapped at 64 characters per line. To describe the type of object, a header and footer surround the base64 string. You'll see **\-----BEGIN CERTIFICATE-----** or **\-----BEGIN PRIVATE KEY-----** , for example.

Often you'll see files with the ".pem" extension. I don't find this suffix useful. The file could contain a certificate, a key, a certificate signing request, or several other possibilities. Imagine going to a sushi restaurant and seeing a menu that described every item as "fish and rice"! Instead, I prefer more informative extensions like ".crt", ".key", and ".csr".

### The PKCS zoo

Earlier, I showed an example of a PKCS #1-formatted RSA key. As you might expect, formats for storing certificates and signing requests also exist in various IETF RFCs. For example, PKCS #8 can be used to store private keys for many different algorithms (including RSA!). Here's some of the ASN.1 from [RFC 5208][20] for PKCS #8. (RFC 5208 has been obsoleted by RFC 5958, but I feel that the ASN.1 in RFC 5208 is easier to understand.)


```
PrivateKeyInfo ::= SEQUENCE {
version Version,
privateKeyAlgorithm PrivateKeyAlgorithmIdentifier,
privateKey PrivateKey,
attributes [0] IMPLICIT Attributes OPTIONAL }

Version ::= INTEGER

PrivateKeyAlgorithmIdentifier ::= AlgorithmIdentifier

PrivateKey ::= OCTET STRING

Attributes ::= SET OF Attribute
```

If you store your RSA private key in a PKCS #8, the PrivateKey element will actually be a DER-encoded PKCS #1! Let's prove it. Remember earlier when I used **genrsa** to generate a PKCS #1? OpenSSL can generate a PKCS #8 with the **genpkey** command, and you can specify RSA as the algorithm to use.


```
% openssl genpkey -algorithm RSA | openssl asn1parse
0:d=0 hl=4 l= 629 cons: SEQUENCE
4:d=1 hl=2 l= 1 prim: INTEGER :00
7:d=1 hl=2 l= 13 cons: SEQUENCE
9:d=2 hl=2 l= 9 prim: OBJECT :rsaEncryption
20:d=2 hl=2 l= 0 prim: NULL
22:d=1 hl=4 l= 607 prim: OCTET STRING [HEX DUMP]:3082025B...
```

You may have spotted the "OBJECT" in the output and guessed that was related to OIDs. You'd be correct. The OID "1.2.840.113549.1.1.1" is assigned to RSA encryption. OpenSSL has a built-in list of common OIDs and translates them into a human-readable form for you.


```
% openssl genpkey -algorithm RSA | openssl asn1parse -strparse 22
0:d=0 hl=4 l= 604 cons: SEQUENCE
4:d=1 hl=2 l= 1 prim: INTEGER :00
7:d=1 hl=3 l= 129 prim: INTEGER :CA6720E706...
139:d=1 hl=2 l= 3 prim: INTEGER :010001
144:d=1 hl=3 l= 128 prim: INTEGER :05D0BEBE44...
275:d=1 hl=2 l= 65 prim: INTEGER :F215DC6B77...
342:d=1 hl=2 l= 65 prim: INTEGER :D6095CED7E...
409:d=1 hl=2 l= 64 prim: INTEGER :402C7562F3...
475:d=1 hl=2 l= 64 prim: INTEGER :06D0097B2D...
541:d=1 hl=2 l= 65 prim: INTEGER :AB266E8E51...
```

In the second command, I've told **asn1parse** via the **-strparse** argument to move to octet 22 and begin parsing the content's octets there as an ASN.1 object. We can clearly see that the PKCS #8's PrivateKey looks just like the PKCS #1 that we examined earlier.

You should favor using the **genpkey** command. PKCS #8 has some features that PKCS #1 does not: PKCS #8 can store private keys for multiple different algorithms (PKCS #1 is RSA-specific), and it provides a mechanism to encrypt the private key using a passphrase and a symmetric cipher.

Encrypted PKCS #8 objects use a different ASN.1 syntax that I'm not going to dive into, but let's take a look at an actual example and see if anything stands out. Encrypting a private key with **genpkey** requires that you specify the symmetric encryption algorithm to use. I'll use AES-256-CBC for this example and a password of "hello" (the "pass:" prefix is the way of telling OpenSSL that the password is coming in from the command line).


```
% openssl genpkey -algorithm RSA -aes-256-cbc -pass pass:hello | openssl asn1parse
0:d=0 hl=4 l= 733 cons: SEQUENCE
4:d=1 hl=2 l= 87 cons: SEQUENCE
6:d=2 hl=2 l= 9 prim: OBJECT :PBES2
17:d=2 hl=2 l= 74 cons: SEQUENCE
19:d=3 hl=2 l= 41 cons: SEQUENCE
21:d=4 hl=2 l= 9 prim: OBJECT :PBKDF2
32:d=4 hl=2 l= 28 cons: SEQUENCE
34:d=5 hl=2 l= 8 prim: OCTET STRING [HEX DUMP]:17E6FE554E85810A
44:d=5 hl=2 l= 2 prim: INTEGER :0800
48:d=5 hl=2 l= 12 cons: SEQUENCE
50:d=6 hl=2 l= 8 prim: OBJECT :hmacWithSHA256
60:d=6 hl=2 l= 0 prim: NULL
62:d=3 hl=2 l= 29 cons: SEQUENCE
64:d=4 hl=2 l= 9 prim: OBJECT :aes-256-cbc
75:d=4 hl=2 l= 16 prim: OCTET STRING [HEX DUMP]:91E9536C39...
93:d=1 hl=4 l= 640 prim: OCTET STRING [HEX DUMP]:98007B264F...

% openssl genpkey -algorithm RSA -aes-256-cbc -pass pass:hello | head -n 1
\-----BEGIN ENCRYPTED PRIVATE KEY-----
```

There are a couple of interesting items here. We see our encryption algorithm is recorded with an OID starting at octet 64. There's an OID for "PBES2" (Password-Based Encryption Scheme 2), which defines a standard process for encryption and decryption, and an OID for "PBKDF2" (Password-Based Key Derivation Function 2), which defines a standard process for creating encryption keys from passwords. Helpfully, OpenSSL uses the header "ENCRYPTED PRIVATE KEY" in the PEM output.

OpenSSL will let you encrypt a PKCS #1, but it's done in a non-standard way via a series of headers inserted into the PEM:


```
% openssl genrsa -aes256 -passout pass:hello 4096
\-----BEGIN RSA PRIVATE KEY-----
Proc-Type: 4,ENCRYPTED
DEK-Info: AES-256-CBC,5B2C64DC05B7C0471A278C76562FD776
...
```

### In conclusion

There's a final PKCS format you need to know about: [PKCS #12][21]. The PKCS #12 format allows for storing multiple objects all in one file. If you have a certificate and its corresponding key or a chain of certificates, you can store them together in one PKCS #12 file. Individual entries in the file can be protected with password-based encryption.

Beyond the PKCS formats, there are other storage methods such as the Java-specific JKS format and the NSS library from Mozilla, which uses file-based databases (SQLite or Berkeley DB, depending on the version). Luckily, the PKCS formats are a lingua franca that can serve as a start or reference if you need to deal with other formats.

If this all seems confusing, that's because it is. Unfortunately, the PKI ecosystem has a lot of sharp edges between tools that generate enigmatic error messages (looking at you, OpenSSL) and standards that have grown and evolved over the past 35 years. Having a basic understanding of how PKI objects are stored is critical if you're doing any application development that will be accessed over SSL/TLS.

I hope this article has shed a little light on the subject and might save you from spending fruitless hours in the PKI wilderness.

* * *

_The author would like to thank Hubert Kario for providing a technical review._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/bits-and-bytes-pki

作者：[Alex Wood][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/awood
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/keyboaord_enter_writing_documentation.jpg?itok=kKrnXc5h (Computer keyboard typing)
[2]: https://opensource.com/article/18/5/cryptography-pki
[3]: https://opensource.com/article/18/7/private-keys
[4]: https://en.wikipedia.org/wiki/Abstract_Syntax_Notation_One
[5]: https://en.wikipedia.org/wiki/ISO_8601
[6]: https://en.wikipedia.org/wiki/ITU_T.61
[7]: https://en.wikipedia.org/wiki/Teletex
[8]: https://en.wikipedia.org/wiki/UTF-32
[9]: https://www.itu.int/itu-t/recommendations/rec.aspx?rec=X.680
[10]: https://www.alvestrand.no/objectid/1.3.6.1.4.1.2312.html
[11]: https://tools.ietf.org/html/rfc8017
[12]: https://linux.die.net/man/1/asn1parse
[13]: https://www.johndcook.com/blog/2018/12/12/rsa-exponent/
[14]: https://www.youtube.com/watch?v=NcPdiPrY_g8
[15]: https://en.wikipedia.org/wiki/X.690
[16]: https://en.wikipedia.org/wiki/Type-length-value
[17]: http://luca.ntop.org/Teaching/Appunti/asn1.html
[18]: https://www.theguardian.com/technology/2012/mar/26/ather-of-the-email-attachment
[19]: https://en.wikipedia.org/wiki/Base64
[20]: https://tools.ietf.org/html/rfc5208
[21]: https://tools.ietf.org/html/rfc7292
