[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 secrets management tools for Git encryption)
[#]: via: (https://opensource.com/article/19/2/secrets-management-tools-git)
[#]: author: (Austin Dewey https://opensource.com/users/adewey)

4 secrets management tools for Git encryption
======
See how Git-crypt, BlackBox, SOPS, and Transcrypt stack up for storing secrets in Git.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003601_05_mech_osyearbook2016_security_cc.png?itok=3V07Lpko)

There are a lot of great open source tools out there for storing secrets in Git. It can be hard to determine the right one for you and your organization—it depends on your use cases and requirements. To help you compare and choose, we'll look at four of the most popular open source tools for secrets management and see how they stack up against each other:

+ [Git-crypt](https://github.com/AGWA/git-crypt)
+ [BlackBox](https://github.com/StackExchange/blackbox)
+ [SOPS](https://github.com/mozilla/sops)
+ [Transcrypt](https://github.com/elasticdog/transcrypt)


We won't review larger solutions like HashiCorp Vault. A production-ready Vault can be a rather large hurdle, especially if your organization is just getting started with secrets management. The tools above are easy to use and set up quickly.

### Encryption types

These secrets management tools use GNU Privacy Guard ([GPG][1]), symmetric key encryption, and/or cloud key services.

  * GPG-based tools require users to create a GPG keypair. The public key is used to encrypt and is shared with other users, while the private key is used to decrypt and is known by only one user.
  * Symmetric key tools are password-based and work when given the correct password.
  * Cloud key services—Amazon Key Management Service (KMS), Google Cloud KMS, and Azure Key Vault-based tools—allow integration with services from cloud providers.



The encryption types these secrets management tools use are:
|            | GPG | Symmetric key | Amazon KMS | Google KMS | Azure Key Vault |
| Git-crypt  | X   | X             |            |            |                 |
| BlackBox   | X   |               |            |            |                 |
| SOPS       | X   |               | X          | X          | X               |
| Transcrypt |     | X             |            |            |                 |

As you can see, Git-crypt and SOPS use more than one encryption basis. This means Git-crypt can achieve encryption by using GPG OR a symmetric key, and SOPS can use GPG OR one of the cloud services.

### Goals

These tools have similar goals:

|            | Transparency with Git | Whole-file encryption | Partial-file encryption |
| Git-crypt  | X                     | X                     |                         |
| BlackBox   | X                     | X                     |                         |
| SOPS       |                       | X                     | X                       |
| Transcrypt | X                     | X                     |                         |

All but SOPS are transparent with Git, which means they have built-in mechanisms to ensure that files in source control are encrypted without much effort from users. They help prevent a **git push** from accidentally pushing plaintext secrets to Git.

At this point, you might be wondering, "Why is SOPS here if it doesn't encrypt transparently with Git? Isn't this a post about Git encryption tools?" The reason is because of how it handles key-value-based files, such as YAML and JSON. When encrypting these types of files, SOPS will leave the keys unencrypted but will encrypt the values. There are often cases, especially in configuration management, where these types of files need to be encrypted in Git, but it would also be convenient to see what kind of information they contain. While SOPS does not provide native Git transparency, tools like [git-secrets][2] can be used alongside SOPS to help ensure plaintext secrets are not pushed to Git.

Finally, all of these tools support whole-file encryption, in which secrets files are encrypted in their entirety.

### Workflows and differences

None of these tools are particularly difficult to use, but they all have quirks and operational challenges to consider.

#### GPG

The basic workflow for a GPG-based tool is:

  1. Initialize the repository with the encryption tool
  2. Create GPG keys for users that are allowed to manage secret files
  3. Add the corresponding public keys to the tool
  4. Designate the files that should be treated as "secret"
  5. Encrypt the files using the tool
  6. Repeat steps 2, 3, and 5 for each new user that is granted permission
  7. To revoke a user, remove the user and repeat step 5



In theory, this workflow is simple. One operational issue is GPG key maintenance. Your team will need to back up its GPG keys to prevent a lock-out scenario if GPG keys are accidentally deleted. If you are using the tool for automation, you will also need to consider who will be responsible for creating and maintaining keys for that service. Additionally, if you need to add, remove, or rotate a key, you'll need to re-encrypt each file for the changes to take effect.

Advantages and disadvantages of the GPG-based tools include:

  * Git-crypt cannot remove GPG users natively, which means step 7 above is not easy to do. There are workarounds available, but it's not a built-in feature.
  * Git-crypt will transparently perform step 5 above on a **git push** —even when new users are added.
  * BlackBox provides a **blackbox_update_all_files** command, which can perform step 5 by re-encrypting all secret files in one command. This comes in handy in key rotation and adding/removing GPG keys, where all files need to be re-encrypted.
  * SOPS makes key rotation and adding/removing GPG keys the most difficult, as it requires each file to be manually re-encrypted.
  * BlackBox has a **blackbox_list_admins** command that returns the email address that corresponds with registered users' GPG keys. This makes it easier to discern who has access to the secrets versus trying to map plain GPG fingerprints.



#### Cloud key services

Here is a sample workflow using SOPS with Amazon KMS:

  1. Create identity and access management (IAM) entities
  2. Create KMS master key
  3. Grant IAM entities access to the master key
  4. Add the master key to each secret file with SOPS and encrypt the file (adding keys and encrypting is usually a one-step process with SOPS)
  5. Re-encrypt when adding or removing master keys



Of these four tools, SOPS is the only one that allows users to configure encryption with a cloud-based key service. Cloud key services ease much of the operational burden that GPG-based solutions carry. Take Amazon KMS, for example: The master key is added to SOPS and access to secret files is controlled through IAM policies. Adding and removing users is as simple as granting or revoking permission with IAM, meaning secret files do not need to be re-encrypted when changing permissions, since nothing changed from SOPS's perspective. This solution does have its own set of operational challenges, however. Each member of the team must have an AWS account before they can access secret files. Also, admins must configure and maintain the IAM policies and KMS master key(s).

#### Symmetric key encryption

The workflow for symmetric key-based tools is probably the simplest:

  1. Initialize the repository with the encryption tool
  2. Designate files that should be treated as "secret"
  3. **git push** to transparently encrypt the files
  4. Share the symmetric key with other users who need access
  5. Rotate the key each time a user is revoked access



Git-crypt and Transcrypt both provide a complex password as the symmetric key. The operational challenges are to find a secure way to share the symmetric key and to be sure to rotate the key each time a user is removed.

Here are a few differences between Git-crypt and Transcrypt, our symmetric key-compatible tools:

  * Git-crypt is compatible with both GPG and symmetric key encryption
  * Git-crypt doesn't support symmetric key rotation, so you can't complete step 5 if you use it with a symmetric key
  * Transcrypt provides a convenient **\--rekey** command for key rotation



### Other features

Other features and characteristics of the tools include:

|            | Editor-in-place | Auditing | Repo-level permission | File-level permission  |
| Git-crypt  |                 |          | X                     |                        |
| BlackBox   | X               |          | X                     |                        |
| SOPS       | X               | X        |                       | X                      |
| Transcrypt |                 |          | X                     |                        |

Both BlackBox and SOPS feature an "editor-in-place" tool, which decrypts the file and opens a text editor specified by the **$EDITOR** environment variable. This enables the user to make in-place edits to the file before it is saved and re-encrypted, so users can modify secret files without requiring them to be "decrypted in place" first.

SOPS is the only tool that provides an auditing feature. This feature tracks and monitors SOPS usage by forwarding events to a database. It requires a certain amount of setup, so check out SOPS's [README][3] for more information.

Git-crypt, BlackBox, and Transcrypt handle access at the repo level, meaning that if you can view one decrypted file, you can view them all. Depending on your use case, this is either a feature or a misfeature. SOPS handles permissions at the file level, meaning just because users can view one file, they can't necessarily view other files in the repo.

### For more information

Hopefully, this high-level overview of four open source secrets management tools will help you make an educated decision about the right tool for you. For more information on the tools, please check out their GitHub pages (linked at the top of this article).

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/secrets-management-tools-git

作者：[Austin Dewey][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/adewey
[b]: https://github.com/lujun9972
[1]: https://www.gnupg.org/
[2]: https://github.com/awslabs/git-secrets
[3]: https://github.com/mozilla/sops/blob/master/README.rst#auditing
