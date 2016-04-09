Linux中的15个‘echo’ 命令实例
================================================================================
**echo**是一种最常用的与广泛使用的内置于Linux的bash和C shell的命令，通常用在脚本语言和批处理文件中来在标准输出或者文件中显示一行文本或者字符串。

![echo command examples](http://www.tecmint.com/wp-content/uploads/2014/08/echo-command.png)

echo命令例子

echo命令的语法是：

    echo [选项] [字符串]

###**1.** 输入一行文本并显示在标准输出上

    $ echo Tecmint is a community of Linux Nerds 

会输出下面的文本:

    Tecmint is a community of Linux Nerds 

###**2.** 输出一个声明的变量值

比如，声明变量**x**并给它赋值为**10**。

     $ x=10

会输出它的值：

    $ echo The value of variable x = $x 

    The value of variable x = 10 


###**3.** 使用‘**\b**‘选项

‘**-e**‘后带上'\b'会删除字符间的所有空格。

**注意：** Linux中的选项‘**-e**‘扮演了转义字符反斜线的翻译器。

    $ echo -e "Tecmint \bis \ba \bcommunity \bof \bLinux \bNerds" 

    TecmintisacommunityofLinuxNerds 

###**4.** 使用‘**\n**‘选项

‘**-e**‘后面的带上‘\n’行会在遇到的地方作为新的一行

    $ echo -e "Tecmint \nis \na \ncommunity \nof \nLinux \nNerds" 

    Tecmint 
    is 
    a 
    community 
    of 
    Linux 
    Nerds 

###**5.** 使用‘**\t**‘选项

‘**-e**‘后面跟上‘\t’会在空格间加上水平制表符。

    $ echo -e "Tecmint \tis \ta \tcommunity \tof \tLinux \tNerds" 

    Tecmint 	is 	a 	community 	of 	Linux 	Nerds 

###**6.** 也可以同时使用换行‘**\n**‘与水平制表符‘**\t**‘

    $ echo -e "\n\tTecmint \n\tis \n\ta \n\tcommunity \n\tof \n\tLinux \n\tNerds" 
    
    	Tecmint 
    	is 
    	a 
    	community 
    	of 
    	Linux 
    	Nerds 

###**7.** 使用‘**\v**‘选项

‘**-e**‘后面跟上‘\v’会加上垂直制表符。

    $ echo -e "\vTecmint \vis \va \vcommunity \vof \vLinux \vNerds" 
    
    Tecmint 
            is 
               a 
                 community 
                           of 
                              Linux 
                                    Nerds 

###**8.** 也可以同时使用换行‘**\n**‘与垂直制表符‘**\v**‘

    $ echo -e "\n\vTecmint \n\vis \n\va \n\vcommunity \n\vof \n\vLinux \n\vNerds" 
    
    
    Tecmint 
    
    is 
    
    a 
    
    community 
    
    of 
    
    Linux 
    
    Nerds 

**注意：** 你可以按照你的需求连续使用两个或者多个垂直制表符，水平制表符与换行符。

###**9.** 使用‘**\r**‘选项

‘**-e**‘后面跟上‘\r’来指定输出中的回车符。（LCTT 译注：会覆写行开头的字符）

    $ echo -e "Tecmint \ris a community of Linux Nerds" 

    is a community of Linux Nerds 

###**10.** 使用‘**\c**‘选项

‘**-e**‘后面跟上‘\c’会抑制输出后面的字符并且最后不会换新行。

    $ echo -e "Tecmint is a community \cof Linux Nerds" 

    Tecmint is a community @tecmint:~$ 

###**11.** ‘**-n**‘会在echo完后不会输出新行

    $ echo -n "Tecmint is a community of Linux Nerds" 
    Tecmint is a community of Linux Nerds@tecmint:~/Documents$ 

###**12.** 使用‘**\a**‘选项

‘**-e**‘后面跟上‘\a’选项会听到声音警告。

    $ echo -e "Tecmint is a community of \aLinux Nerds" 
    Tecmint is a community of Linux Nerds

**注意：** 在你开始前，请先检查你的音量设置。

###**13.** 使用echo命令打印所有的文件和文件夹（ls命令的替代）

    $ echo * 

    103.odt 103.pdf 104.odt 104.pdf 105.odt 105.pdf 106.odt 106.pdf 107.odt 107.pdf 108a.odt 108.odt 108.pdf 109.odt 109.pdf 110b.odt 110.odt 110.pdf 111.odt 111.pdf 112.odt 112.pdf 113.odt linux-headers-3.16.0-customkernel_1_amd64.deb linux-image-3.16.0-customkernel_1_amd64.deb network.jpeg 

###**14.** 打印制定的文件类型

比如，让我们假设你想要打印所有的‘**.jpeg**‘文件，使用下面的命令。

    $ echo *.jpeg 

    network.jpeg 

###**15.** echo可以使用重定向符来输出到一个文件而不是标准输出

    $ echo "Test Page" > testpage 

    ## Check Content
    avi@tecmint:~$ cat testpage 
    Test Page 

### echo 选项列表 ###

<table border="0" cellspacing="0">
<colgroup width="85"></colgroup>
<colgroup width="271"></colgroup>
<tbody>
<tr>
<td style="border: 1px solid #000000;" align="LEFT" height="16"><b> 选项</b></td>
<td style="border: 1px solid #000000;" align="LEFT"><b> 描述</b></td>
</tr>
<tr>
<td style="border: 1px solid #000000;" align="LEFT" height="16"><b> -n</b></td>
<td style="border: 1px solid #000000;" align="LEFT"> 不输出末尾的换行符。</td>
</tr>
<tr>
<td style="border: 1px solid #000000;" align="LEFT" height="16"><b> -e</b></td>
<td style="border: 1px solid #000000;" align="LEFT"> 启用反斜线转义。</td>
</tr>
<tr>
<td style="border: 1px solid #000000;" align="LEFT" height="16"><b> \b</b></td>
<td style="border: 1px solid #000000;" align="LEFT"> 退格</td>
</tr>
<tr>
<td style="border: 1px solid #000000;" align="LEFT" height="16"><b> \\</b></td>
<td style="border: 1px solid #000000;" align="LEFT"> 反斜线</td>
</tr>
<tr>
<td style="border: 1px solid #000000;" align="LEFT" height="16"><b> \n</b></td>
<td style="border: 1px solid #000000;" align="LEFT"> 新行</td>
</tr>
<tr>
<td style="border: 1px solid #000000;" align="LEFT" height="16"><b> \r</b></td>
<td style="border: 1px solid #000000;" align="LEFT"> 回车</td>
</tr>
<tr>
<td style="border: 1px solid #000000;" align="LEFT" height="16"><b> \t</b></td>
<td style="border: 1px solid #000000;" align="LEFT"> 水平制表符</td>
</tr>
<tr>
<td style="border: 1px solid #000000;" align="LEFT" height="16"><b> \v</b></td>
<td style="border: 1px solid #000000;" align="LEFT"> 垂直制表符</td>
</tr>
</tbody>
</table>

就是这些了，不要忘记在下面留下你的反馈。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/echo-command-in-linux/

作者：[Avishek Kumar][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/