translating---geekpi

GoTTY – Share Your Linux Terminal (TTY) as a Web Application
============================================================


GoTTY is a simple GoLang based command line tool that enables you to share your terminal(TTY) as a web application. It turns command line tools into web applications.

It employs Chrome OS’ terminal emulator (hterm) to execute a JavaScript based terminal on a web browsers. And importantly, GoTTY runs a web socket server that basically transfers output from the TTYto clients and receives input from clients (that is if input from clients is permitted) and forwards it to the TTY.

Its architecture (hterm + web socket idea) was inspired by [Wetty program][1] which enables terminal over HTTP and HTTPS.

#### Prerequisites:

You should have [GoLang (Go Programming Language)][2] environment installed in Linux to run GoTTY.

### How To Install GoTTY in Linux Systems

If you already have a [working GoLang environment][3], run the go get command below to install it:

```
# go get github.com/yudai/gotty
```

The command above will install the GoTTY binary in your GOBIN environment variable, try to check if that is the case:

```
# $GOPATH/bin/
```
[
 ![Check GOBIN Environment](http://www.tecmint.com/wp-content/uploads/2017/03/Check-Go-Environment.png) 
][4]

Check GOBIN Environment

### How To Use GoTTY in Linux

To run it, you can use the GOBIN env variable and command auto-completion feature as follows:

```
# $GOBIN/gotty
```

Else, run GoTTY or any other Go program without typing the full path to the binary, add your GOBIN variable to PATH in the `~/.profile` file using the export command below:

```
export PATH="$PATH:$GOBIN"
```

Save the file and close it. Then source the file to effect the changes above:

```
# source ~/.profile
```

The general syntax for running GoTTY commands is:

```
Usage: gotty [options] <Linux command here> [<arguments...>]
```

Now run GoTTY with any command such as the [df command][5] to view system disk partitions space and usage from the web browser:

```
# gotty df -h
```

GoTTY will start a web server at port 8080 by default. Then open the URL: `http://127.0.0.1:8080/`on your web browser and you will see the running command as if it were running on your terminal:

[
 ![Gotty Linux Disk Usage](http://www.tecmint.com/wp-content/uploads/2017/03/Gotty-Linux-Disk-Usage.png) 
][6]

Gotty Linux Disk Usage

### How To Customize GoTTY in Linux

You can alter default options and your terminal (hterm) in the profile file `~/.gotty`, it will load this file by default in case it exists.

This is the main customization file read by gotty commands, so, create it as follows:

```
# touch ~/.gotty
```

And set your own valid values for the config options (find all config options here) to customize GoTTY for example:

```
// Listen at port 9000 by default
port = "9000"
// Enable TSL/SSL by default
enable_tls = true
// hterm preferences
// Smaller font and a little bit bluer background color
preferences {
font_size = 5,
background_color = "rgb(16, 16, 32)"
}
```

You can set your own index.html file using the `--html` option from the command line:

```
# gotty --index /path/to/index.html uptime
```

### How to Use Security Features in GoTTY

Because GoTTY doesn’t offer reliable security by default, you need to manually use certain security features explained below.

#### Permit Clients to Run Commands/Type Input in Terminal

Note that, by default, GoTTY doesn’t permit clients to type input into the TTY, it only enables window resizing.

However, you can use the `-w` or `--permit-write` option to allow clients to write to the TTY, which is not recommended due to security threats to the server.

The following command will use [vi command line editor][7] to open the file fossmint.txt for editing in the web browser:

```
# gotty -w vi fossmint.txt
```

Below is the vi interface as seen from the web browser (use vi commands here as usual):

[
 ![Gotty Web Vi Editor](http://www.tecmint.com/wp-content/uploads/2017/03/Gotty-Web-Vi-Editor.png) 
][8]

Gotty Web Vi Editor

#### Use GoTTY with Basic (Username and Password) Authentication

Try to activate a basic authentication mechanism, where clients will be required to input the specified username and password to connect to the GoTTY server.

The command below will restrict client access using the `-c` option to ask users for specified credentials (username: test and password: @67890):

```
# gotty -w -p "9000" -c "test@67890" glances
```
[
 ![Gotty with Basic Authentication](http://www.tecmint.com/wp-content/uploads/2017/03/Gotty-use-basic-authentication.png) 
][9]

Gotty with Basic Authentication

#### Gotty Generate Random URL

Another way of restricting access to the server is by using the `-r` option. Here, GoTTY will generate a random URL so that only users who know the URL can get access to the server.

Also use the –title-format “GoTTY – {{ .Command }} ({{ .Hostname }})” option to define the web browsers interface title and [glances command][10] is used to show system monitoring stats:

```
# gotty -r --title-format "GoTTY - {{ .Command }} ({{ .Hostname }})" glances
```

The following is result of the command above as seen from the web browser interface:

[
 ![Gotty Random URL for Glances Linux Monitoring](http://www.tecmint.com/wp-content/uploads/2017/03/Gotty-Random-URL-for-Glances-Linux-Monitoring.png) 
][11]

Gotty Random URL for Glances Linux Monitoring

#### Use GoTTY with SSL/TLS

Because by default, all connections between the server and clients are not encrypted, when you send secret information through GoTTY such as user credentials or any other info, you have to use the `-t` or `--tls` option which enables TLS/SSL on the session:

GoTTY will by default read the certificate file `~/.gotty.crt` and key file `~/.gotty.key`, therefore, start by creating a self-signed certification as well as the key file using the openssl command below (answer the question asked in order to generate the cert and key files):

```
# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ~/.gotty.key -out ~/.gotty.crt
```

Then use GoTTY in a secure way with SSL/TLS enabled as follows:

```
# gotty -tr --title-format "GoTTY - {{ .Command }} ({{ .Hostname }})" glances
```

#### Share Your Terminal With Multiple Clients

You can make use of [terminal multiplexers][12] for sharing a single process with multiple clients, the following command will start a new [tmux session][13] named gotty with [glances command][14] (make sure you have tmux installed):

```
# gotty tmux new -A -s gotty glances 
```

To read a different config file, use the –config “/path/to/file” option like so:

```
# gotty -tr --config "~/gotty_new_config" --title-format "GoTTY - {{ .Command }} ({{ .Hostname }})" glances
```

To display the GoTTY version, run the command:

```
# gotty -v 
```

Visit the GoTTY GitHub repository to find more usage examples: [https://github.com/yudai/gotty][15]

That’s all! Have you tried it out? How do you find GoTTY? Share your thoughts with us via the feedback form below.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.



----------


via: http://www.tecmint.com/gotty-share-linux-terminal-in-web-browser/

作者：[ Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/access-linux-server-terminal-in-web-browser-using-wetty/
[2]:http://www.tecmint.com/install-go-in-linux/
[3]:http://www.tecmint.com/install-go-in-linux/
[4]:http://www.tecmint.com/wp-content/uploads/2017/03/Check-Go-Environment.png
[5]:http://www.tecmint.com/how-to-check-disk-space-in-linux/
[6]:http://www.tecmint.com/wp-content/uploads/2017/03/Gotty-Linux-Disk-Usage.png
[7]:http://www.tecmint.com/vi-editor-usage/
[8]:http://www.tecmint.com/wp-content/uploads/2017/03/Gotty-Web-Vi-Editor.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/03/Gotty-use-basic-authentication.png
[10]:http://www.tecmint.com/glances-an-advanced-real-time-system-monitoring-tool-for-linux/
[11]:http://www.tecmint.com/wp-content/uploads/2017/03/Gotty-Random-URL-for-Glances-Linux-Monitoring.png
[12]:http://www.tecmint.com/tmux-to-access-multiple-linux-terminals-inside-a-single-console/
[13]:http://www.tecmint.com/tmux-to-access-multiple-linux-terminals-inside-a-single-console/
[14]:http://www.tecmint.com/glances-an-advanced-real-time-system-monitoring-tool-for-linux/
[15]:https://github.com/yudai/gotty
[16]:http://www.tecmint.com/author/aaronkili/
[17]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[18]:http://www.tecmint.com/free-linux-shell-scripting-books/
