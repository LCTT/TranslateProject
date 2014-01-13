Linux id 命令 - 打印用户id和组id信息
================================================================================
要登入一台计算机，我们需要一个用户名。用户名是一个被计算机识别的身份。基于此，计算机会对使用这个用户名的登陆的人应用一系列的规则。在Linux系统下，我们可以使用**id**命令。

### 什么是id命令 ###

**id** 命令可以打印真实并有效的用户ID(UID)和组ID(GID)。UID是对一个用户的唯一标识。组ID（GID）可以包含多个UID。

### 如何使用 ###

默认上，**id**命令已经预装在大多数Linux系统中。要使用它，只需要在你的控制台输入id。不带选项输入id会显示如下。结果会使用活跃用户。

    $ id

![id默认输出](http://linoxide.com/wp-content/uploads/2013/12/id_default.png)

#### 如何读取输出t : ####

- 用户 **pungki** 的 **UID** 号码 = **1000**, **GID** 号码 = **1000**
- 用户 **pungki ** 是下面的组成员 :

    **pungki** with GID = **1000**
    **adm** with GID = **4**
    **cdrom** with GID = **24**
    **sudo** with GID = **27**
    **dip** with GID = **30**
    **plugdev** with GID = **46**
    **lpadmin** with GID = **108**
    **sambashare** with GID = **124**

### 带选项使用id ###

id命令可以使用一些选项。下面有一些在日常使用中有用的选项。

#### 打印用户名, 该UID所属的所有组 ####

要这么做，我们可以使用**-a** 选项

    $ id -a

![-a 选项](http://linoxide.com/wp-content/uploads/2013/12/id_a.png)

#### 输出所有不同的组ID (有效的，真实的和补充的) ####

我们可以使用 **-G**选项实现这个。

    $ id -G

![-G 选项](http://linoxide.com/wp-content/uploads/2013/12/id_G.png)

结果只会显示GID号。你可以和**/etc/group**文件比较。下面是**/etc/group**文件的示例内容：

    root:x:0:
    daemon:x:1:
    bin:x:2:
    sys:x:3:
    adm:x:4:pungki
    fax:x:21:
    voice:x:22:
    cdrom:x:24:pungki
    floppy:x:25:
    tape:x:26:
    sudo:x:27:pungki
    audio:x:29:pulse
    dip:x:30:pungki
    www-data:x:33:
    backup:x:34:
    operator:x:37:
    sasl:x:45:
    plugdev:x:46:pungki
    ssl-cert:x:107:
    lpadmin:x:108:pungki
    saned:x:123:
    sambashare:x:124:pungki
    winbindd_priv:x:125:

#### 只输出有效的组ID ####

使用 **-g** 选项来只输出有效组ID。

    $ id -g

![-g 选项](http://linoxide.com/wp-content/uploads/2013/12/id_g1.png)

#### 打印特定用户信息 ####

我们可以输出特定的用户信息相关的UID和GID。只需要在id命令后跟上用户名。

    $ id leni

![leni 用户](http://linoxide.com/wp-content/uploads/2013/12/id_leni.png)

上面的命令会打印用户**leni**的UID和GID。

### 总结 ###

当我们想知道某个用户的UID和GID时是非常有用的。一些程序可能需要UID/GID来运行。id使我们更加容易地找出用户的UID以GID而不必在/etc/group文件中搜寻。像往常一样，你可以在控制台输入**man id**进入id的手册页来获取更多的细节。 

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-id-command/

译者：[geekpi](https://github.com/geekpi) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
