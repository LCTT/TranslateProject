[#]: subject: (5 ways to protect your documents with open source software)
[#]: via: (https://opensource.com/article/21/4/secure-documents-open-source)
[#]: author: (Ksenia Fedoruk https://opensource.com/users/ksenia-fedoruk)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

5 ways to protect your documents with open source software
======
Control your own data so that unauthorized users can't access it.
![Filing papers and documents][1]

Users have every right to be concerned about the safety and security of their data. When you create data on a computer, it's reasonable to want exclusive control over it.

There are many ways to protect your documents. At the filesystem level, you can [encrypt your hard drive][2] or [just a file][3]. A good office suite affords you many more options, though, and I've gathered five of the methods I use to secure my documents with open source software.

### 5 ways to secure your docs

#### 1\. Keeping documents in secure cloud storage services

Self-hosting an open source content management system (CMS) platform gives you complete control over your data. All your data stays on your server, and you control who has access to it.

**Options:** [Nextcloud][4], [ownCloud][5], [Pydio][6], and [Seafile][7]

All of these offer functionality for storing, syncing, and sharing documents and folders, managing content, file versioning, and so on. They can easily replace Dropbox, Google Drive, and other proprietary cloud storage that place your data on servers you don't own, maintain, or govern.

The open source self-hosted options listed above are compliant with GDPR and other international regulations that protect user data. They offer backup and data recovery options, auditing and monitoring tools, permissions management, and data encryption.

![Pydio audit control][8]

Audit control in Pydio Cells. (Source: [Pydio.com][9])

#### 2\. Enabling encryption at rest, in transit, and end-to-end

We often speak of data encryption in general terms, but there are several aspects to consider when encrypting files:

  * With **encryption at rest** (or disk encryption), you can protect data stored within your infrastructure or on your hard drive.
  * **Encryption in transit** protects data as traffic when it's using protocols like HTTPS. It protects your data from being intercepted and transformed as it moves from one location to another. This is important when you upload documents to your cloud.
  * **End-to-end encryption** (E2EE) protects data by encrypting it on one end and decrypting it on the other. No third party can read your documents, even if they interfere in the process and get access to the files unless they have the decryption key.



**Options:** CryptPad, ownCloud, ONLYOFFICE Workspace, Nextcloud, and Seafile

ownCloud, ONLYOFFICE Workspace, Nextcloud, and Seafile support all three layers of encryption. They differ in how they implement end-to-end encryption:

  * In ownCloud, there's an E2EE plugin that allows you to encrypt folder sharing.
  * In Nextcloud, there's a folder-level option available in the desktop client.
  * Seafile provides client-side E2EE by creating encrypted libraries.
  * [ONLYOFFICE Workspace][10] not only allows you to encrypt your documents while storing and sharing them, but it also permits you to securely co-edit them in real time in Private Rooms. The encryption data is automatically generated and transferred and is encrypted itself—you don't have to keep or remember any passwords.
  * [CryptPad][11], as its name suggests, is completely private. All content is encrypted and decrypted by your browser. This means documents, chats, and files are unreadable outside the session where you are logged in. Even the service administrators can't get your information.



![Encrypted CryptPad storage][12]

Encrypted CryptPad storage. (Source: [Cryptpad.fr][13])

#### 3\. Using digital signatures

Digital signatures allow you to verify that you originated a document's content and no alterations have been made to it.

**Options:** LibreOffice Writer, ONLYOFFICE Desktop Editors, OpenESignForms, and SignServer

[LibreOffice][14] and [ONLYOFFICE][15] suites provide an integrated tool to digitally sign documents. You can add a signature line that is visible in the document text and allows you to request signatures from other users.

Once you apply a digital signature, no one can edit the document. If someone changes the document, the signature becomes invalid, so you'll know the content was modified.

In ONLYOFFICE, you can sign OOXML files (e.g., DOCX, XLSX, PPTX) in LibreOffice as ODFs and PDFs. If you try to sign an OOXML document in LibreOffice, the signature will be marked with "only parts of the document are signed."

![Digital signature in ONLYOFFICE][16]

Digital signature in ONLYOFFICE. (Source: [ONLYOFFICE Help Center][17])

[SignServer][18] and [Open eSignForms][19] are free electronic signature services that you can use if you don't need to sign a document right in the editor. Both tools allow you to work with documents, and SignServer also enables you to sign code, including Java, and apply time stamping.

#### 4\. Watermarking

Watermarks avoid unauthorized redistribution of your content and protect any confidential information your files might contain.

**Options:** Collabora Online in Nextcloud or ONLYOFFICE Docs in Nextcloud

[ONLYOFFICE Docs][20] and [Collabora][21], when integrated with Nextcloud, allow you to embed a watermark in your documents, spreadsheets, and presentations. To activate watermarking, you have to log into your Nextcloud instance as an admin and go to **Secure view settings** on the solution's Settings page.

You can replace the default watermark with your own text using the placeholders. The watermark will be displayed individually for each user when opening a file. You can also define groups to differentiate users who will see the watermark and select the types of shares that must show the watermark.

![Watermark][22]

Watermarking (Ksenia Fedoruk, [CC BY-SA 4.0][23])

You can also insert watermarks in your docs in the LibreOffice and ONLYOFFICE desktop apps. However, in this case, it's just a text or an image placed under the main text layer, so anyone can remove it easily.

#### 5\. Protecting documents with passwords

Password protection allows you to store and exchange local files securely. If someone accesses your desktop or gets the protected file via email or another method, they won't be able to open it without knowing the password.

**Options:** Apache OpenOffice, LibreOffice, and ONLYOFFICE Desktop Editors

All three solutions offer you the ability to set a password for your sensitive documents.

If a protected doc is important to you, it is strongly recommended you save the password using a password manager or memorize it because LibreOffice, ONLYOFFICE, and [OpenOffice][24] don't offer a password-recovery option. So, if you forget or lose the password, there is no ability to restore or reset it and open the file.

### Your data belongs to you

Protect your documents using one or more of these methods to stay safer online. It's the 21st century, and computing is too advanced to risk giving your data to a service outside your control. Use open source and take ownership of your digital life.

What are your favorite tools for working securely with docs? Please share them in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/secure-documents-open-source

作者：[Ksenia Fedoruk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksenia-fedoruk
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/documents_papers_file_storage_work.png?itok=YlXpAqAJ (Filing papers and documents)
[2]: https://opensource.com/article/21/3/encryption-luks
[3]: https://opensource.com/article/21/3/luks-truecrypt
[4]: https://nextcloud.com/
[5]: https://owncloud.com/
[6]: https://pydio.com/
[7]: https://www.seafile.com/en/home/
[8]: https://opensource.com/sites/default/files/uploads/pydiocells.png (Pydio audit control)
[9]: http://pydio.com
[10]: https://www.onlyoffice.com/workspace.aspx
[11]: https://cryptpad.fr/
[12]: https://opensource.com/sites/default/files/uploads/cryptdrive.png (Encrypted CryptPad storage)
[13]: http://cryptpad.fr
[14]: https://www.libreoffice.org/
[15]: https://www.onlyoffice.com/desktop.aspx
[16]: https://opensource.com/sites/default/files/uploads/onlyoffice_digitalsig.png (Digital signature in ONLYOFFICE)
[17]: http://helpcenter.onlyoffice.com
[18]: https://www.signserver.org/
[19]: https://github.com/OpenESignForms
[20]: https://www.onlyoffice.com/office-for-nextcloud.aspx
[21]: https://www.collaboraoffice.com/
[22]: https://opensource.com/sites/default/files/uploads/onlyoffice_watermark.png (Watermark)
[23]: https://creativecommons.org/licenses/by-sa/4.0/
[24]: https://www.openoffice.org/
