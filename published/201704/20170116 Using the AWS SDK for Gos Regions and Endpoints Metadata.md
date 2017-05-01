使用 AWS 的 GO SDK 获取区域与终端节点信息
============================================================

LCTT 译注： 终端节点（Endpoint），详情请见: [http://docs.amazonaws.cn/general/latest/gr/rande.html](http://docs.amazonaws.cn/general/latest/gr/rande.html)

最新发布的 GO 的 SDK [v1.6.0][1] 版本，加入了获取区域与终端节点信息的功能。它可以很方便地列出区域、服务和终端节点的相关信息。可以通过 [github.com/aws/aws-sdk-go/aws/endpoints][3] 包使用这些功能。

endpoints 包提供了一个易用的接口，可以获取到一个服务的终端节点的 url 列表和区域列表信息。并且我们将相关信息根据 AWS 服务区域进行了分组，如 AWS 标准、AWS 中国和 AWS GovCloud（美国）。

### 解析终端节点

设置 SDK 的默认配置时， SDK 会自动地使用 `endpoints.DefaultResolver` 函数。你也可以自己调用包中的`EndpointFor` 方法来解析终端节点。

```Go
// 解析在us-west-2区域的S3服务的终端节点
resolver := endpoints.DefaultResolver()
endpoint, err := resolver.EndpointFor(endpoints.S3ServiceID, endpoints.UsWest2RegionID)
if err != nil {
        fmt.Println("failed to resolve endpoint", err)
        return
}

fmt.Println("Resolved URL:", endpoint.URL)
```

如果你需要自定义终端节点的解析逻辑，你可以实现 `endpoints.Resolver` 接口，并传值给`aws.Config.EndpointResolver`。当你打算编写自定义的终端节点逻辑，让 SDK 可以用来解析服务的终端节点时候，这个功能就会很有用。

以下示例，创建了一个配置好的 Session，然后 [Amazon S3][4] 服务的客户端就可以使用这个自定义的终端节点。


```Go
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

`endpoints.DefaultResolver` 函数的返回值可以被 `endpoints.EnumPartitions`接口使用。这样就可以获取 SDK 使用的分区片段，也可以列出每个分区的分区信息。

```Go
// 迭代所有分区表打印每个分区的ID
resolver := endpoints.DefaultResolver()
partitions := resolver.(endpoints.EnumPartitions).Partitions()

for _, p := range partitions {
        fmt.Println("Partition:", p.ID())
}
```

除了分区表之外，endpoints 包也提供了每个分区组的 getter 函数。这些工具函数可以方便列出指定分区，而不用执行默认解析器列出所有的分区。

```Go
partition := endpoints.AwsPartition()
region := partition.Regions()[endpoints.UsWest2RegionID]

fmt.Println("Services in region:", region.ID())
for id, _ := range region.Services() {
        fmt.Println(id)
}
```

当你获取区域和服务值后，可以调用 `ResolveEndpoint`。这样解析端点时，就可以提供分区的过滤视图。

获取更多 AWS SDK for GO 信息, 请关注[其开源仓库][5]。若你有更好的看法，请留言评论。


--------------------------------------------------------------------------------

via: https://aws.amazon.com/cn/blogs/developer/using-the-aws-sdk-for-gos-regions-and-endpoints-metadata

作者：[Jason Del Ponte][a]
译者：[Vic020](http://vicyu.com)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://aws.amazon.com/cn/blogs/developer/using-the-aws-sdk-for-gos-regions-and-endpoints-metadata
[1]:https://github.com/aws/aws-sdk-go/releases/tag/v1.6.0
[2]:https://github.com/aws/aws-sdk-go
[3]:http://docs.aws.amazon.com/sdk-for-go/api/aws/endpoints/
[4]:https://aws.amazon.com/s3/
[5]:https://github.com/aws/aws-sdk-go/tree/master/example/aws/endpoints
