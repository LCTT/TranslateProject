十个最好的ZSH技巧
==================

1: 使用 ** 作为下级目录的通配符:

	$ ls **/*.pyc
	foo.pyc bar.pyc lib/wibble.pyc
	$ rm **/*.pyc
	$ ls **/*.pyc

2: 在文件筛选中使用匹配模式:

	$ ls *.(py|sh)

3: 在文件筛选中使用修饰符，如：(@) 限制只匹配符号链接：

	$ ls -l *(@)

4: 使用制表符TAB来自动完成，如man的时候：

 	$ man zsh[TAB]

5: 也可以用制表符来自动补全命令选项：

 	$ python -[TAB]

6: 或者在kill的时候自动完成：

 	$ kill Dock[TAB]

7: 在制表符自动补全时，可以使用光标键（上下左右等）：

 	$ man zsh[TAB][DOWN][RIGHT][LEFT][UP]

8: 自动修改错误的输入：

 	$ pythn -V
 	zsh: correct 'pythn' to 'python' [nyae]? y
 	Python 2.7.1

9: 使用**r**来重复上一条命令，可以带替换方式！

 	$ touch foo.htm bar.htm
 	$ mv foo.htm foo.html
 	$ r foo=bar
 	mv bar.htm bar.html

10: 高可定制性的提示符，使用RPROMPT居然可以设置提示符在右边！

	$ RPROMPT="%t"
	
via: http://blog.goosoftware.co.uk/2012/05/22/ten-great-zsh-tips/


本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：冰雨玉洁 校对：[wxy][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[wxy]:http://linux.cn/space/wxy


