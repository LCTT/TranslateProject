## grep 中的正则表达式
================================================================================
在 Linux 、类 Unix 系统中我该如何使用 Grep 命令的正则表达式呢？

Linux 附带有 GNU grep 命令工具，它支持正则表达式，而且 GNU grep 在所有的 Linux 系统中都是默认有的。Grep 命令被用于搜索定位存储在您服务器或工作站的信息。

### 正则表达式 ###

正则表达式仅仅是对每个输入行的匹配的一种模式，即对字符序列的匹配模式。下面是范例：

    ^w1
    w1|w2
    [^ ]

#### grep 正则表达式示例 ####

在 /etc/passswd 目录中搜索 'vivek'

    grep vivek /etc/passwd

输出例子:

    vivek:x:1000:1000:Vivek Gite,,,:/home/vivek:/bin/bash
    vivekgite:x:1001:1001::/home/vivekgite:/bin/sh
    gitevivek:x:1002:1002::/home/gitevivek:/bin/sh

摸索任何情况下的 vivek(即不区分大小写的搜索)

    grep -i -w vivek /etc/passwd

摸索任何情况下的 vivek 或 raj 

    grep -E -i -w 'vivek|raj' /etc/passwd

上面最后的例子显示的，就是一个正则表达式扩展的模式。

### 锚 ###

你可以分别使用 ^ 和 $ 符号来正则匹配输入行的开始或结尾。下面的例子搜索显示仅仅以 vivek 开始的输入行：

    grep ^vivek /etc/passwd

输出例子:

    vivek:x:1000:1000:Vivek Gite,,,:/home/vivek:/bin/bash
    vivekgite:x:1001:1001::/home/vivekgite:/bin/sh

你可以仅仅只搜索出以单词 vivek 开始的行，即不显示 vivekgit、vivekg 等

    grep -w ^vivek /etc/passwd

找出以单词 word 结尾的行：

	grep 'foo$' 文件名

匹配仅仅只包含 foo 的行：

    grep '^foo$' 文件名

如下所示的例子可以搜索空行：

    grep '^$' 文件名

### 字符类 ###

匹配 Vivek 或 vivek：

    grep '[vV]ivek' 文件名

或者

    grep '[vV][iI][Vv][Ee][kK]' 文件名

也可以匹配数字 (即匹配 vivek1 或 Vivek2 等等):

    grep -w '[vV]ivek[0-9]' 文件名

可以匹配两个数字字符(即 foo11、foo12 等):

    grep 'foo[0-9][0-9]' 文件名

不仅仅局限于数字，也能匹配至少一个字母的:

    grep '[A-Za-z]' 文件名

显示含有"w" 或 "n" 字符的所有行：

    grep [wn] 文件名

在括号内的表达式，即包在"[:" 和 ":]" 之间的字符类的名字，它表示的是属于此类的所有字符列表。标准的字符类名称如下：

- [:alnum:] - 字母数字字符.
- [:alpha:] - 字母字符
- [:blank:] - 空字符: 空格键符 和 制表符.
- [:digit:] - 数字: '0 1 2 3 4 5 6 7 8 9'.
- [:lower:] - 小写字母: 'a b c d e f g h i j k l m n o p q r s t u v w x y z'.
- [:space:] - 空格字符: 制表符、换行符、垂直制表符、换页符、回车符和空格键符.
- [:upper:] - 大写字母: 'A B C D E F G H I J K L M N O P Q R S T U V W X Y Z'.

例子所示的是匹配所有大写字母:

    grep '[:upper:]' 文件名

### 通配符 ###

你可以使用 "." 来匹配单个字符。例子中匹配以"b"开头以"t"结尾的3个字符的单词：

    grep '\<b.t\>' 文件名

在这儿,

- \< 匹配单词前面的空字符串
- \> 匹配单词后面的空字符串

打印出只有两个字符的所有行:

    grep '^..$' 文件名

显示以一个点和一个数字开头的行：

    grep '^\.[0-9]' 文件名

#### 点号转义 ####

下面要匹配到 IP 地址为 192.168.1.254 的正则式是不会工作的:

    egrep '192.168.1.254' /etc/hosts

三个点符号都需要转义：

    grep '192\.168\.1\.254' /etc/hosts

下面的例子仅仅匹配出 IP 地址：

    egrep '[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}' 文件名

下面的例子会匹配任意大小写的 Linux 或 UNIX 这两个单词：

    egrep -i '^(linux|unix)' 文件名

### 怎么样搜索以 - 符号开头的匹配模式？ ###

要使用 -e 选项来搜索匹配 '--test--' 字符串，如果不使用 -e 选项，grep 命令会试图把 '--test--' 当作自己的选项参数来解析：

    grep -e '--test--' 文件名

### 怎么使用 grep 的 OR 匹配? ###

使用如下的语法：

    grep 'word1|word2' 文件名

或者是

    grep 'word1\|word2' 文件名

### 怎么使用 grep 的 AND 匹配? ###

使用下面的语法来显示既包含 'word1' 又包含 'word2' 的所有行

    grep 'word1' 文件名 | grep 'word2'

### 怎么样使用序列检测? ###

使用如下的语法，您可以检测一个字符在序列中重复出现次数：

    {N}
    {N,}
    {min,max}

要匹配字符 “v" 出现两次：

    egrep "v{2}" 文件名

下面的命令能匹配到 "col" 和 "cool" ：

    egrep 'co{1,2}l' 文件名

下面的命令将会匹配出至少有三个 'c' 字符的所有行。

    egrep 'c{3,}' 文件名

下面的例子会匹配 91-1234567890（即二个数字-十个数字） 这种格式的手机号。

    grep "[[:digit:]]\{2\}[ -]\?[[:digit:]]\{10\}" 文件名

### 怎么样使 grep 命令突出显示？###

使用如下的语法：

    grep --color regex 文件名

### 怎么样仅仅只显示匹配出的字符，而不是匹配出的行？   ###

使用如下语法：

    grep -o regex 文件名

### 正则表达式限定符###

注：表格
<table border=1>
  <tr>
    <th>限定符</th>
    <th>描述</th>
  </tr>
  <tr>
    <td>.</td>
    <td>匹配任意的一个字符.</td>
  </tr>
  <tr>
    <td>?</td>
    <td>匹配前面的子表达式,最多一次。</td>
  </tr>
  <tr>
    <td>*</td>
    <td>匹配前面的子表达式零次或多次。</td>
  </tr>
  <tr>
    <td>+</td>
    <td>匹配前面的子表达式一次或多次。</td>
  </tr>
  <tr>
    <td>{N}</td>
    <td>匹配前面的子表达式 N 次。</td>
  </tr>
  <tr>
    <td>{N,}</td>
    <td>匹配前面的子表达式 N 次到多次。</td>
  </tr>
  <tr>
    <td>{N,M}</td>
    <td>匹配前面的子表达式 N 到 M 次，至少 N 次至多 M 次。</td>
  </tr>
  <tr>
    <td>-</td>
    <td>只要不是在序列开始、结尾或者序列的结束点上，表示序列范围</td>
  </tr>
  <tr>
    <td>^</td>
    <td>匹配一行开始的空字符串；也表示字符不在要匹配的列表中。</td>
  </tr>
  <tr>
    <td>$</td>
    <td>匹配一行末尾的空字符串。</td>
  </tr>
  <tr>
    <td>\b</td>
    <td>匹配一个单词前后的空字符串。</td>
  </tr>
  <tr>
    <td>\B</td>
    <td>匹配一个单词中间的空字符串</td>
  </tr>
  <tr>
    <td>\&lt;</td>
    <td>匹配单词前面的空字符串。</td>
  </tr>
  <tr>
    <td>\&gt;</td>
    <td> 匹配单词后面的空字符串。</td>
  </tr>
</table>

#### grep 和 egrep ####

egrep 跟 **grep -E** 是一样的。他会以正则表达式的模式来解释。下面是 grep 的帮助页(man):

       基本的正则表达式元字符  ?、+、 {、 |、 ( 和 ) 已经失去了他们特殊的意义，要使用的话用反斜线的版本 \?、\+、\{、\|、\( 和 \) 来代替。
       传统的 egrep 不支持 { 元字符，一些 egrep 的实现是以 \{ 替代的，所以有 grep -E 的通用脚本应该避免使用 { 符号，要匹配字面的 { 应该使用 [}]。 
       GNU grep -E 试图支持传统的用法，如果 { 出在在无效的间隔规范字符串这前，它就会假定 { 不是特殊字符。
       例如，grep -E '{1' 命令搜索包含 {1 两个字符的串，而不会报出正则表达式语法错误。
       POSIX.2 标准允许对这种操作的扩展，但在可移植脚本文件里应该避免这样使用。

引用:

- grep 和 regex 帮助手册页(7)
- grep 的 info 页`

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/grep-regular-expressions/

作者：Vivek Gite
译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出