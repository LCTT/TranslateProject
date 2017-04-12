使用AWS的GO SDK获取区域与Endpoint信息
============================================================

<section itemprop="articleBody" style="font-family: HelveticaNeue, Helvetica, Helvetica, Arial, sans-serif;">

译注: Endpoint选择不翻译是因为在查阅官方文档中时候发现, 它并不是指代某个端点,而是某个服务,或者区域或者是主机等的url.[详情请见: http://docs.aws.amazon.com/general/latest/gr/rande.html](http://docs.aws.amazon.com/general/latest/gr/rande.html)

最新发布的GO的SDK[v1.6.0][1]版本, 加入了获取区域与Endpoint信息的功能. 它可以很方便地列出区域, 服务 和Endpoint的相关信息.可以通过[github.com/aws/aws-sdk-go/aws/endpoints][3]包使用这些功能.

endpoints包提供了一个易用的接口,可以获取到一个服务的endpoint url列表和区域列表信息.并且我们将相关信息根据AWS服务区域进行了分组,如 AWS 标准, AWS 中国, and AWS GovCloud (美国).

### 解析Endpoint

设置SDK的默认配置时, SDK会自动地使用endpoints.DefaultResolver函数. 你也可以自己调用包中的EndpointFor方法来解析endpoint.

Go
```
// 解析在us-west-2区域的S3服务的endpoint
resolver := endpoints.DefaultResolver()
endpoint, err := resolver.EndpointFor(endpoints.S3ServiceID, endpoints.UsWest2RegionID)
if err != nil {
        fmt.Println("failed to resolve endpoint", err)
        return
}

fmt.Println("Resolved URL:", endpoint.URL)
```

如果你需要自定义endpoint的解析逻辑,你可以实现endpoints.Resolver接口, 并传值给aws.Config.EndpointResolver. 当你打算编写自定义的endpoint逻辑,让sdk可以用来解析服务endpoint时候,这个功能就会很有用.

以下示例, 创建了一个配置好的Session, 然后[Amazon S3][4]服务的客服端就可以使用这个自定义的endpoint.

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

### 分区

endpoints.DefaultResolver函数的返回值可以被endpoints.EnumPartitions接口使用.这样就可以获取SDK使用的分区片段，也可以列出每个分区的分区信息。

Go
```
// 迭代所有分区表打印每个分区的ID
resolver := endpoints.DefaultResolver()
partitions := resolver.(endpoints.EnumPartitions).Partitions()

for _, p := range partitions {
        fmt.Println("Partition:", p.ID())
}
```

除了分区表之外, endpoints包也提供了每个分区组的getter函数. 这些工具函数可以方便列出指定分区,而不用执行默认解析器列出所有的分区.

Go
```
partition := endpoints.AwsPartition()
region := partition.Regions()[endpoints.UsWest2RegionID]

fmt.Println("Services in region:", region.ID())
for id, _ := range region.Services() {
        fmt.Println(id)
}
```

当你获取区域和服务值后, 可以调用ResolveEndpoint. 这样解析端点时,就可以提供分区的过滤视图.

获取更多AWS SDK for GO信息, 请关注[开源库][5]. 若你有更好的看法,请留言评论.

</section>

--------------------------------------------------------------------------------

via: https://aws.amazon.com/cn/blogs/developer/using-the-aws-sdk-for-gos-regions-and-endpoints-metadata

作者：[ Jason Del Ponte][a]
译者：[Vic020](http://vicyu.com)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://aws.amazon.com/cn/blogs/developer/using-the-aws-sdk-for-gos-regions-and-endpoints-metadata
[1]:https://github.com/aws/aws-sdk-go/releases/tag/v1.6.0
[2]:https://github.com/aws/aws-sdk-go
[3]:http://docs.aws.amazon.com/sdk-for-go/api/aws/endpoints/
[4]:https://aws.amazon.com/s3/
[5]:https://github.com/aws/aws-sdk-go/tree/master/example/aws/endpoints
