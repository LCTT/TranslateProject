建立你自己的 CA 服务：OpenSSL 命令行 CA 操作快速指南
================================================================================

这些是关于使用 OpenSSL 生成证书授权（CA）、中间证书授权和末端证书的速记随笔，内容包括 OCSP、CRL 和 CA 颁发者信息，以及指定颁发和有效期限等。

我们将建立我们自己的根 CA，我们将使用根 CA 来生成一个中间 CA 的例子，我们将使用中间 CA 来签署末端用户证书。

### 根 CA ###

创建根 CA 授权目录并切换到该目录：

    mkdir ~/SSLCA/root/
    cd ~/SSLCA/root/

为我们的根 CA 生成一个8192位长的 SHA-256 RSA 密钥：

    openssl genrsa -aes256 -out rootca.key 8192

样例输出：

    Generating RSA private key, 8192 bit long modulus
    .........++
    ....................................................................................................................++
    e is 65537 (0x10001)

如果你想要用密码保护该密钥，请添加 `-aes256` 选项。

创建自签名根 CA 证书 `ca.crt`；你需要为你的根 CA 提供一个身份：

    openssl req -sha256 -new -x509 -days 1826 -key rootca.key -out rootca.crt

样例输出：

    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Country Name (2 letter code) [AU]:NL
    State or Province Name (full name) [Some-State]:Zuid Holland
    Locality Name (eg, city) []:Rotterdam
    Organization Name (eg, company) [Internet Widgits Pty Ltd]:Sparkling Network
    Organizational Unit Name (eg, section) []:Sparkling CA
    Common Name (e.g. server FQDN or YOUR name) []:Sparkling Root CA
    Email Address []:

创建一个存储 CA 序列的文件：

    touch certindex
    echo 1000 > certserial
    echo 1000 > crlnumber

放置 CA 配置文件，该文件持有 CRL 和 OCSP 末端的存根。

    # vim ca.conf
    [ ca ]
    default_ca = myca
    
    [ crl_ext ]
    issuerAltName=issuer:copy 
    authorityKeyIdentifier=keyid:always
    
     [ myca ]
     dir = ./
     new_certs_dir = $dir
     unique_subject = no
     certificate = $dir/rootca.crt
     database = $dir/certindex
     private_key = $dir/rootca.key
     serial = $dir/certserial
     default_days = 730
     default_md = sha1
     policy = myca_policy
     x509_extensions = myca_extensions
     crlnumber = $dir/crlnumber
     default_crl_days = 730
    
     [ myca_policy ]
     commonName = supplied
     stateOrProvinceName = supplied
     countryName = optional
     emailAddress = optional
     organizationName = supplied
     organizationalUnitName = optional
    
     [ myca_extensions ]
     basicConstraints = critical,CA:TRUE
     keyUsage = critical,any
     subjectKeyIdentifier = hash
     authorityKeyIdentifier = keyid:always,issuer
     keyUsage = digitalSignature,keyEncipherment,cRLSign,keyCertSign
     extendedKeyUsage = serverAuth
     crlDistributionPoints = @crl_section
     subjectAltName  = @alt_names
     authorityInfoAccess = @ocsp_section
    
     [ v3_ca ]
     basicConstraints = critical,CA:TRUE,pathlen:0
     keyUsage = critical,any
     subjectKeyIdentifier = hash
     authorityKeyIdentifier = keyid:always,issuer
     keyUsage = digitalSignature,keyEncipherment,cRLSign,keyCertSign
     extendedKeyUsage = serverAuth
     crlDistributionPoints = @crl_section
     subjectAltName  = @alt_names
     authorityInfoAccess = @ocsp_section
    
     [alt_names]
     DNS.0 = Sparkling Intermidiate CA 1
     DNS.1 = Sparkling CA Intermidiate 1
    
     [crl_section]
     URI.0 = http://pki.sparklingca.com/SparklingRoot.crl
     URI.1 = http://pki.backup.com/SparklingRoot.crl
    
     [ocsp_section]
     caIssuers;URI.0 = http://pki.sparklingca.com/SparklingRoot.crt
     caIssuers;URI.1 = http://pki.backup.com/SparklingRoot.crt
     OCSP;URI.0 = http://pki.sparklingca.com/ocsp/
     OCSP;URI.1 = http://pki.backup.com/ocsp/

如果你需要设置某个特定的证书生效/过期日期，请添加以下内容到`[myca]`：

    # format: YYYYMMDDHHMMSS
    default_enddate = 20191222035911
    default_startdate = 20181222035911

### 创建中间 CA###

生成中间 CA （名为 intermediate1）的私钥：

    openssl genrsa -out intermediate1.key 4096

生成中间 CA 的 CSR：

    openssl req -new -sha256 -key intermediate1.key -out intermediate1.csr

样例输出：

    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Country Name (2 letter code) [AU]:NL
    State or Province Name (full name) [Some-State]:Zuid Holland
    Locality Name (eg, city) []:Rotterdam
    Organization Name (eg, company) [Internet Widgits Pty Ltd]:Sparkling Network
    Organizational Unit Name (eg, section) []:Sparkling CA
    Common Name (e.g. server FQDN or YOUR name) []:Sparkling Intermediate CA
    Email Address []:
    
    Please enter the following 'extra' attributes
    to be sent with your certificate request
    A challenge password []:
    An optional company name []:

确保中间 CA 的主体（CN）和根 CA 不同。

用根 CA 签署 中间 CA 的 CSR：

    openssl ca -batch -config ca.conf -notext -in intermediate1.csr -out intermediate1.crt

样例输出：

    Using configuration from ca.conf
    Check that the request matches the signature
    Signature ok
    The Subject's Distinguished Name is as follows
    countryName           :PRINTABLE:'NL'
    stateOrProvinceName   :ASN.1 12:'Zuid Holland'
    localityName          :ASN.1 12:'Rotterdam'
    organizationName      :ASN.1 12:'Sparkling Network'
    organizationalUnitName:ASN.1 12:'Sparkling CA'
    commonName            :ASN.1 12:'Sparkling Intermediate CA'
    Certificate is to be certified until Mar 30 15:07:43 2017 GMT (730 days)
    
    Write out database with 1 new entries
    Data Base Updated

生成 CRL（同时采用 PEM 和 DER 格式）：

    openssl ca -config ca.conf -gencrl -keyfile rootca.key -cert rootca.crt -out rootca.crl.pem
    
    openssl crl -inform PEM -in rootca.crl.pem -outform DER -out rootca.crl

每次使用该 CA 签署证书后，请生成 CRL。

如果你需要撤销该中间证书：

    openssl ca -config ca.conf -revoke intermediate1.crt -keyfile rootca.key -cert rootca.crt

### 配置中间 CA ###

为该中间 CA 创建一个新文件夹，然后进入该文件夹：

    mkdir ~/SSLCA/intermediate1/
    cd ~/SSLCA/intermediate1/

从根 CA 拷贝中间证书和密钥：

    cp ~/SSLCA/root/intermediate1.key ./
    cp ~/SSLCA/root/intermediate1.crt ./

创建索引文件：

    touch certindex
    echo 1000 > certserial
    echo 1000 > crlnumber

创建一个新的 `ca.conf` 文件：

    # vim ca.conf
    [ ca ]
    default_ca = myca
    
    [ crl_ext ]
    issuerAltName=issuer:copy 
    authorityKeyIdentifier=keyid:always
    
     [ myca ]
     dir = ./
     new_certs_dir = $dir
     unique_subject = no
     certificate = $dir/intermediate1.crt
     database = $dir/certindex
     private_key = $dir/intermediate1.key
     serial = $dir/certserial
     default_days = 365
     default_md = sha1
     policy = myca_policy
     x509_extensions = myca_extensions
     crlnumber = $dir/crlnumber
     default_crl_days = 365
    
     [ myca_policy ]
     commonName = supplied
     stateOrProvinceName = supplied
     countryName = optional
     emailAddress = optional
     organizationName = supplied
     organizationalUnitName = optional
    
     [ myca_extensions ]
     basicConstraints = critical,CA:FALSE
     keyUsage = critical,any
     subjectKeyIdentifier = hash
     authorityKeyIdentifier = keyid:always,issuer
     keyUsage = digitalSignature,keyEncipherment
     extendedKeyUsage = serverAuth
     crlDistributionPoints = @crl_section
     subjectAltName  = @alt_names
     authorityInfoAccess = @ocsp_section
    
     [alt_names]
     DNS.0 = example.com
     DNS.1 = example.org
    
     [crl_section]
     URI.0 = http://pki.sparklingca.com/SparklingIntermidiate1.crl
     URI.1 = http://pki.backup.com/SparklingIntermidiate1.crl
    
     [ocsp_section]
     caIssuers;URI.0 = http://pki.sparklingca.com/SparklingIntermediate1.crt
     caIssuers;URI.1 = http://pki.backup.com/SparklingIntermediate1.crt
     OCSP;URI.0 = http://pki.sparklingca.com/ocsp/
     OCSP;URI.1 = http://pki.backup.com/ocsp/

修改 `[alt_names]` 部分，添加你需要的主体备选名。如果你不需要主体备选名，请移除该部分包括`subjectAltName = @alt_names`的行。

如果你需要设置一个指定的生效/到期日期，请添加以下内容到 `[myca]`：

    # format: YYYYMMDDHHMMSS
    default_enddate = 20191222035911
    default_startdate = 20181222035911

生成一个空白 CRL（同时以 PEM 和 DER 格式）：

    openssl ca -config ca.conf -gencrl -keyfile rootca.key -cert rootca.crt -out rootca.crl.pem
    
    openssl crl -inform PEM -in rootca.crl.pem -outform DER -out rootca.crl

### 生成末端用户证书 ###

我们使用这个新的中间 CA 来生成一个末端用户证书，请重复以下操作来使用该 CA 为每个用户签署。

    mkdir enduser-certs

生成末端用户的私钥：

    openssl genrsa -out enduser-certs/enduser-example.com.key 4096

生成末端用户的 CSR：

    openssl req -new -sha256 -key enduser-certs/enduser-example.com.key -out enduser-certs/enduser-example.com.csr

样例输出：

    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Country Name (2 letter code) [AU]:NL
    State or Province Name (full name) [Some-State]:Noord Holland
    Locality Name (eg, city) []:Amsterdam
    Organization Name (eg, company) [Internet Widgits Pty Ltd]:Example Inc
    Organizational Unit Name (eg, section) []:IT Dept
    Common Name (e.g. server FQDN or YOUR name) []:example.com
    Email Address []:
    
    Please enter the following 'extra' attributes
    to be sent with your certificate request
    A challenge password []:
    An optional company name []:

使用中间 CA 签署末端用户的 CSR：

    openssl ca -batch -config ca.conf -notext -in enduser-certs/enduser-example.com.csr -out enduser-certs/enduser-example.com.crt

样例输出：

    Using configuration from ca.conf
    Check that the request matches the signature
    Signature ok
    The Subject's Distinguished Name is as follows
    countryName           :PRINTABLE:'NL'
    stateOrProvinceName   :ASN.1 12:'Noord Holland'
    localityName          :ASN.1 12:'Amsterdam'
    organizationName      :ASN.1 12:'Example Inc'
    organizationalUnitName:ASN.1 12:'IT Dept'
    commonName            :ASN.1 12:'example.com'
    Certificate is to be certified until Mar 30 15:18:26 2016 GMT (365 days)
    
    Write out database with 1 new entries
    Data Base Updated

生成 CRL（同时以 PEM 和 DER 格式）：

    openssl ca -config ca.conf -gencrl -keyfile intermediate1.key -cert intermediate1.crt -out intermediate1.crl.pem
    
    openssl crl -inform PEM -in intermediate1.crl.pem -outform DER -out intermediate1.crl

每次你使用该 CA 签署证书后，都需要生成 CRL。

如果你需要撤销该末端用户证书：

    openssl ca -config ca.conf -revoke enduser-certs/enduser-example.com.crt -keyfile intermediate1.key -cert intermediate1.crt

样例输出：

    Using configuration from ca.conf
    Revoking Certificate 1000.
    Data Base Updated

通过连接根证书和中间证书来创建证书链文件。

    cat ../root/rootca.crt intermediate1.crt > enduser-certs/enduser-example.com.chain

发送以下文件给末端用户：

    enduser-example.com.crt
    enduser-example.com.key
    enduser-example.com.chain

你也可以让末端用户提供他们自己的 CSR，而只发送给他们这个 .crt 文件。不要把它从服务器删除，否则你就不能撤销了。

### 校验证书 ###

你可以对证书链使用以下命令来验证末端用户证书：

    openssl verify -CAfile enduser-certs/enduser-example.com.chain enduser-certs/enduser-example.com.crt 
    enduser-certs/enduser-example.com.crt: OK

你也可以针对 CRL 来验证。首先，将 PEM 格式的 CRL 和证书链相连接：

    cat ../root/rootca.crt intermediate1.crt intermediate1.crl.pem > enduser-certs/enduser-example.com.crl.chain

验证证书：

    openssl verify -crl_check -CAfile enduser-certs/enduser-example.com.crl.chain enduser-certs/enduser-example.com.crt

没有撤销时的输出：

    enduser-certs/enduser-example.com.crt: OK

撤销后的输出如下：

    enduser-certs/enduser-example.com.crt: CN = example.com, ST = Noord Holland, C = NL, O = Example Inc, OU = IT Dept
    error 23 at 0 depth lookup:certificate revoked

--------------------------------------------------------------------------------

via: https://raymii.org/s/tutorials/OpenSSL_command_line_Root_and_Intermediate_CA_including_OCSP_CRL%20and_revocation.html

作者：Remy van Elst
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出
