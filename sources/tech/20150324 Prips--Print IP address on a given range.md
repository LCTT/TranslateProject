Translating---geekpi

Prips – Print IP address on a given range
================================================================================
prips is a tool that can be used to print all of the IP address on a given range. It can enhance the usability of tools that are made to work on only one host at a time.

### Install Prips on ubuntu ###

Open the terminal and run the following command

    sudo apt-get install prips

### Using prips ###

### prips syntax ###

    prips [-c] [-d delim] [-e exclude] [-f format] [-i incr] start end
    prips [-c] [-d delim] [-e exclude] [-f format] [-i incr] CIDR-block

### Available Options ###

The prips tool accepts the following command-line options:

- -c -- Print the range in CIDR notation.
- -d delim -- Set the delimiter to the character with ASCII code delim where 0 <= delim <= 255.
- -e -- Exclude ranges from the output.
- -f format -- Set the format of addresses (hex, dec, or dot).
- -i incr -- Set the increment to ‘x'.

### Prips Examples ###

Display all the addresses in a reserved subnet:

    prips 192.168.32.0 192.168.32.255

The same, using CIDR notation:

    prips 192.168.32/24

Display only the usable addresses in a class A reserved subnet using a space instead of a newline for a delimiter:

    prips -d 32 10.0.0.1 10.255.255.255

Display every fourth address in a weird block:

    prips -i 4 192.168.32.7 192.168.33.5

Determine the smallest CIDR block containing two addresses:

    prips -c 192.168.32.5 192.168.32.11

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/prips-print-ip-address-on-a-given-range.html

作者：[ruchi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
