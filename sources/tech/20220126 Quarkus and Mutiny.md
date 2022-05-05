[#]: subject: "Quarkus and Mutiny"
[#]: via: "https://fedoramagazine.org/quarkus-and-mutiny/"
[#]: author: "Dave O'Meara https://fedoramagazine.org/author/daveome/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Quarkus and Mutiny
======

![][1]

Background image by [Eugene Golovesov][2] on [Unsplash][3] (cropped)

Quarkus is a foundation for building Java based applications; whether for the desktop, server or cloud. An excellent write up on usage can be found at <https://fedoramagazine.org/using-the-quarkus-framework-on-fedora-silverblue-just-a-quick-look/>. This article is primer for coding asynchronous processes using Quarkus and Mutiny.

So what is Mutiny? Mutiny allows streaming of objects in an event driven flow. The stream might originate from a local process or something remote like a database. Mutiny streaming is accomplished by either a _Uni_ or a _Multi_ object. We are using the Uni to stream one object — a _List_ containing many integers. A subscribe pattern initiates the stream.

A traditional program is executed and results are returned before continuing. Mutiny can easily support non-blocking code to run processes concurrently. RxJava, ReactiveX and even native Java are alternatives. Mutiny is easy to use (the exposed API is minimal) and it is the default in many of the Quarkus extensions. The two extensions used are _quarkus-mutiny_ and _quarkus-vertx_. Vert.x is the underlying framework wrapped by Quarkus. The Promise classes are supplied by quarkus-vertx. A _promise_ returns a Uni stream when the process is complete. To get started, install a Java JDK and Maven.

### Bootstrap

The minimum requirement is either Java-11 _or_ Java-17 with Maven.

**With Java-11**:

```

    $ sudo dnf install -y java-11-openjdk-devel maven

```

**With Java-17**:

```

    $ sudo dnf install -y java-17-openjdk-devel maven

```

Bootstrap **Quarkus **and Mutiny with the Maven call below. The extension _quarkus-vertx_ is not included to demonstrate how to add additional extensions. Locate an appropriate directory before executing. The directory _mutiny-demo_ will be created with the initial application.

```

    $ mvn io.quarkus.platform:quarkus-maven-plugin:2.6.2.Final:create \
           -DprojectGroupId=fedoramag   \
           -DprojectArtifactId=mutiny-demo  \
           -DprojectVersion=1.0.0  \
           -DclassName="org.demo.mag.Startup"  \
           -Dextensions="mutiny" \
           -DbuildTool=gradle

```

Now that Gradle is bootstrapped, other extensions can be added. In the _mutiny-demo_ directory execute:

```

    $ ./gradlew addExtension --extensions='quarkus-vertx'

```

To view all available extensions execute:

```

    $ ./gradlew listExtensions

```

To get all of the defined Gradle tasks execute:

```

    $ ./gradlew tasks

```

### Mutiny Code

The ****_className_ entry on the Quarkus bootstrap is _org.demo.mag.Startup_ which creates the file _src/main/java/org/demo/map/Startup.java_. Replace the contents with the following code:

```

    package org.demo.mag;

    import java.util.List;
    import java.util.concurrent.ExecutionException;
    import java.util.function.IntSupplier;
    import java.util.stream.Collectors;
    import java.util.stream.IntStream;

    import io.quarkus.runtime.Quarkus;
    import io.quarkus.runtime.QuarkusApplication;
    import io.quarkus.runtime.annotations.QuarkusMain;
    import io.smallrye.mutiny.Uni;
    import io.smallrye.mutiny.tuples.Tuple2;
    import io.vertx.mutiny.core.Promise;

    @QuarkusMain
    public class Startup implements QuarkusApplication {
        public static void main(String... args) {
            Quarkus.run(Startup.class, args);
        }

        @Override
        public int run(String... args) throws InterruptedException, ExecutionException {
            final Promise<String> finalMessage = Promise.promise();
            final String elapsedTime = "Elapsed time for asynchronous method: %d milliseconds";
            final int[] syncResults = {0};

            Application.runTraditionalMethod();

            final Long millis = System.currentTimeMillis();
            Promise<List<Integer>> promiseRange = Application.getRange(115000);
            Promise<Tuple2<Promise<List<Integer>>, Promise<List<Integer>>>> promiseCombined = Application.getCombined(10000, 15000);
            Promise<List<Integer>> promiseReverse = Application.getReverse(24000);
            /*
            *   Retrieve the Uni stream and on the complete event obtain the List<Integer>
            */
            promiseRange.future().onItem().invoke(list -> {
                System.out.println("Primes Range: " + list.size());
                if(syncResults[0] == 1) {
                    finalMessage.complete(String.format(elapsedTime, System.currentTimeMillis() - millis));
                } {
                    syncResults[0] = 2;
                }
                return;
            }).subscribeAsCompletionStage();

            promiseReverse.future().onItem().invoke(list -> {
                System.out.println("Primes Reverse: " + list.size());
                return;
            }).subscribeAsCompletionStage();
            /*
            *   Notice that this finishes before the other two prime generators(smaller lists).
            */
            promiseCombined.future().onItem().invoke(p -> {
                /*
                *   Notice that "Combined Range" displays first
                */
                p.getItem2().future().invoke(reverse -> {
                    System.out.println("Combined Reverse: " + reverse.size());
                    return;
                }).subscribeAsCompletionStage();

                p.getItem1().future().invoke(range -> {
                    System.out.println("Combined Range: " + range.size());
                    /*
                    * Nesting promises to get multple results together
                    */
                    p.getItem2().future().invoke(reverse -> {
                        System.out.println(String.format("Asserting that expected primes are equal: %d -- %d", range.get(0), reverse.get(reverse.size() - 1)));
                        assert range.get(0) == reverse.get(reverse.size() - 1)
                            : "Generated primes incorrect";
                        if(syncResults[0] == 2) {
                            finalMessage.complete(String.format(elapsedTime, System.currentTimeMillis() - millis));
                        } else {
                            syncResults[0] = 1;
                        }
                        return;
                    }).subscribeAsCompletionStage();
                    return;
                }).subscribeAsCompletionStage();
                return;
            }).subscribeAsCompletionStage();
            // Note: on very fast machines this may not display first.
            System.out.println("This should display first - indicating asynchronous code.");
            // blocking for final message
            String elapsedMessage = finalMessage.futureAndAwait();
            System.out.println(elapsedMessage);

            return 0;
        }

        public static class Application {

            public static Promise<List<Integer>> getRange(int n) {
                final Promise<List<Integer>> promise = Promise.promise();
                // non-blocking - this is only for demonstration(emulating some remote call)
                new Thread(() -> {
                    try {
                        /*
                        * RangeGeneratedPrimes.primes is blocking, only returns when done
                        */
                        promise.complete(RangeGeneratedPrimes.primes(n));
                    } catch (Exception exception) {
                        Thread.currentThread().interrupt();
                    }
                }).start();

                return promise;
            }

            public static Promise<List<Integer>> getReverse(int n) {
                final Promise<List<Integer>> promise = Promise.promise();

                new Thread(() -> {
                    try {
                        // Generating a new object stream
                        promise.complete(ReverseGeneratedPrimes.primes(n));
                    } catch (Exception exception) {
                        Thread.currentThread().interrupt();
                    }
                }).start();

                return promise;
            }

            public static Promise<Tuple2<Promise<List<Integer>>, Promise<List<Integer>>>> getCombined(int ran, int rev) {
                final Promise<Tuple2<Promise<List<Integer>>, Promise<List<Integer>>>> promise = Promise.promise();

                new Thread(() -> {
                    try {
                        Uni.combine().all()
                            /*
                            *   Notice that these are running concurrently
                            */
                            .unis(Uni.createFrom().item(Application.getRange(ran)),
                                    Uni.createFrom().item(Application.getReverse(rev)))
                            .asTuple().onItem().call(tuple -> {
                                promise.complete(tuple);
                                return Uni.createFrom().nullItem();
                            })
                            .onFailure().invoke(Throwable::printStackTrace)
                            .subscribeAsCompletionStage();
                    } catch (Exception exception) {
                        Thread.currentThread().interrupt();
                    }
                }).start();

                return promise;
            }

            public static void runTraditionalMethod() {
                Long millis = System.currentTimeMillis();
                System.out.println("Traditiona1-1: " + RangeGeneratedPrimes.primes(115000).size());
                System.out.println("Traditiona1-2: " + RangeGeneratedPrimes.primes(10000).size());
                System.out.println("Traditiona1-3: " + ReverseGeneratedPrimes.primes(15000).size());
                System.out.println("Traditiona1-4: " + ReverseGeneratedPrimes.primes(24000).size());
                System.out.println(String.format("Elapsed time for traditional method: %d milliseconds\n", System.currentTimeMillis() - millis));
            }
        }

        public interface Primes {
            static List<Integer> primes(int n) {
                return null;
            };
        }

        public abstract static class PrimeBase {
            static boolean isPrime(int number) {
                return IntStream.rangeClosed(2, (int) (Math.sqrt(number)))
                        .allMatch(n -> number % n != 0);
            }
        }

        public static class RangeGeneratedPrimes extends PrimeBase implements Primes {
            public static List<Integer> primes(int n) {
                return IntStream.rangeClosed(2, n)
                        .filter(x -> isPrime(x)).boxed()
                        .collect(Collectors.toList());
            }
        }

        public static class ReverseGeneratedPrimes extends PrimeBase implements Primes {
            public static List<Integer> primes(int n) {
                List<Integer> list = IntStream.generate(getReverseList(n)).limit(n - 1)
                        .filter(x -> isPrime(x)).boxed()
                        .collect(Collectors.toList());

                return list;
            }

            private static IntSupplier getReverseList(int startValue) {
                IntSupplier reverse = new IntSupplier() {
                    private int start = startValue;

                    public int getAsInt() {
                        return this.start--;
                    }
                };

                return reverse;
            }
        }
    }

```

### Testing

The Quarkus install showcases the _quarkus-resteasy_ extension by default. We are not using it, replace the contents of _src/test/java/org/demo/mag/StartupTest.java_ with:

```

    package org.demo.mag;

    import io.quarkus.test.junit.QuarkusTest;
    import io.vertx.mutiny.core.Promise;

    import java.util.List;

    import org.demo.mag.Startup;
    import org.junit.jupiter.api.Assertions;
    import org.junit.jupiter.api.Tag;
    import org.junit.jupiter.api.Test;

    @QuarkusTest
    public class StartupTest {
        Promise<List<Integer>> promise = Promise.promise();
        Promise<Void> promiseAndAwait = Promise.promise();
        List<Integer> testValue;

        @Tag("DEV")
        @Test
        public void testVerifyAsync() {
            Assertions.assertEquals( null , testValue);
            promise.future().onItem().invoke(list -> {
                testValue = list;
                promiseAndAwait.complete();
            }).subscribeAsCompletionStage();
            Assertions.assertEquals(null, testValue);
            promise.complete(Startup.ReverseGeneratedPrimes.primes(100));
            promiseAndAwait.futureAndAwait();
            Assertions.assertNotNull(testValue);
            Assertions.assertEquals(2, testValue.get(testValue.size()-1));
        }
    }

```

### Optional

To reduce download volume, remove the following entries from ****the _build.gradle_ file.

```

    implementation 'io.quarkus:quarkus-resteasy'
            testImplementation 'io.rest-assured:rest-assured'

```

### Installation and Execution

The next step is to build the project. This includes downloading all dependencies as well as compiling and executing the Startup.java program. Everything is included in one file for brevity.

```

    $ ./gradlew quarkusDev

```

The above command produces a banner and console output from Quarkus and the program.

This is development mode. Notice the prompt: “Press [space] to restart”. To review edits hit the space-bar and enter-key to re-compile and execute. Enter **q** to quit.

To build an Uber jar (all dependencies included) execute:

```

    $ ./gradlew quarkusBuild -Dquarkus.package.type=uber-jar

```

This creates a jar in the _build_ directory named mutiny-_demo-1.0.0-runner.jar_. To run the jar file, enter the following command.

```

    $ java -jar ./build/mutiny-demo-1.0.0-runner.jar

```

To remove the banner and console logs, add the following lines to the _src/main/resources/application.properties_ file.

```

    %prod.quarkus.log.console.enable=false
    %prod.quarkus.banner.enabled=false

```

The output might look similar to the following.

```

         Traditional-1: 9592
            Traditional-2: 1229
            Traditional-3: 2262
            Traditional-4: 2762
            Elapsed time for traditional method: 67 milliseconds

            Combined Range: 1229
            This should display first - indicating asynchronous code.
            Combined Reverse: 2262
            Primes Reverse: 2762
            Asserting that expected primes are equal: 2 -- 2
            Primes Range: 9592
            Elapsed time for asynchronous method: 52 milliseconds

```

You will still get the banner and logs in development mode.

To go one step further, Quarkus can generate an executable out of the box using GraalVM.

```

    $ ./gradlew build -Dquarkus.package.type=native

```

The executable generated by the above command will be _./build/mutiny-demo-1.0.0-runner_.

The default GraalVM is a downloaded container. To override this, set the environment variable _GRAALVM_HOME_ to your local install. Don’t forget to install the _native-image_ with the following command.

```

    $ ${GRAALVM_HOME}/bin/gu install native-image

```

### The Code

The code, generates prime numbers for a range, reversed on a limit and a combination of the two. For example, consider the range: “Promise&lt;List&lt;Integer&gt;&gt; promiseRange = Application.getRange(115000);”.

This generates all primes between 1 and 115000 and displays the number of primes in the range. It is executed first but displays its results last. The code near the end of the main method — System.out.println (“This should display first – indicating asynchronous code.”); ****— displays first. This is an example of asynchronous code. We can run multiple processes concurrently. However, the order of completion is unpredictable. The traditional calls are orderly and the results can be collected when completed.

Execution can be blocked until a result is returned. The code does exactly that to display the asynchronous elapsed time message. At the end of the main method we have: “String elapsedMessage = finalMessage.futureAndAwait();”. The message arrives from either _promiseRange_ or _promiseCombined_ — the two longest running processes. But even this is not guaranteed. The state of the underling OS is unknown. One of the other processes might finish last. Normally, asynchronous calls are nested to co-ordinate results. This is demonstrated in the _promiseCombined_ promise to evaluate the results of range and reversed primes.

### Conclusion

The comparison between the traditional method and asynchronous method suggests that the asynchronous method can be up to 25% faster on a modern computer. An older CPU that does not have the resources and computing power produces results faster with the traditional method. If a computer has many cores, why not use them‽

More documentation can be found on the following web sites.

  * [https://][4][quarkus.io][4]
  * <https://smallrye.io>
  * <https://vertx.io>



--------------------------------------------------------------------------------

via: https://fedoramagazine.org/quarkus-and-mutiny/

作者：[Dave O'Meara][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/daveome/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/01/quarkus-and-mutiny-816x345.jpg
[2]: https://unsplash.com/@eugene_golovesov?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://quarkus.io
