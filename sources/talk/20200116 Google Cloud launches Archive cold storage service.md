[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Google Cloud launches Archive cold storage service)
[#]: via: (https://www.networkworld.com/article/3513903/google-cloud-launches-archive-cold-storage-service.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Google Cloud launches Archive cold storage service
======
Archive will focus on long-term data retention and compete against AWS Glacier, Microsoft Cool Blob Storage, and IBM Cloud Storage.
Google

Google Cloud announced the general availability of Archive, a long-term data retention service intended as an alternative to on-premises tape backup.

Google pitches it as cold storage, meaning it is for data which is accessed less than once a year and has been stored for many years. Cold storage data is usually consigned to tape backup, which remains a [surprisingly successful][1] market despite repeated predictions of its demise.

Of course, Google's competition has their own products. Amazon Web Services has Glacier, Microsoft has Cool Blob Storage, and IBM has Cloud Storage. Google also offers its own Coldline and Nearline cloud storage offerings; Coldline is designed for data a business expects to touch less than once a quarter, while Nearline is aimed at data that requires access less than once a month.

[][2]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][2]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

With Archive, Google highlights a few differentiators from the competition and its own archival offerings. First, Google promises no delay on data retrieval, claiming millisecond latency. AWS can take minutes or hours. While Archive costs a little more than AWS and Azure – $1.23 per terabyte per month vs. $1 per terabyte per month for AWS and Azure – that’s due in part to the longer remit for an early deletion charge. Google offers 365 days compared with 180 days for AWS and Azure.

"Having flexible storage options allows you to optimize your total cost of ownership while meeting your business needs," [wrote][3] Geoffrey Noer, Google Cloud storage product manager in a blog post announcing the service’s availability. "At Google Cloud, we think that you should have a range of straightforward storage options that allow you to more securely and reliably access your data when and where you need it, without performance bottlenecks or delays to your users."

Archive is a store-and-forget service, where you keep stuff only because you have to. Tape replacement and archiving data under regulatory retention requirements are two of the most common use cases, according to Google. Other examples include long-term backups and original master copies of videos and images.

The Archive class can also be combined with [Bucket Lock][4], Google Cloud’s data locking mechanism to prevent data from being modified, which is available to enterprises for meeting various data retention laws, according to Noer.

  * [Backup vs. archive: Why it’s important to know the difference][5]
  * [How to pick an off-site data-backup method][6]
  * [Tape vs. disk storage: Why isn’t tape dead yet?][7]
  * [The correct levels of backup save time, bandwidth, space][8]



The Archive class can be set up in dual-regions or multi-regions for geo-redundancy and offers checksum verification durability of "11 nines" – 99.999999999 percent.

More information can be found [here][9].

Join the Network World communities on [Facebook][10] and [LinkedIn][11] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3513903/google-cloud-launches-archive-cold-storage-service.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3263452/theres-still-a-lot-of-life-left-in-tape-backup.html
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://cloud.google.com/blog/products/storage-data-transfer/archive-storage-class-for-coldest-data-now-available
[4]: https://cloud.google.com/storage/docs/bucket-lock
[5]: https://www.networkworld.com/article/3285652/storage/backup-vs-archive-why-its-important-to-know-the-difference.html
[6]: https://www.networkworld.com/article/3328488/backup-systems-and-services/how-to-pick-an-off-site-data-backup-method.html
[7]: https://www.networkworld.com/article/3315156/storage/tape-vs-disk-storage-why-isnt-tape-dead-yet.html
[8]: https://www.networkworld.com/article/3302804/storage/the-correct-levels-of-backup-save-time-bandwidth-space.html
[9]: https://cloud.google.com/blog/products/storage-data-transfer/whats-cooler-than-being-cool-ice-cold-archive-storage
[10]: https://www.facebook.com/NetworkWorld/
[11]: https://www.linkedin.com/company/network-world
