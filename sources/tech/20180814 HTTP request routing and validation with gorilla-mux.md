HTTP request routing and validation with gorilla/mux
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr)

The Go networking library includes the `http.ServeMux` structure type, which supports HTTP request multiplexing (routing): A web server routes an HTTP request for a hosted resource, with a URI such as /sales4today, to a code handler; the handler performs the appropriate logic before sending an HTTP response, typically an HTML page. Here’s a sketch of the architecture:
```
                 +------------+     +--------+     +---------+
HTTP request---->| web server |---->| router |---->| handler |
                 +------------+     +--------+     +---------+
```

In a call to the `ListenAndServe` method to start an HTTP server
```
http.ListenAndServe(":8888", nil) // args: port & router
```

a second argument of `nil` means that the `DefaultServeMux` is used for request routing.

The `gorilla/mux` package has a `mux.Router` type as an alternative to either the `DefaultServeMux` or a customized request multiplexer. In the `ListenAndServe` call, a `mux.Router` instance would replace `nil` as the second argument. What makes the `mux.Router` so appealing is best shown through a code example:

### 1\. A sample crud web app

The crud web application (see below) supports the four CRUD (Create Read Update Delete) operations, which match four HTTP request methods: POST, GET, PUT, and DELETE, respectively. In the crud app, the hosted resource is a list of cliche pairs, each a cliche and a conflicting cliche such as this pair:
```
Out of sight, out of mind. Absence makes the heart grow fonder.

```

New cliche pairs can be added, and existing ones can be edited or deleted.

**The crud web app**
```
package main

import (
   "gorilla/mux"
   "net/http"
   "fmt"
   "strconv"
)

const GETALL string = "GETALL"
const GETONE string = "GETONE"
const POST string   = "POST"
const PUT string    = "PUT"
const DELETE string = "DELETE"

type clichePair struct {
   Id      int
   Cliche  string
   Counter string
}

// Message sent to goroutine that accesses the requested resource.
type crudRequest struct {
   verb     string
   cp       *clichePair
   id       int
   cliche   string
   counter  string
   confirm  chan string
}

var clichesList = []*clichePair{}
var masterId = 1
var crudRequests chan *crudRequest

// GET /
// GET /cliches
func ClichesAll(res http.ResponseWriter, req *http.Request) {
   cr := &crudRequest{verb: GETALL, confirm: make(chan string)}
   completeRequest(cr, res, "read all")
}

// GET /cliches/id
func ClichesOne(res http.ResponseWriter, req *http.Request) {
   id := getIdFromRequest(req)
   cr := &crudRequest{verb: GETONE, id: id, confirm: make(chan string)}
   completeRequest(cr, res, "read one")
}

// POST /cliches

func ClichesCreate(res http.ResponseWriter, req *http.Request) {

   cliche, counter := getDataFromRequest(req)

   cp := new(clichePair)

   cp.Cliche = cliche

   cp.Counter = counter

   cr := &crudRequest{verb: POST, cp: cp, confirm: make(chan string)}

   completeRequest(cr, res, "create")

}



// PUT /cliches/id

func ClichesEdit(res http.ResponseWriter, req *http.Request) {

   id := getIdFromRequest(req)

   cliche, counter := getDataFromRequest(req)

   cr := &crudRequest{verb: PUT, id: id, cliche: cliche, counter: counter, confirm: make(chan string)}

   completeRequest(cr, res, "edit")

}



// DELETE /cliches/id

func ClichesDelete(res http.ResponseWriter, req *http.Request) {

   id := getIdFromRequest(req)

   cr := &crudRequest{verb: DELETE, id: id, confirm: make(chan string)}

   completeRequest(cr, res, "delete")

}



func completeRequest(cr *crudRequest, res http.ResponseWriter, logMsg string) {

   crudRequests<-cr

   msg := <-cr.confirm

   res.Write([]byte(msg))

   logIt(logMsg)

}



func main() {

   populateClichesList()



   // From now on, this gorountine alone accesses the clichesList.

   crudRequests = make(chan *crudRequest, 8)

   go func() { // resource manager

      for {

         select {

         case req := <-crudRequests:

         if req.verb == GETALL {

            req.confirm<-readAll()

         } else if req.verb == GETONE {

            req.confirm<-readOne(req.id)

         } else if req.verb == POST {

            req.confirm<-addPair(req.cp)

         } else if req.verb == PUT {

            req.confirm<-editPair(req.id, req.cliche, req.counter)

         } else if req.verb == DELETE {

            req.confirm<-deletePair(req.id)

         }

      }

   }()

   startServer()

}



func startServer() {

   router := mux.NewRouter()



   // Dispatch map for CRUD operations.

   router.HandleFunc("/", ClichesAll).Methods("GET")

   router.HandleFunc("/cliches", ClichesAll).Methods("GET")

   router.HandleFunc("/cliches/{id:[0-9]+}", ClichesOne).Methods("GET")



   router.HandleFunc("/cliches", ClichesCreate).Methods("POST")

   router.HandleFunc("/cliches/{id:[0-9]+}", ClichesEdit).Methods("PUT")

   router.HandleFunc("/cliches/{id:[0-9]+}", ClichesDelete).Methods("DELETE")



   http.Handle("/", router) // enable the router



   // Start the server.

   port := ":8888"

   fmt.Println("\nListening on port " + port)

   http.ListenAndServe(port, router); // mux.Router now in play

}



// Return entire list to requester.

func readAll() string {

   msg := "\n"

   for _, cliche := range clichesList {

      next := strconv.Itoa(cliche.Id) + ": " + cliche.Cliche + "  " + cliche.Counter + "\n"

      msg += next

   }

   return msg

}



// Return specified clichePair to requester.

func readOne(id int) string {

   msg := "\n" + "Bad Id: " + strconv.Itoa(id) + "\n"



   index := findCliche(id)

   if index >= 0 {

      cliche := clichesList[index]

      msg = "\n" + strconv.Itoa(id) + ": " + cliche.Cliche + "  " + cliche.Counter + "\n"

   }

   return msg

}



// Create a new clichePair and add to list

func addPair(cp *clichePair) string {

   cp.Id = masterId

   masterId++

   clichesList = append(clichesList, cp)

   return "\nCreated: " + cp.Cliche + " " + cp.Counter + "\n"

}



// Edit an existing clichePair

func editPair(id int, cliche string, counter string) string {

   msg := "\n" + "Bad Id: " + strconv.Itoa(id) + "\n"

   index := findCliche(id)

   if index >= 0 {

      clichesList[index].Cliche = cliche

      clichesList[index].Counter = counter

      msg = "\nCliche edited: " + cliche + " " + counter + "\n"

   }

   return msg

}



// Delete a clichePair

func deletePair(id int) string {

   idStr := strconv.Itoa(id)

   msg := "\n" + "Bad Id: " + idStr + "\n"

   index := findCliche(id)

   if index >= 0 {

      clichesList = append(clichesList[:index], clichesList[index + 1:]...)

      msg = "\nCliche " + idStr + " deleted\n"

   }

   return msg

}



//*** utility functions

func findCliche(id int) int {

   for i := 0; i < len(clichesList); i++ {

      if id == clichesList[i].Id {

         return i;

      }

   }

   return -1 // not found

}



func getIdFromRequest(req *http.Request) int {

   vars := mux.Vars(req)

   id, _ := strconv.Atoi(vars["id"])

   return id

}



func getDataFromRequest(req *http.Request) (string, string) {

   // Extract the user-provided data for the new clichePair

   req.ParseForm()

   form := req.Form

   cliche := form["cliche"][0]    // 1st and only member of a list

   counter := form["counter"][0]  // ditto

   return cliche, counter

}



func logIt(msg string) {

   fmt.Println(msg)

}



func populateClichesList() {

   var cliches = []string {

      "Out of sight, out of mind.",

      "A penny saved is a penny earned.",

      "He who hesitates is lost.",

   }

   var counterCliches = []string {

      "Absence makes the heart grow fonder.",

      "Penny-wise and dollar-foolish.",

      "Look before you leap.",

   }



   for i := 0; i < len(cliches); i++ {

      cp := new(clichePair)

      cp.Id = masterId

      masterId++

      cp.Cliche = cliches[i]

      cp.Counter = counterCliches[i]

      clichesList = append(clichesList, cp)

   }

}

```

To focus on request routing and validation, the crud app does not use HTML pages as responses to requests. Instead, requests result in plaintext response messages: A list of the cliche pairs is the response to a GET request, confirmation that a new cliche pair has been added to the list is a response to a POST request, and so on. This simplification makes it easy to test the app, in particular, the `gorilla/mux` components, with a command-line utility such as [curl][1].

The `gorilla/mux` package can be installed from [GitHub][2]. The crud app runs indefinitely; hence, it should be terminated with a Control-C or equivalent. The code for the crud app, together with a README and sample curl tests, is available on [my website][3].

### 2\. Request routing

The `mux.Router` extends REST-style routing, which gives equal weight to the HTTP method (e.g., GET) and the URI or path at the end of a URL (e.g., /cliches). The URI serves as the noun for the HTTP verb (method). For example, in an HTTP request a startline such as
```
GET /cliches

```

means get all of the cliche pairs, whereas a startline such as
```
POST /cliches

```

means create a cliche pair from data in the HTTP body.

In the crud web app, there are five functions that act as request handlers for five variations of an HTTP request:
```
ClichesAll(...)    # GET: get all of the cliche pairs

ClichesOne(...)    # GET: get a specified cliche pair

ClichesCreate(...) # POST: create a new cliche pair

ClichesEdit(...)   # PUT: edit an existing cliche pair

ClichesDelete(...) # DELETE: delete a specified cliche pair

```

Each function takes two arguments: an `http.ResponseWriter` for sending a response back to the requester, and a pointer to an `http.Request`, which encapsulates information from the underlying HTTP request. The `gorilla/mux` package makes it easy to register these request handlers with the web server, and to perform regex-based validation.

The `startServer` function in the crud app registers the request handlers. Consider this pair of registrations, with `router` as a `mux.Router` instance:
```
router.HandleFunc("/", ClichesAll).Methods("GET")

router.HandleFunc("/cliches", ClichesAll).Methods("GET")

```

These statements mean that a GET request for either the single slash / or /cliches should be routed to the `ClichesAll` function, which then handles the request. For example, the curl request (with % as the command-line prompt)
```
% curl --request GET localhost:8888/

```

produces this response:
```
1: Out of sight, out of mind.  Absence makes the heart grow fonder.

2: A penny saved is a penny earned.  Penny-wise and dollar-foolish.

3: He who hesitates is lost.  Look before you leap.

```

The three cliche pairs are the initial data in the crud app.

In this pair of registration statements
```
router.HandleFunc("/cliches", ClichesAll).Methods("GET")

router.HandleFunc("/cliches", ClichesCreate).Methods("POST")

```

the URI is the same (/cliches) but the verbs differ: GET in the first case, and POST in the second. This registration exemplifies REST-style routing because the difference in the verbs alone suffices to dispatch the requests to two different handlers.

More than one HTTP method is allowed in a registration, although this strains the spirit of REST-style routing:
```
router.HandleFunc("/cliches", DoItAll).Methods("POST", "GET")

```

HTTP requests can be routed on features besides the verb and the URI. For example, the registration
```
router.HandleFunc("/cliches", ClichesCreate).Schemes("https").Methods("POST")

```

requires HTTPS access for a POST request to create a new cliche pair. In similar fashion, a registration might require a request to have a specified HTTP header element (e.g., an authentication credential).

### 3\. Request validation

The `gorilla/mux` package takes an easy, intuitive approach to request validation through regular expressions. Consider this request handler for a get one operation:
```
router.HandleFunc("/cliches/{id:[0-9]+}", ClichesOne).Methods("GET")

```

This registration rules out HTTP requests such as
```
% curl --request GET localhost:8888/cliches/foo

```

because foo is not a decimal numeral. The request results in the familiar 404 (Not Found) status code. Including the regex pattern in this handler registration ensures that the `ClichesOne` function is called to handle a request only if the request URI ends with a decimal integer value:
```
% curl --request GET localhost:8888/cliches/3  # ok

```

As a second example, consider the request
```
% curl --request PUT --data "..." localhost:8888/cliches

```

This request results in a status code of 405 (Bad Method) because the /cliches URI is registered, in the crud app, only for GET and POST requests. A PUT request, like a GET one request, must include a numeric id at the end of the URI:
```
router.HandleFunc("/cliches/{id:[0-9]+}", ClichesEdit).Methods("PUT")

```

### 4\. Concurrency issues

The `gorilla/mux` router executes each call to a registered request handler as a separate goroutine, which means that concurrency is baked into the package. For example, if there are ten simultaneous requests such as
```
% curl --request POST --data "..." localhost:8888/cliches

```

then the `mux.Router` launches ten goroutines to execute the `ClichesCreate` handler.

Of the five request operations GET all, GET one, POST, PUT, and DELETE, the last three alter the requested resource, the shared `clichesList` that houses the cliche pairs. Accordingly, the crudapp needs to guarantee safe concurrency by coordinating access to the `clichesList`. In different but equivalent terms, the crud app must prevent a race condition on the `clichesList`. In a production environment, a database system might be used to store a resource such as the `clichesList`, and safe concurrency then could be managed through database transactions.

The crud app takes the recommended Go approach to safe concurrency:

  * Only a single goroutine, the resource manager started in the crud app `startServer` function, has access to the `clichesList` once the web server starts listening for requests.
  * The request handlers such as `ClichesCreate` and `ClichesAll` send a (pointer to) a `crudRequest` instance to a Go channel (thread-safe by default), and the resource manager alone reads from this channel. The resource manager then performs the requested operation on the `clichesList`.



The safe-concurrency architecture can be sketched as follows:
```
                 crudRequest                   read/write

request handlers------------->resource manager------------>clichesList

```

With this architecture, no explicit locking of the `clichesList` is needed because only one goroutine, the resource manager, accesses the `clichesList` once CRUD requests start coming in.

To keep the crud app as concurrent as possible, it’s essential to have an efficient division of labor between the request handlers, on the one side, and the single resource manager, on the other side. Here, for review, is the `ClichesCreate` request handler:
```
func ClichesCreate(res http.ResponseWriter, req *http.Request) {

   cliche, counter := getDataFromRequest(req)

   cp := new(clichePair)

   cp.Cliche = cliche

   cp.Counter = counter

   cr := &crudRequest{verb: POST, cp: cp, confirm: make(chan string)}

   completeRequest(cr, res, "create")

}ClichesCreateres httpResponseWriterreqclichecountergetDataFromRequestreqcpclichePaircpClicheclichecpCountercountercr&crudRequestverbPOSTcpcpconfirmcompleteRequestcrres

```

`ClichesCreate` calls the utility function `getDataFromRequest`, which extracts the new cliche and counter-cliche from the POST request. The `ClichesCreate` function then creates a new `ClichePair`, sets two fields, and creates a `crudRequest` to be sent to the single resource manager. This request includes a confirmation channel, which the resource manager uses to return information back to the request handler. All of the setup work can be done without involving the resource manager because the `clichesList` is not being accessed yet.

The request handlercalls the utility function, which extracts the new cliche and counter-cliche from the POST request. Thefunction then creates a new, sets two fields, and creates ato be sent to the single resource manager. This request includes a confirmation channel, which the resource manager uses to return information back to the request handler. All of the setup work can be done without involving the resource manager because theis not being accessed yet.

The `completeRequest` utility function called at the end of the `ClichesCreate` function and the other request handlers
```
completeRequest(cr, res, "create") // shown above

```

brings the resource manager into play by putting a `crudRequest` into the `crudRequests` channel:
```
func completeRequest(cr *crudRequest, res http.ResponseWriter, logMsg string) {

   crudRequests<-cr          // send request to resource manager

   msg := <-cr.confirm       // await confirmation string

   res.Write([]byte(msg))    // send confirmation back to requester

   logIt(logMsg)             // print to the standard output

}

```

For a POST request, the resource manager calls the utility function `addPair`, which changes the `clichesList` resource:
```
func addPair(cp *clichePair) string {

   cp.Id = masterId  // assign a unique ID

   masterId++        // update the ID counter

   clichesList = append(clichesList, cp) // update the list

   return "\nCreated: " + cp.Cliche + " " + cp.Counter + "\n"

}

```

The resource manager calls similar utility functions for the other CRUD operations. It’s worth repeating that the resource manager is the only goroutine to read or write the `clichesList` once the web server starts accepting requests.

For web applications of any type, the `gorilla/mux` package provides request routing, request validation, and related services in a straightforward, intuitive API. The crud web app highlights the package’s main features. Give the package a test drive, and you’ll likely be a buyer.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/http-request-routing-validation-gorillamux

作者：[Marty Kalin][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mkalindepauledu
[1]:https://curl.haxx.se/
[2]:https://github.com/gorilla/mux
[3]:http://condor.depaul.edu/mkalin
