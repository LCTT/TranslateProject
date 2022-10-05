[#]: subject: "How To Use Ansible Vault To Protect Sensitive Playbook Data"
[#]: via: "https://ostechnix.com/ansible-vault/"
[#]: author: "Karthick https://ostechnix.com/author/karthick/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How To Use Ansible Vault To Protect Sensitive Playbook Data
======
Ansible Vault Tutorial | Encrypt Content With Ansible Vault

In this article, we are going to learn **what is Ansible Vault** and how to **use Ansible Vault to protect sensitive playbook data** by encrypting the data in Linux.

### What Is Ansible Vault?

**Ansible Vault** is a feature of ansible that allows you to **keep sensitive data such as passwords or keys in encrypted files**, rather than leaving the data visible as plaintext in playbooks or roles.

Authentication and authorization are two important layers controlling the access part of software applications. When you work in a collaborative environment, not all data will be kept visible to you.

Similarly, when you create a project using **[Ansible][1]**, you may want to keep some sensitive information like api key, database password, and access tokens secure.

Keeping this information visible to everyone is not good for security, especially when you store it in public repositories.

In the upcoming section of this **Ansible vault tutorial**, we will learn how to use ansible vault to encrypt a file or string in order to **secure your secrets** safely and how to **use Ansible vault in the playbooks to protect sensitive data** with example commands.

### Working With Ansible Vault Command

By default ansible-vault comes with ansible installation. Launch your terminal and run the following command which will give you the list of options you can use with the ansible vault command.

```
$ ansible-vault --help
```

![Ansible Help Section][2]

### Encrypting Files With Ansible Vault

If you want to create a new file, write some data to it, and encrypt it, then run the following command. Here the **"secretkey"** is the file name.

```
$ ansible-vault create secretkey
```

Let’s understand what happens when you run this command.

* Since this file is not available, a file will be created and opened for writing.
* You will be prompted to provide the password for this file which should be kept safe. Please remember without the password, you will not be able to decrypt the file again.

![Encrypt A New File With Ansible Vault][3]

Once the file is closed, the content will be encrypted. if you try to open the file you encrypted with a text editor/viewer application, you will see some random data as shown in the picture below.

![View Encrypted File][4]

On the first line, there is some metadata that ansible will use internally for encryption and decryption. As you see from the first line, **AES256 algorithm** is used to encrypt the file.

You can also encrypt existing files as well.

To encrypt an existing file, run the following command. Again you will be prompted to provide the vault password which will be later used to decrypt the file.

```
$ echo "api_key: 'XUITZ89776XX'" > secretkey2 # Writing random data to file
```

```
$ ansible-vault encrypt secretkey2
```

![Encrypt An Existing File][5]

### How To Change Ansible Vault Password

You can set a new vault password for any existing encrypted files by running the following command. Here you should remember your old password which will be prompted first followed by the new vault password.

```
$ ansible-vault rekey secretkey2
```

![Change Ansible Vault Password][6]

### How To Decrypt The Encrypted File

If you want to view the original content of the file, there are a few ways to do it. The first method is to run the **decrypt** command which will put the file in unencrypted form.

```
$ ansible-vault decrypt secretkey2
```

![Decrypt The Encrypted File][7]

You can also view the content of the encrypted file without decrypting by running the following command with **"view"** instead of "`decrypt` ".

```
$ ansible-vault view secretkey2
```

![View The Content Of An Encrypted File Without Decrypting It][8]

The difference between `decrypt` and `view` is that the former will remove the encryption to view the original content but the latter will just decrypt and print the content while keeping the original file encrypted.

### Modify The Contents In Encrypted File

Let’s say you want to edit the content of an encrypted file. In this case, you can either decrypt the file edit the content, or encrypt the file again. Alternatively, you can use the **"edit"** command to edit the content.

```
$ ansible-vault edit secretkey2
```

![Modify The Contents In Encrypted File][9]

The advantage with the "`edit` " command is you need not decrypt the file and encrypt it again. It will open the file for editing, and once you close the file it will be automatically encrypted.

### Encrypted Content With Ansible Playbook

Till now we have seen how to encrypt and decrypt data at the file level. You can also encrypt a string. Let’s take an example.

I have a few variables used for remote connection and it also contains a connection password. To encrypt the password run the following command. Here I am using the password as **"password"**.

Remember the vault password which will be needed to decrypt the string.

```
$ ansible-vault encrypt_string "password"
```

In the below playbook, I have created a few vars simulating connection details and **"connect_pwd"** will store the encrypted data. I am printing the "`connection_pwd` " variable using the debug module in the task.

```
- name: "Test playbook for ansible vault"
  gather_facts: False
  hosts: local

  vars:
    remote_user: produser
    default_role: prodrole
    connect_pwd: << COPY PASTE THE ENCRYPTED PASSWORD HERE >>

  tasks:

    - name: print the password
      debug:
        msg: "{{ connect_pwd }}"
```

![Use Ansible Vault In A Playbook][10]

When running the playbook, you should use either **--ask-vault-password** or **--ask-vault-pass** flag which will prompt you to enter the vault password to decrypt the string.

```
$ ansible-playbook playbook.yml --ask-vault-pass
```

![Run A Playbook With Ansible Vault][11]

If you try to run the playbook without `--ask-vault-password` or `--ask-vault-pass` flag, the task will fail with the following error.

```
fatal: [master.anslab.com]: FAILED! => {"msg": "Attempting to decrypt but no vault secrets found"}
```

You can also store the vault password in a file and pass it as an argument to `--vault-password-file` or `--vault-pass-file` argument.

When storing the vault password in a file, **make sure proper permission is set** so that only the file owner can read the content of the file.

```
$ echo "password" > .secretkey
```

```
$ chmod 600 .secretkey
```

I created a file named **.secretkey** and set the permission to **600**. Now, this file can be used to decrypt the string in my playbook.

```
$ ansible-playbook --vault-password-file .secretkey playbook.yml
```

### Store Vault Password In Ansible Configuration File

You can also store the vault password in the **ansible.cfg** file. In this case, you can run the playbook command without the need for any extra vault flags.

```
vault_password_file = .secretkey
```

You can also set the following environmental variable which will be used for all the decryption.

```
export ANSIBLE_VAULT_PASSWORD_FILE="./.secretkey"
```

### Conclusion

By this time, you should have a fair understanding of how to secure your secrets with Ansible vault. Encrypting content with Ansible Vault is quite easy and doesn't require any external tools.

Practice all the examples given in the article which will help you understand more on how an Ansible vault helps to protect the sensitive Playbook data.

**Resource:**

* [Encrypting Contents With Ansible Vault][12]

*[Featured image by Jagrit Parajuli from Pixabay.][13]*

--------------------------------------------------------------------------------

via: https://ostechnix.com/ansible-vault/

作者：[Karthick][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/karthick/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/introduction-to-ansible-automation-platform/
[2]: https://ostechnix.com/wp-content/uploads/2022/10/Ansible-Help-Section.png
[3]: https://ostechnix.com/wp-content/uploads/2022/10/Encrypt-A-New-File-With-Ansible-Vault.png
[4]: https://ostechnix.com/wp-content/uploads/2022/10/View-Encrypted-File.png
[5]: https://ostechnix.com/wp-content/uploads/2022/10/Encrypt-An-Existing-File.png
[6]: https://ostechnix.com/wp-content/uploads/2022/10/Change-Ansible-Vault-Password.png
[7]: https://ostechnix.com/wp-content/uploads/2022/10/Decrypt-The-Encrypted-File.png
[8]: https://ostechnix.com/wp-content/uploads/2022/10/View-The-Content-Of-An-Encrypted-File-Without-Decrypting-It.png
[9]: https://ostechnix.com/wp-content/uploads/2022/10/Modify-The-Contents-In-Encrypted-File.png
[10]: https://ostechnix.com/wp-content/uploads/2022/10/Use-Ansible-vault-In-A-Playbook.png
[11]: https://ostechnix.com/wp-content/uploads/2022/10/Run-A-Playbook-With-Ansible-Vault.png
[12]: https://docs.ansible.com/ansible/latest/user_guide/vault.html
[13]: https://pixabay.com/users/jagritparajuli99-8150243/?utm_source=link-attribution&utm_medium=referral&utm_campaign=image&utm_content=4558667
