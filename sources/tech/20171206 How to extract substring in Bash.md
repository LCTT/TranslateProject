translating by lujun9972
How to extract substring in Bash
======
A substring is nothing but a string is a string that occurs “in”. For example “3382” is a substring of “this is a 3382 test”. One can extract the digits or given string using various methods.

 [![How to Extract substring in Bash Shell on Linux or Unix](https://www.cyberciti.biz/media/new/faq/2017/12/How-to-Extract-substring-in-Bash-Shell-on-Linux-or-Unix.jpg)][2] 

This quick tutorial shows how to obtain or finds substring when using bash shell.

### Extract substring in Bash

The syntax is: ## syntax ## ${parameter:offset:length} The substring expansion is a bash feature. It expands to up to length characters of the value of parameter starting at the character specified by offset. For example, $u defined as follows:

| 
```
## define var named u ##
u="this is a test"
```
 |

The following substring parameter expansion performs substring extraction:

| 
```
var="${u:10:4}"
echo "${var}"
```
 |

Sample outputs:

```
test
```

*   10 : The offset

*   4 : The length

### Using IFS

From the bash man page:

> The Internal Field Separator that is used for word splitting after expansion and to split lines into words with the read builtin command. The default value is .

Another POSIX ready solution is as follows:

| 
```
u="this is a test"
set -- $u
echo "$1"
echo "$2"
echo "$3"
echo "$4"
```
 |

Sample outputs:

```
this
is
a
test
```

| 
```
#!/bin/bash
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
echo "Purging cache from Cloudflare..."
echo
for u in $urls
do
     home_url="$(get_home_url $u)"
     amp_url="${u}amp/"
     curl -X DELETE "https://api.cloudflare.com/client/v4/zones/${zone_id}/purge_cache" \
          -H "X-Auth-Email: ${email_id}" \
          -H "X-Auth-Key: ${api_key}" \
          -H "Content-Type: application/json" \
          --data "{\"files\":[\"${u}\",\"${amp_url}\",\"${home_url}\"]}"
     echo
done
echo
```
 |

I can run it as follows: ~/bin/cf.clear.cache https://www.cyberciti.biz/faq/bash-for-loop/ https://www.cyberciti.biz/tips/linux-security.html

### Say hello to cut command

One can remove sections from each line of file or variable using the cut command. The syntax is:

| 
```
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
 |

For more info read bash man page: man bash man cut See also: [Bash String Comparison: Find Out IF a Variable Contains a Substring][1]

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-extract-substring-in-bash/

作者：[Vivek Gite][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/faq/bash-find-out-if-variable-contains-substring/
[2]:https://www.cyberciti.biz/media/new/faq/2017/12/How-to-Extract-substring-in-Bash-Shell-on-Linux-or-Unix.jpg
