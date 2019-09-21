使用 Kafka 和 MongoDB 进行 Go 异步处理
============================================================

在我前面的博客文章 “[我的第一个 Go 微服务：使用 MongoDB 和 Docker 多阶段构建][9]” 中，我创建了一个 Go 微服务示例，它发布一个 REST 式的 http 端点，并将从 HTTP POST 中接收到的数据保存到 MongoDB 数据库。

在这个示例中，我将数据的保存和 MongoDB 分离，并创建另一个微服务去处理它。我还添加了 Kafka 为消息层服务，这样微服务就可以异步处理它自己关心的东西了。

> 如果你有时间去看，我将这个博客文章的整个过程录制到 [这个视频中了][1] :)

下面是这个使用了两个微服务的简单的异步处理示例的上层架构图。

![rest-kafka-mongo-microservice-draw-io](https://www.melvinvivas.com/content/images/2018/04/rest-kafka-mongo-microservice-draw-io.jpg)

微服务 1 —— 是一个 REST 式微服务，它从一个 /POST http 调用中接收数据。接收到请求之后，它从 http 请求中检索数据，并将它保存到 Kafka。保存之后，它通过 /POST 发送相同的数据去响应调用者。

微服务 2 —— 是一个订阅了 Kafka 中的一个主题的微服务，微服务 1 的数据保存在该主题。一旦消息被微服务消费之后，它接着保存数据到 MongoDB 中。

在你继续之前，我们需要能够去运行这些微服务的几件东西：

1.  [下载 Kafka][2] —— 我使用的版本是 kafka_2.11-1.1.0
2.  安装 [librdkafka][3] —— 不幸的是，这个库应该在目标系统中
3.  安装 [Kafka Go 客户端][4]
4.  运行 MongoDB。你可以去看我的 [以前的文章][5] 中关于这一块的内容，那篇文章中我使用了一个 MongoDB docker 镜像。

我们开始吧！

首先，启动 Kafka，在你运行 Kafka 服务器之前，你需要运行 Zookeeper。下面是示例：

```
$ cd /<download path>/kafka_2.11-1.1.0
$ bin/zookeeper-server-start.sh config/zookeeper.properties
```

接着运行 Kafka ——  我使用 9092 端口连接到 Kafka。如果你需要改变端口，只需要在 `config/server.properties` 中配置即可。如果你像我一样是个新手，我建议你现在还是使用默认端口。

```
$ bin/kafka-server-start.sh config/server.properties
```

Kafka 跑起来之后，我们需要 MongoDB。它很简单，只需要使用这个 `docker-compose.yml` 即可。

```
version: '3'
services:
  mongodb:
    image: mongo
    ports:
      - "27017:27017"
    volumes:
      - "mongodata:/data/db"
    networks:
      - network1

volumes:
   mongodata:

networks:
   network1:
```

使用 Docker Compose 去运行  MongoDB docker 容器。

```
docker-compose up
```

这里是微服务 1 的相关代码。我只是修改了我前面的示例去保存到 Kafka 而不是 MongoDB：

[rest-to-kafka/rest-kafka-sample.go][10]

```
func jobsPostHandler(w http.ResponseWriter, r *http.Request) {

	//Retrieve body from http request
	b, err := ioutil.ReadAll(r.Body)
	defer r.Body.Close()
	if err != nil {
		panic(err)
	}

	//Save data into Job struct
	var _job Job
	err = json.Unmarshal(b, &_job)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	saveJobToKafka(_job)

	//Convert job struct into json
	jsonString, err := json.Marshal(_job)
	if err != nil {
		http.Error(w, err.Error(), 500)
		return
	}

	//Set content-type http header
	w.Header().Set("content-type", "application/json")

	//Send back data as response
	w.Write(jsonString)

}

func saveJobToKafka(job Job) {

	fmt.Println("save to kafka")

	jsonString, err := json.Marshal(job)

	jobString := string(jsonString)
	fmt.Print(jobString)

	p, err := kafka.NewProducer(&kafka.ConfigMap{"bootstrap.servers": "localhost:9092"})
	if err != nil {
		panic(err)
	}

	// Produce messages to topic (asynchronously)
	topic := "jobs-topic1"
	for _, word := range []string{string(jobString)} {
		p.Produce(&kafka.Message{
			TopicPartition: kafka.TopicPartition{Topic: &topic, Partition: kafka.PartitionAny},
			Value:          []byte(word),
		}, nil)
	}
}
```

这里是微服务 2 的代码。在这个代码中最重要的东西是从 Kafka 中消费数据，保存部分我已经在前面的博客文章中讨论过了。这里代码的重点部分是从 Kafka 中消费数据：

[kafka-to-mongo/kafka-mongo-sample.go][11]

```
func main() {

	//Create MongoDB session
	session := initialiseMongo()
	mongoStore.session = session

	receiveFromKafka()

}

func receiveFromKafka() {

	fmt.Println("Start receiving from Kafka")
	c, err := kafka.NewConsumer(&kafka.ConfigMap{
		"bootstrap.servers": "localhost:9092",
		"group.id":          "group-id-1",
		"auto.offset.reset": "earliest",
	})

	if err != nil {
		panic(err)
	}

	c.SubscribeTopics([]string{"jobs-topic1"}, nil)

	for {
		msg, err := c.ReadMessage(-1)

		if err == nil {
			fmt.Printf("Received from Kafka %s: %s\n", msg.TopicPartition, string(msg.Value))
			job := string(msg.Value)
			saveJobToMongo(job)
		} else {
			fmt.Printf("Consumer error: %v (%v)\n", err, msg)
			break
		}
	}

	c.Close()

}

func saveJobToMongo(jobString string) {

	fmt.Println("Save to MongoDB")
	col := mongoStore.session.DB(database).C(collection)

	//Save data into Job struct
	var _job Job
	b := []byte(jobString)
	err := json.Unmarshal(b, &_job)
	if err != nil {
		panic(err)
	}

	//Insert job into MongoDB
	errMongo := col.Insert(_job)
	if errMongo != nil {
		panic(errMongo)
	}

	fmt.Printf("Saved to MongoDB : %s", jobString)

}
```

我们来演示一下，运行微服务 1。确保 Kafka 已经运行了。

```
$ go run rest-kafka-sample.go
```

我使用 Postman 向微服务 1 发送数据。

![Screenshot-2018-04-29-22.20.33](https://www.melvinvivas.com/content/images/2018/04/Screenshot-2018-04-29-22.20.33.png)

这里是日志，你可以在微服务 1 中看到。当你看到这些的时候，说明已经接收到了来自 Postman 发送的数据，并且已经保存到了 Kafka。

![Screenshot-2018-04-29-22.22.00](https://www.melvinvivas.com/content/images/2018/04/Screenshot-2018-04-29-22.22.00.png)

因为我们尚未运行微服务 2，数据被微服务 1 只保存在了 Kafka。我们来消费它并通过运行的微服务 2 来将它保存到 MongoDB。

```
$ go run kafka-mongo-sample.go
```

现在，你将在微服务 2 上看到消费的数据，并将它保存到了 MongoDB。

![Screenshot-2018-04-29-22.24.15](https://www.melvinvivas.com/content/images/2018/04/Screenshot-2018-04-29-22.24.15.png)

检查一下数据是否保存到了 MongoDB。如果有数据，我们成功了！

![Screenshot-2018-04-29-22.26.39](https://www.melvinvivas.com/content/images/2018/04/Screenshot-2018-04-29-22.26.39.png)

完整的源代码可以在这里找到：

[https://github.com/donvito/learngo/tree/master/rest-kafka-mongo-microservice][12]

现在是广告时间：如果你喜欢这篇文章，请在 Twitter [@donvito][6] 上关注我。我的 Twitter 上有关于 Docker、Kubernetes、GoLang、Cloud、DevOps、Agile 和 Startups 的内容。欢迎你们在 [GitHub][7] 和 [LinkedIn][8] 关注我。

开心地玩吧！

--------------------------------------------------------------------------------

via: https://www.melvinvivas.com/developing-microservices-using-kafka-and-mongodb/

作者：[Melvin Vivas][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.melvinvivas.com/author/melvin/
[1]:https://youtu.be/xa0Yia1jdu8
[2]:https://kafka.apache.org/downloads
[3]:https://github.com/confluentinc/confluent-kafka-go
[4]:https://github.com/confluentinc/confluent-kafka-go
[5]:https://www.melvinvivas.com/my-first-go-microservice/
[6]:https://twitter.com/donvito
[7]:https://github.com/donvito
[8]:https://www.linkedin.com/in/melvinvivas/
[9]:https://www.melvinvivas.com/my-first-go-microservice/
[10]:https://github.com/donvito/learngo/tree/master/rest-kafka-mongo-microservice/rest-to-kafka
[11]:https://github.com/donvito/learngo/tree/master/rest-kafka-mongo-microservice/kafka-to-mongo
[12]:https://github.com/donvito/learngo/tree/master/rest-kafka-mongo-microservice
