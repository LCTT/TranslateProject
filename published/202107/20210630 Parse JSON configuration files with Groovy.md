[#]: subject: (Parse JSON configuration files with Groovy)
[#]: via: (https://opensource.com/article/21/6/groovy-parse-json)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13576-1.html)

用 Groovy 解析 JSON 配置文件
======

> 抛开关于是否使用 JSON 作为配置格式的争论，只需学习如何用 Groovy 来解析它。

![](https://img.linux.net.cn/data/attachment/album/202107/12/232406vpp4qrv6ee5a3erz.jpg)

应用程序通常包括某种类型的默认或“开箱即用”的状态或配置，以及某种让用户根据自己的需要定制配置的方式。

例如，[LibreOffice Writer][2] 通过其菜单栏上的**工具 > 选项**，可以访问诸如用户数据、字体、语言设置等（以及更多的）设置。一些应用程序（如 LibreOffice）提供了一个点选式的用户界面来管理这些设置。有些，像 [Tracker][3]（GNOME 的“任务”，用于索引文件）使用 XML 文件。还有一些，特别是基于 JavaScript 的应用，使用 JSON，尽管它有许多人抗议（例如，[这位作者][4] 和 [这位其他作者][5]）。

在这篇文章中，我将回避关于是否使用 JSON 作为配置文件格式的争论，并解释如何使用 [Groovy 编程语言][6] 来解析这类信息。Groovy 以 Java 为基础，但有一套不同的设计重点，使 Groovy 感觉更像 Python。

### 安装 Groovy

由于 Groovy 是基于 Java 的，它也需要安装 Java。你可能会在你的 Linux 发行版的软件库中找到最近的、合适的 Java 和 Groovy 版本。或者，你可以按照其网站上的 [说明][7] 安装 Groovy。 Linux 用户的一个不错的选择是 [SDKMan][8]，你可以使用它来获取 Java、Groovy 和许多其他相关工具的多个版本。 对于本文，我将使用我的发行版的 OpenJDK11 和 SDKMan 的 Groovy 3.0.7。

### 演示的 JSON 配置文件

在这个演示中，我从 [Drupal][9] 中截取了这个 JSON 文件，它是 Drupal CMS 使用的主要配置文件，并将其保存在文件 `config.json` 中：

```
{
 "vm": {
  "ip": "192.168.44.44",
  "memory": "1024",
  "synced_folders": [
   {
    "host_path": "data/",
    "guest_path": "/var/www",
    "type": "default"
   }
  ],
  "forwarded_ports": []
 },
 "vdd": {
  "sites": {
   "drupal8": {
    "account_name": "root",
    "account_pass": "root",
    "account_mail": "box@example.com",
    "site_name": "Drupal 8",
    "site_mail": "box@example.com",
    "vhost": {
     "document_root": "drupal8",
     "url": "drupal8.dev",
     "alias": ["www.drupal8.dev"]
    }
   },
   "drupal7": {
    "account_name": "root",
    "account_pass": "root",
    "account_mail": "box@example.com",
    "site_name": "Drupal 7",
    "site_mail": "box@example.com",
    "vhost": {
     "document_root": "drupal7",
     "url": "drupal7.dev",
     "alias": ["www.drupal7.dev"]
    }
   }
  }
 }
}
```

这是一个漂亮的、复杂的 JSON 文件，有几层结构，如：

```
<>.vdd.sites.drupal8.account_name
```

和一些列表，如：

```
<>.vm.synced_folders
```

这里，`<>` 代表未命名的顶层。让我们看看 Groovy 是如何处理的。

### 用 Groovy 解析 JSON

Groovy 自带的 `groovy.json` 包，里面有各种很酷的东西。其中最好的部分是 `JsonSlurper` 类，它包括几个 `parse()` 方法，可以将 JSON 转换为 Groovy 的 `Map`，一种根据键值存储的数据结构。

下面是一个简短的 Groovy 程序，名为 `config1.groovy`，它创建了一个 `JsonSlurper` 实例，然后调用其中的 `parse()` 方法来解析文件中的 JSON，并将其转换名为 `config` 的 `Map` 实例，最后将该 map 输出：


```
import groovy.json.JsonSlurper

def jsonSlurper = new JsonSlurper()

def config = jsonSlurper.parse(new File('config.json'))

println "config = $config"
```

在终端的命令行上运行这个程序：

```
$ groovy config1.groovy
config = [vm:[ip:192.168.44.44, memory:1024, synced_folders:[[host_path:data/, guest_path:/var/www, type:default]], forwarded_ports:[]], vdd:[sites:[drupal8:[account_name:root, account_pass:root, account_mail:box@example.com, site_name:Drupal 8, site_mail:box@example.com, vhost:[document_root:drupal8, url:drupal8.dev, alias:[www.drupal8.dev]]], drupal7:[account_name:root, account_pass:root, account_mail:box@example.com, site_name:Drupal 7, site_mail:box@example.com, vhost:[document_root:drupal7, url:drupal7.dev, alias:[www.drupal7.dev]]]]]]
$
```

输出显示了一个有两个键的顶层映射：`vm` 和 `vdd`。每个键都引用了它自己的值的映射。注意 `forwarded_ports` 键所引用的空列表。

这很容易，但它所做的只是把东西打印出来。你是如何获得各种组件的呢？下面是另一个程序，显示如何访问存储在 `config.vm.ip` 的值：

```
import groovy.json.JsonSlurper

def jsonSlurper = new JsonSlurper()

def config = jsonSlurper.parse(new File('config.json'))

println "config.vm.ip = ${config.vm.ip}"
```

运行它：

```
$ groovy config2.groovy
config.vm.ip = 192.168.44.44
$
```

是的，这也很容易。 这利用了 Groovy 速记，这意味着：

```
config.vm.ip
```

在 Groovy 中等同于：

```
config['vm']['ip']
```

当 `config` 和 `config.vm` 都是 `Map` 的实例，并且都等同于在 Java 中的:

```
config.get("vm").get("ip")
```

仅仅是处理 JSON 就这么多了。如果你想有一个标准的配置并让用户覆盖它呢？在这种情况下，你可能想在程序中硬编码一个 JSON 配置，然后读取用户配置并覆盖任何标准配置的设置。

假设上面的配置是标准的，而用户只想覆盖其中的一点，只想覆盖 `vm` 结构中的 `ip` 和 `memory` 值，并把它放在 `userConfig.json` 文件中:

```
{
 "vm": {
  "ip": "201.201.201.201",
  "memory": "4096",
 }
}
```

你可以用这个程序来做：

```
import groovy.json.JsonSlurper

def jsonSlurper = new JsonSlurper()

// 使用 parseText() 来解析一个字符串，而不是从文件中读取。
// 这给了我们一个“标准配置”
def standardConfig = jsonSlurper.parseText("""
{
 "vm": {
  "ip": "192.168.44.44",
  "memory": "1024",
  "synced_folders": [
   {
    "host_path": "data/",
    "guest_path": "/var/www",
    "type": "default"
   }
  ],
  "forwarded_ports": []
 },
 "vdd": {
  "sites": {
   "drupal8": {
    "account_name": "root",
    "account_pass": "root",
    "account_mail": "box@example.com",
    "site_name": "Drupal 8",
    "site_mail": "box@example.com",
    "vhost": {
     "document_root": "drupal8",
     "url": "drupal8.dev",
     "alias": ["www.drupal8.dev"]
    }
   },
   "drupal7": {
    "account_name": "root",
    "account_pass": "root",
    "account_mail": "box@example.com",
    "site_name": "Drupal 7",
    "site_mail": "box@example.com",
    "vhost": {
     "document_root": "drupal7",
     "url": "drupal7.dev",
     "alias": ["www.drupal7.dev"]
    }
   }
  }
 }
}
""")

// 打印标准配置
println "standardConfig = $standardConfig"

//读入并解析用户配置信息
def userConfig = jsonSlurper.parse(new File('userConfig.json'))

// 打印出用户配置信息
println "userConfig = $userConfig"

// 一个将用户配置与标准配置合并的函数
def mergeMaps(Map input, Map merge) {
  merge.each { k, v -&gt;
    if (v instanceof Map)
      mergeMaps(input[k], v)
    else
      input[k] = v
  }
}

// 合并配置并打印出修改后的标准配置
mergeMaps(standardConfig, userConfig)

println "modified standardConfig $standardConfig"
```

以下列方式运行：

```
$ groovy config3.groovy
standardConfig = [vm:[ip:192.168.44.44, memory:1024, synced_folders:[[host_path:data/, guest_path:/var/www, type:default]], forwarded_ports:[]], vdd:[sites:[drupal8:[account_name:root, account_pass:root, account_mail:box@example.com, site_name:Drupal 8, site_mail:box@example.com, vhost:[document_root:drupal8, url:drupal8.dev, alias:[www.drupal8.dev]]], drupal7:[account_name:root, account_pass:root, account_mail:box@example.com, site_name:Drupal 7, site_mail:box@example.com, vhost:[document_root:drupal7, url:drupal7.dev, alias:[www.drupal7.dev]]]]]]
userConfig = [vm:[ip:201.201.201.201, memory:4096]]
modified standardConfig [vm:[ip:201.201.201.201, memory:4096, synced_folders:[[host_path:data/, guest_path:/var/www, type:default]], forwarded_ports:[]], vdd:[sites:[drupal8:[account_name:root, account_pass:root, account_mail:box@example.com, site_name:Drupal 8, site_mail:box@example.com, vhost:[document_root:drupal8, url:drupal8.dev, alias:[www.drupal8.dev]]], drupal7:[account_name:root, account_pass:root, account_mail:box@example.com, site_name:Drupal 7, site_mail:box@example.com, vhost:[document_root:drupal7, url:drupal7.dev, alias:[www.drupal7.dev]]]]]]
$
```

以 `modified standardConfig` 开头的一行显示，`vm.ip` and `vm.memory` 的值被覆盖了。

眼尖的读者会注意到，我没有检查畸形的 JSON，也没有仔细确保用户的配置是有意义的（不创建新字段，提供合理的值，等等）。所以用这个递归方法来合并两个映射在现实中可能并不那么实用。

好吧，我必须为家庭作业留下 _一些_ 东西，不是吗？

### Groovy 资源

Apache Groovy 网站有很多很棒的 [文档][11]。另一个很棒的 Groovy 资源是 [Mr. Haki][12]。学习 Groovy 的一个非常好的理由是继续学习 [Grails][13]，它是一个非常高效的全栈 Web 框架，建立在 Hibernate、Spring Boot 和 Micronaut 等优秀组件之上。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/groovy-parse-json

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/look-binoculars-sight-see-review.png?itok=NOw2cm39 (Looking back with binoculars)
[2]: https://www.libreoffice.org/discover/writer/
[3]: https://gitlab.gnome.org/GNOME/tracker
[4]: https://www.lucidchart.com/techblog/2018/07/16/why-json-isnt-a-good-configuration-language/
[5]: https://medium.com/trabe/stop-using-json-config-files-ab9bc55d82fa
[6]: https://groovy-lang.org/
[7]: https://groovy.apache.org/download.html
[8]: https://sdkman.io/
[9]: https://www.drupal.org/node/2008800
[10]: mailto:box@example.com
[11]: http://groovy-lang.org/documentation.html
[12]: https://blog.mrhaki.com/
[13]: https://grails.org/
