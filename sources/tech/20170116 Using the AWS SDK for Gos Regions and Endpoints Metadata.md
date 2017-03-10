Using the AWS SDK for Go’s Regions and Endpoints Metadata
============================================================

<section itemprop="articleBody" style="font-family: HelveticaNeue, Helvetica, Helvetica, Arial, sans-serif;">

In release [v1.6.0][1] of the [AWS SDK for Go][2], we added Regions and Endpoints metadata to the SDK. This feature enables you to easily enumerate the metadata and discover Regions, Services, and Endpoints. You can find this feature in the [github.com/aws/aws-sdk-go/aws/endpoints][3] package.

The endpoints package provides a simple interface to get a service’s endpoint URL and enumerate the Region metadata. The metadata is grouped into partitions. Each partition is a group of AWS Regions such as AWS Standard, AWS China, and AWS GovCloud (US).

### Resolving Endpoints

The SDK automatically uses the endpoints.DefaultResolver function when setting the SDK’s default configuration. You can resolve endpoints yourself by calling the EndpointFor methods in the endpoints package.

Go
```
// Resolve endpoint for S3 in us-west-2
resolver := endpoints.DefaultResolver()
endpoint, err := resolver.EndpointFor(endpoints.S3ServiceID, endpoints.UsWest2RegionID)
if err != nil {
        fmt.Println("failed to resolve endpoint", err)
        return
}

fmt.Println("Resolved URL:", endpoint.URL)
```

If you need to add custom endpoint resolution logic to your code, you can implement the endpoints.Resolver interface, and set the value to aws.Config.EndpointResolver. This is helpful when you want to provide custom endpoint logic that the SDK will use for resolving service endpoints.

The following example creates a Session that is configured so that [Amazon S3][4] service clients are constructed with a custom endpoint.

Go
```
s3CustResolverFn := func(service, region string, optFns ...func(*endpoints.Options)) (endpoints.ResolvedEndpoint, error) {
        if service == "s3" {
               return endpoints.ResolvedEndpoint{
                       URL:           "s3.custom.endpoint.com",
                       SigningRegion: "custom-signing-region",
               }, nil
        }

        return defaultResolver.EndpointFor(service, region, optFns...)
}
sess := session.Must(session.NewSessionWithOptions(session.Options{
        Config: aws.Config{
               Region:           aws.String("us-west-2"),
               EndpointResolver: endpoints.ResolverFunc(s3CustResolverFn),
        },
}))
```

### Partitions

The return value of the endpoints.DefaultResolver function can be cast to the endpoints.EnumPartitions interface. This will give you access to the slice of partitions that the SDK will use, and can help you enumerate over partition information for each partition.

Go
```
// Iterate through all partitions printing each partition's ID.
resolver := endpoints.DefaultResolver()
partitions := resolver.(endpoints.EnumPartitions).Partitions()

for _, p := range partitions {
        fmt.Println("Partition:", p.ID())
}
```

In addition to the list of partitions, the endpoints package also includes a getter function for each partition group. These utility functions enable you to enumerate a specific partition without having to cast and enumerate over all the default resolver’s partitions.

Go
```
partition := endpoints.AwsPartition()
region := partition.Regions()[endpoints.UsWest2RegionID]

fmt.Println("Services in region:", region.ID())
for id, _ := range region.Services() {
        fmt.Println(id)
}
```

Once you have a Region or Service value, you can call ResolveEndpoint on it. This provides a filtered view of the Partition when resolving endpoints.

Check out the AWS SDK for Go repo for [more examples][5]. Let us know in the comments what you think of the endpoints package.

</section>

--------------------------------------------------------------------------------

via: https://aws.amazon.com/cn/blogs/developer/using-the-aws-sdk-for-gos-regions-and-endpoints-metadata

作者：[ Jason Del Ponte][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://aws.amazon.com/cn/blogs/developer/using-the-aws-sdk-for-gos-regions-and-endpoints-metadata
[1]:https://github.com/aws/aws-sdk-go/releases/tag/v1.6.0
[2]:https://github.com/aws/aws-sdk-go
[3]:http://docs.aws.amazon.com/sdk-for-go/api/aws/endpoints/
[4]:https://aws.amazon.com/s3/
[5]:https://github.com/aws/aws-sdk-go/tree/master/example/aws/endpoints
