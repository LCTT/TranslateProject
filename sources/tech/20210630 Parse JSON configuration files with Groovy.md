[#]: subject: (Parse JSON configuration files with Groovy)
[#]: via: (https://opensource.com/article/21/6/groovy-parse-json)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Parse JSON configuration files with Groovy
======
Sidestep the debate on whether or not to use JSON as a configuration
format and just learn how to parse it using Groovy.
![Looking back with binoculars][1]

Applications typically include some type of default or "out-of-the-box" state or configuration, as well as some way for users to customize that configuration for their needs.

For example, [LibreOffice Writer][2] gives access to stuff like user data, fonts, language settings, and (much) more through **Tools &gt; Options** on its menu bar. Some applications (like LibreOffice) provide a point-and-click user interface to manage these settings. Some, like [Tracker][3] (the GNOME task that indexes files), use XML files. And some, especially JavaScript-based applications, use JSON, despite the protestations of many (for example, [this writer][4] and [this other writer][5]).

In this article, I'll sidestep the debate about whether or not to use JSON as a configuration file format and explain how to parse this kind of information using the [Groovy programming language][6]. Groovy is based on Java but with a different set of design priorities that make Groovy feel more like Python.

### Install Groovy

Since Groovy is based on Java, it also requires a Java installation. You might find recent and decent versions of Java and Groovy in your Linux distribution's repositories. Or you can install Groovy following the [instructions][7] on its website. A nice alternative for Linux users is [SDKMan][8], which you can use to get multiple versions of Java, Groovy, and many other related tools. For this article, I'll use my distro's OpenJDK11 release and SDKMan's Groovy 3.0.7 release.

### The demo JSON configuration file

For this demonstration, I snagged this JSON from [Drupal][9]—it's the main configuration file used by the Drupal CMS—and saved it in the file `config.json`:


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
        "account_mail": "[box@example.com][10]",
        "site_name": "Drupal 8",
        "site_mail": "[box@example.com][10]",
        "vhost": {
          "document_root": "drupal8",
          "url": "drupal8.dev",
          "alias": ["www.drupal8.dev"]
        }
      },
      "drupal7": {
        "account_name": "root",
        "account_pass": "root",
        "account_mail": "[box@example.com][10]",
        "site_name": "Drupal 7",
        "site_mail": "[box@example.com][10]",
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

This is a nice, complex JSON file with several levels of structure, like:


```
`<>.vdd.sites.drupal8.account_name`
```

and some lists like:


```
`<>.vm.synced_folders`
```

Here, `<>` represents the unnamed top level. Let's see how Groovy handles that.

### Parsing JSON with Groovy

Groovy comes with the `groovy.json` package, which is full of all sorts of cool stuff. One of the best parts is the `JsonSlurper` class, which includes several `parse()` methods that convert JSON to a Groovy `Map`—a data structure with values stored against keys.

Here's a nice, short Groovy program named `config1.groovy` that creates a `JsonSlurper` instance, then calls one of its `parse()` methods to parse the JSON in a file and convert it to a `Map` instance called `config`, and finally writes out that map:


```
import groovy.json.JsonSlurper

def jsonSlurper = new JsonSlurper()

def config = jsonSlurper.parse(new File('config.json'))

println "config = $config"
```

Run this program on the command line in a terminal:


```
$ groovy config1.groovy
config = [vm:[ip:192.168.44.44, memory:1024, synced_folders:[[host_path:data/, guest_path:/var/www, type:default]], forwarded_ports:[]], vdd:[sites:[drupal8:[account_name:root, account_pass:root, account_mail:[box@example.com][10], site_name:Drupal 8, site_mail:[box@example.com][10], vhost:[document_root:drupal8, url:drupal8.dev, alias:[www.drupal8.dev]]], drupal7:[account_name:root, account_pass:root, account_mail:[box@example.com][10], site_name:Drupal 7, site_mail:[box@example.com][10], vhost:[document_root:drupal7, url:drupal7.dev, alias:[www.drupal7.dev]]]]]]
$
```

The output shows a top-level map with two keys: `vm` and `vdd`. Each key references its own map of values. Notice the empty list referenced by the `forwarded_ports` key.

Huh. That was easy, but all it did was print things out. How do you get at the various components? Here's another program that shows how to access the value stored at `config.vm.ip`:


```
import groovy.json.JsonSlurper

def jsonSlurper = new JsonSlurper()

def config = jsonSlurper.parse(new File('config.json'))

println "config.vm.ip = ${config.vm.ip}"
```

Run it:


```
$ groovy config2.groovy
config.vm.ip = 192.168.44.44
$
```

Yup, that's easy, too. This takes advantage of Groovy shorthand that means:


```
`config.vm.ip`
```

in Groovy is equivalent to:


```
`config['vm']['ip']`
```

when `config` and `config.vm` are both instances of `Map`, and both are equivalent to:


```
`config.get("vm").get("ip")`
```

in Java.

So much for just handling the JSON. What if you want to have a standard configuration and let the user override it? In that case, you might want to have a JSON configuration hard-coded in the program, then read the user configuration and override any of the standard configuration settings.

Say the above configuration is standard, and the user wants to override only a bit of it, just the `ip` and `memory` values in the `vm` structure, and put that in the `userConfig.json` file:


```
{
  "vm": {
    "ip": "201.201.201.201",
    "memory": "4096",
  }
}
```

You could do that using this program:


```
import groovy.json.JsonSlurper

def jsonSlurper = new JsonSlurper()

// use parseText() to parse a string rather than reading from a file
// this gives us the “standard configuration”

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
        "account_mail": "[box@example.com][10]",
        "site_name": "Drupal 8",
        "site_mail": "[box@example.com][10]",
        "vhost": {
          "document_root": "drupal8",
          "url": "drupal8.dev",
          "alias": ["www.drupal8.dev"]
        }
      },
      "drupal7": {
        "account_name": "root",
        "account_pass": "root",
        "account_mail": "[box@example.com][10]",
        "site_name": "Drupal 7",
        "site_mail": "[box@example.com][10]",
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

// print out the standard configuration

println "standardConfig = $standardConfig"

// read in and parse the user configuration information

def userConfig = jsonSlurper.parse(new File('userConfig.json'))

// print out the user configuration information

println "userConfig = $userConfig"

// a function to merge the user configuration with the standard

def mergeMaps(Map input, Map merge) {
    merge.each { k, v -&gt;
        if (v instanceof Map)
            mergeMaps(input[k], v)
        else
            input[k] = v
    }
}

// merge the configurations and print out the modified
// standard configuration

mergeMaps(standardConfig, userConfig)

println "modified standardConfig $standardConfig"
```

Run this as:


```
$ groovy config3.groovy
standardConfig = [vm:[ip:192.168.44.44, memory:1024, synced_folders:[[host_path:data/, guest_path:/var/www, type:default]], forwarded_ports:[]], vdd:[sites:[drupal8:[account_name:root, account_pass:root, account_mail:[box@example.com][10], site_name:Drupal 8, site_mail:[box@example.com][10], vhost:[document_root:drupal8, url:drupal8.dev, alias:[www.drupal8.dev]]], drupal7:[account_name:root, account_pass:root, account_mail:[box@example.com][10], site_name:Drupal 7, site_mail:[box@example.com][10], vhost:[document_root:drupal7, url:drupal7.dev, alias:[www.drupal7.dev]]]]]]
userConfig = [vm:[ip:201.201.201.201, memory:4096]]
modified standardConfig [vm:[ip:201.201.201.201, memory:4096, synced_folders:[[host_path:data/, guest_path:/var/www, type:default]], forwarded_ports:[]], vdd:[sites:[drupal8:[account_name:root, account_pass:root, account_mail:[box@example.com][10], site_name:Drupal 8, site_mail:[box@example.com][10], vhost:[document_root:drupal8, url:drupal8.dev, alias:[www.drupal8.dev]]], drupal7:[account_name:root, account_pass:root, account_mail:[box@example.com][10], site_name:Drupal 7, site_mail:[box@example.com][10], vhost:[document_root:drupal7, url:drupal7.dev, alias:[www.drupal7.dev]]]]]]
$
```

The line beginning `modified standardConfig` shows that the `vm.ip` and `vm.memory` values were overridden.

Sharp-eyed readers will notice that I did not check for malformed JSON , nor was I careful to ensure that the user configuration makes sense (doesn't create new fields, provides reasonable values, and so on). So the cute little recursive method to merge the two maps probably isn't all that practical in the real world.

Well I had to leave _something_ for homework, didn't I?

### Groovy resources

The Apache Groovy site has a lot of great [documentation][11]. Another great Groovy resource is [Mr. Haki][12]. And a really great reason to learn Groovy is to go on and learn [Grails][13], which is a wonderfully productive full-stack web framework built on top of excellent components like Hibernate, Spring Boot, and Micronaut.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/groovy-parse-json

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
