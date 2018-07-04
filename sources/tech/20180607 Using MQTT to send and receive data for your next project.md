pinewall translating

Using MQTT to send and receive data for your next project
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/toolbox-learn-draw-container-yearbook.png?itok=xDbwz1pP)

Last November we bought an electric car, and it raised an interesting question: When should we charge it? I was concerned about having the lowest emissions for the electricity used to charge the car, so this is a specific question: What is the rate of CO2 emissions per kWh at any given time, and when during the day is it at its lowest?

### Finding the data

I live in New York State. About 80% of our electricity comes from in-state generation, mostly through natural gas, hydro dams (much of it from Niagara Falls), nuclear, and a bit of wind, solar, and other fossil fuels. The entire system is managed by the [New York Independent System Operator][1] (NYISO), a not-for-profit entity that was set up to balance the needs of power generators, consumers, and regulatory bodies to keep the lights on in New York.

Although there is no official public API, as part of its mission, NYISO makes [a lot of open data][2] available for public consumption. This includes reporting on what fuels are being consumed to generate power, at five-minute intervals, throughout the state. These are published as CSV files on a public archive and updated throughout the day. If you know the number of megawatts coming from different kinds of fuels, you can make a reasonable approximation of how much CO2 is being emitted at any given time.

We should always be kind when building tools to collect and process open data to avoid overloading those systems. Instead of sending everyone to their archive service to download the files all the time, we can do better. We can create a low-overhead event stream that people can subscribe to and get updates as they happen. We can do that with [MQTT][3]. The target for my project ([ny-power.org][4]) was inclusion in the [Home Assistant][5] project, an open source home automation platform that has hundreds of thousands of users. If all of these users were hitting this CSV server all the time, NYISO might need to restrict access to it.

### What is MQTT?

MQTT is a publish/subscribe (pubsub) wire protocol designed with small devices in mind. Pubsub systems work like a message bus. You send a message to a topic, and any software with a subscription for that topic gets a copy of your message. As a sender, you never really know who is listening; you just provide your information to a set of topics and listen for any other topics you might care about. It's like walking into a party and listening for interesting conversations to join.

This can make for extremely efficient applications. Clients subscribe to a narrow selection of topics and only receive the information they are looking for. This saves both processing time and network bandwidth.

As an open standard, MQTT has many open source implementations of both clients and servers. There are client libraries for every language you could imagine, even a library you can embed in Arduino for making sensor networks. There are many servers to choose from. My go-to is the [Mosquitto][6] server from Eclipse, as it's small, written in C, and can handle tens of thousands of subscribers without breaking a sweat.

### Why I like MQTT

Over the past two decades, we've come up with tried and true models for software applications to ask questions of services. Do I have more email? What is the current weather? Should I buy this thing now? This pattern of "ask/receive" works well much of the time; however, in a world awash with data, there are other patterns we need. The MQTT pubsub model is powerful where lots of data is published inbound to the system. Clients can subscribe to narrow slices of data and receive updates instantly when that data comes in.

MQTT also has additional interesting features, such as "last-will-and-testament" messages, which make it possible to distinguish between silence because there is no relevant data and silence because your data collectors have crashed. MQTT also has retained messages, which provide the last message on a topic to clients when they first connect. This is extremely useful for topics that update slowly.

In my work with the Home Assistant project, I've found this message bus model works extremely well for heterogeneous systems. If you dive into the Internet of Things space, you'll quickly run into MQTT everywhere.

### Our first MQTT stream

One of NYSO's CSV files is the real-time fuel mix. Every five minutes, it's updated with the fuel sources and power generated (in megawatts) during that time period.

The CSV file looks something like this:

| Time Stamp          | Time Zone | Fuel Category      | Gen MW |
| 05/09/2018 00:05:00 | EDT       | Dual Fuel          |   1400 |
| 05/09/2018 00:05:00 | EDT       | Natural Gas        |   2144 |
| 05/09/2018 00:05:00 | EDT       | Nuclear            |   4114 |
| 05/09/2018 00:05:00 | EDT       | Other Fossil Fuels |      4 |
| 05/09/2018 00:05:00 | EDT       | Other Renewables   |    226 |
| 05/09/2018 00:05:00 | EDT       | Wind               |      1 |
| 05/09/2018 00:05:00 | EDT       | Hydro              |   3229 |
| 05/09/2018 00:10:00 | EDT       | Dual Fuel          |   1307 |
| 05/09/2018 00:10:00 | EDT       | Natural Gas        |   2092 |
| 05/09/2018 00:10:00 | EDT       | Nuclear            |   4115 |
| 05/09/2018 00:10:00 | EDT       | Other Fossil Fuels |      4 |
| 05/09/2018 00:10:00 | EDT       | Other Renewables   |    224 |
| 05/09/2018 00:10:00 | EDT       | Wind               |     40 |
| 05/09/2018 00:10:00 | EDT       | Hydro              |   3166 |

The only odd thing in the table is the dual-fuel category. Most natural gas plants in New York can also burn other fossil fuel to generate power. During cold snaps in the winter, the natural gas supply gets constrained, and its use for home heating is prioritized over power generation. This happens at a low enough frequency that we can consider dual fuel to be natural gas (for our calculations).

The file is updated throughout the day. I created a simple data pump that polls for the file every minute and looks for updates. It publishes any new entries out to the MQTT server into a set of topics that largely mirror this CSV file. The payload is turned into a JSON object that is easy to parse from nearly any programming language.
```
ny-power/upstream/fuel-mix/Hydro {"units": "MW", "value": 3229, "ts": "05/09/2018 00:05:00"}

ny-power/upstream/fuel-mix/Dual Fuel {"units": "MW", "value": 1400, "ts": "05/09/2018 00:05:00"}

ny-power/upstream/fuel-mix/Natural Gas {"units": "MW", "value": 2144, "ts": "05/09/2018 00:05:00"}

ny-power/upstream/fuel-mix/Other Fossil Fuels {"units": "MW", "value": 4, "ts": "05/09/2018 00:05:00"}

ny-power/upstream/fuel-mix/Wind {"units": "MW", "value": 41, "ts": "05/09/2018 00:05:00"}

ny-power/upstream/fuel-mix/Other Renewables {"units": "MW", "value": 226, "ts": "05/09/2018 00:05:00"}

ny-power/upstream/fuel-mix/Nuclear {"units": "MW", "value": 4114, "ts": "05/09/2018 00:05:00"}

```

This direct reflection is a good first step in turning open data into open events. We'll be converting this into a CO2 intensity, but other applications might want these raw feeds to do other calculations with them.

### MQTT topics

Topics and topic structures are one of MQTT's major design points. Unlike more "enterprisey" message buses, in MQTT topics are not preregistered. A sender can create topics on the fly, the only limit being that they are less than 220 characters. The `/` character is special; it's used to create topic hierarchies. As we'll soon see, you can subscribe to slices of data in these hierarchies.

Out of the box with Mosquitto, every client can publish to any topic. While it's great for prototyping, before going to production you'll want to add an access control list (ACL) to restrict writing to authorized applications. For example, my app's tree is accessible to everyone in read-only format, but only clients with specific credentials can publish to it.

There is no automatic schema around topics nor a way to discover all the possible topics that clients will publish to. You'll have to encode that understanding directly into any application that consumes the MQTT bus.

So how should you design your topics? The best practice is to start with an application-specific root name, in our case, `ny-power`. After that, build a hierarchy as deep as you need for efficient subscription. The `upstream` tree will contain data that comes directly from an upstream source without any processing. Our `fuel-mix` category is a specific type of data. We may add others later.

### Subscribing to topics

Subscriptions in MQTT are simple string matches. For processing efficiency, only two wildcards are allowed:

  * `#` matches everything recursively to the end
  * `+` matches only until the next `/` character



It's easiest to explain this with some examples:
```
ny-power/#  - match everything published by the ny-power app

ny-power/upstream/#  - match all raw data

ny-power/upstream/fuel-mix/+  - match all fuel types

ny-power/+/+/Hydro - match everything about Hydro power that's

       nested 2 deep (even if it's not in the upstream tree)

```

A wide subscription like `ny-power/#` is common for low-volume applications. Just get everything over the network and handle it in your own application. This works poorly for high-volume applications, as most of the network bandwidth will be wasted as you drop most of the messages on the floor.

To stay performant at higher volumes, applications will do some clever topic slides like `ny-power/+/+/Hydro` to get exactly the cross-section of data they need.

### Adding our next layer of data

From this point forward, everything in the application will work off existing MQTT streams. The first additional layer of data is computing the power's CO2 intensity.

Using the 2016 [U.S. Energy Information Administration][7] numbers for total emissions and total power by fuel type in New York, we can come up with an [average emissions rate][8] per megawatt hour of power.

This is encapsulated in a dedicated microservice. This has a subscription on `ny-power/upstream/fuel-mix/+`, which matches all upstream fuel-mix entries from the data pump. It then performs the calculation and publishes out to a new topic tree:
```
ny-power/computed/co2 {"units": "g / kWh", "value": 152.9486, "ts": "05/09/2018 00:05:00"}

```

In turn, there is another process that subscribes to this topic tree and archives that data into an [InfluxDB][9] instance. It then publishes a 24-hour time series to `ny-power/archive/co2/24h`, which makes it easy to graph the recent changes.

This layer model works well, as the logic for each of these programs can be distinct from each other. In a more complicated system, they may not even be in the same programming language. We don't care, because the interchange format is MQTT messages, with well-known topics and JSON payloads.

### Consuming from the command line

To get a feel for MQTT in action, it's useful to just attach it to a bus and see the messages flow. The `mosquitto_sub` program included in the `mosquitto-clients` package is a simple way to do that.

After you've installed it, you need to provide a server hostname and the topic you'd like to listen to. The `-v` flag is important if you want to see the topics being posted to. Without that, you'll see only the payloads.
```
mosquitto_sub -h mqtt.ny-power.org -t ny-power/# -v

```

Whenever I'm writing or debugging an MQTT application, I always have a terminal with `mosquitto_sub` running.

### Accessing MQTT directly from the web

We now have an application providing an open event stream. We can connect to it with our microservices and, with some command-line tooling, it's on the internet for all to see. But the web is still king, so it's important to get it directly into a user's browser.

The MQTT folks thought about this one. The protocol specification is designed to work over three transport protocols: [TCP][10], [UDP][11], and [WebSockets][12]. WebSockets are supported by all major browsers as a way to retain persistent connections for real-time applications.

The Eclipse project has a JavaScript implementation of MQTT called [Paho][13], which can be included in your application. The pattern is to connect to the host, set up some subscriptions, and then react to messages as they are received.
```
// ny-power web console application

var client = new Paho.MQTT.Client(mqttHost, Number("80"), "client-" + Math.random());



// set callback handlers

client.onMessageArrived = onMessageArrived;



// connect the client

client.reconnect = true;

client.connect({onSuccess: onConnect});



// called when the client connects

function onConnect() {

    // Once a connection has been made, make a subscription and send a message.

    console.log("onConnect");

    client.subscribe("ny-power/computed/co2");

    client.subscribe("ny-power/archive/co2/24h");

    client.subscribe("ny-power/upstream/fuel-mix/#");

}



// called when a message arrives

function onMessageArrived(message) {

    console.log("onMessageArrived:"+message.destinationName + message.payloadString);

    if (message.destinationName == "ny-power/computed/co2") {

        var data = JSON.parse(message.payloadString);

        $("#co2-per-kwh").html(Math.round(data.value));

        $("#co2-units").html(data.units);

        $("#co2-updated").html(data.ts);

    }

    if (message.destinationName.startsWith("ny-power/upstream/fuel-mix")) {

        fuel_mix_graph(message);

    }

    if (message.destinationName == "ny-power/archive/co2/24h") {

        var data = JSON.parse(message.payloadString);

        var plot = [

            {

                x: data.ts,

                y: data.values,

                type: 'scatter'

            }

        ];

        var layout = {

            yaxis: {

                title: "g CO2 / kWh",

            }

        };

        Plotly.newPlot('co2_graph', plot, layout);

    }

```

This application subscribes to a number of topics because we're going to display a few different kinds of data. The `ny-power/computed/co2` topic provides us a topline number of current intensity. Whenever we receive that topic, we replace the related contents on the site.


![NY ISO Grid CO2 Intensity][15]

NY ISO Grid CO2 Intensity graph from [ny-power.org][4].

The `ny-power/archive/co2/24h` topic provides a time series that can be loaded into a [Plotly][16] line graph. And `ny-power/upstream/fuel-mix` provides the data needed to provide a nice bar graph of the current fuel mix.


![Fuel mix on NYISO grid][18]

Fuel mix on NYISO grid, [ny-power.org][4].

This is a dynamic website that is not polling the server. It is attached to the MQTT bus and listening on its open WebSocket. The webpage is a pub/sub client just like the data pump and the archiver. This one just happens to be executing in your browser instead of a microservice in the cloud.

You can see the page in action at <http://ny-power.org>. That includes both the graphics and a real-time MQTT console to see the messages as they come in.

### Diving deeper

The entire ny-power.org application is [available as open source on GitHub][19]. You can also check out [this architecture overview][20] to see how it was built as a set of Kubernetes microservices deployed with [Helm][21]. You can see another interesting MQTT application example with [this code pattern][22] using MQTT and OpenWhisk to translate text messages in real time.

MQTT is used extensively in the Internet of Things space, and many more examples of MQTT use can be found at the [Home Assistant][23] project.

And if you want to dive deep into the protocol, [mqtt.org][3] has all the details for this open standard.

To learn more, attend Sean Dague's talk, [Adding MQTT to your toolkit][24], at [OSCON][25], which will be held July 16-19 in Portland, Oregon.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/mqtt

作者：[Sean Dague][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/sdague
[1]:http://www.nyiso.com/public/index.jsp
[2]:http://www.nyiso.com/public/markets_operations/market_data/reports_info/index.jsp
[3]:http://mqtt.org/
[4]:http://ny-power.org/#
[5]:https://www.home-assistant.io
[6]:https://mosquitto.org/
[7]:https://www.eia.gov/
[8]:https://github.com/IBM/ny-power/blob/master/src/nypower/calc.py#L1-L60
[9]:https://www.influxdata.com/
[10]:https://en.wikipedia.org/wiki/Transmission_Control_Protocol
[11]:https://en.wikipedia.org/wiki/User_Datagram_Protocol
[12]:https://en.wikipedia.org/wiki/WebSocket
[13]:https://www.eclipse.org/paho/
[14]:/file/400041
[15]:https://opensource.com/sites/default/files/uploads/mqtt_nyiso-co2intensity.png (NY ISO Grid CO2 Intensity)
[16]:https://plot.ly/
[17]:/file/400046
[18]:https://opensource.com/sites/default/files/uploads/mqtt_nyiso_fuel-mix.png (Fuel mix on NYISO grid)
[19]:https://github.com/IBM/ny-power
[20]:https://developer.ibm.com/code/patterns/use-mqtt-stream-real-time-data/
[21]:https://helm.sh/
[22]:https://developer.ibm.com/code/patterns/deploy-serverless-multilingual-conference-room/
[23]:https://www.home-assistant.io/
[24]:https://conferences.oreilly.com/oscon/oscon-or/public/schedule/speaker/77317
[25]:https://conferences.oreilly.com/oscon/oscon-or
