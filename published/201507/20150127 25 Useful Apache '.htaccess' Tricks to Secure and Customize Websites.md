25 个有用 Apache ‘.htaccess’ 技巧
================================================================================
网站是我们生活中重要的一部分。它们是实现扩大业务、分享知识以及其它更多功能的方式。早期受制于只能提供静态内容，随着动态客户端和服务器端脚本语言的引入和现有静态语言的持续改进，例如从 html 到 html5，动态网站成为可能，剩下的也许在不久的将来也会实现。

对于网站，随之而来的是需要一个能向全球大规模用户显示站点的某个东西。这个需求可以通过托管网站的服务器实现。这包括一系列的服务器，例如：Apache HTTP Server、Joomla 以及 允许个人拥有自己网站的 WordPress。

![Apache htaccess 小技巧](http://www.tecmint.com/wp-content/uploads/2015/01/htaccess-tricks.jpg)

*25 个 htaccess 小技巧*

想要拥有一个网站，可以创建一个自己的本地服务器，或者联系任何上面提到的或其它服务器管理员来托管他的网站。但实际问题也从这点开始。网站的性能主要取决于以下因素：

- 网站消耗的带宽。
- 面对黑客，网站有多安全。
- 对数据库进行数据检索时的优化。
- 显示导航菜单和提供更多 UI 功能时的用户友好性。

除此之外，保证托管网站服务器成功的多种因素还包括：

- 对于一个流行站点的数据压缩量。
- 同时为多个对请求同一或不同站点的用户服务的能力。
- 保证网站上输入的机密数据安全，例如：Email、信用卡信息等等。
- 允许更多的选项用于增强站点的动态性。

这篇文章讨论一个服务器提供的用于增强网站性能和提高针对坏机器人、热链等的安全性的功能：‘.htaccess’ 文件。

### .htaccess 是什么？ ###

htaccess (hypertext access，超文本访问) 是为网站所有者提供用于控制服务器环境变量以及其它参数的选项，从而增强他们网站的功能的文件。这些文件可以在网站目录树的任何一个目录中，并向该目录以及目录中的文件和子目录提供功能。

这些功能是什么呢？其实这些是服务器的指令，例如命令服务器执行特定任务的行，这些命令只对该文件所在目录中的文件和子目录有效。这些文件默认是隐藏的，因为所有操作系统和网站服务器默认配置为忽略它们，但如果查看隐藏文件的话，你就可以看到这些特殊文件。后续章节的话题将讨论能控制什么类型的参数。

注意：如果 .htaccess 文件保存在 /apache/home/www/Gunjit/ 目录，那么它会向该目录中的所有文件和子目录提供命令，但如果该目录包含一个名为 /Gunjit/images/ 子目录，且该子目录中也有一个 .htaccess 文件，那么这个子目录中的命令会覆盖父目录中 .htaccess 文件(或者目录层次结构中更上层的文件)提供的命令。

### Apache Server 和 .htaccess 文件 ###

Apache HTTP Server 俗称为 Apache，是为了表示对一个有卓越战争策略技能的美洲土著部落的尊敬而命名。它基于 [NCSA HTTPd 服务器][1] ，是用 C/C++ 和 XML 建立的跨平台 Web 服务器，它在万维网的成长和发展中起到了关键作用。

它最常用于 UNIX，但 Apache 也能用于多种平台，包括 FreeBSD、Linux、Windows、Mac OS、Novel Netware 等。在 2009 年，Apache 成为第一个为超过一亿站点提供服务的服务器。

Apache 服务器可以让 www/ 目录中的每个用户有一个单独的 .htaccess 文件。尽管这些文件是隐藏的，但如果需要的话可以使它们可见。在 www/ 目录中可以有很多子目录，每个子目录通过用户名或所有者名称命名，包含了一个站点。除此之外你可以在每个子目录中有一个 .htaccess 文件，像之前所述用于配置子目录中的文件。

下面介绍如果配置 Apache 服务器上的 htaccess 文件。

### Apache 服务器上的配置 ###

这里有两种情况：

#### 在自己的服务器上托管网站 ####

在这种情况下，如果没有启用 .htaccess 文件，你可以通过在 http.conf(Apache HTTP 守护进程的默认配置文件) 中找到 <Directories> 部分启用。

    <Directory "/var/www/htdocs">

定位如下行

    AllowOverride None 

更改为

    AllowOverride All

现在，重启 Apache 后就启用了 .htaccess。

#### 在不同的托管服务提供商的服务器上托管网站 ####

在这种情况下最好咨询托管管理员，如果他们允许访问 .htaccess 文件的话。

### 用于网站的 25 个 Apache Web 服务器 ‘.htaccess’ 小技巧 ###

#### 1. 如何在 .htaccess 文件中启用 mod_rewrite ####

mod_rewrite 选项允许你使用重定向并通过重定向到其它 URL 来隐藏你真实的 URL。这个选项非常有用，允许你用短的容易记忆的 URL 替换长 URL。

要允许 mod_rewrite，只需要在你的 .htaccess 文件的第一行添加如下一行。

    Options +FollowSymLinks

该选项允许你跟踪符号链接从而在站点中启用 mod_rewrite。后面会介绍用短 URL 替换。（LCTT 译注：+FollowSymLinks 只是启用 mod_rewrite 的前提之一，还需要在全局和虚拟机中设置 `RewriteEngine on` 才能启用重写模块。）

#### 2. 如何允许或禁止对站点的访问 ####

通过使用 order、allow 和 deny 关键字，htaccess 文件可以允许或者禁止对站点或目录中子目录或文件的访问。

**只允许 IP 192.168.3.1 的访问**

    Order Allow, Deny
    Deny from All
    Allow from 192.168.3.1
    
    或
    
    Order Allow, Deny
    Allow from 192.168.3.1

这里的 Order 关键字指定处理 allow 和 deny 访问的顺序。对于上面的 ‘Order’ 语句，首先会处理 Allow 语句，然后是 deny 语句。

**只禁止某个 IP 的访问**

下面一行的意思是除了 IP 地址 192.168.3.1，允许所有用户访问网站。

    Order Allow, Deny
    Deny from 192.168.3.1
    Allow from All
    
    或
    
    Order Deny, Allow
    Deny from 192.168.3.1

#### 3. 为不同错误码生成 Apache 错误文档 ####

用简单几行，我们可以解决当用户/客户端请求一个站点上不可用的网页时服务器产生的错误码的错误文档，例如我们大部分人见过的浏览器中显示的 ‘404 Page not found’。‘.htaccess’ 文件指定了发生这些错误情况时采取何种操作。

要做到这点，需要添加下面的行到 ‘.htaccess’ 文件：

    ErrorDocument <error-code> <path-of-document/string-representing-html-file-content>

‘ErrorDocument’ 是一个关键字，error-code 可以是 401、403、404、500 或任何有效的表示错误的代码，最后 ‘path-of-document’ 表示本地机器上的路径（如果你使用的是你自己的本地服务器） 或服务器上的路径（如果你使用任何其它服务器来托管网站）。

**例子：**

    ErrorDocument 404 /error-docs/error-404.html

上面一行设置客户请求任何无效页面，服务器报告 404 错误时显示 error-docs 目录下的 ‘error-404.html’ 文档。

	ErrorDocument 404 "<html><head><title>404 Page not found</title></head><body><p>The page you request is not present. Check the URL you have typed</p></body></html>"

上面的表示也正确，其中字符串相当于一个普通的 html 文件。

#### 4. 设置/取消 Apache 服务器环境变量 ####

在 .htaccess 文件中你可以设置或者取消站点所有者可以更改的全局环境变量。要设置或取消环境变量，你需要在你的 .htaccess 文件中添加下面的行。

**设置环境变量**

    SetEnv OWNER “Gunjit Khera”

**取消环境变量**

    UnsetEnv OWNER

#### 5. 为文件定义不同 MIME 类型 ####

MIME（多用途 Internet 多媒体扩展）是浏览器运行任何页面所默认识别的类型。你可以在 .htaccess 文件中为你的站点定义 MIME 类型，然后服务器就可以识别你定义类型的文件并运行。

    <IfModule mod_mime.c>
    	AddType	application/javascript		js
    	AddType application/x-font-ttf		ttf ttc
    </IfModule>

这里，mod_mime.c 是用于控制定义不同 MIME 类型的模块，如果在你的系统中已经安装了这个模块，那么你就可以用该模块去为你站点中不同的扩展名定义不同的 MIME 类型，从而让服务器可以理解这些文件。

#### 6. 如何在 Apache 中限制上传和下载的大小 ####

.htaccess 文件允许你能够控制某个用户从你的站点（通过 PHP）单次上传数据量的大小（LCTT 译注：原文有误，修改）。要做到这点你只需要添加下面的行到你的 .htaccess 文件：

    php_value upload_max_filesize 20M
    php_value post_max_size 20M
    php_value max_execution_time 200
    php_value max_input_time 200

上面的行设置最大上传大小、最大POST 提交数据大小、最长执行时间（例如，允许用户在他的本地机器上单次执行一个请求的最大时间）、限制的最大输入时间。

#### 7. 让用户不能在你的站点上在线播放 .mp3 和其它文件 ####

大部分情况下，人们在下载检查音乐质量之前会在网站上播放等等。作为一个聪明的销售者，你可以添加一个简单的功能，不允许任何用户在线播放音乐或视频，而是必须下载完成后才能播放。这非常有用，因为（无缓冲的）在线播放音乐和视频会消耗很多带宽。

要添加下面的行到你的 .htaccess 文件：

    AddType application/octet-stream .mp3 .zip 

#### 8. 为站点设置目录索引 ####

大部分网站开发者都知道第一个显示的页面是哪个，例如一个站点的首页，被命名为 ‘index.html’。我们大部分也见过这个。但是如何设置呢？

.htaccess 文件提供了一种方式用于列出一个客户端请求访问网站的主页面时会顺序扫描的一些网页集合，相应地如果找到了列出的页面中的任何一个就会作为站点的主页面并显示给用户。

需要添加下面的行产生所需的效果。

    DirectoryIndex index.html index.php yourpage.php

上面一行指定如果有任何访问首页的请求到来，首先会在目录中顺序搜索上面列出的网页：如果发现了 index.html 则显示为主页面，否则会找下一个页面，例如 index.php，如此直到你在列表中输入的最后一个页面。

#### 9. 如何为文件启用 GZip 压缩以节省网站带宽 ####

繁忙的站点通常比只占少量空间的轻量级站点运行更慢，这是常见的现象。因为对于繁忙的站点需要时间加载巨大的脚本文件和图片以在客户端的 Web 浏览器上显示。

通常的机制是这样的，当浏览器请求一个 web 页面时，服务器提供给浏览器该页面，并在浏览器端显示该 web 页面，浏览器需要下载该页面并运行页面内的脚本。

这里 GZip 压缩所做的就是节省单个用户的服务时间而不用增加带宽。服务器上站点的源文件以压缩形式保存，当用户请求到来的时候，这些文件以压缩形式传送，然后在客户端上解压（LCTT 译注：原文此处有误）。这改善了带宽限制。

下面的行允许你压缩站点的源文件，但要求在你的服务器上安装 mod_deflate.c 模块。

    <IfModule mod_deflate.c>
    	AddOutputFilterByType DEFLATE text/plain
    	AddOutputFilterByType DEFLATE text/html
    	AddOutputFilterByType DEFLATE text/xml
    	AddOutputFilterByType DEFLATE application/html
    	AddOutputFilterByType DEFLATE application/javascript
    	AddOutputFilterByType DEFLATE application/x-javascript
    </IfModule>

#### 10. 处理文件类型 ####

服务器默认的有一些特定情况。例如：在服务器上运行 .php 文件，显示 .txt 文件。像这些我们可以以源代码形式只显示一些可执行 cgi 脚本或文件而不是执行它们（LCTT 译注：这是为了避免攻击者通过上传恶意脚本，进而在服务器上执行恶意脚本进行破坏和窃取）。

要做到这点在 .htaccess 文件中有如下行。

    RemoveHandler cgi-script .php .pl .py
    AddType text/plain .php .pl .py

这些行告诉服务器只显示而不执行 .pl (perl 脚本)、.php (PHP 文件) 和 .py (Python 文件) 。

#### 11. 为 Apache 服务器设置时区 ####

从 .htaccess 文件可用于为服务器设置时区可以看出它的能力和重要性。这可以通过设置一个服务器为每个托管站点提供的一系列全局环境变量中的 ‘TZ’ 完成。

由于这个原因，我们可以在网站上看到根据我们的时区显示的时间。也许服务器上其他拥有网站的人会根据他居住地点的位置设置时区。

下面的一行为服务器设置时区。

    SetEnv TZ India/Kolkata

#### 12. 如果在站点上启用缓存控制 ####

浏览器很有趣的一个功能是，很多时间你可以看到，当多次同时打开一个网站和第一次打开相比前者会更快。但为什么会这样呢？事实上，浏览器在它的缓存中保存了一些通常访问的页面用于加快后面的访问。

但保存多长时间呢？这取决于你自己。例如，你的 .htaccess 文件中设置的缓存控制时间。.htaccess 文件指定了站点的网页可以在浏览器缓存中保存的时间，时间到期后需要重新验证缓存，页面可能会从缓存中删除然后在下次用户访问站点的时候重建。

下面的行为你的站点实现缓存控制。

    <FilesMatch "\.(ico|png|jpeg|svg|ttf)$">
    	Header Set Cache-Control "max-age=3600, public"
    </FilesMatch>
    <FilesMatch "\.(js|css)$">
    	Header Set Cache-Control "public"
    	Header Set Expires "Sat, 24 Jan 2015 16:00:00 GMT"
    </FilesMatch>

上面的行允许缓存 .htaccess 文件所在目录中的页面一小时。

#### 13. <files> 配置单个文件 ####

通常 .htaccess 文件中的内容会对该文件所在目录中的所有文件和子目录起作用，但是你也可以对特殊文件设置一些特殊权限，例如只禁止对某个文件的访问等等。

要做到这点，你需要在文件中以类似方式添加 \<Files> 标记：

    <files conf.html="">
    Order allow, deny
    Deny from 188.100.100.0
    </files>

这是一个禁止 IP 188.100.100.0 访问 ‘conf.html’ 的简单例子，但是你也可以添加介绍过的 .htaccess 文件的任何功能，包括将要介绍的功能，例如：缓存控制、GZip 压缩。

大部分服务器会用这个功能增强 .htaccess 文件的安全，这也是我们在浏览器上看不到 .htaccess 文件的原因。在后面的章节中会介绍如何给文件授权。

#### 14. 启用在 cgi-bin 目录以外运行 CGI 脚本 ####

通常服务器运行的 CGI 脚本都保存在 cgi-bin 目录中，但是你可以在你需要的目录运行 CGI 脚本，只需要在所需的目录中的 .htaccess 文件添加下面的行，如果没有该文件就创建一个，并添加下面的行：

    AddHandler cgi-script .cgi
    Options +ExecCGI

#### 15.如何用 .htaccess 在站点上启用 SSI ####

服务器端包括（SSI）顾名思义是和服务器部分相关的东西。这是什么呢？通常当我们在站点上有很多页面的时候，我们在主页上会有一个显示到其它页面链接的导航菜单，我们可以启用 SSI 选项允许导航菜单中显示的所有页面完全包含在主页面中。

SSI 允许多个页面包含同样的内容，因此只需要编辑一个文件就行，从而可以节省很多磁盘空间。对于 .shtml 文件，服务器默认启用了该选项。

如果你想要对 .html 启用该选项，你需要添加下面的行：

    AddHandler server-parsed .html

这样 html 文件中如下部分会被替换为 SSI。

    <!--#inlcude virtual="gk/document.html"-->

#### 16. 如何防止网站列出目录列表 ####

为防止任何客户端在本地机器罗列服务器上的网站目录列表，添加下面的行到你不想列出的目录的文件中。

    Options -Indexes

#### 17. 更改默认字符集和语言头 ####

.htaccess 文件允许你更改网站使用的字符集，例如 ASCII 或 UNICODE，UTF-8 等，以及用于显示内容的默认语言。

在服务器的全局环境变量之后添加下面语句可以实现上述功能。

    AddDefaultCharset UTF-8
    DefaultLanguage en-US

#### 18. 重定向一个非 www URL 到 www URL ####

在开始解释之前，首先看看如何启用该功能，添加下列行到 .htaccess 文件。

    RewriteEngine ON
    RewriteCond %{HTTP_HOST} ^abc\.net$
    RewriteRule (.*) http://www.abc.net/$1 [R=301,L]

上面的行启用重写引擎，然后在第二行检查所有涉及到主机 abc.net 或 环境变量 HTTP_HOST 为 “abc.net” 的 URL。

对于所有这样的 URL，代码永久重定向它们(如果启用了 R=301 规则)到新 URL http://www.abc.net/$1，其中 $1 是主机为 abc.net 的非 www URL。非 www URL 是大括号内的内容，并通过 $1 引用。

**重写 URL 的重定向规则**

重写功能简单的说，就是用短而易记的 URL 替换长而难以记忆的 URL。但是，在开始这个话题之前，这里有一些本文后面会使用的特殊字符的规则和约定。

**特殊符号：**

    符号      		含义
    ^         -  	字符串开头
    $         -  	字符串结尾
    |         -  	或 [a|b] ： a 或 b
    [a-z]     -  	a 到 z 的任意字母
    +         -  	之前字母的一次或多次出现
    *         -  	之前字母的零次或多次出现
    ?         -  	之前字母的零次或一次出现

**常量和它们的含义：**

    常量     		含义
    NC          -  	区分大小写
    L           -  	最后的规则 – 停止处理后面规则
    R           -  	临时重定向到新 URL
    R=301       -  	永久重定向到新 URL
    F           -  	禁止发送 403 头给用户
    P           -  	代理 - 获取远程内容代替部分并返回
    G           -  	Gone， 不再存在
    S=x         -  	跳过后面的 x 条规则
    T=mime-type -  	强制指定 MIME 类型
    E=var:value -  	设置环境变量 var 的值为 value
    H=handler   -  	设置处理器
    PT          -  	Pass through - 用于 URL 还有额外的头
    QSA         -  	将查询字符串追加到替换 URL 


#### 19. 重定向整个站点到 https ####

下面的行会帮助你转换整个网站到 https：

    RewriteEngine ON
    RewriteCond %{HTTPS} !on
    RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}

上面的行启用重写引擎，然后检查环境变量 HTTPS 的值。如果设置了那么重写所有网站页面到 https。

#### 20.一个自定义重写例子 ####

例如，重定向 url ‘http://www.abc.net?p=100&q=20’ 到 ‘http://www.abc.net/10020pq’。

    RewriteEngine ON
    RewriteRule ^http://www.abc.net/([0-9]+)([0-9]+)pq$ ^http://www.abc.net?p=$1&q=$2

在上面的行中，$1 表示第一个括号，$2 表示第二个括号。

#### 21. 重命名 htaccess 文件 ####

为了防止入侵者和其他人查看 .htaccess 文件，你可以重命名该文件，这样就不能通过客户端浏览器访问。实现该目标的语句是：

    AccessFileName	htac.cess

#### 22. 如何为你的网站禁用图片盗链 ####

网站带宽消耗比较大的另外一个重要问题是盗链问题，这是其它站点用于显示你网站的图片而链接到你的网站的链接，这会消耗你的带宽。这问题也被成为 ‘带宽盗窃’。

一个常见现象是当一个网站要显示其它网站所包含的图片时，由于该链接需要从你的网站加载内容，消耗你站点的带宽而为其它站点显示图片。为了防止出现这种情况，比如对于 .gif、.jpeg 图片等，下面的代码行会有所帮助：

    RewriteEngine ON
    RewriteCond %{HTTP_REFERER} !^$
    RewriteCond %{HTTP_REFERERER} !^http://(www\.)?mydomain.com/.*$ [NC]
    RewriteRule \.(gif|jpeg|png)$ - [F].

上面的行检查 HTTP_REFERER 是否没有设为空或没有设为你站点上的任何链接。如果是这样的话，你网页上的所有图片会用 403 禁止访问代替。

#### 23. 如何将用户重定向到维护页面 ####

如果你的网站需要进行维护并且你想向所有需要访问该网站的你的所有客户通知这个消息，对于这种情况，你可以添加下面的行到你的 .htaccess 文件，从而只允许管理员访问并替换所有访问 .jpg、.css、.gif、.js 等的页面内容。

    RewriteCond %{REQUEST_URI} !^/admin/ [NC]
    RewriteCond %{REQUEST_URI} !^((.*).css|(.*).js|(.*).png|(.*).jpg)	 [NC]
    RewriteRule ^(.*)$ /ErrorDocs/Maintainence_Page.html [NC,L,U,QSA]

这些行检查请求 URL 是否包含任何例如以 ‘/admin/’ 开头的管理页面的请求，或任何到 ‘.png, .jpg, .js, .css’ 页面的请求，对于任何这样的请求，用 ‘ErrorDocs/Maintainence_Page.html’ 替换那个页面。

#### 24. 映射 IP 地址到域名 ####

名称服务器是将特定 IP 地址转换为域名的服务器。这种映射也可以在 .htaccess 文件中用以下形式指定。

    # 为了将IP地址 L.M.N.O 映射到域名 www.hellovisit.com
    RewriteCond %{HTTP_HOST} ^L\.M\.N\.O$ [NC]
    RewriteRule ^(.*)$ http://www.hellovisit.com/$1 [L,R=301]

上面的行检查任何页面的主机是否包含类似 L.M.N.O 的 IP 地址，如果是的话第三行会通过永久重定向将页面映射到域名 http://www.hellovisit.com。

#### 25. FilesMatch 标签 ####

类似用于应用条件到单个文件的 <files> 标签，<FilesMatch> 能用于匹配一组文件并对该组文件应用一些条件，如下： 

    <FilesMatch “\.(png|jpg)$”>
    Order Allow, Deny 
    Deny from All
    </FilesMatch>

### 结论 ###

.htaccess 文件能实现的小技巧还有很多。这告诉了我们这个文件有多么强大，通过该文件能给你的站点添加多少安全性、动态性以及其它功能。

我们已经在这篇文章中尽最大努力覆盖尽可能多的 htaccess 小技巧，但如果我们缺少了任何重要的技巧，或者你愿意告诉我们你的 htaccess 想法和技巧，你可以在下面的评论框中提交，我们也会在文章中进行介绍。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/apache-htaccess-tricks/

作者：[Gunjit Khera][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gunjitk94/
[1]:https://en.wikipedia.org/wiki/NCSA_HTTPd