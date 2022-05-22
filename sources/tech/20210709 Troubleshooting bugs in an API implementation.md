[#]: subject: (Troubleshooting bugs in an API implementation)
[#]: via: (https://opensource.com/article/21/7/listing-prefixes-s3-implementations)
[#]: author: (Alay Patel https://opensource.com/users/alpatel)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Troubleshooting bugs in an API implementation
======
Different API versions can cause unexpected problems.
![magnifying glass on computer screen, finding a bug in the code][1]

As distributed and cloud computing adoption increase, things are intrinsically getting harder to debug. This article shares a situation where you would expect a library to safeguard against different versions of an API. However, it didn't and it caused unexpected behavior that was very hard to debug. This might be a useful example of how ripping out layers of abstractions is sometimes necessary to get to the root cause of a problem in a systematic manner.

The S3 (Simple Storage Solution) API is an industry standard that provides the capability to interact with cloud storage programmatically. Many cloud providers implement it as one of the ways to interact with the object-store. Having different vendors to choose from is good to avoid vendor lock-in. Also, having different implementations to choose from means you get to select open source implementations of the popular standard that works best for you and your team.

However, the differences in API versions may cause unexpected problems, as we learned. This article leverages those differences to illustrate the troubleshooting process.

### Konveyor Crane

[Crane][2] is part of the [Konveyor community][3], which works to solve problems related to app modernization and portability to further the adoption of Kubernetes. Crane allows users to migrate applications (and the associated data) deployed on OpenShift 3 to OpenShift 4. Behind the scenes, it uses [Velero][4] to orchestrate the migration. Velero uses the object store to perform backup and restore operations.

### How Velero stores data

Velero can be configured to use a bucket from the object store as a backup storage location (where backup data is stored). Velero organizes backups in a directory called `<prefix>/backups` (with `prefix` being configurable). Under the `backups` directory, Velero creates a separate directory for each backup, e.g., `<prefix>/backups/<backup-name>`.

Additionally, to ensure that a backup created in the object store is available in the cluster and available for restoration, Velero makes a prefix list of all the directories under `backups`. It uses the ListObjectsV2 S3 API to implement this. The [ListObjectsV2][5] API differs from the [ListObjects][6] API in how it handles pagination.

### How API differences produced a bug

The differences between these two API versions are subtle. First, clients see the difference in the request that they send to the S3 server. When requesting a ListObjectV2, the client sends something like this:


```
GET /?list-type=2&amp;delimiter=Delimiter&amp;prefix=Prefix
HTTP/1.1
Host: Bucket.s3.example.objectstorage.softlayer.net
x-amz-request-payer: RequestPayer
x-amz-expected-bucket-owner: ExpectedBucketOwner
```

For ListObjects, the request looks very similar, but it's missing `list-type=2`:


```
GET /?delimiter=Delimiter&amp;marker=Marker&amp;prefix=Prefix
HTTP/1.1
Host: Bucket.s3.example.objectstorage.softlayer.net
x-amz-request-payer: RequestPayer
x-amz-expected-bucket-owner: ExpectedBucketOwner
```

For a server that ignores the `list-type=2` parameter, it is easy to respond to a basic ListObjectsV2 call with a ListObject response type.

The interesting difference between the API versions' response types is how pagination is implemented. Both versions share a common field called `isTruncated` in the response; this indicates whether the server has sent a complete set of keys in its response. In ListObjectsV2, this field is used along with the `NextContinuousToken` field to get the next page (and, hence, the next set of keys) and is iterated upon until the `isTruncated` field is false. However, in ListObjects API, the `NextMarker` field is used instead. There are subtle differences in how this is implemented.

### Our observations

When we observed the Velero debug logs, we discovered 555 total backup objects were found. However, when we ran the [s3cmd][7] command against the same bucket to list objects, it returned 788. After looking at the debug logs of the s3cmd command-line interface (CLI), we found that the s3cmd could talk to the server using ListObjects. We also noticed that the last field on the first page of the s3cmd debug log was the last field Velero saw in its list. This immediately rang bells that pagination is not implemented correctly with the ListObjectsV2 API.

In a ListObjectsV2 API, the `NextContinuousToken` field is used to take the client to the next page, and the `ListObjectV2Pages` method in the `aws-go-sdk` uses this field in its implementation. The logic is: if the `NextContinuousToken` field is empty, no more pages exist, so set `LastPage=true`.

Considering that a server could send a ListObject response without a `NextContinuousToken` set on a ListObjectV2Pages API call, it is clear that if the response is pagination with a ListObject response, ListObjectsV2Pages will read only the first page. This is exactly what happened and was verified by observing it in a debugger using a [sample program][8].

Simply by changing Velero's implementation to use the ListObjectsPages method (which uses the ListObjects API), Velero was able to report a backup count of 788, which was consistent with the s3cmd CLI.

Because of this semantic difference, the customer's migration efforts were blocked. The root cause stemmed from the libraries being used, and the analysis unblocked the customer.

### Conclusion

This case study shows how implementations of something as widely adopted as the S3 API could have bugs and can cause problems in unexpected ways.

To follow the technical analysis of how Konveyor's development team is solving modernization and migration issues, check out our engineering [knowledge base][9]. For updates on the Konveyor tools, join the community at [konveyor.io][10]

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/listing-prefixes-s3-implementations

作者：[Alay Patel][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alpatel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/mistake_bug_fix_find_error.png?itok=PZaz3dga (magnifying glass on computer screen, finding a bug in the code)
[2]: https://www.konveyor.io/crane
[3]: https://www.redhat.com/en/blog/red-hat-and-ibm-research-launch-konveyor-project
[4]: https://velero.io/
[5]: https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectsV2.html
[6]: https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjects.html
[7]: https://s3tools.org/usage
[8]: https://gist.github.com/alaypatel07/c2a1f34095813e8887ddcb3f6e90d262
[9]: http://engineering.konveyor.io/
[10]: https://konveyor.io/
