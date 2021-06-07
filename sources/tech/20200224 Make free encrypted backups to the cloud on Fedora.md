[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Make free encrypted backups to the cloud on Fedora)
[#]: via: (https://fedoramagazine.org/make-free-encrypted-backups-to-the-cloud-on-fedora/)
[#]: author: (Curt Warfield https://fedoramagazine.org/author/rcurtiswarfield/)

Make free encrypted backups to the cloud on Fedora
======

![][1]

Most free cloud storage is limited to 5GB or less. Even Google Drive is limited to 15GB. While not heavily advertised, IBM offers free accounts with a whopping **25GB** of cloud storage for free. This is not a limited time offer, and you don’t have to provide a credit card. It’s absolutely free! Better yet, since it’s S3 compatible, most of the S3 tools available for backups should work fine.

This article will show you how to use restic for encrypted backups onto this free storage. Please also refer to [this previous Magazine article about installing and configuring restic.][2] Let’s get started!

### Creating your free IBM account and storage

Head over to the IBM cloud services site and follow the steps to sign up for a free account here: <https://cloud.ibm.com/registration>. You’ll need to verify your account from the email confirmation that IBM sends to you.

Then log in to your account to bring up your dashboard, at <https://cloud.ibm.com/>.

Click on the **Create resource** button.

![][3]

Click on **Storage** and then **Object Storage**.

![][4]

Next click on the **Create Bucket** button.

![][5]

This brings up the **Configure your resource** section.

![][6]

Next, click on the ****Create** button to use the default settings.

![][7]

Under **Predefined buckets** click on the **Standard** box:

![][8]

A unique bucket name is automatically created, but it’s suggested that you change this.

![][9]

In this example, the bucket name is changed to __freecloudstorage_._**

Click on the **Next** button after choosing a bucket name:

![][10]

Continue to click on the **Next** button until you get the the **Summary** page:

![][11]

Scroll down to the **Endpoints** section.

![][12]

The information in the **Public** section is the location of your bucket. This is what you need to specify in restic when you create your backups. In this example, the location is **s3.us-south.cloud-object-storage.appdomain.cloud**.

### Making your credentials

The last thing that you need to do is create an access ID and secret key. To start, click on **Service credentials**.

![][13]

Click on the **New credential** button.

![][14]

Choose a name for your credential, make sure you check the **Include HMAC Credential** box and then click on the **Add** button. In this example I’m using the name **resticbackup**.

![][15]

Click on **View credentials**.

![][16]

The _access_key_id_ and _secret_access_key_ is what you are looking for. (For obvious reasons, the author’s details here are obscured.)

You will need to export these by calling them with the _export_ alias in the shell, or putting them into a backup script.

![][17]

### Preparing a new repository

Restic refers to your backup as a _repository_, and can make backups to any bucket on your IBM cloud account. First, setup the following environment variables using your _access_key_id_ and _secret_access_key_ that you retrieved from your IBM cloud bucket. These can also be set in any backup script you may create.

```
$ export AWS_ACCESS_KEY_ID=<MY_ACCESS_KEY>
$ export AWS_SECRET_ACCESS_KEY=<MY_SECRET_ACCESS_KEY>
```

Even though you are using IBM Cloud and not AWS, as previously mentioned, IBM Cloud storage is S3 compatible, and restic uses its interal AWS commands for any S3 compatible storage. So these AWS keys really refer to the keys from your IBM bucket.

Create the repository by initializing it. A prompt appears for you to type a password for the repository. _**Do not lose this password because your data is irrecoverable without it!**_

```
restic -r s3:http://PUBLIC_ENDPOINT_LOCATION/BUCKET init
```

The _PUBLIC_ENDPOINT_LOCATION_ was specified in the Endpoint section of your Bucket summary.

![][18]

For example:

```
$ restic -r s3:http://s3.us-south.cloud-object-storage.appdomain.cloud/freecloudstorage init
```

### Creating backups

Now it’s time to backup some data. Backups are called _snapshots_. Run the following command and enter the repository password when prompted.

```
restic -r s3:http://PUBLIC_ENDPOINT_LOCATION/BUCKET backup files_to_backup
```

For example:

```
$ restic -r s3:http://s3.us-south.cloud-object-storage.appdomain.cloud/freecloudstorage backup Documents/
Enter password for repository:
 repository 106a2eb4 opened successfully, password is correct
 Files:          51 new,     0 changed,     0 unmodified
 Dirs:            0 new,     0 changed,     0 unmodified
 Added to the repo: 11.451 MiB
 processed 51 files, 11.451 MiB in 0:06
 snapshot 611e9577 saved
```

### Restoring from backups

Now that you’ve backed up some files, it’s time to make sure you know how to restore them. To get a list of all of your backup snapshots, use this command:

```
restic -r s3:http://PUBLIC_ENDPOINT_LOCATION/BUCKET snapshots
```

For example:

```
$ restic -r s3:http://s3.us-south.cloud-object-storage.appdomain.cloud/freecloudstorage snapshots
Enter password for repository:
ID       Date                Host   Tags  Directory
-------------------------------------------------------------------
106a2eb4 2020-01-15 15:20:42 client /home/curt/Documents
```

To restore an entire snapshot, run a command like this:

```
restic -r s3:http://s3.us-south.cloud-object-storage.appdomain.cloud/freecloudstorage restore snapshotID --target restoreDirectory
```

For example:

```
$ restic -r s3:http://s3.us-south.cloud-object-storage.appdomain.cloud/freecloudstorage restore 106a2eb4 --target ~
Enter password for repository:
repository 106a2eb4 opened successfully, password is correct
restoring <Snapshot 106a2eb4 of [/home/curt/Documents]
```

If the directory still exists on your system, be sure to specify a different location for the *restoreDirectory. *For example:

```
restic -r s3:http://s3.us-south.cloud-object-storage.appdomain.cloud/freecloudstorage restore 106a2eb4 --target /tmp
```

To restore an individual file, run a command like this:

```
restic -r s3:http://PUBLIC_ENDPOINT_LOCATION/BUCKET restore snapshotID --target restoreDirectory --include filename
```

For example:

```
$ restic -r s3:http://s3.us-south.cloud-object-storage.appdomain.cloud/freecloudstorage restore 106a2eb4 --target /tmp --include file1.txt
Enter password for repository:
restoring <Snapshot 106a2eb4 of [/home/curt/Documents] at 2020-01-16 15:20:42.833131988 -0400 EDT by curt@client> to /tmp
```

* * *

_Photo by [Alex Machado][19] on [Unsplash][20]._

[EDITORS NOTE: The Fedora Project is [sponsored][21] by [Red Hat][22], which is owned by [IBM][23].]

[EDITORS NOTE: Updated at 1647 UTC on 24 February 2020 to correct a broken link.]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/make-free-encrypted-backups-to-the-cloud-on-fedora/

作者：[Curt Warfield][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/rcurtiswarfield/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/01/encrypted-backups-ibm-cloud-816x345.jpg
[2]: https://fedoramagazine.org/use-restic-encrypted-backups/
[3]: https://fedoramagazine.org/wp-content/uploads/2020/01/ibmclouddash-3-e1579713553261.png
[4]: https://fedoramagazine.org/wp-content/uploads/2020/01/ibmcloudresourcestorage-3.png
[5]: https://fedoramagazine.org/wp-content/uploads/2020/01/ibmcloudbucket-3.png
[6]: https://fedoramagazine.org/wp-content/uploads/2020/01/ibmcloudbucket2.png
[7]: https://fedoramagazine.org/wp-content/uploads/2020/01/ibmcloudbucket3-e1579713758635.png
[8]: https://fedoramagazine.org/wp-content/uploads/2020/01/ibmcloudbucket4.png
[9]: https://fedoramagazine.org/wp-content/uploads/2020/01/createbucket1.png
[10]: https://fedoramagazine.org/wp-content/uploads/2020/01/next.png
[11]: https://fedoramagazine.org/wp-content/uploads/2020/01/bucketsummary-1024x368.png
[12]: https://fedoramagazine.org/wp-content/uploads/2020/01/endpoints-1024x272.png
[13]: https://fedoramagazine.org/wp-content/uploads/2020/01/servicecreds.png
[14]: https://fedoramagazine.org/wp-content/uploads/2020/01/newcred.png
[15]: https://fedoramagazine.org/wp-content/uploads/2020/01/addnewcred.png
[16]: https://fedoramagazine.org/wp-content/uploads/2020/01/keys-1024x298.png
[17]: https://fedoramagazine.org/wp-content/uploads/2020/01/keys2.png
[18]: https://fedoramagazine.org/wp-content/uploads/2020/01/publicendpoint.png
[19]: https://unsplash.com/@alexmachado?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[20]: https://unsplash.com/s/photos/backups-to-cloud?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[21]: https://getfedora.org/sponsors/
[22]: https://redhat.com
[23]: https://www.ibm.com/cloud/redhat
