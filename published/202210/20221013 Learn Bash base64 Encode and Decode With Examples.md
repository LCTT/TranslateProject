[#]: subject: "Learn Bash base64 Encode and Decode With Examples"
[#]: via: "https://www.debugpoint.com/bash-base64-encode-decode/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "chai001125"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15189-1.html"

通过示例来学习 Bash base64 的编码和解码
======

> 你想了解 Base64 编码和解码的方法吗？在本教程中，我们使用 Bash shell 脚本和各种示例解释了 Base64 编码和解码步骤。

![](https://img.linux.net.cn/data/attachment/album/202210/29/163350mde5lll86j6lspln.jpg)

Base64 编码方法可以将二进制数据转换为文本，如此编码数据可以在任何通信媒介进行传输。这种编码方法主要用于电子邮件加密的过程。

总体而言，Base64 编码方法是一种二进制到文本的编码方案，以 ASCII 字符串格式表示 8 字节的二进制数据。使用这种编码方法在各种媒介之间传输数据时有几个优势，尤其是对于那些能可靠地支持文本内容的媒介。因此，Base64 编码方法在万维网上被广泛使用。这种编码方案最常用于电子邮件附件的编码上。

根据 Base64 编码表，二进制数据可以经 Base64 编码后可以转换为 64 个不同的 ASCII 字符，包含大写字母 `A` 到 `Z`，小写字母 `a` 到 `z`，数字 `0` 到 `9`，以及符号 `+` 和 `/`，这些字符在传输和打印上十分便捷。

这 64 个 ASCII 字符代表着从 `000000` 到 `111111` 的二进制值。每个非末尾的 Base64 编码字符恰好代表 6 位二进制值。

![Base64 Index Table][2]

### Bash base64 的编码和解码

#### 句法

在我们提供示例之前，首先介绍 Base64 的基本语法。

```
base64 [OPTIONs] [INFILE] [OUTFILE]
```

- 选项（`Option`）：参照下面的表格，你可以提供任何的选项或组合多个选项。
- 输入（`INFILE`）：你可以从标准输入（如命令行）或文件中输入。
- 输出（`OUTFILE`）：你可以将输出重定向到标准输出，如终端或文件中。

| 选项 | 描述 | 
| :- | :- |
| `-e` 或者 `--encode` | 此选项用于对标准输入的数据或从文件中读入的数据进行编码。这是默认选项。 | 
| `-d` 或者 `--decode` | 此选项用于对标准输入的数据或从文件中读入的已 Base64 编码数据进行解码。 | 
| `-n` 或者 `--noerrcheck` | 默认情况下，Base64 在解码数据时，会自动检查是否有错误。你可以使用该选项在解码时忽略检查。 | 
| `-i` 或 `--ignore-garbage` | 此选项用于在解码时忽略非字母字符。 | 
| `-u` 或者 `--help` | 此选项用于获取有关使用此命令的信息。 |

#### 示例 1：基本编码

在 Linux 中，默认已安装好 Base64 软件包。因此，你可以轻松地从命令行使用 Base64。要对一个字符串或文本进行编码，你可以通过管道将其传递到 `base64` 命令，并获取待编码的文本。在下面的示例中，对字符串 `debugpoint.com` 进行了 Base64 编码。

```
echo "debugpoint.com" | base64
```

![bash base64 encode and decode - example 1][3]

结果是经过 Base64 编码后的字符串。

#### 解释

Base64 编码方法使用下面的几个步骤来转换输入的数据。首先，每个输入字符转换为 8 位二进制值，接着，二进制字符串拆分为一组组 6 位的二进制值，然后，每个 6 位的二进制值被转换为十进制值。

最后，每个十进制值都通过 Base64 编码索引表转换为 Base64 字符。

在上面的示例中，第一个字符 `d` 被转换为二进制 `01100100`。前 6 位是 `011001`，转换为十进制是 `25`。`25` 在 Base64 编码索引表中对应着 `Z`。整个输入的文本流都像如此编码。请参阅以下编码过程的示例。

![Base64 Encode and Decode – inner working][4]

#### 示例 2：基本解码

要解码字符串，需要将编码值传递给 `base64` 命令，选项为 `--decode`，它将输出你之前输入的字符串。

![bash base64 encode and decode - example 2 (decode the same example)][5]

#### 示例 3：对文本文件进行编码

示例 1 中的同一命令也可用于编码文本文件，并将输出重定向到另一个文本文件。方法如下。

```
base64 example3.txt > example3-encoded.txt
```

![Encode a text file][6]

#### 示例 4：对文本文件进行解码

要解码使用 Base64 编码的文本文件，只需使用 `--decode` 或 `-d` 选项，并传递文本文件名。

```
base64 -d example3-encoded.txt
```

#### 示例 5：对用户输入的数据进行编码

使用 Bash shell 编程，你可以通过终端接收用户的输入，并对其进行 Base64 编码。你需要先编写一个简单的 shell 脚本，并在授予可执行权限后执行。

以下就是一个简单的示例，它从用户那里获得输入，然后进行 Base64 编码，最终显示编码的字符串。

```
#!/bin/bash
#Sample program to take input, encode to base64 and display on terminal
#Example by www.debugpoint.com
echo "Enter text for encoding to base64:"
read input_text
output_text=`echo -n $input_text | base64`
echo "The Base64 Encoded text is: $output_text"
```

![Custom input - base64 encode and decode using script][7]

#### 示例 6：用 Base64 进行简单的身份认证

你可以运用上述的编码和解码方法，实现一个简单的身份验证系统。你可以让用户输入密码或密码，然后将密码存储在文件中。或者进行实时比较。

如果存储的编码字符串与用户输入的文本再编码的字符串相匹配，则用户可以通过验证。虽然这是一种检查身份验证的很简单的方法，但有时这对一些简单的业务案例很有用。

```
#!/bin/bash
#Sample program to take input, encode to base64 and display on terminal
#Example by www.debugpoint.com
echo "Type your password"
read pwd1
decoded_text=`echo 'U2lsZW5jZSBpcyBnb2xkZW4h' | base64 --decode`
if [[ $pwd1 == $decoded_text ]]
then
    echo "You are a valid user."
else
    echo "You are NOT a valid user."
fi
```

![A Simple Authentication using bash base64][8]

### 总结

我希望你能通过这些示例，学会 [Base64][9] 编码和解码的基础知识。此外，你也了解到 Base64 的内部编码方式。如果这对你很有帮助，或你还需要有关此主题的其他教程，请在下面的评论区中告诉我吧。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/bash-base64-encode-decode/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[chai001125](https://github.com/chai001125)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2021/11/base64example-1024x576.jpg
[2]: https://www.debugpoint.com/wp-content/uploads/2021/11/Base64-Index-Table.png
[3]: https://www.debugpoint.com/wp-content/uploads/2021/11/bash-base64-encode-and-decode-example-1.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2021/11/Base64-Encode-and-Decode-inner-working.png
[5]: https://www.debugpoint.com/wp-content/uploads/2021/11/bash-base64-encode-and-decode-example-2-decode-the-same-example.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2021/11/Encode-a-text-file.png
[7]: https://www.debugpoint.com/wp-content/uploads/2021/11/Custom-input-base64-encode-and-decode-using-script.png
[8]: https://www.debugpoint.com/wp-content/uploads/2021/11/A-Simple-Authentication-using-bash-base64.png
[9]: https://linux.die.net/man/1/base64
