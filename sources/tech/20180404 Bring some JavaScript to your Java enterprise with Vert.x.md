Bring some JavaScript to your Java enterprise with Vert.x
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_blue.png?itok=IfckxN48)
If you are a Java programmer, chances are that you've either used JavaScript in the past or will in the near future. Not only is it one of the most popular (and useful) programming languages, understanding some of JavaScript's features could help you build the next uber-popular web application.

### JavaScript on the server

The idea to run JavaScript on the server is not new; in fact, in December 1995, soon after releasing JavaScript for browsers, Netscape introduced an implementation of the language for server-side scripting with Netscape Enterprise Server. Microsoft also adopted it on Internet Information Server as JScript, a reverse-engineered implementation of Netscape's JavaScript.

The seed was planted, but the real boom happened in 2009 when Ryan Dahl introduced Node.js. Node's success was not based on the language but on the runtime itself. It introduced a single process event loop that followed the reactive programming principles and could scale like other platforms couldn't.

### The enterprise and the JVM

Many enterprises have standardized on the Java virtual machine (JVM) as the platform of choice to run their mission-critical business applications, and large investments have been made on the JVM, so it makes sense for those organizations to look for a JVM-based JavaScript runtime.

[Eclipse Vert.x][1] is a polyglot-reactive runtime that runs on the JVM. Using Eclipse Vert.x with JavaScript is not much different from what you would expect from Node.js. There are limitations, such as that the JVM JavaScript engine is not fully compatible with the ES6 standard and not all Node.js package manager (npm) modules can be used with it. But it can still do interesting things.

### Why Eclipse Vert.x?

Having a large investment in the JVM and not wanting to switch to a different runtime might be reason enough for an enterprise to be interested in Eclipse Vert.x. But other benefits are that it can interact with any existing Java application and offers one of the best performances possible on the JVM.

To demonstrate, let's look at how Vert.x works with an existing business rules management system. Imagine for a moment that our fictional enterprise has a mission-critical application running inside JBoss Drools. We now need to create a new web application that can interact with this legacy app.

For the sake of simplicity, let's say our existing rules are a simple Hello World:
```
package drools



//list any import classes here.



//declare any global variables here



rule "Greetings"

    when

        greetingsReferenceObject: Greeting( message == "Hello World!" )

    then

        greetingsReferenceObject.greet();

    end

```

When this engine runs, we get "Drools Hello World!" This is not amazing, but let's imagine this was a really complex process.

### Implementing the Eclipse Vert.x JavaScript project

Like with any other JavaScript project, we'll use the standard npm commands to bootstrap a project. Here's how to bootstrap the project `drools-integration` and prepare it to use Vert.x:
```
# create an empty project directory

mkdir drools-integration

cd drools-integration



# create the initial package.json

npm init -y



# add a couple of dependencies

npm add vertx-scripts --save-dev

# You should see a tip like:

#Please add the following scripts to your 'package.json':

# "scripts": {

#   "postinstall": "vertx-scripts init",

#   "test": "vertx-scripts launcher test -t",

#   "start": "vertx-scripts launcher run",

#   "package": "vertx-scripts package"

# }



# add

npm add @vertx/web --save-prod

```

We have initialized a bare-bones project so we can start writing the JavaScript code. We'll start by adding a simple HTTP server that exposes a simple API. Every time a request is made to the URL `http://localhost:8080/greetings`, we should see the existing Drools engine's execution result in the terminal.

Start by creating an `index.js` file. If you're using VisualStudio Code, it's wise to add the following two lines to the beginning of your file:
```
/// <reference types="@vertx/core/runtime" />

/// @ts-check

```

These lines will enable full support and check the code for syntax errors. They aren't required, but they sure help during the development phase.

Next, add the simple HTTP server. Running on the JVM is not exactly the same as running on Node, and many libraries will not be available. Think of the JVM as a headless browser, and in many cases, code that runs in a browser can run on the JVM. This does not mean we can't have a high-performance HTTP server; in fact, this is exactly what Vert.x does. Let's start writing our server:
```
import { Router } from '@vertx/web';



// route all request based on the request path

const app = Router.router(vertx);



app.get('/greetings').handler(function (ctx) {

    // will invoke our existing drools engine here...

});



vertx

// create a HTTP server

.createHttpServer()

// on each request pass it to our APP

.requestHandler(function (req) {

    app.accept(req);

})

// listen on port 8080

.listen(8080);

```

The code is not complicated and should be self-explanatory, so let's focus on the integration with existing JVM code and libraries in the form of a Drools rule. Since Drools is a Java-based tool, we should build our application with a `java` build tool. Fortunately, because, behind the scenes, `vertx-scripts` delegates the JVM bits to Apache Maven, our work is easy.
```
mkdir -p src/main/java/drools

mkdir -p src/main/resources/drools

```

Next, we add the file `src/main/resources/drools/rules.drl` with the following content:
```
package drools



//list any import classes here.



//declare any global variables here



rule "Greetings"

    when

        greetingsReferenceObject: Greeting( message == "Hello World!" )

    then

        greetingsReferenceObject.greet();

    end

```

Then we'll add the file `src/main/java/drools/Greeting.java` with the following content:
```
package drools;



public interface Greeting {



  ();



  void greet();

}Greeting String getMessagegreet

```

Finally, we'll add the helper utility class `src/main/java/drools/DroolsHelper.java`:
```
package drools;



import org.drools.compiler.compiler.*;

import org.drools.core.*;

import java.io.*;



public final class DroolsHelper {



  /**

   * Simple factory to create a Drools WorkingMemory from the given `drl` file.

   */

  public static WorkingMemory load( drl) throws {

    PackageBuilder packageBuilder = new PackageBuilder();

    packageBuilder.addPackageFromDrl(new StringReader(drl));

    RuleBase ruleBase = RuleBaseFactory.newRuleBase();

    ruleBase.addPackage(packageBuilder.getPackage());

    return ruleBase.newStatefulSession();

  }



  /**

   * Simple factory to create a Greeting objects.

   */

  public static Greeting createGreeting( message, ) {

    return new Greeting() {

      @Override

      public () {

        return message;

      }



      @Override

      public void greet() {

        andThen.run();

      }

    };

  }

}DroolsHelperWorkingMemory load String drl IOException , DroolsParserExceptionPackageBuilder packageBuilderPackageBuilderpackageBuilder.drlRuleBase ruleBaseRuleBaseFactory.ruleBase.packageBuilder.ruleBase.Greeting createGreeting String message, Runnable andThenGreeting@Override String getMessagemessage@OverridegreetandThen.

```

We cannot use the file directly; we need to have `drools`. To do this, we add a custom property to our `package.json` named `mvnDependencies` (following the usual pattern):
```
{

    "mvnDependencies": {

        "org.drools:drools-compiler": "6.0.1.Final"

    }

}

```

Of course, since we updated the project file, we should update npm:
```
npm install

```

We are now entering the final step of this project, where we mix Java and JavaScript. We had a placeholder before, so let's fill in the gaps. We first use the helper Java class to create an engine (you can now see the power of Vert.x, a truly polyglot runtime), then invoke our engine whenever an HTTP request arrives.
```
// get a reference from Java to the JavaScript runtime

const DroolsHelper = Java.type('drools.DroolsHelper');

// get a drools engine instance

const engine = DroolsHelper.load(vertx.fileSystem().readFileBlocking("drools/rules.drl"));



app.get('/greetings').handler(function (ctx) {

  // create a greetings message

  var greeting = DroolsHelper.createGreeting('Hello World!', function () {

    // when a match happens you should see this message

    console.log('Greetings from Drools!');

  });



  // run the engine

  engine.insert(greeting);

  engine.fireAllRules();



  // complete the HTTP response

  ctx.response().end();

});

```

### Conclusion

As this simple example shows, Vert.x allows you to be truly polyglot. The reason to choose Vert.x is not because it's another JavaScript runtime, rather it's a runtime that allows you to reuse what you already have and quickly build new code using the tools and language that run the internet. We didn't touch on performance here (as it is a topic on its own), but I encourage you to look at independent benchmarks such as [TechEmpower][2] to explore that topic.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/benefits-javascript-vertx

作者：[Paulo Lopes][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/pml0pes
[1]:http://vertx.io/
[2]:https://www.techempower.com/benchmarks/#section=data-r15
