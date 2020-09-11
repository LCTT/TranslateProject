[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Integrate online documents editors, into a Python web app using ONLYOFFICE)
[#]: via: (https://opensourceforu.com/2019/09/integrate-online-documents-editors-into-a-python-web-app-using-onlyoffice/)
[#]: author: (Aashima Sharma https://opensourceforu.com/author/aashima-sharma/)

Integrate online documents editors, into a Python web app using ONLYOFFICE
======

[![][1]][2]

_[ONLYOFFICE][3] is an open-source collaborative office suite distributed under the terms of GNU AGPL v.3 license. It contains three editors for text documents, spreadsheets, and presentations and features the following:_

  * Viewing, editing and co-editing docx, .xlsx, pptx files. OOXML as a core format ensures high compatibility with Microsoft Word, Excel and PowerPoint files.
  * Editing other popular formats (.odt, .rtf, .txt, .html, .ods., .csv, .odp) with inner conversion to OOXML.
  * Familiar tabbed interface.
  * Collaboration tools: two co-editing modes (fast and strict), track changes, comments and integrated chat.
  * Flexible access rights management: full access, read only, review, form filling and comment.
  * Building your own add-ons using the API.
  * 250 languages available and hieroglyphic alphabets.



API allowing the developers integrate ONLYOFFICE editors into their own web sites and apps written in any programming language and setup and manage the editors.

To integrate ONLYOFFICE editors, we will need an integration app connecting the editors (ONLYOFFICE Document Server) and your service. To use editors within your interface, it should grant to ONLYOFFICE the following permissions :

  * Adding and executing custom code.
  * Anonymous access for downloading and saving files. It means that the editors only communicate with your service on the server side without involving any user authorization data from the client side (browser cookies).
  * Adding new buttons to UI (for example, “Open in ONLYOFFICE”, “Edit in ONLYOFFICE”).
  * Оpening a new page where ONLYOFFICE can execute the script to add an editor.
  * Ability to specify Document Server connection settings.



There are several cases of successful integration with popular collaboration solutions such as Nextcloud, ownCloud, Alfresco, Confluence and SharePoint, via official ready-to-use connectors offered by ONLYOFFICE.

One of the most actual integration cases is the integration of ONLYOFFICE editors with its open-source collaboration platform written in C#. This platform features document and project management, CRM, email aggregator, calendar, user database, blogs, forums, polls, wiki, and instant messenger.

Integrating online editors with CRM and Projects modules, you can:

  * Attach documents to CRM opportunities and cases, or to project tasks and discussions, or even create a separate folder with documents, spreadsheets, and presentations related to the project.
  * Create new docs, sheets, and presentations right in CRM or in the Project module.
  * Open and edit attached documents, or download and delete them.
  * Import contacts to your CRM in bulk from a CSV file as well as export the customer database as a CSV file.



In the Mail module, you can attach files stored in the Documents module or insert a link to the needed document into the message body. When ONLYOFFICE users receive a message with an attached document, they are able to: download the attachment, view the file in the browser, open the file for editing or save it to the Documents module. As mentioned above, if the format differs from OOXML, the file will be automatically converted to .docx/.xlsx/.pptx and its copy will be saved in the original format as well.

In this article, you will see the integration process of ONLYOFFICE into the Document Management System written in Python, one of the most popular programming languages. The following steps will show you how to create all the necessary elements to make possible work and collaboration on documents within DMS interface: viewing, editing, co-editing, saving files and users access management and may serve as an example of integration into your Python app.

**1\. What you will need**

Let’s start off by creating key components of the integration process: [_ONLYOFFICE Document Server_][4] and DMS written in Python.

1.1 To install ONLYOFFICE Document Server you can choose from multiple installation options: compile the source code available on GitHub, use .deb or .rpm packages or the Docker image.
We recommend installing Document Server and all the necessary dependencies with only one command using the Docker image. Please note, that choosing this method, you need the latest Docker version installed.

```
docker run -itd -p 80:80 onlyoffice/documentserver-de
```

1.2 We need to develop DMS in Python. If you have one already, please, check if it meets the following conditions:

  * Has a list of files you need to open for viewing/editing
  * Allows downloading files



For the app, we will use a Bottle framework. We will install it in the working directory using the following command:

```
pip install bottle
```

Then we create the app’s code * main.py*  and the template _index.tpl_ .
We add the following code into this * main.py*  file:

```
from bottle import route, run, template, get, static_file # connecting the framework and the necessary components
@route('/') # setting up routing for requests for /
def index():
return template('index.tpl') # showing template in response to request
run(host="localhost", port=8080) # running the application on port 8080
```

Once we run the app, an empty page will be rendered on <http://localhost:8080 >.

In order, the Document Server to be able to create new docs, add default files and form a list of their names in the template, we should create a folder  _files_ , and put 3 files (.docx, .xlsx and .pptx) in there.

To read these files’ names, we use the _listdir_ component.

```
from os import listdir
```

Now let’s create a variable for all the file names from the files folder:

```
sample_files = [f for f in listdir('files')]
```

To use this variable in the template, we need to pass it through the _template_ method:

```
def index():
return template('index.tpl', sample_files=sample_files)

Here’s this variable in the template:
%for file in sample_files:
<div>
<span>{{file}}</span>
</div>
% end
```

We restart the application to see the list of filenames on the page.
Here’s the method to make these files available for all the app users:

```
@get("/files/<filepath:re:.*\.*>")
def show_sample_files(filepath):
return static_file(filepath, root="files")
```

**2\. How to view docs in ONLYOFFICE within the Python App**
Once all the components are ready, let’s add functions to make editors operational within the app interface.

The first option enables users to open and view docs. Connect document editors API in the template:

```
<script type="text/javascript" src="editor_url/web-apps/apps/api/documents/api.js"></script>
```

_editor_url_  is a link to document editors.

A button to open each file for viewing:

```
<button onclick="view('files/{{file}}')">view</button>
```

Now we need to add a div with  _id_ , in which the document editor will be opened:

```
<div id="editor"></div>
```

To open the editor, we have to call a function:

```
<script>
function view(filename) {
if (/docx$/.exec(filename)) {
filetype = "text"
}
if (/xlsx$/.exec(filename)) {
filetype = "spreadsheet"
}
if (/pptx$/.exec(filename)) {
filetype = "presentation",
title: filename
}
new DocsAPI.DocEditor("editor",
{
documentType: filetype,
document: {
url: "host_url" + '/' + filename,
title: filename
},
editorConfig: {mode: 'view'}
});
}
</script>
```

There are two arguments for the DocEditor function: id of the element where the editors will be opened and a JSON with the editors’ settings.
In this example, the following mandatory parameters are used:

  * _documentType_ is identified by its format (.docx, .xlsx, .pptx for texts, spreadsheets and presentations accordingly)
  * _document.url_ is the link to the file you are going to open.
  * _editorConfig.mode_.



We can also add _title_ that will be displayed in the editors.

So, now we have everything to view docs in our Python app.

**3\. How to edit docs in ONLYOFFICE within the Python App**
First of all, add the “Edit” button:

```
<button onclick="edit('files/{{file}}')">edit</button>
```

Then create a new function that will open files for editing. It is similar to the View function.
Now we have 3 functions:

```
<script>
var editor;
function view(filename) {
if (editor) {
editor.destroyEditor()
}
editor = new DocsAPI.DocEditor("editor",
{
documentType: get_file_type(filename),
document: {
url: "host_url" + '/' + filename,
title: filename
},
editorConfig: {mode: 'view'}
});
}
function edit(filename) {
if (editor) {
editor.destroyEditor()
}
editor = new DocsAPI.DocEditor("editor",
{
documentType: get_file_type(filename),
document: {
url: "host_url" + '/' + filename,
title: filename
}
});
}
function get_file_type(filename) {
if (/docx$/.exec(filename)) {
return "text"
}
if (/xlsx$/.exec(filename)) {
return "spreadsheet"
}
if (/pptx$/.exec(filename)) {
return "presentation"
}
}
</script>
```

_destroyEditor_  is called to close an open editor.
As you might notice, the _editorConfig_ parameter is absent from the _edit()_ function, because it has by default the value * {“mode”: “edit”}.*

Now we have everything to open docs for co-editing in your Python app.

**4\. How to co-edit docs in ONLYOFFICE within the Python App**
Co-editing is implemented by using the same document.key for the same document in the editors’ settings. Without this key, the editors will create the editing session each time you open the file.

Set unique keys for each doc to make users connect to the same editing session for co-editing. The format of the key should be the following:  _filename + “_key”_. The next step is to add it to all of the configs where document is present.

```
document: {
url: "host_url" + '/' + filepath,
title: filename,
key: filename + '_key'
},
```

**5\. How to save docs in ONLYOFFICE within the Python App**
Every time we change and save the file, ONLYOFFICE stores all its versions. Let’s see closely how it works. After we close the editor, Document Server builds the file version to be saved and sends the request to callbackUrl address. This request contains document.key and the link to the just built file.
document.key is used to find the old version of the file and replace it with the new one. As we do not have any database here, we just send the filename using callbackUrl.
Specify _callbackUrl_ parameter in the setting in _editorConfig.callbackUrl_ and add it to the _edit()method_:

```
function edit(filename) {
const filepath = 'files/' + filename;
if (editor) {
editor.destroyEditor()
}
editor = new DocsAPI.DocEditor("editor",
{
documentType: get_file_type(filepath),
document: {
url: "host_url" + '/' + filepath,
title: filename,
key: filename + '_key'
}
,
editorConfig: {
mode: 'edit',
callbackUrl: "host_url" + '/callback' + '&filename=' + filename // add file name as a request parameter
}
});
}
```

Write a method that will save file after getting the POST request to* /callback* address:

```
@post("/callback") # processing post requests for /callback
def callback():
if request.json['status'] == 2:
file = requests.get(request.json['url']).content
with open('files/' + request.query['filename'], 'wb') as f:
f.write(file)
return "{\"error\":0}"
```

* # status 2*  is the built file.

When we close the editor, the new version of the file will be saved to storage.

**6\. How to manage users in ONLYOFFICE within the Python App**
If there are users in your app, and you need to see who exactly is editing a doc, write their identifiers (id and name) in the editors’ configuration.
Add the ability to select a user in the interface:

```
<select id="user_selector" onchange="pick_user()">
<option value="1" selected="selected">JD</option>
<option value="2">Turk</option>
<option value="3">Elliot</option>
<option value="4">Carla</option>
</select>
```

If you add the call of the function *pick_user()*at the beginning of the tag _&lt;script&gt;_, it will initialize, in the function itself, the variables responsible for the id and the user name.

```
function pick_user() {
const user_selector = document.getElementById("user_selector");
this.current_user_name = user_selector.options[user_selector.selectedIndex].text;
this.current_user_id = user_selector.options[user_selector.selectedIndex].value;
}
```

Make use of _editorConfig.user.id_ and  _editorConfig.user.name_ to configure user’s settings. Add these parameters to the editors’ configuration in the file editing function.

```
function edit(filename) {
const filepath = 'files/' + filename;
if (editor) {
editor.destroyEditor()
}
editor = new DocsAPI.DocEditor("editor",
{
documentType: get_file_type(filepath),
document: {
url: "host_url" + '/' + filepath,
title: filename
},
editorConfig: {
mode: 'edit',
callbackUrl: "host_url" + '/callback' + '?filename=' + filename,
user: {
id: this.current_user_id,
name: this.current_user_name
}
}
});
}
```

Using this approach, you can integrate ONLYOFFICE editors into your app written in Python and get all the necessary tools for working and collaborating on docs. For more integration examples (Java, Node.js, PHP, Ruby), please, refer to the official [_API documentation_][5].

**By: Maria Pashkina**

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/09/integrate-online-documents-editors-into-a-python-web-app-using-onlyoffice/

作者：[Aashima Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/aashima-sharma/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2016/09/Typist-composing-text-in-laptop.jpg?resize=696%2C420&ssl=1 (Typist composing text in laptop)
[2]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2016/09/Typist-composing-text-in-laptop.jpg?fit=900%2C543&ssl=1
[3]: https://www.onlyoffice.com/en/
[4]: https://www.onlyoffice.com/en/developer-edition.aspx
[5]: https://api.onlyoffice.com/editors/basic
