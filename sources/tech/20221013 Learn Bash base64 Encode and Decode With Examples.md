[#]: subject: "Learn Bash base64 Encode and Decode With Examples"
[#]: via: "https://www.debugpoint.com/bash-base64-encode-decode/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Learn Bash base64 Encode and Decode With Examples
======
Want to learn about the base64 encode and decode method? Here in this tutorial, we explain the base64 encode and decode steps using bash shell scripting with various examples.

![][1]

The base64 encoding method transmits data over any communication medium by converting binary data to text. This method is primarily used for the email encryption process.

The Base64 method, in general, is a binary-to-text encoding scheme representing 8-byte binary data in ASCII string format. This has several advantages while transmitting or channelling data among various mediums – especially those that reliably support text content. Hence, it is widely used on World Wide Web. Probably the most used case of this encoding scheme is using it for email attachments.

As per the Base64 representation table, the binary data can be converted to 64 different ASCII characters – which are easy to transmit and printable. This encoding method uses letters A to Z, a to Z, 0 to 9 and + and /.

A total of 64 ASCII characters to represent binary from `000000` to `111111`. Each non-final Base64 digit represents exactly 6 bits of data.

![Base64 Index Table][2]

### Bash base64 encode and decode

#### Syntax

Before you learn about the examples, here is the basic syntax.

```
base64 [OPTIONs] [INFILE] [OUTFILE]
```

Option: You can provide any of the options or combine them as explained below.INFILE: Input can be picked up from standard input (like the command line) or files.OUTFILE: You can redirect the output to the standard output, like the terminal or to a file.

| Arguments | Descriptions | 
| :- | :- |
| -e or –encode | This option is used to encode any data from standard input or any file. It is the default option. | 
| -d or –decode | This option is used to decode any encoded data from standard input or any file. | 
| -n or –noerrcheck | By default, base64 checks error while decoding any data. You can use –n or –noerrcheck option to ignore checking at the time of decoding. | 
| -i, –ignore-garbage | This option is used to ignore non-alphabet characters while decoding. | 
| -u or –help | This option is used to get information about the usage of this command. |

#### Example 1 – A basic encode

In Linux, the base64 package is installed by default. Hence, you can use it from the command line easily. To simply encode a string or text, you can pass it through the command line via piping and get the encoded text. In this example, the string debugpoint.com is encoded to base64.

```
echo "debugpoint.com" | base64
```

![bash base64 encode and decode - example 1][3]

The result is the base64 encoded string.

#### Explanation

The encoding method uses several steps to convert the input. The input characters are converted to 8-bit binary values. The entire set of the binary string is split into 6-bit binary values, which are converted to decimals.

Each decimal value is translated to the base64 character via the base64 index table.

In the above example, the first character, “d”, is converted to binary `01100100`. The first 6 bits are `011001`, which is 25 in decimal. The 25 refers to the Z in the base64 index table. And this goes on for the entire stream of text. See the example below.

![Base64 Encode and Decode – inner working][4]

#### Example 2 – A basic decode

To decode the string, simply pass the encoded value to the base64 with the option `--decode`. And it will give you the exact input string.

![bash base64 encode and decode - example 2 (decode the same example)][5]

#### Example 3 – Encode a Text file

The same command can be used to encode a text file and redirect the output to another text file. Here’s how.

```
base64 example3.txt > example3-encoded.txt
```

![Encode a text file][6]

#### Example 4 – Decode a Text File

And to decode a text file that was encoded using base64, simply use the `--decode` or `-d` switch and pass on the text file name.

```
base64 -d example3-encoded.txt
```

#### Example 5 – Encode a custom input from the user

Using bash shell programming, you can take input from the user via the terminal and encode it. But for that, you need to write a simple shell script and execute it after giving executable permission.

Here’s a simple example which takes input from the user and displays the encoded string.

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

#### Example 6 – A Simple Authentication using base64

You can implement a simple authentication system using the above encode and decode method. You can ask the user to enter a password or a secret code. Then store the secret code in a file or compare it on the fly.

If the stored encoded string matches with the user input encoded text, then the user is authenticated. However, it is a straightforward way of checking an authentication, but sometimes useful for simple business cases.

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

### Conclusion

I hope you get to learn the basics of [Base64][9] encode and decode with these examples. Also, learn a bit about its inner workings. Let me know in the comment box below if this helps you or need additional tutorials on this topic.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/bash-base64-encode-decode/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
