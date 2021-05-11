[#]: subject: (Getting started with edge development on Linux using open source)
[#]: via: (https://opensource.com/article/21/5/edge-quarkus-linux)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Getting started with edge development on Linux using open source
======
Leverage Quarkus to scale IoT application development and deployment
environments.
![Looking at a map][1]

There are many reasons why Linux is such a popular platform for processing Internet of Things (IoT) edge applications. A major one is transparency. Linux security capabilities are built on open source projects, giving users a transparent view of security risks and threats and enables them to apply fixes quickly with security module patches or kernel-level updates. Another Linux advantage is that developers can choose from various programming languages to develop, test, and run device communications over various networking protocols—other than HTTP(s)—when developing IoT edge applications. It also enables developers to address server programming for controlling data flow from IoT devices to front-end graphical user interface (GUI) applications.

This article explains how to get started with IoT edge development using [Quarkus][2], a cloud-native Java framework that enables you to integrate a lightweight [message broker][3] for processing data streams from IoT devices in a reactive way.

For this article, I'm using [CentOS Stream][4], which I feel provides a reliable open source platform to handle the business applications I work on, from traditional enterprise Java to cloud, IoT edge, artificial intelligence (AI), and machine learning (ML) environments. It's a midstream platform operating between [Fedora][5] and [Red Hat Enterprise Linux][6] (RHEL).

**[Read next: [Deploy Quarkus everywhere with RHEL][7]]**

![High-level architecture for IoT edge development][8]

(Daniel Oh, [CC BY-SA 4.0][9])

You don't have to use CentOS to use Quarkus, of course. However, if you want to follow along with this article precisely, you can install [CentOS Stream][10] so there will be no difference between what you read here and what you see onscreen.

You can learn more about Quarkus by reading my article _[Writing Java with Quarkus in VS Code][11]_.

### Step 1: Send IoT data to the lightweight message broker

To quickly spin up a lightweight message broker, you can use [Eclipse Mosquitto][12]. It's an open source message broker that implements the MQTT protocol. [MQTT][13] processes messages across IoT devices, such as low-power sensors, mobile phones, embedded computers, and microcontrollers. Mosquitto can be [installed][14] on various devices and operating system platforms, but you can also spin up the broker container image after installing a container engine (e.g., [Docker][15]) and a command-line interface (CLI) tool.

I use the [Podman][16] tool for running Linux containers. Compared to other container engines, this saves resources (CPU and memory especially) when you install and run an extra container engine in your environment. If you haven't already, [install Podman][17] before continuing. Then run the Mosquitto message broker with this command:


```
$ podman run --name mosquitto \
\--rm -p "9001:9001" -p "1883:1883" \
eclipse-mosquitto:1.6.2
```

You see this output:


```
1619384779: mosquitto version 1.6.2 starting
1619384779: Config loaded from /mosquitto/config/mosquitto.conf.
1619384779: Opening ipv4 listen to socket on port 1883.
1619384779: Opening ipv6 listen socket on port 1883.
```

### Step 2: Process reactive data streams with Quarkus

For this example, imagine you have IoT devices connected to a warehouse that continually send temperature and heat data to back-end servers to monitor the building's condition and save power resources.

Your imaginary setup uses one [ESP8266-01][18] WiFi module that streams temperature and heat data in the JSON data format. The stream's IoT edge data is transmitted to the Mosiquitto message broker server running on your machine.

Define the ESP8266-01 emulator in a Java application on Quarkus:


```
Device esp8266 = new Device("ESP8266-01");

@Outgoing("device-temp")
public Flowable&lt;String&gt; generate() {
  return Flowable.interval(2, TimeUnit.SECONDS)
    .onBackpressureDrop()
    .map(t -&gt; {
      [String][19] data = esp8266.toString();
      return data;
  });
}
```

Quarkus also enables you to process data streams and event sources with the [SmallRye Reactive Messaging][20] extension, which interacts with various messaging technologies such as [Apache Kafka][21], [AMQP][22], and especially MQTT, the standard for IoT messaging. This code snippet shows how to specify incoming data streams with an `@Incoming()` annotation:


```
@Incoming("devices")
@Outgoing("my-data-stream")
@Broadcast
public String process(byte[] data) {
  String d = new String(data);
  return d;
}
```

You can find this solution in my [GitHub repository][23].

#### Step 3: Monitor the real-time data channel

Quarkus uses reactive messaging and channels to receive, process, and showcase messages with a browser-based front-end application. You can run the Quarkus application in development mode for live coding or continue adding code in the inner-loop development workflow.

Issue the following Maven command to build and start the application:


```
`./mvnw compile quarkus:dev`
```

Once your Quarkus application starts, you should see incoming IoT data from the ESP8266-01 device.

![Incoming IoT data in Quarkus][24]

(Daniel Oh, [CC BY-SA 4.0][9])

You can use the dashboard to monitor how the IoT edge data (e.g., temperature, heat) is processing. Open a new web browser and navigate to [http://localhost:8080][25]. You should start seeing some statistics.

![IoT data graph][26]

(Daniel Oh, [CC BY-SA 4.0][9])

### Conclusion

With Quarkus, enterprises can scale application development and deployment environments with minimal cost and without high maintenance or licensing fees. From a DevOps perspective, enterprise developers can still use familiar open source technologies (such as Java) to implement IoT edge applications, while operators can control and monitor production using a Linux-based system (like CentOS Stream) with data gathered from big data, IoT, and artificial intelligence (AI) technologies.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/edge-quarkus-linux

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tips_map_guide_ebook_help_troubleshooting_lightbulb_520.png?itok=L0BQHgjr (Looking at a map)
[2]: https://quarkus.io/
[3]: https://www.ibm.com/cloud/learn/message-brokers
[4]: https://www.centos.org/centos-stream/
[5]: https://getfedora.org/
[6]: https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux
[7]: https://developers.redhat.com/blog/2021/04/07/deploy-quarkus-everywhere-with-red-hat-enterprise-linux-rhel/
[8]: https://opensource.com/sites/default/files/uploads/iot-edge-architecture.png (High-level architecture for IoT edge development)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://www.centos.org/download/
[11]: https://opensource.com/article/20/4/java-quarkus-vs-code
[12]: https://mosquitto.org/
[13]: https://mqtt.org/
[14]: https://mosquitto.org/download/
[15]: https://opensource.com/resources/what-docker
[16]: https://podman.io/
[17]: https://podman.io/getting-started/installation
[18]: https://www.instructables.com/Getting-Started-With-the-ESP8266-ESP-01/
[19]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[20]: https://smallrye.io/smallrye-reactive-messaging/smallrye-reactive-messaging/2/index.html
[21]: https://kafka.apache.org/
[22]: https://www.amqp.org/
[23]: https://github.com/danieloh30/quarkus-edge-mqtt-demo
[24]: https://opensource.com/sites/default/files/uploads/quarkus_incoming-iot-data.png (Incoming IoT data in Quarkus)
[25]: http://localhost:8080/
[26]: https://opensource.com/sites/default/files/uploads/iot-graph.png (IoT data graph)
