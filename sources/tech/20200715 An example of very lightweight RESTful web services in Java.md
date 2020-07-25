[#]: collector: (lujun9972)
[#]: translator: (Yufei-Yan)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (An example of very lightweight RESTful web services in Java)
[#]: via: (https://opensource.com/article/20/7/restful-services-java)
[#]: author: (Marty Kalin https://opensource.com/users/mkalindepauledu)

An example of very lightweight RESTful web services in Java
======
Explore lightweight RESTful services in Java through a full code example
to manage a book collection.
![Coding on a computer][1]

Web services, in one form or another, have been around for more than two decades. For example, [XML-RPC services][2] appeared in the late 1990s, followed shortly by ones written in the SOAP offshoot. Services in the [REST architectural style][3] also made the scene about two decades ago, soon after the XML-RPC and SOAP trailblazers. [REST][4]-style (hereafter, Restful) services now dominate in popular sites such as eBay, Facebook, and Twitter. Despite the alternatives to web services for distributed computing (e.g., web sockets, microservices, and new frameworks for remote-procedure calls), Restful web services remain attractive for several reasons:

  * Restful services build upon existing infrastructure and protocols, in particular, web servers and the HTTP/HTTPS protocols. An organization that has HTML-based websites can readily add web services for clients interested more in the data and underlying functionality than in the HTML presentation. Amazon, for example, has pioneered making the same information and functionality available through both websites and web services, either SOAP-based or Restful.

  * Restful services treat HTTP as an API, thereby avoiding the complicated software layering that has come to characterize the SOAP-based approach to web services. For example, the Restful API supports the standard CRUD (Create-Read-Update-Delete) operations through the HTTP verbs POST-GET-PUT-DELETE, respectively; HTTP status codes inform a requester whether a request succeeded or why it failed.

  * Restful web services can be as simple or complicated as needed. Restful is a style—indeed, a very flexible one—rather than a set of prescriptions about how services should be designed and structured. (The attendant downside is that it may be hard to determine what does _not_ count as a Restful service.)

  * For a consumer or client, Restful web services are language- and platform-neutral. The client makes requests in HTTP(S) and receives text responses in a format suitable for modern data interchange (e.g., JSON).

  * Almost every general-purpose programming language has at least adequate (and often strong) support for HTTP/HTTPS, which means that web-service clients can be written in those languages.




This article explores lightweight Restful services in Java through a full code example.

### The Restful novels web service

The Restful novels web service consists of three programmer-defined classes:

  * The `Novel` class represents a novel with just three properties: a machine-generated ID, an author, and a title. The properties could be expanded for more realism, but I want to keep this example simple.


  * The `Novels` class consists of utilities for various tasks: converting a plain-text encoding of a `Novel` or a list of them into XML or JSON; supporting the CRUD operations on the novels collection; and initializing the collection from data stored in a file. The `Novels` class mediates between `Novel` instances and the servlet.


  * The `NovelsServlet` class derives from `HttpServlet`, a sturdy and flexible piece of software that has been around since the very early enterprise Java of the late 1990s. The servlet acts as an HTTP endpoint for client CRUD requests. The servlet code focuses on processing client requests and generating the appropriate responses, leaving the devilish details to utilities in the `Novels` class.



Some Java frameworks, such as Jersey (JAX-RS) and Restlet, are designed for Restful services. Nonetheless, the `HttpServlet` on its own provides a lightweight, flexible, powerful, and well-tested API for delivering such services. I'll demonstrate this with the novels example.

### Deploy the novels web service

Deploying the novels web service requires a web server, of course. My choice is [Tomcat][5], but the service should work (famous last words!) if it's hosted on, for example, Jetty or even a Java Application Server. The code and a README that summarizes how to install Tomcat are [available on my website][6]. There is also a documented Apache Ant script that builds the novels service (or any other service or website) and deploys it under Tomcat or the equivalent.

Tomcat is available for download from its [website][7]. Once you install it locally, let `TOMCAT_HOME` be the install directory. There are two subdirectories of immediate interest:

  * The `TOMCAT_HOME/bin` directory contains startup and stop scripts for Unix-like systems (`startup.sh` and `shutdown.sh`) and Windows (`startup.bat` and `shutdown.bat`). Tomcat runs as a Java application. The web server's servlet container is named Catalina. (In Jetty, the web server and container have the same name.) Once Tomcat starts, enter `http://localhost:8080/` in a browser to see extensive documentation, including examples.

  * The `TOMCAT_HOME/webapps` directory is the default for deployed websites and web services. The straightforward way to deploy a website or web service is to copy a JAR file with a `.war` extension (hence, a WAR file) to `TOMCAT_HOME/webapps` or a subdirectory thereof. Tomcat then unpacks the WAR file into its own directory. For example, Tomcat would unpack `novels.war` into a subdirectory named `novels`, leaving `novels.war` as-is. A website or service can be removed by deleting the WAR file and updated by overwriting the WAR file with a new version. By the way, the first step in debugging a website or service is to check that Tomcat has unpacked the WAR file; if not, the site or service was not published because of a fatal error in the code or configuration.

  * Because Tomcat listens by default on port 8080 for HTTP requests, a request URL for Tomcat on the local machine begins:


```
`http://localhost:8080/`
```

Access a programmer-deployed WAR file by adding the WAR file's name but without the `.war` extension:


```
`http://locahost:8080/novels/`
```

If the service was deployed in a subdirectory (e.g., `myapps`) of `TOMCAT_HOME`, this would be reflected in the URL:


```
`http://locahost:8080/myapps/novels/`
```

I'll offer more details about this in the testing section near the end of the article.




As noted, the ZIP file on my homepage contains an Ant script that compiles and deploys a website or service. (A copy of `novels.war` is also included in the ZIP file.) For the novels example, a sample command (with `%` as the command-line prompt) is:


```
`% ant -Dwar.name=novels deploy`
```

This command compiles Java source files and then builds a deployable file named `novels.war`, leaves this file in the current directory, and copies it to `TOMCAT_HOME/webapps`. If all goes well, a `GET` request (using a browser or a command-line utility, such as `curl`) serves as a first test:


```
`% curl http://localhost:8080/novels/`
```

Tomcat is configured, by default, for _hot deploys_: the web server does not need to be shut down to deploy, update, or remove a web application.

### The novels service at the code level

Let's get back to the novels example but at the code level. Consider the `Novel` class below:

#### Example 1. The Novel class


```
package novels;

import java.io.Serializable;

public class Novel implements [Serializable][8], Comparable&lt;Novel&gt; {
    static final long serialVersionUID = 1L;
    private [String][9] author;
    private [String][9] title;
    private int id;

    public Novel() { }

    public void setAuthor(final [String][9] author) { this.author = author; }
    public [String][9] getAuthor() { return this.author; }
    public void setTitle(final [String][9] title) { this.title = title; }
    public [String][9] getTitle() { return this.title; }
    public void setId(final int id) { this.id = id; }
    public int getId() { return this.id; }

    public int compareTo(final Novel other) { return this.id - other.id; }
}
```

This class implements the `compareTo` method from the `Comparable` interface because `Novel` instances are stored in a thread-safe `ConcurrentHashMap`, which does not enforce a sorted order. In responding to requests to view the collection, the novels service sorts a collection (an `ArrayList`) extracted from the map; the implementation of `compareTo` enforces an ascending sorted order by `Novel` ID.

The class `Novels` contains various utility functions:

#### Example 2. The Novels utility class


```
package novels;

import java.io.IOException;
import java.io.File;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.nio.file.Files;
import java.util.stream.Stream;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.Collections;
import java.beans.XMLEncoder;
import javax.servlet.ServletContext; // not in JavaSE
import org.json.JSONObject;
import org.json.XML;

public class Novels {
    private final [String][9] fileName = "/WEB-INF/data/novels.db";
    private ConcurrentMap&lt;[Integer][10], Novel&gt; novels;
    private ServletContext sctx;
    private AtomicInteger mapKey;

    public Novels() {
        novels = new ConcurrentHashMap&lt;[Integer][10], Novel&gt;();
        mapKey = new AtomicInteger();
    }

    public void setServletContext(ServletContext sctx) { this.sctx = sctx; }
    public ServletContext getServletContext() { return this.sctx; }

    public ConcurrentMap&lt;[Integer][10], Novel&gt; getConcurrentMap() {
        if (getServletContext() == null) return null; // not initialized
        if (novels.size() &lt; 1) populate();
        return this.novels;
    }

    public [String][9] toXml([Object][11] obj) { // default encoding
        [String][9] xml = null;
        try {
            [ByteArrayOutputStream][12] out = new [ByteArrayOutputStream][12]();
            XMLEncoder encoder = new XMLEncoder(out);
            encoder.writeObject(obj);
            encoder.close();
            xml = out.toString();
        }
        catch([Exception][13] e) { }
        return xml;
    }

    public [String][9] toJson([String][9] xml) { // option for requester
        try {
            JSONObject jobt = XML.toJSONObject(xml);
            return jobt.toString(3); // 3 is indentation level
        }
        catch([Exception][13] e) { }
        return null;
    }

    public int addNovel(Novel novel) {
        int id = mapKey.incrementAndGet();
        novel.setId(id);
        novels.put(id, novel);
        return id;
    }

    private void populate() {
        [InputStream][14] in = sctx.getResourceAsStream(this.fileName);
        // Convert novel.db string data into novels.
        if (in != null) {
            try {
                [InputStreamReader][15] isr = new [InputStreamReader][15](in);
                [BufferedReader][16] reader = new [BufferedReader][16](isr);

                [String][9] record = null;
                while ((record = reader.readLine()) != null) {
                    [String][9][] parts = record.split("!");
                    if (parts.length == 2) {
                        Novel novel = new Novel();
                        novel.setAuthor(parts[0]);
                        novel.setTitle(parts[1]);
                        addNovel(novel); // sets the Id, adds to map
                    }
                }
                in.close();
            }
            catch ([IOException][17] e) { }
        }
    }
}
```

The most complicated method is `populate`, which reads from a text file contained in the deployed WAR file. The text file contains the initial collection of novels. To open the text file, the `populate` method needs the `ServletContext`, a Java map that contains all of the critical information about the servlet embedded in the servlet container. The text file, in turn, contains records such as this:


```
`Jane Austen!Persuasion`
```

The line is parsed into two parts (author and title) separated by the bang symbol (`!`). The method then builds a `Novel` instance, sets the author and title properties, and adds the novel to the collection, which acts as an in-memory data store.

The `Novels` class also has utilities to encode the novels collection into XML or JSON, depending upon the format that the requester prefers. XML is the default, but JSON is available upon request. A lightweight XML-to-JSON package provides the JSON. Further details on encoding are below.

#### Example 3. The NovelsServlet class


```
package novels;

import java.util.concurrent.ConcurrentMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.beans.XMLEncoder;
import org.json.JSONObject;
import org.json.XML;

public class NovelsServlet extends HttpServlet {
    static final long serialVersionUID = 1L;
    private Novels novels; // back-end bean

    // Executed when servlet is first loaded into container.
    @Override
    public void init() {
        this.novels = new Novels();
        novels.setServletContext(this.getServletContext());
    }

    // GET /novels
    // GET /novels?id=1
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        [String][9] param = request.getParameter("id");
        [Integer][10] key = (param == null) ? null : [Integer][10].valueOf((param.trim()));

        // Check user preference for XML or JSON by inspecting
        // the HTTP headers for the Accept key.
        boolean json = false;
        [String][9] accept = request.getHeader("accept");
        if (accept != null &amp;&amp; accept.contains("json")) json = true;

        // If no query string, assume client wants the full list.
        if (key == null) {
            ConcurrentMap&lt;[Integer][10], Novel&gt; map = novels.getConcurrentMap();
            [Object][11][] list = map.values().toArray();
            [Arrays][18].sort(list);

            [String][9] payload = novels.toXml(list);        // defaults to Xml
            if (json) payload = novels.toJson(payload); // Json preferred?
            sendResponse(response, payload);
        }
        // Otherwise, return the specified Novel.
        else {
            Novel novel = novels.getConcurrentMap().get(key);
            if (novel == null) { // no such Novel
                [String][9] msg = key + " does not map to a novel.\n";
                sendResponse(response, novels.toXml(msg));
            }
            else { // requested Novel found
                if (json) sendResponse(response, novels.toJson(novels.toXml(novel)));
                else sendResponse(response, novels.toXml(novel));
            }
        }
    }

    // POST /novels
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        [String][9] author = request.getParameter("author");
        [String][9] title = request.getParameter("title");

        // Are the data to create a new novel present?
        if (author == null || title == null)
            throw new [RuntimeException][19]([Integer][10].toString(HttpServletResponse.SC_BAD_REQUEST));

        // Create a novel.
        Novel n = new Novel();
        n.setAuthor(author);
        n.setTitle(title);

        // Save the ID of the newly created Novel.
        int id = novels.addNovel(n);

        // Generate the confirmation message.
        [String][9] msg = "Novel " + id + " created.\n";
        sendResponse(response, novels.toXml(msg));
    }

    // PUT /novels
    @Override
    public void doPut(HttpServletRequest request, HttpServletResponse response) {
        /* A workaround is necessary for a PUT request because Tomcat does not
           generate a workable parameter map for the PUT verb. */
        [String][9] key = null;
        [String][9] rest = null;
        boolean author = false;

        /* Let the hack begin. */
        try {
            [BufferedReader][16] br =
                new [BufferedReader][16](new [InputStreamReader][15](request.getInputStream()));
            [String][9] data = br.readLine();
            /* To simplify the hack, assume that the PUT request has exactly
               two parameters: the id and either author or title. Assume, further,
               that the id comes first. From the client side, a hash character
               # separates the id and the author/title, e.g.,

                  id=33#title=War and Peace
            */
            [String][9][] args = data.split("#");      // id in args[0], rest in args[1]
            [String][9][] parts1 = args[0].split("="); // id = parts1[1]
            key = parts1[1];

            [String][9][] parts2 = args[1].split("="); // parts2[0] is key
            if (parts2[0].contains("author")) author = true;
            rest = parts2[1];
        }
        catch([Exception][13] e) {
            throw new [RuntimeException][19]([Integer][10].toString(HttpServletResponse.SC_INTERNAL_SERVER_ERROR));
        }

        // If no key, then the request is ill formed.
        if (key == null)
            throw new [RuntimeException][19]([Integer][10].toString(HttpServletResponse.SC_BAD_REQUEST));

        // Look up the specified novel.
        Novel p = novels.getConcurrentMap().get([Integer][10].valueOf((key.trim())));
        if (p == null) { // not found
            [String][9] msg = key + " does not map to a novel.\n";
            sendResponse(response, novels.toXml(msg));
        }
        else { // found
            if (rest == null) {
                throw new [RuntimeException][19]([Integer][10].toString(HttpServletResponse.SC_BAD_REQUEST));
            }
            // Do the editing.
            else {
                if (author) p.setAuthor(rest);
                else p.setTitle(rest);

                [String][9] msg = "Novel " + key + " has been edited.\n";
                sendResponse(response, novels.toXml(msg));
            }
        }
    }

    // DELETE /novels?id=1
    @Override
    public void doDelete(HttpServletRequest request, HttpServletResponse response) {
        [String][9] param = request.getParameter("id");
        [Integer][10] key = (param == null) ? null : [Integer][10].valueOf((param.trim()));
        // Only one Novel can be deleted at a time.
        if (key == null)
            throw new [RuntimeException][19]([Integer][10].toString(HttpServletResponse.SC_BAD_REQUEST));
        try {
            novels.getConcurrentMap().remove(key);
            [String][9] msg = "Novel " + key + " removed.\n";
            sendResponse(response, novels.toXml(msg));
        }
        catch([Exception][13] e) {
            throw new [RuntimeException][19]([Integer][10].toString(HttpServletResponse.SC_INTERNAL_SERVER_ERROR));
        }
    }

    // Methods Not Allowed
    @Override
    public void doTrace(HttpServletRequest request, HttpServletResponse response) {
        throw new [RuntimeException][19]([Integer][10].toString(HttpServletResponse.SC_METHOD_NOT_ALLOWED));
    }

    @Override
    public void doHead(HttpServletRequest request, HttpServletResponse response) {
        throw new [RuntimeException][19]([Integer][10].toString(HttpServletResponse.SC_METHOD_NOT_ALLOWED));
    }

    @Override
    public void doOptions(HttpServletRequest request, HttpServletResponse response) {
        throw new [RuntimeException][19]([Integer][10].toString(HttpServletResponse.SC_METHOD_NOT_ALLOWED));
    }

    // Send the response payload (Xml or Json) to the client.
    private void sendResponse(HttpServletResponse response, [String][9] payload) {
        try {
            [OutputStream][20] out = response.getOutputStream();
            out.write(payload.getBytes());
            out.flush();
        }
        catch([Exception][13] e) {
            throw new [RuntimeException][19]([Integer][10].toString(HttpServletResponse.SC_INTERNAL_SERVER_ERROR));
        }
    }
}
```

Recall that the `NovelsServlet` class above extends the `HttpServlet` class, which in turn extends the `GenericServlet` class, which implements the `Servlet` interface:


```
`NovelsServlet extends HttpServlet extends GenericServlet implements Servlet`
```

As the name makes clear, the `HttpServlet` is designed for servlets delivered over HTTP(S). The class provides empty methods named after the standard HTTP request verbs (officially, _methods_):

  * `doPost` (Post = Create)
  * `doGet` (Get = Read)
  * `doPut` (Put = Update)
  * `doDelete` (Delete = Delete)



Some additional HTTP verbs are covered as well. An extension of the `HttpServlet`, such as the `NovelsServlet`, overrides any `do` method of interest, leaving the others as no-ops. The `NovelsServlet` overrides seven of the `do` methods.

Each of the `HttpServlet` CRUD methods takes the same two arguments. Here is `doPost` as an example:


```
`public void doPost(HttpServletRequest request, HttpServletResponse response) {`
```

The `request` argument is a map of the HTTP request information, and the `response` provides an output stream back to the requester. A method such as `doPost` is structured as follows:

  * Read the `request` information, taking whatever action is appropriate to generate a response. If information is missing or otherwise deficient, generate an error.


  * Use the extracted request information to perform the appropriate CRUD operation (in this case, create a `Novel`) and then encode an appropriate response to the requester using the `response` output stream to do so. In the case of `doPost`, the response is a confirmation that a new novel has been created and added to the collection. Once the response is sent, the output stream is closed, which closes the connection as well.



### More on the do method overrides

An HTTP request has a relatively simple structure. Here is a sketch in the familiar HTTP 1.1 format, with comments introduced by double sharp signs:


```
GET /novels              ## start line
Host: localhost:8080     ## header element
Accept-type: text/plain  ## ditto
...
[body]                   ## POST and PUT only
```

The start line begins with the HTTP verb (in this case, `GET`) and the URI (Uniform Resource Identifier), which is the noun (in this case, `novels`) that names the targeted resource. The headers consist of key-value pairs, with a colon separating the key on the left from the value(s) on the right. The header with key `Host` (case insensitive) is required; the hostname `localhost` is the symbolic address of the local machine on the local machine, and the port number `8080` is the default for the Tomcat web server awaiting HTTP requests. (By default, Tomcat listens on port 8443 for HTTPS requests.) The header elements can occur in arbitrary order. In this example, the `Accept-type` header's value is the MIME type `text/plain`.

Some requests (in particular, `POST` and `PUT`) have bodies, whereas others (in particular, `GET` and `DELETE`) do not. If there is a body (perhaps empty), two newlines separate the headers from the body; the HTTP body consists of key-value pairs. For bodyless requests, header elements, such as the query string, can be used to send information. Here is a request to `GET` the `/novels` resource with the ID of 2:


```
`GET /novels?id=2`
```

The query string starts with the question mark and, in general, consists of key-value pairs, although a key without a value is possible.

The `HttpServlet`, with methods such as `getParameter` and `getParameterMap`, nicely hides the distinction between HTTP requests with and without a body. In the novels example, the `getParameter` method is used to extract the required information from the `GET`, `POST`, and `DELETE` requests. (Handling a `PUT` request requires lower-level code because Tomcat does not provide a workable parameter map for `PUT` requests.) Here, for illustration, is a slice of the `doPost` method in the `NovelsServlet` override:


```
@Override
public void doPost(HttpServletRequest request, HttpServletResponse response) {
   [String][9] author = request.getParameter("author");
   [String][9] title = request.getParameter("title");
   ...
```

For a bodyless `DELETE` request, the approach is essentially the same:


```
@Override
public void doDelete(HttpServletRequest request, HttpServletResponse response) {
   [String][9] param = request.getParameter("id"); // id of novel to be removed
   ...
```

The `doGet` method needs to distinguish between two flavors of a `GET` request: one flavor means "get all*"*, whereas the other means _get a specified one_. If the `GET` request URL contains a query string whose key is an ID, then the request is interpreted as "get a specified one":


```
`http://localhost:8080/novels?id=2  ## GET specified`
```

If there is no query string, the `GET` request is interpreted as "get all":


```
`http://localhost:8080/novels       ## GET all`
```

### Some devilish details

The novels service design reflects how a Java-based web server such as Tomcat works. At startup, Tomcat builds a thread pool from which request handlers are drawn, an approach known as the _one thread per request model_. Modern versions of Tomcat also use non-blocking I/O to boost performance.

The novels service executes as a _single_ instance of the `NovelsServlet` class, which in turn maintains a _single_ collection of novels. Accordingly, a race condition would arise, for example, if these two requests were processed concurrently:

  * One request changes the collection by adding a new novel.
  * The other request gets all the novels in the collection.



The outcome is indeterminate, depending on exactly how the _read_ and _write_ operations overlap. To avoid this problem, the novels service uses a thread-safe `ConcurrentMap`. Keys for this map are generated with a thread-safe `AtomicInteger`. Here is the relevant code segment:


```
public class Novels {
    private ConcurrentMap&lt;[Integer][10], Novel&gt; novels;
    private AtomicInteger mapKey;
    ...
```

By default, a response to a client request is encoded as XML. The novels program uses the old-time `XMLEncoder` class for simplicity; a far richer option is the JAX-B library. The code is straightforward:


```
public [String][9] toXml([Object][11] obj) { // default encoding
   [String][9] xml = null;
   try {
      [ByteArrayOutputStream][12] out = new [ByteArrayOutputStream][12]();
      XMLEncoder encoder = new XMLEncoder(out);
      encoder.writeObject(obj);
      encoder.close();
      xml = out.toString();
   }
   catch([Exception][13] e) { }
   return xml;
}
```

The `Object` parameter is either a sorted `ArrayList` of novels (in response to a "get all" request); or a single `Novel` instance (in response to a _get one_ request); or a `String` (a confirmation message).

If an HTTP request header refers to JSON as a desired type, then the XML is converted to JSON. Here is the check in the `doGet` method of the `NovelsServlet`:


```
[String][9] accept = request.getHeader("accept"); // "accept" is case insensitive
if (accept != null &amp;&amp; accept.contains("json")) json = true;
```

The `Novels` class houses the `toJson` method, which converts XML to JSON:


```
public [String][9] toJson([String][9] xml) { // option for requester
   try {
      JSONObject jobt = XML.toJSONObject(xml);
      return jobt.toString(3); // 3 is indentation level
   }
   catch([Exception][13] e) { }
   return null;
}
```

The `NovelsServlet` checks for errors of various types. For example, a `POST` request should include an author and a title for the new novel. If either is missing, the `doPost` method throws an exception:


```
if (author == null || title == null)
   throw new [RuntimeException][19]([Integer][10].toString(HttpServletResponse.SC_BAD_REQUEST));
```

The `SC` in `SC_BAD_REQUEST` stands for _status code_, and the `BAD_REQUEST` has the standard HTTP numeric value of 400. If the HTTP verb in a request is `TRACE`, a different status code is returned:


```
public void doTrace(HttpServletRequest request, HttpServletResponse response) {
   throw new [RuntimeException][19]([Integer][10].toString(HttpServletResponse.SC_METHOD_NOT_ALLOWED));
}
```

### Testing the novels service

Testing a web service with a browser is tricky. Among the CRUD verbs, modern browsers generate only `POST` (Create) and `GET` (Read) requests. Even a `POST` request is challenging from a browser, as the key-values for the body need to be included; this is typically done through an HTML form. A command-line utility such as [curl][21] is a better way to go, as this section illustrates with some `curl` commands, which are included in the ZIP on my website.

Here are some sample tests without the corresponding output:


```
% curl localhost:8080/novels/
% curl localhost:8080/novels?id=1
% curl --header "Accept: application/json" localhost:8080/novels/
```

The first command requests all the novels, which are encoded by default in XML. The second command requests the novel with an ID of 1, which is encoded in XML. The last command adds an `Accept` header element with `application/json` as the MIME type desired. The `get one` command could also use this header element. Such requests have JSON rather than the XML responses.

The next two commands create a new novel in the collection and confirm the addition:


```
% curl --request POST --data "author=Tolstoy&amp;title=War and Peace" localhost:8080/novels/
% curl localhost:8080/novels?id=4
```

A `PUT` command in `curl` resembles a `POST` command except that the `PUT` body does not use standard syntax. The documentation for the `doPut` method in the `NovelsServlet` goes into detail, but the short version is that Tomcat does not generate a proper map on `PUT` requests. Here is the sample `PUT` command and a confirmation command:


```
% curl --request PUT --data "id=3#title=This is an UPDATE" localhost:8080/novels/
% curl localhost:8080/novels?id=3
```

The second command confirms the update.

Finally, the `DELETE` command works as expected:


```
% curl --request DELETE localhost:8080/novels?id=2
% curl localhost:8080/novels/
```

The request is for the novel with the ID of 2 to be deleted. The second command shows the remaining novels.

### The web.xml configuration file

Although it's officially optional, a `web.xml` configuration file is a mainstay in a production-grade website or service. The configuration file allows routing, security, and other features of a site or service to be specified independently of the implementation code. The configuration for the novels service handles routing by providing a URL pattern for requests dispatched to this service:


```
&lt;?xml version = "1.0" encoding = "UTF-8"?&gt;
&lt;web-app&gt;
  &lt;servlet&gt;
    &lt;servlet-name&gt;novels&lt;/servlet-name&gt;
    &lt;servlet-class&gt;novels.NovelsServlet&lt;/servlet-class&gt;
  &lt;/servlet&gt;
  &lt;servlet-mapping&gt;
    &lt;servlet-name&gt;novels&lt;/servlet-name&gt;
    &lt;url-pattern&gt;/*&lt;/url-pattern&gt;
  &lt;/servlet-mapping&gt;
&lt;/web-app&gt;
```

The `servlet-name` element provides an abbreviation (`novels`) for the servlet's fully qualified class name (`novels.NovelsServlet`), and this name is used in the `servlet-mapping` element below.

Recall that a URL for a deployed service has the WAR file name right after the port number:


```
`http://localhost:8080/novels/`
```

The slash immediately after the port number begins the URI known as the _path_ to the requested resource, in this case, the novels service; hence, the term `novels` occurs after the first single slash.

In the `web.xml` file, the `url-pattern` is specified as `/*`, which means _any path that starts with /novels_. Suppose Tomcat encounters a contrived request URL, such as this:


```
`http://localhost:8080/novels/foobar/`
```

The `web.xml` configuration specifies that this request, too, should be dispatched to the novels servlet because the `/*` pattern covers `/foobar`. The contrived URL thus has the same result as the legitimate one shown above it.

A production-grade configuration file might include information on security, both wire-level and users-roles. Even in this case, the configuration file would be only two or three times the size of the sample one.

### Wrapping up

The `HttpServlet` is at the center of Java's web technologies. A website or web service, such as the novels service, extends this class, overriding the `do` verbs of interest. A Restful framework such as Jersey (JAX-RS) or Restlet does essentially the same by providing a customized servlet, which then acts as the HTTP(S) endpoint for requests against a web application written in the framework.

A servlet-based application has access, of course, to any Java library required in the web application. If the application follows the separation-of-concerns principle, then the servlet code remains attractively simple: the code checks a request, issuing the appropriate error if there are deficiencies; otherwise, the code calls out for whatever functionality may be required (e.g., querying a database, encoding a response in a specified format), and then sends the response to the requester. The `HttpServletRequest` and `HttpServletResponse` types make it easy to perform the servlet-specific work of reading the request and writing the response.

Java has APIs that range from the very simple to the highly complicated. If you need to deliver some Restful services using Java, my advice is to give the low-fuss `HttpServlet` a try before anything else.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/restful-services-java

作者：[Marty Kalin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkalindepauledu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: http://xmlrpc.com/
[3]: https://en.wikipedia.org/wiki/Representational_state_transfer
[4]: https://www.redhat.com/en/topics/integration/whats-the-difference-between-soap-rest
[5]: http://tomcat.apache.org/
[6]: https://condor.depaul.edu/mkalin
[7]: https://tomcat.apache.org/download-90.cgi
[8]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+serializable
[9]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[10]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+integer
[11]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+object
[12]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+bytearrayoutputstream
[13]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+exception
[14]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+inputstream
[15]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+inputstreamreader
[16]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+bufferedreader
[17]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+ioexception
[18]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+arrays
[19]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+runtimeexception
[20]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+outputstream
[21]: https://curl.haxx.se/
