HTTP Public Key Pinning Extension HPKP for Apache, NGINX and Lighttpd
================================================================================
Public Key Pinning means that a certificate chain must include a whitelisted public key. It ensures only whitelisted Certificate Authorities (CA) can sign certificates for `*.example.com`, and not any CA in your browser store. This article has background theory and configuration examples for Apache, Lighttpd and NGINX.

### HTTP Public Key Pinning Extension ###

An example might be your bank, which always have their certificate from CA Company A. With the current certificate system, CA Company B, CA Company C and the NSA CA can all create a certificate for your bank, which your browser will hapily accept because those companies are also trusted root CA's.

If the bank implements HPKP and pin's their first intermidiate certificate (from CA Company A), browsers will not accept certificates from CA Company B and CA Company C, even if they have a valid trust path. HPKP also allows your browser to report back the failure to the bank, so that they know they are under attack.

Public Key Pinning Extension for HTTP (HPKP) is a standard for public key pinning for HTTP user agents that's been in development since 2011. It was started by Google, which, even though it had implemented pinning in Chrome, understood that manually maintaining a list of pinned sites can't scale.

Here is a quick feature overview of HPKP:

- HPKP is set at the HTTP level, using the `Public-Key-Pins` response header.
- The policy retention period is set with the max-age parameter, it specifies duration in seconds.
- The PKP header can only be used over an error-free secure encryption.
- If multiple headers are seen, only the first one is processed.
- Pinning can be extended to subdomains with the `includeSubDomains` parameter.
- When a new PKP header is received, it overwrites previously stored pins and metadata.
- A pin consists out of the hashing algorithm and an "Subject Public Key Info" fingerprint.

This article first has some theory about the workings of HPKP, down below you'll find the part which shows you how to get the required fingerprints and has web server configuration.

### SPKI Fingerprint - Theory ###

As explained by Adam Langley in [his post][1], we hash a public key, not a certificate:

> In general, hashing certificates is the obvious solution, but the wrong one. The problem is that CA certificates are often reissued: there are multiple certificates with the same public key, subject name etc but different extensions or expiry dates. Browsers build certificates chains from a pool of certificates, bottom up, and an alternative version of a certificate might be substituted for the one that you expect.
> 
> For example, StartSSL has two root certificates: one signed with SHA1 and the other with SHA256. If you wished to pin to StartSSL as your CA, which certificate hash would you use? You would have to use both, but how would you know about the other root if I hadn't just told you?
> 
> Conversely, public key hashes must be correct:
> 
> Browsers assume that the leaf certificate is fixed: it's always the starting point of the chain. The leaf certificate contains a signature which must be a valid signature, from its parent, for that certificate. That implies that the public key of the parent is fixed by the leaf certificate. So, inductively, the chain of public keys is fixed, modulo truncation.
> 
> The only sharp edge is that you mustn't pin to a cross-certifying root. For example, GoDaddy's root is signed by Valicert so that older clients, which don't recognise GoDaddy as a root, still trust those certificates. However, you wouldn't want to pin to Valicert because newer clients will stop their chain at GoDaddy.
> 
> Also, we're hashing the SubjectPublicKeyInfo not the public key bit string. The SPKI includes the type of the public key and some parameters along with the public key itself. This is important because just hashing the public key leaves one open to misinterpretation attacks. Consider a Diffie-Hellman public key: if one only hashes the public key, not the full SPKI, then an attacker can use the same public key but make the client interpret it in a different group. Likewise one could force an RSA key to be interpreted as a DSA key etc.

### Where to Pin ###

Where should you pin? Pinning your own public key is not the best idea. The key might change or get compromised. You might have multiple certificates in use. The key might change because you rotate your certificates every so often. It might key compromised because the web server was hacked.

The easiest, but not most secure place to pin is the first intermediate CA certificate. The signature of that certificate is on your websites certificate so the issuing CA's public key must always be in the chain.

This way you can renew your end certificate from the same CA and have no pinning issues. If the CA issues a different root, then you have a problem, there is no clear solution for this yet. There is one thing you can do to mitigate this:

- Always have a backup pin and a spare certificate from a different CA.

The RFC states that you need to provide at least two pins. One of the pins must be present in the chain used in the connection over which the pins were received, the other pin must not be present.

This other pin is your backup public key. It can also be the SPKI fingerprint of a different CA where you have a certificate issued.

An alternative and **more secure** take on this issue is to create at least three seperate public keys beforehand (using OpenSSL, see [this page][2] for a Javascript OpenSSL command generator) and to keep two of those keys as a backup in a safe place, offline and off-site.

You create the SPKI hashes for the three certificates and pin those. You only use the first key as the active certificate. When it is needed, you can then use one of the alternative keys. You do however need to let that certificate sign by a CA to create a certificate pair and that process can take a few days depending on the certificate.

This is not a problem for the HPKP because we take the SPKI hash of the public key, and not of the certificate. Expiration or a different chain of CA signer do not matter in this case.

If you have the means and procedures to create and securely save at least three seperate keys as described above and pin those, it would also protect you from your CA provider getting compromised and giving out a fake certificate for your specific website.

### SPKI Fingerprint ###

To get the SPKI fingerprint from a certificate we can use the following OpenSSL command, as shown in [the RFC draft][3]:

    openssl x509 -noout -in certificate.pem -pubkey | \
    openssl asn1parse -noout -inform pem -out public.key;
    openssl dgst -sha256 -binary public.key | openssl enc -base64

Result:

    klO23nT2ehFDXCfx3eHTDRESMz3asj1muO+4aIdjiuY=

The input `certificate.pem` file is the first certificate in the chain for this website. (At the time of writing, `COMODO RSA Domain Validation Secure Server CA, Serial 2B:2E:6E:EA:D9:75:36:6C:14:8A:6E:DB:A3:7C:8C:07.`)

You need to also do this with your backup public key, ending up with two fingerprints.

### Bugs ###

At the time of writing this article (2015-Jan) the only browser supporting HPKP (Chrome) has a serious issue where Chrome doesn't treat the max-age and includeSubdomains directives from HSTS and HPKP headers as mutually exclusive. This means that if you have HSTS and HPKP with different policiesfor max-age or includeSubdomains they will be interchanged. See this bug for more info: [https://code.google.com/p/chromium/issues/detail?id=444511][4]. Thanks to Scott Helme from [https://scotthelme.co.uk][5] for finding and notifying me and the Chromium project about it.

### Webserver configuration ###

Below you'll find configuration instructions for the three most populair web servers. Since this is just a HTTP header, almost all web servers will allow you to set this. It needs to be set for the HTTPS website.

The example below pins the `COMODO RSA Domain Validation Secure Server CA` and the `Comodo PositiveSSL` CA 2 as a backup, with a 30 day expire time including all subdomains.

#### Apache ####

Edit your apache configuration file (`/etc/apache2/sites-enabled/website.conf or /etc/apache2/httpd.conf` for example) and add the following to your VirtualHost:

    # Optionally load the headers module:
    LoadModule headers_module modules/mod_headers.so
    
    Header set Public-Key-Pins "pin-sha256=\"klO23nT2ehFDXCfx3eHTDRESMz3asj1muO+4aIdjiuY=\"; pin-sha256=\"633lt352PKRXbOwf4xSEa1M517scpD3l5f79xMD9r9Q=\"; max-age=2592000; includeSubDomains"

#### Lighttpd ####

The lighttpd variant is just as simple. Add it to your Lighttpd configuration file (`/etc/lighttpd/lighttpd.conf` for example):

    server.modules += ( "mod_setenv" )
    $HTTP["scheme"] == "https" {
        setenv.add-response-header  = ( "Public-Key-Pins" => "pin-sha256=\"klO23nT2ehFDXCfx3eHTDRESMz3asj1muO+4aIdjiuY=\"; pin-sha256=\"633lt352PKRXbOwf4xSEa1M517scpD3l5f79xMD9r9Q=\"; max-age=2592000; includeSubDomains")
    }

#### NGINX ####

NGINX is even shorter with its config. Add this in the server block for your HTTPS configuration:

    add_header Public-Key-Pins 'pin-sha256="klO23nT2ehFDXCfx3eHTDRESMz3asj1muO+4aIdjiuY="; pin-sha256="633lt352PKRXbOwf4xSEa1M517scpD3l5f79xMD9r9Q="; max-age=2592000; includeSubDomains';

### Reporting ###

HPKP reporting allows the user-agent to report any failures back to you.

If you add an aditional `report-uri="http://example.org/hpkp-report`" parameter to the header and set up a listener there, clients will send reports if they encounter a failure. A report is sent as a POST request to the report-uri with a JSON body like this:

    {
        "date-time": "2014-12-26T11:52:10Z",
        "hostname": "www.example.org",
        "port": 443,
        "effective-expiration-date": "2014-12-31T12:59:59",
        "include-subdomains": true,
        "served-certificate-chain": [
            "-----BEGINCERTIFICATE-----\nMIIAuyg[...]tqU0CkVDNx\n-----ENDCERTIFICATE-----"
        ],
        "validated-certificate-chain": [
            "-----BEGINCERTIFICATE-----\nEBDCCygAwIBA[...]PX4WecNx\n-----ENDCERTIFICATE-----"
        ],
        "known-pins": [
            "pin-sha256=\"dUezRu9zOECb901Md727xWltNsj0e6qzGk\"",
            "pin-sha256=\"E9CqVKB9+xZ9INDbd+2eRQozqbQ2yXLYc\""
        ]
    }

### No Enforcment, report only ###

HPKP can be set up without enforcement, in reporting mode by using the `Public-Key-Pins-Report-Only` response header.

This approach allows you to set up pinning without your site being unreachable or HPKP being configured incorrectly. You can later move to enforcement by changing the header back to `Public-Key-Pins`.

--------------------------------------------------------------------------------

via: https://raymii.org/s/articles/HTTP_Public_Key_Pinning_Extension_HPKP.html

作者：[Remy van Elst][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://raymii.org/
[1]:http://www.imperialviolet.org/2011/05/04/pinning.html
[2]:https://raymii.org/s/software/OpenSSL_Command_Generator.html
[3]:https://tools.ietf.org/html/draft-ietf-websec-key-pinning-21#appendix-A
[4]:https://code.google.com/p/chromium/issues/detail?id=444511
[5]:https://scotthelme.co.uk/