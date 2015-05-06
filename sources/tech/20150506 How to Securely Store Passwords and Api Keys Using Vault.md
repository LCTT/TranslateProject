How to Securely Store Passwords and Api Keys Using Vault
================================================================================
Vault is a tool that is used to access secret information securely, it may be password, API key, certificate or anything else. Vault provides a unified interface to secret information through strong access control mechanism and extensive logging of events.

Granting access to critical information is quite a difficult problem when we have multiple roles and individuals across different roles requiring various critical information like, login details to databases with different privileges, API keys for external services, credentials for service oriented architecture communication etc. Situation gets even worse when access to secret information is managed across different platforms with custom settings, so rolling, secure storage and managing the audit logs is almost impossible. But Vault provides a solution to such a complex situation.

### Salient Features ###

Data Encryption: Vault can encrypt and decrypt data with no requirement to store it. Developers can now store encrypted data without developing their own encryption techniques and it allows security teams to define security parameters.

**Secure Secret Storage**: Vault encrypts the secret information (API keys, passwords or certificates) before storing it on to the persistent (secondary) storage. So even if somebody gets access to the stored information by chance, it will be of no use until it is decrypted.

**Dynamic Secrets**: On demand secrets are generated for systems like AWS and SQL databases. If an application needs to access S3 bucket, for instance, it requests AWS keypair from Vault, which grants the required secret information along with a lease time. The secret information won’t work once the lease time is expired.

**Leasing and Renewal**: Vault grants secrets with a lease limit, it revokes the secrets as soon as lease expires which can further be renewed through APIs if required.

**Revocation**: Upon expiring the lease period Vault can revoke a single secret or a tree of secrets.

### Installing Vault ###

There are two ways to use Vault.

**1. Pre-compiled Vault Binary** can be downloaded for all Linux flavors from the following source, once done, unzip it and place it on a system PATH where other binaries are kept so that it can be accessed/invoked easily.

- [Download Precompiled Vault Binary (32-bit)][1]
- [Download Precompiled Vault Binary (64-bit)][2]
- [Download Precompiled Vault Binary (ARM)][3]

Download the desired precompiled Vault binary.

![wget binary](http://blog.linoxide.com/wp-content/uploads/2015/04/wget-binary.png)

Unzip the downloaded binary.

![vault](http://blog.linoxide.com/wp-content/uploads/2015/04/unzip.png)

unzipCongratulations! Vault is ready to be used.

![](http://blog.linoxide.com/wp-content/uploads/2015/04/vault.png)

**2. Compiling from source** is another way of installing Vault on the system. GO and GIT are required to be installed and configured properly on the system before we start the installation process.

To **install GO on Redhat systems** use the following command.

    sudo yum install go

To **install GO on Debian systems** use the following commands.

    sudo apt-get install golang

OR

    sudo add-apt-repository ppa:gophers/go

    sudo apt-get update

    sudo apt-get install golang-stable

To **install GIT on Redhat systems** use the following command.

    sudo yum install git

To **install GIT on Debian systems** use the following commands.

    sudo apt-get install git

Once both GO and GIT are installed we start the Vault installation process by compiling from the source.

> Clone following Vault repository into the GOPATH

    https://github.com/hashicorp/vault

> Verify if the following clone file exist, if it doesn’t then Vault wasn’t cloned to the proper path.

    $GOPATH/src/github.com/hashicorp/vault/main.go

> Run following command to build Vault in the current system and put binary in the bin directory.

    make dev

![path](http://blog.linoxide.com/wp-content/uploads/2015/04/installation4.png)

### An introductory tutorial of Vault ###

We have compiled Vault’s official interactive tutorial along with its output on SSH.

**Overview**

This tutorial will cover the following steps:

- Initializing and unsealing your Vault
- Authorizing your requests to Vault
- Reading and writing secrets
- Sealing your Vault

**Initialize your Vault**

To get started, we need to initialize an instance of Vault for you to work with.
While initializing, you can configure the seal behavior of Vault.
Initialize Vault now, with 1 unseal key for simplicity, using the command:

    vault init -key-shares=1 -key-threshold=1

You'll notice Vault prints out several keys here. Don't clear your terminal, as these are needed in the next few steps.

![Initializing SSH](http://blog.linoxide.com/wp-content/uploads/2015/04/Initializing-SSH.png)

**Unsealing your Vault**

When a Vault server is started, it starts in a sealed state. In this state, Vault is configured to know where and how to access the physical storage, but doesn't know how to decrypt any of it.
Vault encrypts data with an encryption key. This key is encrypted with the "master key", which isn't stored. Decrypting the master key requires a threshold of shards. In this example, we use one shard to decrypt this master key.

    vault unseal <key 1>

![Unsealing SSH](http://blog.linoxide.com/wp-content/uploads/2015/04/Unsealing-SSH.png)

**Authorize your requests**

Before performing any operation with Vault, the connecting client must be authenticated. Authentication is the process of verifying a person or machine is who they say they are and assigning an identity to them. This identity is then used when making requests with Vault.
For simplicity, we'll use the root token we generated on init in Step 2. This output should be available in the scrollback.
Authorize with a client token:

    vault auth <root token>

![Authorize SSH](http://blog.linoxide.com/wp-content/uploads/2015/04/Authorize-SSH.png)

**Read and write secrets**

Now that Vault has been set-up, we can start reading and writing secrets with the default mounted secret backend. Secrets written to Vault are encrypted and then written to the backend storage. The backend storage mechanism never sees the unencrypted value and doesn't have the means necessary to decrypt it without Vault.

    vault write secret/hello value=world

Of course, you can then read this data too:

    vault read secret/hello

![RW_SSH](http://blog.linoxide.com/wp-content/uploads/2015/04/RW_SSH.png)

**Seal your Vault**

There is also an API to seal the Vault. This will throw away the encryption key and require another unseal process to restore it. Sealing only requires a single operator with root privileges. This is typically part of a rare "break glass procedure".
This way, if there is a detected intrusion, the Vault data can be locked quickly to try to minimize damages. It can't be accessed again without access to the master key shards.

    vault seal

![Seal Vault SSH](http://blog.linoxide.com/wp-content/uploads/2015/04/Seal-Vault-SSH.png)

That is the end of introductory tutorial.

### Summary ###

Vault is a very useful application mainly because of providing a reliable and secure way of storing critical information. Furthermore it encrypts the critical information before storing, maintains audit logs, grants secret information for limited lease time and revokes it once lease is expired. It is platform independent and freely available to download and install. To discover more about Vault, readers are encouraged to visit the official website.

--------------------------------------------------------------------------------

via: http://linoxide.com/how-tos/secure-secret-store-vault/

作者：[Aun Raza][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunrz/
[1]:https://dl.bintray.com/mitchellh/vault/vault_0.1.0_linux_386.zip
[2]:https://dl.bintray.com/mitchellh/vault/vault_0.1.0_linux_amd64.zip
[3]:https://dl.bintray.com/mitchellh/vault/vault_0.1.0_linux_arm.zip