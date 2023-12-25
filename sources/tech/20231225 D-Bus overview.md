[#]: subject: "D-Bus overview"
[#]: via: "https://fedoramagazine.org/d-bus-overview/"
[#]: author: "Íñigo Huguet https://fedoramagazine.org/author/ihuguet/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

D-Bus overview
======

![][1]

### What D-Bus is

D-Bus serves various purposes aiming to facilitate the cooperation between different processes in the system. This article will describe D-Bus and how it performs this function.

From the D-Bus creators definition:

> D-Bus is a message bus system, a simple way for applications to talk to one another. In addition to interprocess communication, D-Bus helps coordinate process lifecycle; it makes it simple and reliable to code a “single instance” application or daemon, and to launch applications and daemons on demand when their services are needed.

D-Bus is, mainly, an interprocess communication (IPC) protocol. Its main advantage is that applications don’t need to establish one-to-one communication with every other process that they need to talk with. D-Bus, instead, offers a virtual bus to which all applications connect and send the messages to.

![Processes without D-Bus][2]

![Processes with D-Bus][3]

### Reaching the desired application

We talk about a D-Bus system but in a system there can be more than one bus. Actually, normally, there are at least 2:

  * A **system bus** : applications that manage system-wide resources that are connected to it.
  * One **session bus** per logged in user: desktop applications commonly use this bus.



To send _D-Bus messages_ to the desired destination on a bus, a way to identify each of the applications connected to a bus is needed. For that reason, each application gets at least one _bus name_ that others can specify as the destination of its messages. There are two name types:

  * **Unique connection names** : Each application that connects to the bus automatically gets one. It’s a unique identifier that will never be reused for a different application. These names start with a colon (‘:’) and normally look something like “:1.94” (the characters after the colon have no special meaning but are unique).
  * **Well-known names** : While _unique connection names_ are dynamically assigned, applications that need to be easily discoverable by others must own a fixed name that is **well known** to them. They look like reversed domain names, similar to “org.freedesktop.NetworkManager”.



You can see what applications are connected to the two main buses using the _busctl_ commands below. We’ll discover that nowadays many of the main components of the system use D-Bus. In the following examples, omit the _–acquired_ option to also see _unique connection names_.

```

    $ busctl list --system --acquired
    ...
    $ busctl list --user --acquired
    ...

```

In an analogy with IP networks, _unique connection names_ are like dynamic IP addresses and _well-known names_ are like hostnames or domain names.

For example, _NetworkManager_ is a daemon that controls the networking configuration of the system. Clients like _GNOME control center_ , or the command line tools _nmcli_ and _nmstate_ , connect to the _system bus_ and send _D-Bus messages_ to the “org.freedesktop.NetworkManager” _well-known name_ to get info or request changes.

_Note: the D-Bus specification uses the term “bus name”, so it’s somehow official_. _This_ _can be quite confusing because people tend to think that it refers to different buses, instead of apps connected to the same bus. Many articles and tools use the term “service” instead of “bus name” because it’s more intuitive, but it has a different meaning in the spec so[it’s discouraged][4]. In this article I use the term “destination” whenever possible_. _In any case, remember that “bus name” refers to “name IN the bus”, and not “name OF a bus”._

### D-Bus objects

D-Bus applications can expose some of their resources and actions in what we could call a D-Bus API.

The exposed resources resemble the main concepts of object oriented programming languages so they are called _D-Bus objects_. Specifically, each application can expose an indefinite number of objects with properties and methods. Individual _D-Bus objects_ are identified by their _D-Bus object paths_ , which look much like Unix paths (i.e. /path/to/the/object).

You can inspect what objects a certain application exposes using the _busctl_ command. For example:

```

    $ busctl tree org.freedesktop.NetworkManager

```

Applications can express the hierarchy between objects, thanks to this path-like identifier, in an intuitive way. It is easy to know that “/Background/Color” is an object that hierarchically belongs to the object “/Background”. The spec does not mandate following this hierarchical design but almost all applications do it.

_Note: it is common in many applications that the object paths begin with the reverse domain of the author (i.e. /org/freedesktop/NetworkManager/*). This avoids name collisions with other objects from different libraries or sources. However, this is not mandatory and not all applications do it._

### D-Bus interfaces, methods and properties

Each _D-Bus object_ implements one or more _D-Bus interfaces_ and each _interface_ defines some _properties_ and _methods_. _Properties_ are like variables and _methods_ are like functions. The names of _D-Bus interfaces_ look like “org.example.AppName.InterfaceName”.

If you already know any programming language that uses the concept of interface, like Java, this will be familiar to you. If you are not, just remember that interfaces are like types for the objects and each object can have more than one type at the same time. But keep in mind that, unlike what happens in many of these languages, _D-Bus objects_ never define direct members, only the _interfaces_ do.

Example:

  * A printing server application defines the following interfaces:
    * Printer: defines the method “PrintDocument” and the property “InkLevel”.
    * Scanner: defines the method “ScanDocument”.
  * The object “/Devices/1” represents a normal printer, so it only implements the interface “Printer”.
  * The object “/Devices/2” represents a printer with scanner, so it implements both interfaces.



#### Introspection

Introspection allows you to get a list of the interfaces, with its methods and properties, that a _D-Bus object_ implements. For example, the _busctl_ command is used as follows:

```

    $ busctl introspect org.freedesktop.NetworkManager /org/freedesktop/NetworkManager

```

#### Methods and Properties

Now let’s see how to call to D-Bus methods and read properties from the terminal in two examples:

```

    # Method call
    busctl call                                                \
        --system                                               \
        org.freedesktop.NetworkManager           `# app name`  \
        /org/freedesktop/NetworkManager/Settings `# object`    \
        org.freedesktop.NetworkManager.Settings  `# interface` \
        ListConnections                          `# method`

    # Property read
    busctl get-property                                           \
        --system                                                  \
        org.freedesktop.NetworkManager              `# app name`  \
        /org/freedesktop/NetworkManager/Devices/2   `# object`    \
        org.freedesktop.NetworkManager.Device.Wired `# interface` \
        PermHwAddress                               `# property`

```

To read or write _properties_ , we actually have to call _methods_ of the standard _interface_ “org.freedesktop.DBus.Properties” defined by the [D-Bus specs][5]. _Busctl,_ however, **does it under the hood with the _get/set-property_ command to abstract a bit from that. Exercise suggestion: read a property using _busctl_ call (hint: you need to specify the arguments’ signature, which is “ss”).

_Note: when calling D-Bus methods, it’s not mandatory to specify the interface, but if two interfaces define the same method name, the result is undefined, so you should always specify it. The tool busctl makes it mandatory for this reason._

### D-Bus type system

D-Bus uses a strict type system, so all properties, arguments and return values must have a well defined type.

There are some basic types like BYTE, BOOLEAN, INT32, UINT32, DOUBLE, STRING or OBJECT_PATH. These basic types can be grouped into 3 different types of containers: STRUCT, ARRAY and DICT_ENTRY (dictionaries). Containers can be nested within other containers of the same or different type.

There is also a VARIANT type which allows some kind of dynamic typing.

Each type can be identified by a _signature_ string. The _signatures_ of basic types are single characters like “i”, “u”, “s”, etc. _Signatures_ of compound types are strings like “(iibs)”, “ai” or “a{s(ii)}”. A complete description of all types and signatures is beyond the scope of this article, but depending on the language and/or D-Bus library that you use you will need at least some knowledge on how to specify the type of the values you pass or receives. Check the [D-Bus specification][6] for more info.

### Putting it all together (python example)

Now that we know the basic concepts of D-Bus, we are ready to send _D-Bus messages_. Let’s see a complete Python example.

```

    #!/usr/bin/env python3

    # Import the 'dbus' module from dbus-python package.
    # The package can be installed with `pip install dbus-python`.
    # Documenation: https://dbus.freedesktop.org/doc/dbus-python/
    import dbus

    # We need the NetworkManager's D-Bus API documentation to
    # know what objects and methods we are interested in:
    # https://networkmanager.dev/docs/api/latest/spec.html

    # We'll connect to system bus
    bus = dbus.SystemBus()

    # We'll send our messages to NetworkManager
    NM_WELL_KNOWN_NAME = "org.freedesktop.NetworkManager"

    # Call to the following method:
    #  - object: /org/freedesktop/NetworkManager
    #  - interface: org.freedesktop.NetworkManager
    #  - method: GetDeviceByIpIface
    #  - input argument: "eth0" (type: STRING)
    #  - return value: the device's path (type: OBJECT_PATH)
    #
    # Get the path to the object that represents the device with
    # the interface name "eth0".
    nm_dbus_obj = bus.get_object(
        NM_WELL_KNOWN_NAME, "/org/freedesktop/NetworkManager"
    )
    nm_dbus_iface = dbus.Interface(
        nm_dbus_obj, "org.freedesktop.NetworkManager"
    )
    try:
        device_dbus_path = nm_dbus_iface.GetDeviceByIpIface("eth0")
    except dbus.exceptions.DBusException as e:
        print("D-Bus error: " + str(e))
        quit()

    print("D-Bus path to eth0 device: " + str(device_dbus_path))

    # Call to the following method:
    #  - object: the device that we obtained in the previous step
    #  - interface: org.freedesktop.NetworkManager.Device
    #  - method: Disconnect
    #
    # Request to the NM daemon to disconnect the device
    # Note: NM will return an error if it was already disconnected
    device_dbus_obj = bus.get_object(
        NM_WELL_KNOWN_NAME, device_dbus_path
    )
    device_dbus_iface = dbus.Interface(
        device_dbus_obj, "org.freedesktop.NetworkManager.Device"
    )
    try:
        device_dbus_iface.Disconnect()
    except dbus.exceptions.DBusException as e:
        print("D-Bus error: " + str(e))
        quit()

    print("Device disconnected")

```

Note that we didn’t need to specify the type of the method’s argument. This is because _dbus-python_ does its best to convert the Python values to the equivalent D-Bus values (i.e. str to STRING, list to ARRAY, dict to DICT_ENTRYs, etc.). However, as D-Bus has a strict type system, you will need to specify the type when there is ambiguity. For example, for integer types you will often need to use _dbus.UInt16(value)_ , _dbus.Int64(value)_ , etc.

### More D-Bus features

Another important and widely used D-Bus feature are _signal messages_. Applications can subscribe to other applications’ _signals_ , specifying which of them they are interested in. The producer application sends _signal messages_ when certain events happen, and the subscriber receives them in an asynchronous way. This avoids the need for polling all the time.

There are many other useful features in D-Bus like services activation, authentication, introspection, etc, which are far beyond the scope of this article.

### Useful tools

For command line, systemd’s _busctl_ is the most intuitive and complete tool, with great features like monitoring or capturing D-Bus traffic as a _[pcap][7]_ file. However, value types have to be specified as _D-Bus signatures_ , which is hard if you don’t know them very well. In that case, _dbus-send_ from the _dbus-tools_ package or Qt’s _qdbus_ might be easier to use.

When starting to play around with D-Bus, exploring the different application’s objects hierarchy is much easier with a GUI tool like the _Qt DBUS Viewer_ ( _QDbusViewer_ ).

![Screenshot of QDbusViewer][8]

### Consulted articles

  * <https://www.freedesktop.org/wiki/Software/dbus/>
  * <https://dbus.freedesktop.org/doc/dbus-tutorial.html>
  * <https://dbus.freedesktop.org/doc/dbus-specification.html>
  * <https://develop.kde.org/docs/features/d-bus/introduction_to_dbus/>
  * <https://en.wikipedia.org/wiki/D-Bus>
  * <https://networkmanager.dev/docs/api/latest/spec.html>
  * <https://dbus.freedesktop.org/doc/dbus-python/index.html>



--------------------------------------------------------------------------------

via: https://fedoramagazine.org/d-bus-overview/

作者：[Íñigo Huguet][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/ihuguet/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/12/a1890px-Processes_with_D-Bus.svg_-816x345.jpg
[2]: https://fedoramagazine.org/wp-content/uploads/2023/12/640px-Processes_without_D-Bus.svg_.png
[3]: https://fedoramagazine.org/wp-content/uploads/2023/12/640px-Processes_with_D-Bus.svg_.png
[4]: https://dbus.freedesktop.org/doc/dbus-faq.html#service
[5]: https://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-properties
[6]: https://dbus.freedesktop.org/doc/dbus-specification.html#type-system
[7]: https://en.wikipedia.org/wiki/Pcap
[8]: https://fedoramagazine.org/wp-content/uploads/2023/12/qtdbusviewer.png
