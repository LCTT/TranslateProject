[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use Emacs to create OAuth 2.0 UML sequence diagrams)
[#]: via: (https://www.onwebsecurity.com/configuration/use-emacs-to-create-oauth-2-0-uml-sequence-diagrams.html)
[#]: author: (Peter Mosmans https://www.onwebsecurity.com)

Use Emacs to create OAuth 2.0 UML sequence diagrams
======

![OAuth 2.0 abstract protocol flow][6]

It seems that the [OAuth 2.0 framework][7] is more and more being used by web (and mobile) applications. Great !

Although the protocol itself is not that complex, there are a number of different use-cases, flows and implementations to choose from. As with most things in life, the devil is in the detail.

When reviewing OAuth 2.0 implementations or writing penetration testing reports I like to draw UML diagrams. That makes it easier to understand what's going on, and to spot potential issues. After all, a picture is worth a thousand words.

This can be done extremely easy using the GPL-licensed open source [Emacs][8] editor, in conjunction with the GPL-licensed open source tool [PlantUML][9] (and optionally using Eclipse Public Licensed [Graphviz][10]).

Emacs is worlds' most versatile editor. In this case, it's being used to edit the text, and automatically convert the text to an image. PlantUML is a tool which allows you to write UML in human readable text and does the actual conversion. Graphviz is visualization software, and optionally - in this case, it's used to show certain images.

Download the [compiled PlantUML jar file][11], [Emacs][12] and optionally download and install [Graphviz][13].

Once you have Emacs installed and running, the following Lisp code (actually configuration) in your startup file (` ~/.emacs.d/init.d` ) will

  * configure ` org-mode` (a mode to organize and edit text files) to use PlantUML
  * add ` plantuml` to the recognized ` org-babel` languages (which allows you to execute source code from within text files)
  * allow the execution of PlantUML code as "safe"
  * automatically show you the resulting image



```
 ;; tell org-mode where to find the plantuml JAR file (specify the JAR file)
(setq org-plantuml-jar-path (expand-file-name "~/plantuml.jar"))

;; use plantuml as org-babel language
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))

;; helper function
(defun my-org-confirm-babel-evaluate (lang body)
"Do not ask for confirmation to evaluate code for specified languages."
(member lang '("plantuml")))

;; trust certain code as being safe
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

;; automatically show the resulting image
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
```

If you don't have a startup file yet, add this code to the file ` ~/.emacs.d/init.el` and restart Emacs.

Hint: Control-c Control-f allows you to create/open a (new) file. Control-x Control-s saves a file, and Control-x Control-c exits Emacs.

That's it!

To test the configuration, create/open a file ( Control-c Control-f ) with the extension ` .org` , e.g. ` test.org` . This makes sure that Emacs switches to "org-mode" and recognizes the "org-babel" syntax.

Insert the following code, and press Control-c Control-c within the code to test the installation:

```
#+BEGIN_SRC plantuml :file test.png
@startuml
version
@enduml
#+END_SRC
```

If everything went well, you'll see an image appearing inside Emacs, below the text.

Note

To quickly insert code snippets like ` #+BEGIN_SRC` and ` #+END_SRC` , you can use the built-in Easy Templates system: Type <s followed by a TAB , and it will automagically insert a template for you.

For a more advanced example, this is the UML source code used to generate the image above:

```
#+BEGIN_SRC plantuml :file t:/oauth2-abstract-protocol-flow.png
@startuml
hide footbox
title Oauth 2.0 Abstract protocol flow
autonumber
actor user as "resource owner (user)"
box "token stays secure" #FAFAFA
participant client as "client (application)"
participant authorization as "authorization server"
database resource as "resource server"
end box

group user authorizes client
client -> user : request authorization
note left
**grant types**:
# authorization code
# implicit
# password
# client_credentials
end note
user --> client : authorization grant
end

group token is generated
client -> authorization : request token\npresent authorization grant
authorization --> client :var: access token
note left
**response types**:
# code
# token
end note
end group

group resource can be accessed
client -> resource : request resource\npresent token
resource --> client : resource
end group
@enduml
#+END_SRC
```

Don't you just love the versatility of Emacs, and open source tools ?

--------------------------------------------------------------------------------

via: https://www.onwebsecurity.com/configuration/use-emacs-to-create-oauth-2-0-uml-sequence-diagrams.html

作者：[Peter Mosmans][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.onwebsecurity.com
[b]: https://github.com/lujun9972
[1]: https://www.onwebsecurity.com/category/configuration.html
[2]: https://www.onwebsecurity.com/tag/emacs.html
[3]: https://www.onwebsecurity.com/tag/oauth2.html
[4]: https://www.onwebsecurity.com/tag/pentesting.html
[5]: https://www.onwebsecurity.com/tag/security.html
[6]: https://www.onwebsecurity.com/images/oauth2-abstract-protocol-flow.png
[7]: https://tools.ietf.org/html/rfc6749
[8]: https://www.gnu.org/software/emacs/
[9]: https://plantuml.com
[10]: http://www.graphviz.org/
[11]: http://plantuml.com/download
[12]: https://www.gnu.org/software/emacs/download.html
[13]: http://www.graphviz.org/Download.php
