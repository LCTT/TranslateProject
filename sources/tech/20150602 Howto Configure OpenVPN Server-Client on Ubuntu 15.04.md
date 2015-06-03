Howto Configure OpenVPN Server-Client on Ubuntu 15.04
================================================================================
Virtual private network (VPN) is a common name of several technologies which allows to establish a network connection over other network. It called virtual because nodes connected between each over through non physical lines. And it is private due to absence of public access to network without proper rights from of the network owner.

![](http://blog.linoxide.com/wp-content/uploads/2015/05/vpn_custom_illustration.jpg)

[OpenVPN][1] software transfer data using TCP and UDP protocols and with help of TUN/TAP drivers. UDP protocol and TUN driver allows to establish connection to OpenVPN server for clients behind NAT. Additionally OpenVPN allows to specify custom port. It provide additional flexibility of configuration and may help in avoiding of firewall restrictions.

Security and encryption in OpenVPN provided by library OpenSSL and by Transport Layer Security (TLS). TLS is an improved version of SSL protocol.

OpenSSL provide two kinds of encryption: symmetric and asymmetric. Below we show how to configure server side of OpenVPN and how to make all preparations for use asymmetric cryptography and TLS protocol with Public Key Infrastructure (PKI).

### Server side configuration ###

First of all we must install OpenVPN. In Ubuntu 15.04 and other Unix systems with 'apt' package manager this can be done as follows:

    sudo apt-get install openvpn

Then we must setup a keys. This can be done using default tools "openssl". But this way is rather difficult. That is why we can use "easy-rsa" for this purpose. Next command installs the "easy-rsa" into our system

    sudo apt-get unstall easy-rsa

**Remark**: all next commands executed with superuser rights, i.e. after command "sudo -i"; otherwise you can use "sudo -E" as prefix for all next commands.

For beginning we need to copy "easy-rsa" into openvpn folder

    mkdir /etc/openvpn/easy-rsa
    cp -r /usr/share/easy-rsa /etc/openvpn/easy-rsa
    mv /etc/openvpn/easy-rsa/easy-rsa /etc/openvpn/easy-rsa/2.0

and goes into it

    cd /etc/openvpn/easy-rsa/2.0

Here we start a process of key generation.

Firstly we edit a "var" file. For simplify generation process we need to specify our data in it. Here is an example of "var" file:

    export KEY_COUNTRY="US"
    export KEY_PROVINCE="CA"
    export KEY_CITY="SanFrancisco"
    export KEY_ORG="Fort-Funston"
    export KEY_EMAIL="my@myhost.mydomain"
    export KEY_OU=server

Hope, field names is clear and there is no need of additional description of them.

Secondly we need to copy the openssl config. There is config from different version. If you haven't any certain requirement use last version of it. This is a 1.0.0 version.

    cp openssl-1.0.0.cnf openssl.cnf

Thirdly we need load environment variables, which we edited on previous step

    source ./vars

Final step of preparation for key generation is in flushing of old certificates and keys and in generation of serial and index files for new keys. This can be done by using command

    ./clean-all

Now we finish preparation and ready to start generation process. Lets generate certificate first

    ./build-ca

In dialog we see default variants, which we specified in "vars" file before. We may check them, edit if needed and then press ENTER couple of times. Dialog looks as follows

    Generating a 2048 bit RSA private key
    .............................................+++
    ...................................................................................................+++
    writing new private key to 'ca.key'
    -----
    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Country Name (2 letter code) [US]:
    State or Province Name (full name) [CA]:
    Locality Name (eg, city) [SanFrancisco]:
    Organization Name (eg, company) [Fort-Funston]:
    Organizational Unit Name (eg, section) [MyOrganizationalUnit]:
    Common Name (eg, your name or your server's hostname) [Fort-Funston CA]:
    Name [EasyRSA]:
    Email Address [me@myhost.mydomain]:

Next we need to generate a server key

    ./build-key-server server

Dialog of this command is shown below:

    Generating a 2048 bit RSA private key
    ........................................................................+++
    ............................+++
    writing new private key to 'server.key'
    -----
    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Country Name (2 letter code) [US]:
    State or Province Name (full name) [CA]:
    Locality Name (eg, city) [SanFrancisco]:
    Organization Name (eg, company) [Fort-Funston]:
    Organizational Unit Name (eg, section) [MyOrganizationalUnit]:
    Common Name (eg, your name or your server's hostname) [server]:
    Name [EasyRSA]:
    Email Address [me@myhost.mydomain]:

    Please enter the following 'extra' attributes
    to be sent with your certificate request
    A challenge password []:
    An optional company name []:
    Using configuration from /etc/openvpn/easy-rsa/2.0/openssl-1.0.0.cnf
    Check that the request matches the signature
    Signature ok
    The Subject's Distinguished Name is as follows
    countryName :PRINTABLE:'US'
    stateOrProvinceName :PRINTABLE:'CA'
    localityName :PRINTABLE:'SanFrancisco'
    organizationName :PRINTABLE:'Fort-Funston'
    organizationalUnitName:PRINTABLE:'MyOrganizationalUnit'
    commonName :PRINTABLE:'server'
    name :PRINTABLE:'EasyRSA'
    emailAddress :IA5STRING:'me@myhost.mydomain'
    Certificate is to be certified until May 22 19:00:25 2025 GMT (3650 days)
    Sign the certificate? [y/n]:y
    1 out of 1 certificate requests certified, commit? [y/n]y
    Write out database with 1 new entries
    Data Base Updated

Here we must answer "yes" on last two questions about "sign the certificate" and about "commit".

Now we have certificate and server key. Next step is to generate Diffie-Hellman key. Execute the below command and be patient. During next couple minutes we will see a lots of dots and pluses symbols.

    ./build-dh

Example of the output of this command you can find below

    Generating DH parameters, 2048 bit long safe prime, generator 2
    This is going to take a long time
    ................................+................<and many many dots>

After a long wait we can move to generation of the last key. This is key for TLS-authentication. Here is a command for it:

    openvpn --genkey --secret keys/ta.key

Now, generation completed and we can move all generated files to the final location.

    cp -r /etc/openvpn/easy-rsa/2.0/keys/ /etc/openvpn/

Finally we create OpenVPN configuration file. Let's copy it from example:

    cp /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz /etc/openvpn/
    cd /etc/openvpn
    gunzip -d /etc/openvpn/server.conf.gz

Then edit it

    vim /etc/openvpn/server.conf

We need to specify custom paths to keys

    ca /etc/openvpn/keys/ca.crt
    cert /etc/openvpn/keys/server.crt
    key /etc/openvpn/keys/server.key # This file should be kept secret
    dh /etc/openvpn/keys/dh2048.pem

That's all. After restart of OpenVPN configuration of server side is complete.

    service openvpn restart

### Client side configuration for Unix ###

Suppose we have a device with Unix like operation system, for example Ubuntu 15.04, and with installed OpenVPN. We want to connect to OpenVPN server from previous section. Firstly we need a key for the client. For generation of this key go to folder on server:

    cd /etc/openvpn/easy-rsa/2.0

Load environment variables

    source vars

and create a client key

    ./build-key client

We will see a same dialog as described in previous section on part about server key generation. Fill actual information about client in it.

You need run other command in case of requirement of password protect key. Here it is

    ./build-key-pass client

In this case you will be prompted to input password in beginning of establishing of VPN connection.

Now we need to copy follows files from server to client into /etc/openvpn/keys/ folder.

List of files from server:

- ca.crt,
- dh2048.pem,
- client.crt,
- client.key,
- ta.key.

After that we go to the client and prepare configuration file. Location of file is /etc/openvpn/client.conf and content of it presents below

    dev tun
    proto udp

    # IP and Port of remote host with OpenVPN server
    remote 111.222.333.444 1194

    resolv-retry infinite

    ca /etc/openvpn/keys/ca.crt
    cert /etc/openvpn/keys/client.crt
    key /etc/openvpn/keys/client.key
    tls-client
    tls-auth /etc/openvpn/keys/ta.key 1
    auth SHA1
    cipher BF-CBC
    remote-cert-tls server
    comp-lzo
    persist-key
    persist-tun

    status openvpn-status.log
    log /var/log/openvpn.log
    verb 3
    mute 20

After that we need to restart OpenVPN for accepting a new configuration.

    service openvpn restart

That's it, the configuration of the client is over.

### Client side configuration for Android ###

Configuration of OpenVPN on Android devices is quite similar to configuration on Unix system. We need a pack with a configuration file, with a keys and with a certificates. Here is a list of them:

- configuration file (.ovpn),
- ca.crt,
- dh2048.pem,
- client.crt,
- client.key.

Client key can be generated by the same way as described in previous section.

Configuration file has a follows content

    client tls-client
    dev tun
    proto udp

    # IP and Port of remote host with OpenVPN server
    remote 111.222.333.444 1194

    resolv-retry infinite
    nobind
    ca ca.crt
    cert client.crt
    key client.key
    dh dh2048.pem
    persist-tun
    persist-key

    verb 3
    mute 20

All this files we must to move on SD-card of our device.

Then we need to install [OpenVPN Connect][2].

Next configuration process is very simple:

    open setting of OpenVPN and select Import options
    select Import Profile from SD card option
    in opened window go to folder with prepared files and select .ovpn file
    application offered us to create a new profile
    tap on the Connect button and wait a second

And thats all. Now our Android device has connection to our private network using secure VPN connection.

### Conclusion ###

So, initial configuration of OpenVPN takes a time, but it is compensated by easy clients configuration and the ability to connect from any device. Moreover OpenVPN provided a high security level and ability to connection from different places including clients located behind NAT. Therefore OpenVPN may equally well be used both at home and in enterprise.

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/configure-openvpn-server-client-ubuntu-15-04/

作者：[Ivan Zabrovskiy][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/ivanz/
[1]:https://openvpn.net/
[2]:https://play.google.com/store/apps/details?id=net.openvpn.openvpn