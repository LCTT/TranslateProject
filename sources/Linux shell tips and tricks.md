Translating------------geekpi



Linux shell tips and tricks
================================================================================
I’m using Linux shell (Bash) on daily basis, but I often forgot some useful command or shell tip. Yes, I can remember commands, but I can’t say that if I used it just once for specific task. Then I started to write Linux shell tips in text file on my Dropbox account and now I decided to share that. This list will be updated over time. Also keep in mind that for some tips you will need to install additional software on your Linux distribution.

Check if remote port is open with bash:

    echo >/dev/tcp/8.8.8.8/53 && echo "open"

Suspend process:

    Ctrl + z 

Move process to foreground:

    fg

Generate random hex number where n is number of characters:

    openssl rand -hex n

Execute commands from a file in the current shell:

    source /home/user/file.name

Substring for first 5 characters:

    ${variable:0:5}

SSH debug mode:

    ssh -vvv user@ip_address

SSH with pem key:

    ssh user@ip_address -i key.pem

Get complete directory listing to local directory with wget:

    wget -r --no-parent --reject "index.html*" http://hostname/ -P /home/user/dirs

Create multiple directories:

    mkdir -p /home/user/{test,test1,test2}

List processes tree with child processes:

    ps axwef

Create war file:

    jar -cvf name.war file

Test disk write speed:

    dd if=/dev/zero of=/tmp/output.img bs=8k count=256k conv=fdatasync; rm -rf /tmp/output.img

Test disk read speed:

    hdparm -Tt /dev/sda

Get md5 hash from text:

    echo -n "text" | md5sum

Check xml syntax:

    xmllint --noout file.xml

Extract tar.gz in new directory:

    tar zxvf package.tar.gz -C new_dir

Get HTTP headers with curl:

    curl -I http://www.example.com

Modify timestamp of some file or directory (YYMMDDhhmm):

    touch -t 0712250000 file

Download from ftp using wget:

    wget -m ftp://username:password@hostname

Generate random password (16 char long in this case):

    LANG=c < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-16};echo;

Quickly create a backup of a file:

    cp some_file_name{,.bkp}

Access Windows share:

    smbclient -U "DOMAIN\user" //dc.domain.com/share/test/dir

Run command from history (here at line 100):

    !100

Unzip to directory:

    unzip package_name.zip -d dir_name

Multiline text (CTRL + d to exit):

    cat > test.txt

Create empty file or empty existing one:

    > test.txt

Update date from Ubuntu NTP server:

    ntpdate ntp.ubuntu.com

netstat show all tcp4 listening ports:

    netstat -lnt4 | awk '{print $4}' | cut -f2 -d: | grep -o '[0-9]*'

Convert image from qcow2 to raw:

    qemu-img convert -f qcow2 -O raw precise-server-cloudimg-amd64-disk1.img \
                                     precise-server-cloudimg-amd64-disk1.raw

Run command repeatedly, displaying it's output (default every two seconds):

    watch ps -ef

List all users:

    getent passwd

Mount root in read/write mode:

    mount -o remount,rw /

Mount a directory (for cases when symlinking will not work):

    mount --bind /source /destination

Send dynamic update to DNS server:

    nsupdate < <EOF
    update add $HOST 86400 A $IP
    send
    EOF

Recursively grep all directories:

    grep -r "some_text" /path/to/dir

List ten largest open files:

    lsof / | awk '{ if($7 > 1048576) print $7/1048576 "MB "$9 }' | sort -n -u | tail

Show free RAM in MB:

    free -m | grep cache | awk '/[0-9]/{ print $4" MB" }'

Open Vim and jump to end of file:

    vim + some_file_name

Git clone specific branch (master):

    git clone git@github.com:name/app.git -b master

Git switch to another branch (develop):

    git checkout develop

Git delete branch (myfeature):

    git branch -d myfeature

Git delete remote branch:

    git push origin :branchName

Git push new branch to remote:

    git push -u origin mynewfeature

Print out the last cat command from history:

    !cat:p

Run your last cat command from history:

    !cat

Find all empty subdirectories in /home/user:

    find /home/user -maxdepth 1 -type d -empty

Get all from line 50 to 60 in test.txt:

    < test.txt sed -n '50,60p'

Run last command (if it was: mkdir /root/test, below will run: sudo mkdir /root/test):

    sudo !!

Create temporary RAM filesystem - ramdisk (first create /tmpram directory):

    mount -t tmpfs tmpfs /tmpram -o size=512m

Grep whole words:

    grep -w "name" test.txt

Append text to a file that requires raised privileges:

    echo "some text" | sudo tee -a /path/file

List all supported kill signals:

    kill -l

Generate random password (16 characters long in this case):

    openssl rand -base64 16

Do not log last session in bash history:

    kill -9 $$

Scan network to find open port:

    nmap -p 8081 172.20.0.0/16

Set git email:

    git config --global user.email "me@example.com"

To sync with master if you have unpublished commits:

    git pull --rebase origin master

Move all files with "txt" in name to /home/user:

    find -iname "*txt*" -exec mv -v {} /home/user \;

Put the file lines side by side:

    paste test.txt test1.txt

Progress bar in shell:

    pv data.log

Send the data to server with netcat:

    echo "hosts.sampleHost 10 `date +%s`" | nc 192.168.200.2 3000

Convert tabs to spaces:

    expand test.txt > test1.txt

Skip bash history:

    < <space>>cmd

Go to the previous working directory:

    cd -

Split large tar.gz archive (100MB each) and put it back:

    split –b 100m /path/to/large/archive /path/to/output/files
    cat files* > archive

Get HTTP status code with curl:

    curl -sL -w "%{http_code}\\n" www.example.com -o /dev/null

When Ctrl + c not works:

    Ctrl + \

Get file owner:

    stat -c %U file.txt

List block devices:

    lsblk -f

Find files with trailing spaces:

    find . -type f -exec egrep -l " +$" "{}" \;

Find files with tabs indentation:

    find . -type f -exec egrep -l $'\t' "{}" \;

Print horizontal line with "=":

    printf '%100s\n' | tr ' ' =

**UPDATE: November 25, 2013**

--------------------------------------------------------------------------------

via: http://www.techbar.me/linux-shell-tips/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出