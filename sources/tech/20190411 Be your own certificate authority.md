[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Be your own certificate authority)
[#]: via: (https://opensource.com/article/19/4/certificate-authority)
[#]: author: (Moshe Zadka  https://opensource.com/users/moshez/users/elenajon123)

Be your own certificate authority
======
Create a simple, internal CA for your microservice architecture or
integration testing.
![][1]

The Transport Layer Security ([TLS][2]) model, which is sometimes referred to by the older name SSL, is based on the concept of [certificate authorities][3] (CAs). These authorities are trusted by browsers and operating systems and, in turn, _sign_ servers' certificates to validate their ownership.

However, for an intranet, a microservice architecture, or integration testing, it is sometimes useful to have a _local CA_ : one that is trusted only internally and, in turn, signs local servers' certificates.

This especially makes sense for integration tests. Getting certificates can be a burden because the servers will be up for minutes. But having an "ignore certificate" option in the code could allow it to be activated in production, leading to a security catastrophe.

A CA certificate is not much different from a regular server certificate; what matters is that it is trusted by local code. For example, in the **requests** library, this can be done by setting the **REQUESTS_CA_BUNDLE** variable to a directory containing this certificate.

In the example of creating a certificate for integration tests, there is no need for a _long-lived_ certificate: if your integration tests take more than a day, you have already failed.

So, calculate **yesterday** and **tomorrow** as the validity interval:


```
>>> import datetime
>>> one_day = datetime.timedelta(days=1)
>>> today = datetime.date.today()
>>> yesterday = today - one_day
>>> tomorrow = today - one_day
```

Now you are ready to create a simple CA certificate. You need to generate a private key, create a public key, set up the "parameters" of the CA, and then self-sign the certificate: a CA certificate is _always_ self-signed. Finally, write out both the certificate file as well as the private key file.


```
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.hazmat.primitives import hashes, serialization
from cryptography import x509
from cryptography.x509.oid import NameOID

private_key = rsa.generate_private_key(
public_exponent=65537,
key_size=2048,
backend=default_backend()
)
public_key = private_key.public_key()
builder = x509.CertificateBuilder()
builder = builder.subject_name(x509.Name([
x509.NameAttribute(NameOID.COMMON_NAME, 'Simple Test CA'),
]))
builder = builder.issuer_name(x509.Name([
x509.NameAttribute(NameOID.COMMON_NAME, 'Simple Test CA'),
]))
builder = builder.not_valid_before(yesterday)
builder = builder.not_valid_after(tomorrow)
builder = builder.serial_number(x509.random_serial_number())
builder = builder.public_key(public_key)
builder = builder.add_extension(
x509.BasicConstraints(ca=True, path_length=None),
critical=True)
certificate = builder.sign(
private_key=private_key, algorithm=hashes.SHA256(),
backend=default_backend()
)
private_bytes = private_key.private_bytes(
encoding=serialization.Encoding.PEM,
format=serialization.PrivateFormat.TraditionalOpenSSL,
encryption_algorithm=serialization.NoEncrption())
public_bytes = certificate.public_bytes(
encoding=serialization.Encoding.PEM)
with open("ca.pem", "wb") as fout:
fout.write(private_bytes + public_bytes)
with open("ca.crt", "wb") as fout:
fout.write(public_bytes)
```

In general, a real CA will expect a [certificate signing request][4] (CSR) to sign a certificate. However, when you are your own CA, you can make your own rules! Just go ahead and sign what you want.

Continuing with the integration test example, you can create the private keys and sign the corresponding public keys right then. Notice **COMMON_NAME** needs to be the "server name" in the **https** URL. If you've configured name lookup, the needed server will respond on **service.test.local**.


```
service_private_key = rsa.generate_private_key(
public_exponent=65537,
key_size=2048,
backend=default_backend()
)
service_public_key = service_private_key.public_key()
builder = x509.CertificateBuilder()
builder = builder.subject_name(x509.Name([
x509.NameAttribute(NameOID.COMMON_NAME, 'service.test.local')
]))
builder = builder.not_valid_before(yesterday)
builder = builder.not_valid_after(tomorrow)
builder = builder.public_key(public_key)
certificate = builder.sign(
private_key=private_key, algorithm=hashes.SHA256(),
backend=default_backend()
)
private_bytes = service_private_key.private_bytes(
encoding=serialization.Encoding.PEM,
format=serialization.PrivateFormat.TraditionalOpenSSL,
encryption_algorithm=serialization.NoEncrption())
public_bytes = certificate.public_bytes(
encoding=serialization.Encoding.PEM)
with open("service.pem", "wb") as fout:
fout.write(private_bytes + public_bytes)
```

Now the **service.pem** file has a private key and a certificate that is "valid": it has been signed by your local CA. The file is in a format that can be given to, say, Nginx, HAProxy, or most other HTTPS servers.

By applying this logic to testing scripts, it's easy to create servers that look like authentic HTTPS servers, as long as the client is configured to trust the right CA.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/certificate-authority

作者：[Moshe Zadka (Community Moderator)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez/users/elenajon123
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_commun_4604_02_mech_connections_rhcz0.5x.png?itok=YPPU4dMj
[2]: https://en.wikipedia.org/wiki/Transport_Layer_Security
[3]: https://en.wikipedia.org/wiki/Certificate_authority
[4]: https://en.wikipedia.org/wiki/Certificate_signing_request
