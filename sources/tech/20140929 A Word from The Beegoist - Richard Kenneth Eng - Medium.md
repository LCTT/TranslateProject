A Word from The Beegoist – Richard Kenneth Eng – Medium
======
I like the [Go programming language][22]. I sought to use Go to write web applications. To this end, I examined two of the “full stack” web frameworks available to Go developers (aka “Gophers”): [Beego][23] and [Revel][24].

The reason I looked for full stack was because of my prior experience with [web2py][25], a Python-based framework with extraordinary capability that was also [deliciously easy to get started and be highly productive in][26]. (I also cut my teeth on Smalltalk-based [Seaside][27], which has the same qualities.) In my opinion, full stack is the only way to go because developers should not waste time and effort on the minutiae of tool configuration and setup. The focus should be almost entirely on writing your application.

Between Beego and Revel, I chose the former. It seemed to be more mature and better documented. It also had a built-in [ORM][28].

To be sure, Beego isn’t as easy and productive as web2py, but I believe in Go, so it is worth the effort to give Beego my best shot. To get started with Beego, I needed a project, a useful exercise that covered all the bases, such as database management, CSS styling, email capability, form validation, etc., and also provided a useful end product.

The project I selected was a user account management component for web applications. All of my previous applications required user registration/login, and Beego did not appear to have anything like that available.

Now that I’ve completed the project, I believe it would be an excellent foundation for a Beego tutorial. I do not pretend that the code is optimal, nor do I pretend that it is bug-free, but if there are any bugs, it would be a good exercise for a novice to resolve them.

The inspiration for this tutorial arose from my failure to find good, thorough tutorials when I first started learning Beego. There is one 2-part tutorial that is often mentioned, but I found Part 2 sorely lacking. Throwing source code at you for you to figure out on your own is no way to teach. Thus, I wanted to offer my take on a tutorial. Only history will determine whether it was successful.

So, without further ado, let’s begin. The word is “Go!”

### Basic Assumptions

You have some familiarity with the Go language. I highly recommend you follow this [Go tutorial][1].

You’ve installed [Go][2] and [Beego][3] on your computer. There are plenty of good online resources to help you here (for [example][4]). It’s really quite easy.

You have basic knowledge of CSS, HTML, and databases. You have at least one database package installed on your computer such as [MySQL][5] (Community Edition) or [SQLite][6]. I have SQLite because it’s much easier to use.

You have some experience writing software; basic skills are assumed. If you studied computer programming in school, then you’re off to a good start.

You will be using your favourite programming editor in conjunction with the command line. I use [LiteIDE][7] (on the Mac), but I can suggest alternatives such as [TextMate][8] for the Mac, [Notepad++][9] for Windows, and [vim][10] for Linux.

These basic assumptions define the target audience for the tutorial. If you’re a programming veteran, though, you’ll breeze through it and hopefully gain much useful knowledge, as well.

### Creating the Project

First, we must create a Beego project. We’ll call it ‘[ACME][11]’. From the command line, change directory (cd) to $GOPATH/src and enter:
```
$ bee new acme

```

The following directory structure will be created:
```
acme
....conf
....controllers
....models
....routers
....static
........css
........img
........js
....tests
....views

```

Note that Beego is a MVC framework (Model/View/Controller), which means that your application will be separated into three general sections. Model refers to the internal database structure of your application. View is all about how your application looks on the computer screen; in our case, this includes HTML and CSS code. And Controller is where you have your business logic and user interactions.

You can immediately compile and run your application by changing directory (cd acme) and typing:
```
$ bee run

```

In your browser, go to <http://localhost:8080> to see the running application. It doesn’t do anything fancy right now; it simply greets you. But upon this foundation, we shall raise an impressive edifice.

### The Source Code

To follow along, you may [download the source code][12] for this tutorial. Cd to $GOPATH/src and unzip the file. [When you download the source, the filename that Github uses is ‘acme-master’. You must change it to ‘acme’.]

### Program Design

The user account management component provides the following functionality:

  1. User registration (account creation)
  2. Account verification (via email)
  3. Login (create a session)
  4. Logout (delete the session)
  5. User profile (can change name, email, or password)
  6. Remove user account



The essence of a web application is the mapping of URLs (webpages) to the server functions that will process the HTTP requests. This mapping is what generates the work flow in the application. In Beego, the mapping is defined within the ‘router’. Here’s the code for our router (look at router.go in the ‘routers’ directory):
```
beego.Router("/home", &controllers.MainController{})
beego.Router("/user/login/:back", &controllers.MainController{}, "get,post:Login")
beego.Router("/user/logout", &controllers.MainController{}, "get:Logout")
beego.Router("/user/register", &controllers.MainController{}, "get,post:Register")
beego.Router("/user/profile", &controllers.MainController{}, "get,post:Profile")
beego.Router("/user/verify/:uuid({[0-9A-F]{8}-[0-9A-F]{4}-4[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}})", &controllers.MainController{}, "get:Verify")
beego.Router("/user/remove", &controllers.MainController{}, "get,post:Remove")
beego.Router("/notice", &controllers.MainController{}, "get:Notice")

```

For example, in the line for ‘login’, “get,post:Login” says that both the GET and POST operations are handled by the ‘Login’ function. The ‘:back’ is a request parameter; in this case, it tells us what page to return to after successful login.

In the line for ‘verify’, the ‘:uuid’ is a request parameter that must match the [regular expression][13] for a Version 4 UUID. The GET operation is handled by the ‘Verify’ function.

More on this when we talk about controllers.

Note that I’ve added ‘/home’ to the first line in the router (it was originally ‘/’). This makes it convenient to go to the home page, which we often do in our application.

### Model

The database model for a user account is represented by the following struct:
```
package models

```
```
import (
 "github.com/astaxie/beego/orm"
 "time"
)

```
```
type AuthUser struct {
 Id int
 First string
 Last string
 Email string `orm:"unique"`
 Password string
 Reg_key string
 Reg_date time.Time `orm:"auto_now_add;type(datetime)"`
}

```
```
func init() {
 orm.RegisterModel(new(AuthUser))
}

```

Place this in models.go in the ‘models’ directory. Ignore the init() for the time being.

‘Id’ is the primary key which is auto-incremented in the database. We also have ‘First’ and ‘Last’ names. ‘Password’ contains the hexadecimal representation of the [PBKDF2 hash][14] of the plaintext password.

‘Reg_key’ contains the [UUID][15] string that is used for account verification (via email). ‘Reg_date’ is the timestamp indicating the time of registration.

The funny-looking string literals associated with both ‘Email’ and ‘Reg_date’ are used to tell the database the special requirements of these fields. ‘Email’ must be a unique key. ‘Reg_date’ will be automatically assigned the date and time of database insertion.

By the way, don’t be scared of the PBKDF2 and UUID references. PBKDF2 is simply a way to securely store a user’s password in the database. A UUID is a unique identifier that can be used to ensure the identity of the user for verification purposes.

### View

For our CSS template design, I’ve chosen the [Stardust][16] theme (pictured at the start of this article). We will use its index.html as a basis for the view layout.

Place the appropriate files from the Stardust theme into the ‘css’ and ‘img’ directories of ‘static’ directory. The link statement in the header of index.html must be amended to:
```
<link href="/static/css/default.css" rel="stylesheet" type="text/css" />

```

And all references to image gifs and jpegs in index.html and default.css must point to ‘/static/img/’.

The view layout contains a header section, a footer section, a sidebar section, and the central section where most of the action will take place. We will be using Go’s templating facility which allows us to replace embedded codes, signified by ‘{{‘ and ‘}}’, with actual HTML. Here’s our basic-layout.tpl (.tpl for ‘template’):
```
{{.Header}}
{{.LayoutContent}}
{{.Sidebar}}
{{.Footer}}

```

Since every webpage in our application will need to adhere to this basic layout, we need a common method to set it up (look at default.go):
```
func (this *MainController) activeContent(view string) {
 this.Layout = "basic-layout.tpl"
 this.LayoutSections = make(map[string]string)
 this.LayoutSections["Header"] = "header.tpl"
 this.LayoutSections["Sidebar"] = "sidebar.tpl"
 this.LayoutSections["Footer"] = "footer.tpl"
 this.TplNames = view + ".tpl"

```
```
 sess := this.GetSession("acme")
 if sess != nil {
 this.Data["InSession"] = 1 // for login bar in header.tpl
 m := sess.(map[string]interface{})
 this.Data["First"] = m["first"]
 }
}

```

The template parameters, such as ‘.Sidebar’, correspond to the keys used in the LayoutSections map. ‘.LayoutContent’ is a special, implicit template parameter. We’ll get to the GetSession stuff further below.

Of course, we need to create the various template files (such as footer.tpl) in the ‘views’ directory. From index.html, we can carve out the header section for header.tpl:
```
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>StarDust by Free Css Templates</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/static/css/default.css" rel="stylesheet" type="text/css" />
</head>

```
```
<body>
<!-- start header -->
<div id="header-bg">
 <div id="header">
 <div align="right">{{if .InSession}}
 Welcome, {{.First}} [<a href="http://localhost:8080/logout">Logout</a>|<a href="http://localhost:8080/profile">Profile</a>]
 {{else}}
 [<a href="http://localhost:8080/login/home">Login</a>]
 {{end}}
 </div>
 <div id="logo">
 <h1><a href="#">StarDust<sup></sup></a></h1>
 <h2>Designed by FreeCSSTemplates</h2>
 </div>
 <div id="menu">
 <ul>
 <li class="active"><a href="http://localhost:8080/home">home</a></li>
 <li><a href="#">photos</a></li>
 <li><a href="#">about</a></li>
 <li><a href="#">links</a></li>
 <li><a href="#">contact </a></li>
 </ul>
 </div>
 </div>
</div>
<!-- end header -->
<!-- start page -->
<div id="page">

```

I leave it as an exercise for you to carve out the sections for sidebar.tpl and footer.tpl.

Note the lines in bold. I added them to facilitate a “login bar” at the top of every webpage. Once you’ve logged into the application, you will see the bar as so:

![][17]

This login bar works in conjunction with the GetSession code snippet we saw in activeContent(). The logic is, if the user is logged in (ie, there is a non-nil session), then we set the InSession parameter to a value (any value), which tells the templating engine to use the “Welcome” bar instead of “Login”. We also extract the user’s first name from the session so that we can present the friendly affectation “Welcome, Richard”.

The home page, represented by index.tpl, uses the following snippet from index.html:
```
 <!-- start content -->
 <div id="content">
 <div class="post">
 <h1 class="title">Welcome to StarDust</h1>
 // to save space, I won't enter the remainder
 // of the snippet
 </div>
 <!-- end content -->

```

#### Special Note

The template files for the user module reside in the ‘user’ directory within ‘views’, just to keep things tidy. So, for example, the call to activeContent() for login is:
```
this.activeContent("user/login")

```

### Controller

A controller handles requests by handing them off to the appropriate function or ‘method’. We only have one controller for our application and it’s defined in default.go. The default method Get() for handling a GET operation is associated with our home page:
```
func (this *MainController) Get() {
 this.activeContent("index")

```
```
 //bin //boot //dev //etc //home //lib //lib64 //media //mnt //opt //proc //root //run //sbin //speedup //srv //sys //tmp //usr //var This page requires login
 sess := this.GetSession("acme")
 if sess == nil {
 this.Redirect("/user/login/home", 302)
 return
 }
 m := sess.(map[string]interface{})
 fmt.Println("username is", m["username"])
 fmt.Println("logged in at", m["timestamp"])
}

```

I’ve made login a requirement for accessing this page. Logging in means creating a session, which by default expires after 3600 seconds of inactivity. A session is typically maintained on the client side by a ‘cookie’.

In order to support sessions in the application, the ‘SessionOn’ flag must be set to true. There are two ways to do this:

  1. Insert ‘beego.SessionOn = true’ in the main program, main.go.
  2. Insert ‘sessionon = true’ in the configuration file, app.conf, which can be found in the ‘conf’ directory.



I chose #1. (But note that I used the configuration file to set ‘EnableAdmin’ to true: ‘enableadmin = true’. EnableAdmin allows you to use the Supervisor Module in Beego that keeps track of CPU, memory, Garbage Collector, threads, etc., via port 8088: <http://localhost:8088>.)

#### The Main Program

The main program is also where we initialize the database to be used with the ORM (Object Relational Mapping) component. ORM makes it more convenient to perform database activities within our application. The main program’s init():
```
func init() {
 orm.RegisterDriver("sqlite", orm.DR_Sqlite)
 orm.RegisterDataBase("default", "sqlite3", "acme.db")
 name := "default"
 force := false
 verbose := false
 err := orm.RunSyncdb(name, force, verbose)
 if err != nil {
 fmt.Println(err)
 }
}

```

To use SQLite, we must import ‘go-sqlite3', which can be installed with the command:
```
$ go get github.com/mattn/go-sqlite3

```

As you can see in the code snippet, the SQLite driver must be registered and ‘acme.db’ must be registered as our SQLite database.

Recall in models.go, there was an init() function:
```
func init() {
 orm.RegisterModel(new(AuthUser))
}

```

The database model has to be registered so that the appropriate table can be generated. To ensure that this init() function is executed, you must import ‘models’ without actually using it within the main program, as follows:
```
import _ "acme/models"

```

RunSyncdb() is used to autogenerate the tables when you start the program. (This is very handy for creating the database tables without having to **manually** do it in the database command line utility.) If you set ‘force’ to true, it will drop any existing tables and recreate them.

#### The User Module

User.go contains all the methods for handling login, registration, profile, etc. There are several third-party packages we need to import; they provide support for email, PBKDF2, and UUID. But first we must get them into our project…
```
$ go get github.com/alexcesaro/mail/gomail
$ go get github.com/twinj/uuid

```

I originally got **github.com/gokyle/pbkdf2** , but this package was pulled from Github, so you can no longer get it. I’ve incorporated this package into my source under the ‘utilities’ folder, and the import is:
```
import pk "acme/utilities/pbkdf2"

```

The ‘pk’ is a convenient alias so that I don’t have to type the rather unwieldy ‘pbkdf2'.

#### ORM

It’s pretty straightforward to use ORM. The basic pattern is to create an ORM object, specify the ‘default’ database, and select which ORM operation you want, eg,
```
o := orm.NewOrm()
o.Using("default")
err := o.Insert(&user) // or
err := o.Read(&user, "Email") // or
err := o.Update(&user) // or
err := o.Delete(&user)

```

#### Flash

By the way, Beego provides a way to present notifications on your webpage through the use of ‘flash’. Basically, you create a ‘flash’ object, give it your notification message, store the flash in the controller, and then retrieve the message in the template file, eg,
```
flash := beego.NewFlash()
flash.Error("You've goofed!") // or
flash.Notice("Well done!")
flash.Store(&this.Controller)

```

And in your template file, reference the Error flash with:
```
{{if .flash.error}}
<h3>{{.flash.error}}</h3>
&nbsp;
{{end}}

```

#### Form Validation

Once the user posts a request (by pressing the Submit button, for example), our handler must extract and validate the form input. So, first, check that we have a POST operation:
```
if this.Ctx.Input.Method() == "POST" {

```

Let’s get a form element, say, email:
```
email := this.GetString("email")

```

The string “email” is the same as in the HTML form:
```
<input name="email" type="text" />

```

To validate it, we create a validation object, specify the type of validation, and then check to see if there are any errors:
```
valid := validation.Validation{}
valid.Email(email, "email") // must be a proper email address
if valid.HasErrors() {
 for _, err := range valid.Errors {

```

What you do with the errors is up to you. I like to present all of them at once to the user, so as I go through the range of valid.Errors, I add them to a map of errors that will eventually be used in the template file. Hence, the full snippet:
```
if this.Ctx.Input.Method() == "POST" {
 email := this.GetString("email")
 password := this.GetString("password")
 valid := validation.Validation{}
 valid.Email(email, "email")
 valid.Required(password, "password")
 if valid.HasErrors() {
 errormap := []string{}
 for _, err := range valid.Errors {
 errormap = append(errormap, "Validation failed on "+err.Key+": "+err.Message+"\n")
 }
 this.Data["Errors"] = errormap
 return
 }

```

### The User Management Methods

We’ve looked at the major pieces of the controller. Now, we get to the meat of the application, the user management methods:

  * Login()
  * Logout()
  * Register()
  * Verify()
  * Profile()
  * Remove()



Recall that we saw references to these functions in the router. The router associates each URL (and HTTP request) with the corresponding controller method.

#### Login()

Let’s look at the pseudocode for this method:
```
if the HTTP request is "POST" then
 Validate the form (extract the email address and password).
 Read the password hash from the database, keying on email.
 Compare the submitted password with the one on record.
 Create a session for this user.
endif

```

In order to compare passwords, we need to give pk.MatchPassword() a variable with members ‘Hash’ and ‘Salt’ that are **byte slices**. Hence,
```
var x pk.PasswordHash

```
```
x.Hash = make([]byte, 32)
x.Salt = make([]byte, 16)
// after x has the password from the database, then...

```
```
if !pk.MatchPassword(password, &x) {
 flash.Error("Bad password")
 flash.Store(&this.Controller)
 return
}

```

Creating a session is trivial, but we want to store some useful information in the session, as well. So we make a map and store first name, email address, and the time of login:
```
m := make(map[string]interface{})
m["first"] = user.First
m["username"] = email
m["timestamp"] = time.Now()
this.SetSession("acme", m)
this.Redirect("/"+back, 302) // go to previous page after login

```

Incidentally, the name “acme” passed to SetSession is completely arbitrary; you just need to reference the same name to get the same session.

#### Logout()

This one is trivially easy. We delete the session and redirect to the home page.

#### Register()
```
if the HTTP request is "POST" then
 Validate the form.
 Create the password hash for the submitted password.
 Prepare new user record.
 Convert the password hash to hexadecimal string.
 Generate a UUID and insert the user into database.
 Send a verification email.
 Flash a message on the notification page.
endif

```

To send a verification email to the user, we use **gomail** …
```
link := "http://localhost:8080/user/verify/" + u // u is UUID
host := "smtp.gmail.com"
port := 587
msg := gomail.NewMessage()
msg.SetAddressHeader("From", "acmecorp@gmail.com", "ACME Corporation")
msg.SetHeader("To", email)
msg.SetHeader("Subject", "Account Verification for ACME Corporation")
msg.SetBody("text/html", "To verify your account, please click on the link: <a href=\""+link+"\">"+link+"</a><br><br>Best Regards,<br>ACME Corporation")
m := gomail.NewMailer(host, "youraccount@gmail.com", "YourPassword", port)
if err := m.Send(msg); err != nil {
 return false
}

```

I chose Gmail as my email relay (you will need to open your own account). Note that Gmail ignores the “From” address (in our case, “[acmecorp@gmail.com][18]”) because Gmail does not permit you to alter the sender address in order to prevent phishing.

#### Notice()

This special router method is for displaying a flash message on a notification page. It’s not really a user module function; it’s general enough that you can use it in many other places.

#### Profile()

We’ve already discussed all the pieces in this function. The pseudocode is:
```
Login required; check for a session.
Get user record from database, keyed on email (or username).
if the HTTP request is "POST" then
 Validate the form.
 if there is a new password then
 Validate the new password.
 Create the password hash for the new password.
 Convert the password hash to hexadecimal string.
 endif
 Compare submitted current password with the one on record.
 Update the user record.
 - update the username stored in session
endif

```

#### Verify()

The verification email contains a link which, when clicked by the recipient, causes Verify() to process the UUID. Verify() attempts to read the user record, keyed on the UUID or registration key, and if it’s found, then the registration key is removed from the database.

#### Remove()

Remove() is pretty much like Login(), except that instead of creating a session, you delete the user record from the database.

### Exercise

I left out one user management method: What if the user has forgotten his password? We should provide a way to reset the password. I leave this as an exercise for you. All the pieces you need are in this tutorial. (Hint: You’ll need to do it in a way similar to Registration verification. You should add a new Reset_key to the AuthUser table. And make sure the user email address exists in the database before you send the Reset email!)

[Okay, so I’ll give you the [exercise solution][19]. I’m not cruel.]

### Wrapping Up

Let’s review what we’ve learned. We covered the mapping of URLs to request handlers in the router. We showed how to incorporate a CSS template design into our views. We discussed the ORM package, and how it’s used to perform database operations. We examined a number of third-party utilities useful in writing our application. The end result is a component useful in many scenarios.

This is a great deal of material in a tutorial, but I believe it’s the best way to get started in writing a practical application.

[For further material, look at the [sequel][20] to this article, as well as the [final edition][21].]

--------------------------------------------------------------------------------

via: https://medium.com/@richardeng/a-word-from-the-beegoist-d562ff8589d7

作者：[Richard Kenneth Eng][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@richardeng?source=post_header_lockup
[1]:http://tour.golang.org/
[2]:http://golang.org/
[3]:http://beego.me/
[4]:https://medium.com/@richardeng/in-the-beginning-61c7e63a3ea6
[5]:http://www.mysql.com/
[6]:http://www.sqlite.org/
[7]:https://code.google.com/p/liteide/
[8]:http://macromates.com/
[9]:http://notepad-plus-plus.org/
[10]:https://medium.com/@richardeng/back-to-the-future-9db24d6bcee1
[11]:http://en.wikipedia.org/wiki/Acme_Corporation
[12]:https://github.com/horrido/acme
[13]:http://en.wikipedia.org/wiki/Regular_expression
[14]:http://en.wikipedia.org/wiki/PBKDF2
[15]:http://en.wikipedia.org/wiki/Universally_unique_identifier
[16]:http://www.freewebtemplates.com/download/free-website-template/stardust-141989295/
[17]:https://cdn-images-1.medium.com/max/1600/1*1OpYy1ISYGUaBy0U_RJ75w.png
[18]:mailto:acmecorp@gmail.com
[19]:https://github.com/horrido/acme-exercise
[20]:https://medium.com/@richardeng/a-word-from-the-beegoist-ii-9561351698eb
[21]:https://medium.com/@richardeng/a-word-from-the-beegoist-iii-dbd6308b2594
[22]: http://golang.org/
[23]: http://beego.me/
[24]: http://revel.github.io/
[25]: http://www.web2py.com/
[26]: https://medium.com/@richardeng/the-zen-of-web2py-ede59769d084
[27]: http://www.seaside.st/
[28]: http://en.wikipedia.org/wiki/Object-relational_mapping
