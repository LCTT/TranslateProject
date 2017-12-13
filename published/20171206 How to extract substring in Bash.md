如何在 Bash 中抽取子字符串
======

所谓“子字符串”就是出现在其它字符串内的字符串。 比如 “3382” 就是 “this is a 3382 test” 的子字符串。 我们有多种方法可以从中把数字或指定部分字符串抽取出来。

 [![How to Extract substring in Bash Shell on Linux or Unix](https://www.cyberciti.biz/media/new/faq/2017/12/How-to-Extract-substring-in-Bash-Shell-on-Linux-or-Unix.jpg)][2] 

本文会向你展示在 bash shell 中如何获取或者说查找出子字符串。

### 在 Bash 中抽取子字符串

其语法为：

```shell
## 格式 ## 
${parameter:offset:length} 
```

子字符串扩展是 bash 的一项功能。它会扩展成 `parameter` 值中以 `offset` 为开始，长为 `length` 个字符的字符串。 假设， `$u` 定义如下:

```shell
## 定义变量 u ##
u="this is a test"
```

那么下面参数的子字符串扩展会抽取出子字符串:

```shell
var="${u:10:4}"
echo "${var}"
```

结果为:

```
test
```

其中这些参数分别表示：

+   10 : 偏移位置
+   4 : 长度

### 使用 IFS

根据 bash 的 man 页说明:

> [IFS （内部字段分隔符）][3]用于在扩展后进行单词分割，并用内建的 read 命令将行分割为词。默认值是<space><tab><newline>。

另一种 <ruby>POSIX 就绪<rt>POSIX ready</rt></ruby>的方案如下：

```shell
u="this is a test"
set -- $u
echo "$1"
echo "$2"
echo "$3"
echo "$4"
```

输出为：

```shell
this
is
a
test
```

下面是一段 bash 代码，用来从 Cloudflare cache 中去除带主页的 url。

```shell
#！/bin/bash
####################################################
## Author - Vivek Gite {https://www.cyberciti.biz/}
## Purpose - Purge CF cache
## License - Under GPL ver 3.x+
####################################################
## set me first ##
zone_id="YOUR_ZONE_ID_HERE"
api_key="YOUR_API_KEY_HERE"
email_id="YOUR_EMAIL_ID_HERE"

## hold data ##
home_url=""
amp_url=""
urls="$@"

## Show usage 
[ "$urls" == "" ] && { echo "Usage: $0 url1 url2 url3"; exit 1; }

## Get home page url as we have various sub dirs on domain
## /tips/
## /faq/

get_home_url(){
	local u="$1"
	IFS='/'
	set -- $u
	echo "${1}${IFS}${IFS}${3}${IFS}${4}${IFS}"
}

echo
echo "Purging cache from Cloudflare。.。"
echo
for u in $urls
do
     home_url="$(get_home_url $u)"
     amp_url="${u}amp/"
     curl -X DELETE "https://api.cloudflare.com/client/v4/zones/${zone_id}/purge_cache" \
          -H "X-Auth-Email: ${email_id}" \
          -H "X-Auth-Key: ${api_key}" \
          -H "Content-Type: application/json" \
          --data "{\"files\":[\"${u}\"，\"${amp_url}\"，\"${home_url}\"]}"
     echo
done
echo
```

它的使用方法为：

```shell
~/bin/cf.clear.cache https://www.cyberciti.biz/faq/bash-for-loop/ https://www.cyberciti.biz/tips/linux-security.html
```

### 借助 cut 命令

可以使用 `cut` 命令来将文件中每一行或者变量中的一部分删掉。它的语法为：

```shell
u="this is a test"
echo "$u" | cut -d' ' -f 4
echo "$u" | cut --delimiter=' ' --fields=4
##########################################
## WHERE
##   -d' ' : Use a whitespace as delimiter
##   -f 4  : Select only 4th field
##########################################
var="$(cut -d' ' -f 4 <<< $u)"
echo "${var}"
```

想了解更多请阅读 bash 的 man 页：

```shell
man bash
man cut
```

另请参见： [Bash String Comparison: Find Out IF a Variable Contains a Substring][1]

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-extract-substring-in-bash/

作者：[Vivek Gite][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/faq/bash-find-out-if-variable-contains-substring/
[2]:https://www.cyberciti.biz/media/new/faq/2017/12/How-to-Extract-substring-in-Bash-Shell-on-Linux-or-Unix.jpg
[3]:https://bash.cyberciti.biz/guide/$IFS
