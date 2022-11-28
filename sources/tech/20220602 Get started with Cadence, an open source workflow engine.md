[#]: subject: "Get started with Cadence, an open source workflow engine"
[#]: via: "https://opensource.com/article/22/6/cadence-open-source-workflow-engine"
[#]: author: "Ben Slater https://opensource.com/users/ben-slater"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Get started with Cadence, an open source workflow engine
======
Cadence simplifies the complexity of distributed systems so that developers can focus on creating applications built for high durability, availability, and scalability.

![Tips and gears turning][1]

Image by: opensource.com

Modern applications require complicated interactions between long-running business processes, internal services, and third-party APIs. To say it's been a challenge for developers is putting it mildly. Managing these processes means tracking complex states, preparing responses to asynchronous events, and communicating with often unreliable external dependencies.

Developers typically take on these complex challenges with solutions that are just as convoluted, assembling unwieldy systems that leverage stateless services, databases, retry algorithms, and job scheduling queues. Because these complex systems obscure their own business logic, availability issues are common, often stemming from the application's dependence on scattered and unproven components. Developer productivity is regularly sacrificed to keep these sprawling, troubled systems from collapsing.

### Designing a distributed application

Cadence solves these issues by offering a highly scalable fault-oblivious code platform. Cadence abstracts away the usual challenges of implementing fault tolerance and durability with its fault oblivious code.

A standard Cadence application includes a Cadence service, workflow, activity workers, and external clients. If needed, it's acceptable to co-locate the roles of workflow workers, activity workers, and external clients in a single application process.

**Cadence Service**

![Image of client application and Cadence service][2]

Image by: (Ben Slater, CC BY-SA 4.0)

Cadence is centered on its multi-tenant service and the high scalability it enables. A strongly typed [gRPC API][3] exposes all Cadence service functionality. A Cadence cluster can run multiple services on multiple nodes, including:

* Front end: A stateless service that handles incoming worker requests, with instances backed by an external load balancer.
* History service: Handles core logic for workflow steps and activity orchestration.
* Matching service: Matches workflow or activity tasks with workers ready to complete them.
* Internal worker service: Meets internal requirements (such as archiving) by introducing Cadence workflows and activities.
* Workers: Function as Cadence client apps that execute user-created workflow and activity logic.

By default, Cadence supports Apache Cassandra, MySQL, PostgreSQL, CockroachDB, and TiDB for use as persistence stores, as well as ElasticSearch and OpenSearch for listing workflows with complex predicates.

Because the Cadence service is multi-tenant, a single service can serve one or many applications. A local Cadence service instance can be configured with docker-compose for local development. The Cadence service maintains workflow states, associated durable timers, and internal "task list" queues to send tasks to external workers.

Beyond the Cadence service itself:

* Workflow workers: hosts fault-oblivious code externally to the Cadence service. The Cadence service sends these workers "decision tasks." The workers deliver the tasks to the workflow code and communicate the completed "decisions" back to the Cadence service. Workflow code can be implemented in any language able to communicate with Cadence API: production-ready Java and Go clients are currently available.
* Activity workers: hosts "activities", or code that perform application specific actions such as service calls, database record updates, and file downloads. Activities feature task routing to specific processes, heartbeats, infinite retries, and unlimited execution time. The Cadence service sends activity tasks to these workers, who complete them and report completion.
* External clients: enable the creation of workflow instances, or "executions". External clients such as UIs, microservices or CLIs use the StartWorkflowExecution Cadence service API call to implement executions. External clients are also capable of notifying workflows about asynchronous external events, synchronous workflow state queries, waiting for synchronous workflow completion, workflow restarts, cancellation, and searching for specific workflows with List API.

### Getting started with Cadence

In this example we'll use the Cadence Java client. The client is [available from GitHub][4], and [JavaDoc documentation can be found here][5]. You can also check for the [latest release version][6].

To begin, add *cadence-client* as a dependency to your *pom.xml* file like this:

```
<dependency>
    <groupId>com.uber.cadence</groupId>
    <artifactId>cadence-client</artifactId>
    <version>LATEST.RELEASE.VERSION</version>
</dependency>
```

Alternatively, you can use *build.gradle*:

compile group: ‘com.uber.cadence', name: ‘cadence-client', version: ‘LATEST.RELEASE.VERSION'

**Java Hello World with Cadence**

The best way to get an idea of what Cadence is capable of is to try it, so here's a simple "Hello World" example you can try. First, add the [Cadence Java client dependency][7] to your Java project. Using Gradle, the dependency looks like this:

compile group: ‘com.uber.cadence', name: ‘cadence-client', version: ‘<latest_version>'

Add these dependencies that the cadence-client requires as well:

compile group: ‘commons-configuration', name: ‘commons-configuration', version: ‘1.9'

compile group: ‘ch.qos.logback', name: ‘logback-classic', version: ‘1.2.3'

Then compile this code:

```
import com.uber.cadence.workflow.Workflow;
import com.uber.cadence.workflow.WorkflowMethod;
import org.slf4j.Logger;
public class GettingStarted {
    private static Logger logger = Workflow.getLogger(GettingStarted.class);

    public interface HelloWorld {
        @WorkflowMethod
        void sayHello(String name);
    }
}
```

These [Cadence Java samples][8] are available to help if you encounter issues with the build files.

Next, put this logback config file into your classpath:

```
<configuration>
    <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
        <!-- encoders are assigned the type
        ch.qos.logback.classic.encoder.PatternLayoutEncoder by default -->
        <encoder>
            <pattern>%d{HH:mm:ss.SSS} [%thread] %-5level %logger{36} - %msg%n</pattern>
        </encoder>
    </appender>

    <logger name="io.netty" level="INFO"/>

    <root level="INFO">
        <appender-ref ref="STDOUT" />
    </root>
</configuration>
```

Now create the Hello World workflow. Add HelloWorldImpl with the sayHello method, which logs and returns "Hello …":

```
import com.uber.cadence.worker.Worker;
import com.uber.cadence.workflow.Workflow;
import com.uber.cadence.workflow.WorkflowMethod;
import org.slf4j.Logger;
public class GettingStarted {
    private static Logger logger = Workflow.getLogger(GettingStarted.class);

    public interface HelloWorld {
        @WorkflowMethod
        void sayHello(String name);
    }

    public static class HelloWorldImpl implements HelloWorld {
        @Override
        public void sayHello(String name) {
            logger.info("Hello " + name + "!");
        }
    }
}
```

Register the workflow implementation to the Cadence framework with a worker connected to a Cadence service. Workers will connect to a Cadence service running locally by default.

```
public static void main(String[] args) {
    WorkflowClient workflowClient = WorkflowClient.newInstance(
        new WorkflowServiceTChannel(ClientOptions.defaultInstance()),
        WorkflowClientOptions.newBuilder().setDomain(DOMAIN).build()
    );
    // Get worker to poll the task list.
    WorkerFactory factory = WorkerFactory.newInstance(workflowClient);
    Worker worker = factory.newWorker(TASK_LIST);
    worker.registerWorkflowImplementationTypes(HelloWorldImpl.class);
    factory.start();
}
```

Now you're ready to run the worker program. Here's an example log:

```
13:35:02.575 [main] INFO c.u.c.s.WorkflowServiceTChannel - Initialized TChannel for service cadence-frontend, LibraryVersion: 2.2.0, FeatureVersion: 1.0.0

13:35:02.671 [main] INFO c.u.cadence.internal.worker.Poller - start(): Poller{options=PollerOptions{maximumPollRateIntervalMilliseconds=1000, maximumPollRatePerSecond=0.0, pollBackoffCoefficient=2.0, pollBackoffInitialInterval=PT0.2S, pollBackoffMaximumInterval=PT20S, pollThreadCount=1, pollThreadNamePrefix=‘Workflow Poller taskList="HelloWorldTaskList", domain="test-domain", type="workflow"'}, identity=45937@maxim-C02XD0AAJGH6}

13:35:02.673 [main] INFO c.u.cadence.internal.worker.Poller - start(): Poller{options=PollerOptions{maximumPollRateIntervalMilliseconds=1000, maximumPollRatePerSecond=0.0, pollBackoffCoefficient=2.0, pollBackoffInitialInterval=PT0.2S, pollBackoffMaximumInterval=PT20S, pollThreadCount=1, pollThreadNamePrefix=‘null'}, identity=81b8d0ac-ff89-47e8-b842-3dd26337feea}
```

"Hello"'isn't printing, because the worker only hosts the workflow code. To execute the workflow, start it with the Cadence CLI:

```
$ docker run --network=host --rm ubercadence/cli:master --do test-domain workflow start --tasklist HelloWorldTaskList --workflow_type HelloWorld::sayHello --execution_timeout 3600 --input \"World\"
Started Workflow Id: bcacfabd-9f9a-46ac-9b25-83bcea5d7fd7, run Id: e7c40431-8e23-485b-9649-e8f161219efe
```

Now the program gives this output:

```
13:35:02.575 [main] INFO c.u.c.s.WorkflowServiceTChannel - Initialized TChannel for service cadence-frontend, LibraryVersion: 2.2.0, FeatureVersion: 1.0.0

13:35:02.671 [main] INFO c.u.cadence.internal.worker.Poller - start(): Poller{options=PollerOptions{maximumPollRateIntervalMilliseconds=1000, maximumPollRatePerSecond=0.0, pollBackoffCoefficient=2.0, pollBackoffInitialInterval=PT0.2S, pollBackoffMaximumInterval=PT20S, pollThreadCount=1, pollThreadNamePrefix=‘Workflow Poller taskList="HelloWorldTaskList", domain=“test-domain”, type="workflow"'}, identity=45937@maxim-C02XD0AAJGH6}

13:35:02.673 [main] INFO c.u.cadence.internal.worker.Poller - start(): Poller{options=PollerOptions{maximumPollRateIntervalMilliseconds=1000, maximumPollRatePerSecond=0.0, pollBackoffCoefficient=2.0, pollBackoffInitialInterval=PT0.2S, pollBackoffMaximumInterval=PT20S, pollThreadCount=1, pollThreadNamePrefix=‘null'}, identity=81b8d0ac-ff89-47e8-b842-3dd26337feea}

13:40:28.308 [workflow-root] INFO c.u.c.samples.hello.GettingStarted - Hello World!
```

Success! Now run this workflow execution:

```
$ docker run --network=host --rm ubercadence/cli:master --do test-domain workflow start --tasklist HelloWorldTaskList --workflow_type HelloWorld::sayHello --execution_timeout 3600 --input \"Cadence\"

Started Workflow Id: d2083532-9c68-49ab-90e1-d960175377a7, run Id: 331bfa04-834b-45a7-861e-bcb9f6ddae3e
```

You should get this output:

```
13:35:02.575 [main] INFO c.u.c.s.WorkflowServiceTChannel - Initialized TChannel for service cadence-frontend, LibraryVersion: 2.2.0, FeatureVersion: 1.0.0

13:35:02.671 [main] INFO c.u.cadence.internal.worker.Poller - start(): Poller{options=PollerOptions{maximumPollRateIntervalMilliseconds=1000, maximumPollRatePerSecond=0.0, pollBackoffCoefficient=2.0, pollBackoffInitialInterval=PT0.2S, pollBackoffMaximumInterval=PT20S, pollThreadCount=1, pollThreadNamePrefix=‘Workflow Poller taskList="HelloWorldTaskList", domain="test-domain", type="workflow"'}, identity=45937@maxim-C02XD0AAJGH6}

13:35:02.673 [main] INFO c.u.cadence.internal.worker.Poller - start(): Poller{options=PollerOptions{maximumPollRateIntervalMilliseconds=1000, maximumPollRatePerSecond=0.0, pollBackoffCoefficient=2.0, pollBackoffInitialInterval=PT0.2S, pollBackoffMaximumInterval=PT20S, pollThreadCount=1, pollThreadNamePrefix=‘null'}, identity=81b8d0ac-ff89-47e8-b842-3dd26337feea}

13:40:28.308 [workflow-root] INFO c.u.c.samples.hello.GettingStarted - Hello World!

13:42:34.994 [workflow-root] INFO c.u.c.samples.hello.GettingStarted - Hello Cadence!
```

Lastly, use this CLI to list the workflow:

```
$ docker run --network=host --rm ubercadence/cli:master --do test-domain workflow list

WORKFLOW TYPE | WORKFLOW ID | RUN ID | START TIME | EXECUTION TIME | END TIME

HelloWorld::sayHello | d2083532-9c68-49ab-90e1-d960175377a7 | 331bfa04-834b-45a7-861e-bcb9f6ddae3e | 20:42:34 | 20:42:34 | 20:42:35

HelloWorld::sayHello | bcacfabd-9f9a-46ac-9b25-83bcea5d7fd7 | e7c40431-8e23-485b-9649-e8f161219efe | 20:40:28 | 20:40:28 | 20:40:29
```

Look over the workflow execution history as well:

```
$ docker run --network=host --rm ubercadence/cli:master --do test-domain workflow showid 1965109f-607f-4b14-a5f2-24399a7b8fa7
1 WorkflowExecutionStarted {WorkflowType:{Name:HelloWorld::sayHello},
TaskList:{Name:HelloWorldTaskList},
Input:["World"],
ExecutionStartToCloseTimeoutSeconds:3600,
TaskStartToCloseTimeoutSeconds:10,
ContinuedFailureDetails:[],
LastCompletionResult:[],
Identity:cadence-cli@linuxkit-025000000001,
Attempt:0,
FirstDecisionTaskBackoffSeconds:0}
2 DecisionTaskScheduled {TaskList:{Name:HelloWorldTaskList},
StartToCloseTimeoutSeconds:10,
Attempt:0}
3 DecisionTaskStarted {ScheduledEventId:2,
Identity:45937@maxim-C02XD0AAJGH6,
RequestId:481a14e5-67a4-436e-9a23-7f7fb7f87ef3}
4 DecisionTaskCompleted {ExecutionContext:[],
ScheduledEventId:2,
StartedEventId:3,
Identity:45937@maxim-C02XD0AAJGH6}
5 WorkflowExecutionCompleted {Result:[],
DecisionTaskCompletedEventId:4}
```

It may be a simple workflow, but looking at the history is quite informative. The history's value as a troubleshooting, analytics, and compliance tool only increases with the complexity of the workflow. As a best practice, automatically archive the history to a long-term blob store when workflows complete.

### Try Cadence

Cadence offers transformative advantages for organizations and application development teams charged with creating and managing high-scale distributed applications built for high durability, availability, and scalability. Cadence is available to all as free and open source software, making it simple for teams to explore its capabilities and determine if Cadence is a strong fit for their organizations.

Using Cadence is as simple as cloning the [Git repository for the Cadence server][9] or the [container image][10]. For more details on getting started, visit: [https://cadenceworkflow.io/docs/get-started/][11].

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/cadence-open-source-workflow-engine

作者：[Ben Slater][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ben-slater
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/gears_devops_learn_troubleshooting_lightbulb_tips_520.png
[2]: https://opensource.com/sites/default/files/2022-05/cadence1.png
[3]: https://github.com/uber/cadence-idl/tree/master/proto/uber/cadence/api/v1
[4]: https://github.com/uber/cadence-java-client
[5]: https://www.javadoc.io/doc/com.uber.cadence/cadence-client/latest/index.html
[6]: https://github.com/uber/cadence-java-client/releases
[7]: https://mvnrepository.com/artifact/com.uber.cadence/cadence-client
[8]: https://github.com/uber/cadence-java-samples
[9]: https://github.com/uber/cadence
[10]: https://hub.docker.com/r/ubercadence/server
[11]: https://cadenceworkflow.io/docs/get-started/
