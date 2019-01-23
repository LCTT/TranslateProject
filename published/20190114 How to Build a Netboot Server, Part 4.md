[#]: collector: "lujun9972"
[#]: translator: "qhwdw"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-10470-1.html"
[#]: subject: "How to Build a Netboot Server, Part 4"
[#]: via: "https://fedoramagazine.org/how-to-build-a-netboot-server-part-4/"
[#]: author: "Gregory Bartholomew https://fedoramagazine.org/author/glb/"

如何构建一台网络引导服务器（四）
======
![](https://fedoramagazine.org/wp-content/uploads/2018/11/netboot4-816x345.jpg)

在本系列教程中所构建的网络引导服务器有一个很重要的限制，那就是所提供的操作系统镜像是只读的。一些使用场景或许要求终端用户能够修改操作系统镜像。例如，一些教师或许希望学生能够安装和配置一些像 MariaDB 和 Node.js 这样的包来做为他们课程练习的一部分。

可写镜像的另外的好处是，终端用户“私人定制”的操作系统，在下次不同的工作站上使用时能够“跟着”他们。

### 修改 Bootmenu 应用程序以使用 HTTPS

为 bootmenu 应用程序创建一个自签名的证书：

```
$ sudo -i
# MY_NAME=$(</etc/hostname)
# MY_TLSD=/opt/bootmenu/tls
# mkdir $MY_TLSD
# openssl req -newkey rsa:2048 -nodes -keyout $MY_TLSD/$MY_NAME.key -x509 -days 3650 -out $MY_TLSD/$MY_NAME.pem
```

验证你的证书的值。确保 `Subject` 行中 `CN` 的值与你的 iPXE 客户端连接你的网络引导服务器所使用的 DNS 名字是相匹配的：

```
# openssl x509 -text -noout -in $MY_TLSD/$MY_NAME.pem
```

接下来，更新 bootmenu 应用程序去监听 HTTPS 端口和新创建的证书及密钥：

```
# sed -i "s#listen => .*#listen => ['https://$MY_NAME:443?cert=$MY_TLSD/$MY_NAME.pem\&key=$MY_TLSD/$MY_NAME.key\&ciphers=AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA'],#" /opt/bootmenu/bootmenu.conf
```

注意 [iPXE 当前支持的][1] 加密算法是有限制的。

GnuTLS 要求 “CAP_DAC_READ_SEARCH” 能力，因此将它添加到 bootmenu 应用程序的 systemd 服务：

```
# sed -i '/^AmbientCapabilities=/ s/$/ CAP_DAC_READ_SEARCH/' /etc/systemd/system/bootmenu.service
# sed -i 's/Serves iPXE Menus over HTTP/Serves iPXE Menus over HTTPS/' /etc/systemd/system/bootmenu.service
# systemctl daemon-reload
```

现在，在防火墙中为 bootmenu 服务添加一个例外规则并重启动该服务：

```
# MY_SUBNET=192.0.2.0
# MY_PREFIX=24
# firewall-cmd --add-rich-rule="rule family='ipv4' source address='$MY_SUBNET/$MY_PREFIX' service name='https' accept"
# firewall-cmd --runtime-to-permanent
# systemctl restart bootmenu.service
```

使用 `wget` 去验证是否工作正常：

```
$ MY_NAME=server-01.example.edu
$ MY_TLSD=/opt/bootmenu/tls
$ wget -q --ca-certificate=$MY_TLSD/$MY_NAME.pem -O - https://$MY_NAME/menu
```

### 添加 HTTPS 到 iPXE

更新 `init.ipxe` 去使用 HTTPS。接着使用选项重新编译 ipxe 引导加载器，以便它包含和信任你为 bootmenu 应用程序创建的自签名证书：

```
$ echo '#define DOWNLOAD_PROTO_HTTPS' >> $HOME/ipxe/src/config/local/general.h
$ sed -i 's/^chain http:/chain https:/' $HOME/ipxe/init.ipxe
$ cp $MY_TLSD/$MY_NAME.pem $HOME/ipxe
$ cd $HOME/ipxe/src
$ make clean
$ make bin-x86_64-efi/ipxe.efi EMBED=../init.ipxe CERT="../$MY_NAME.pem" TRUST="../$MY_NAME.pem"
```

你现在可以将启用了 HTTPS 的 iPXE 引导加载器复制到你的客户端上，并测试它能否正常工作：

```
$ cp $HOME/ipxe/src/bin-x86_64-efi/ipxe.efi $HOME/esp/efi/boot/bootx64.efi
```

### 添加用户验证到 Mojolicious 中

为 bootmenu 应用程序创建一个 PAM 服务定义：

```
# dnf install -y pam_krb5
# echo 'auth required pam_krb5.so' > /etc/pam.d/bootmenu
```

添加一个库到 bootmenu 应用程序中，它使用 Authen-PAM 的 Perl 模块去执行用户验证：

```
# dnf install -y perl-Authen-PAM;
# MY_MOJO=/opt/bootmenu
# mkdir $MY_MOJO/lib
# cat << 'END' > $MY_MOJO/lib/PAM.pm
package PAM;

use Authen::PAM;

sub auth {
   my $success = 0;

   my $username = shift;
   my $password = shift;

   my $callback = sub {
      my @res;
      while (@_) {
         my $code = shift;
         my $msg = shift;
         my $ans = "";
   
         $ans = $username if ($code == PAM_PROMPT_ECHO_ON());
         $ans = $password if ($code == PAM_PROMPT_ECHO_OFF());
   
         push @res, (PAM_SUCCESS(), $ans);
      }
      push @res, PAM_SUCCESS();

      return @res;
   };

   my $pamh = new Authen::PAM('bootmenu', $username, $callback);

   {
      last unless ref $pamh;
      last unless $pamh->pam_authenticate() == PAM_SUCCESS;
      $success = 1;
   }

   return $success;
}

return 1;
END
```

以上的代码是一字不差是从 Authen::PAM::FAQ 的 man 页面中复制来的。

重定义 bootmenu 应用程序，以使它仅当提供了有效的用户名和密码之后返回一个网络引导模板：

```
# cat << 'END' > $MY_MOJO/bootmenu.pl
#!/usr/bin/env perl

use lib 'lib';

use PAM;
use Mojolicious::Lite;
use Mojolicious::Plugins;
use Mojo::Util ('url_unescape');

plugin 'Config';

get '/menu';
get '/boot' => sub {
   my $c = shift;

   my $instance = $c->param('instance');
   my $username = $c->param('username');
   my $password = $c->param('password');

   my $template = 'menu';

   {
      last unless $instance =~ /^fc[[:digit:]]{2}$/;
      last unless $username =~ /^[[:alnum:]]+$/;
      last unless PAM::auth($username, url_unescape($password));
      $template = $instance;
   }

   return $c->render(template => $template);
};

app->start;
END
```

bootmenu 应用程序现在查找 `lib` 命令去找到相应的 `WorkingDirectory`。但是，默认情况下，对于 systemd 单元它的工作目录设置为服务器的 root 目录。因此，你必须更新 systemd 单元去设置 `WorkingDirectory` 为 bootmenu 应用程序的根目录：

```
# sed -i "/^RuntimeDirectory=/ a WorkingDirectory=$MY_MOJO" /etc/systemd/system/bootmenu.service
# systemctl daemon-reload
```

更新模块去使用重定义后的 bootmenu 应用程序：

```
# cd $MY_MOJO/templates
# MY_BOOTMENU_SERVER=$(</etc/hostname)
# MY_FEDORA_RELEASES="28 29"
# for i in $MY_FEDORA_RELEASES; do echo '#!ipxe' > fc$i.html.ep; grep "^kernel\|initrd" menu.html.ep | grep "fc$i" >> fc$i.html.ep; echo "boot || chain https://$MY_BOOTMENU_SERVER/menu" >> fc$i.html.ep; sed -i "/^:f$i$/,/^boot /c :f$i\nlogin\nchain https://$MY_BOOTMENU_SERVER/boot?instance=fc$i\&username=\${username}\&password=\${password:uristring} || goto failed" menu.html.ep; done
```

上面的最后的命令将生成类似下面的三个文件：

`menu.html.ep`：

```
#!ipxe

set timeout 5000

:menu
menu iPXE Boot Menu
item --key 1 lcl 1. Microsoft Windows 10
item --key 2 f29 2. RedHat Fedora 29
item --key 3 f28 3. RedHat Fedora 28
choose --timeout ${timeout} --default lcl selected || goto shell
set timeout 0
goto ${selected}

:failed
echo boot failed, dropping to shell...
goto shell

:shell
echo type 'exit' to get the back to the menu
set timeout 0
shell
goto menu

:lcl
exit

:f29
login
chain https://server-01.example.edu/boot?instance=fc29&username=${username}&password=${password:uristring} || goto failed

:f28
login
chain https://server-01.example.edu/boot?instance=fc28&username=${username}&password=${password:uristring} || goto failed
```

`fc29.html.ep`：

```
#!ipxe
kernel --name kernel.efi ${prefix}/vmlinuz-4.19.5-300.fc29.x86_64 initrd=initrd.img ro ip=dhcp rd.peerdns=0 nameserver=192.0.2.91 nameserver=192.0.2.92 root=/dev/disk/by-path/ip-192.0.2.158:3260-iscsi-iqn.edu.example.server-01:fc29-lun-1 netroot=iscsi:192.0.2.158::::iqn.edu.example.server-01:fc29 console=tty0 console=ttyS0,115200n8 audit=0 selinux=0 quiet
initrd --name initrd.img ${prefix}/initramfs-4.19.5-300.fc29.x86_64.img
boot || chain https://server-01.example.edu/menu
```

`fc28.html.ep`：

```
#!ipxe
kernel --name kernel.efi ${prefix}/vmlinuz-4.19.3-200.fc28.x86_64 initrd=initrd.img ro ip=dhcp rd.peerdns=0 nameserver=192.0.2.91 nameserver=192.0.2.92 root=/dev/disk/by-path/ip-192.0.2.158:3260-iscsi-iqn.edu.example.server-01:fc28-lun-1 netroot=iscsi:192.0.2.158::::iqn.edu.example.server-01:fc28 console=tty0 console=ttyS0,115200n8 audit=0 selinux=0 quiet
initrd --name initrd.img ${prefix}/initramfs-4.19.3-200.fc28.x86_64.img
boot || chain https://server-01.example.edu/menu
```

现在，重启动 bootmenu 应用程序，并验证用户认证是否正常工作：

```
# systemctl restart bootmenu.service
```

### 使得 iSCSI Target 可写

现在，用户验证通过 iPXE 可以正常工作，在用户连接时，你可以按需在只读镜像的上面创建每用户可写的<ruby>overlay<rt>叠加层</rt></ruby>。使用一个 [写时复制][2] 的叠加层与简单地为每个用户复制原始镜像相比有三个好处：

  1. 副本创建非常快。这样就可以按需创建。
  2. 副本并不增加服务器上的磁盘使用。除了原始镜像之外，仅存储用户写入个人镜像的内容。
  3. 由于每个副本的扇区大多都是服务器的存储器上的相同扇区，在随后的用户访问这些操作系统的副本时，它们可能已经加载到内存中，这样就提升了服务器的性能，因为对内存的访问速度要比磁盘 I/O 快得多。

使用写时复制的一个潜在隐患是，一旦叠加层创建后，叠加层之下的镜像就不能再改变。如果它们改变，所有它们之上的叠加层将出错。因此，叠加层必须被删除并用新的、空白的进行替换。即便只是简单地以读写模式加载的镜像，也可能因为某些文件系统更新导致叠加层出错。

由于这个隐患，如果原始镜像被修改将导致叠加层出错，因此运行下列的命令，将原始镜像标记为不可改变：

```
# chattr +i </path/to/file>
```

你可以使用 `lsattr </path/to/file>` 去查看不可改变标志，并可以使用 `chattr -i </path/to/file>` 取消设置不可改变标志。在设置了不可改变标志之后，即便是 root 用户或以 root 运行的系统进程也不修改或删除这个文件。

停止 tgtd.service 之后，你就可以改变镜像文件：

```
# systemctl stop tgtd.service
```

当仍有连接打开的时候，运行这个命令一般需要一分钟或更长的时间。

现在，移除只读的 iSCSI 出口。然后更新模板中的 `readonly-root` 配置文件，以使镜像不再是只读的：

```
# MY_FC=fc29
# rm -f /etc/tgt/conf.d/$MY_FC.conf
# TEMP_MNT=$(mktemp -d)
# mount /$MY_FC.img $TEMP_MNT
# sed -i 's/^READONLY=yes$/READONLY=no/' $TEMP_MNT/etc/sysconfig/readonly-root
# sed -i 's/^Storage=volatile$/#Storage=auto/' $TEMP_MNT/etc/systemd/journald.conf
# umount $TEMP_MNT
```

将 journald 日志从发送到内存修改回缺省值（如果 `/var/log/journal` 存在的话记录到磁盘），因为一个用户报告说，他的客户端由于应用程序生成了大量的系统日志而产生内存溢出错误，导致它的客户端被卡住。而将日志记录到磁盘的负面影响是客户端产生了额外的写入流量，这将在你的网络引导服务器上可能增加一些没有必要的 I/O。你应该去决定到底使用哪个选择 —— 记录到内存还是记录到硬盘 —— 哪个更合适取决于你的环境。

因为你的模板镜像在以后不能做任何的更改，因此在它上面设置不可更改标志，然后重启动 tgtd.service：

```
# chattr +i /$MY_FC.img
# systemctl start tgtd.service
```

现在，更新 bootmenu 应用程序：

```
# cat << 'END' > $MY_MOJO/bootmenu.pl
#!/usr/bin/env perl

use lib 'lib';

use PAM;
use Mojolicious::Lite;
use Mojolicious::Plugins;
use Mojo::Util ('url_unescape');

plugin 'Config';

get '/menu';
get '/boot' => sub {
   my $c = shift;

   my $instance = $c->param('instance');
   my $username = $c->param('username');
   my $password = $c->param('password');

   my $chapscrt;
   my $template = 'menu';

   {
      last unless $instance =~ /^fc[[:digit:]]{2}$/;
      last unless $username =~ /^[[:alnum:]]+$/;
      last unless PAM::auth($username, url_unescape($password));
      last unless $chapscrt = `sudo scripts/mktgt $instance $username`;
      $template = $instance;
   }

   return $c->render(template => $template, username => $username, chapscrt => $chapscrt);
};

app->start;
END
```

新版本的 bootmenu 应用程序调用一个定制的 `mktgt` 脚本，如果成功，它将为每个它自己创建的新的 iSCSI 目标返回一个随机的 [CHAP][3] 密码。这个 CHAP 密码可以防止其它用户的 iSCSI 目标以间接方式挂载这个用户的目标。这个应用程序只有在用户密码认证成功之后才返回一个正确的 iSCSI 目标密码。

`mktgt` 脚本要加 `sudo` 前缀来运行，因为它需要 root 权限去创建目标。

`$username` 和 `$chapscrt` 变量也传递给 `render` 命令，因此在需要的时候，它们也能够被纳入到模板中返回给用户。

接下来，更新我们的引导模板，以便于它们能够读取用户名和 `chapscrt` 变量，并传递它们到所属的终端用户。也要更新模板以 rw（读写）模式加载根文件系统：

```
# cd $MY_MOJO/templates
# sed -i "s/:$MY_FC/:$MY_FC-<%= \$username %>/g" $MY_FC.html.ep
# sed -i "s/ netroot=iscsi:/ netroot=iscsi:<%= \$username %>:<%= \$chapscrt %>@/" $MY_FC.html.ep
# sed -i "s/ ro / rw /" $MY_FC.html.ep
```

运行上面的命令后，你应该会看到如下的引导模板：

```
#!ipxe
kernel --name kernel.efi ${prefix}/vmlinuz-4.19.5-300.fc29.x86_64 initrd=initrd.img rw ip=dhcp rd.peerdns=0 nameserver=192.0.2.91 nameserver=192.0.2.92 root=/dev/disk/by-path/ip-192.0.2.158:3260-iscsi-iqn.edu.example.server-01:fc29-<%= $username %>-lun-1 netroot=iscsi:<%= $username %>:<%= $chapscrt %>@192.0.2.158::::iqn.edu.example.server-01:fc29-<%= $username %> console=tty0 console=ttyS0,115200n8 audit=0 selinux=0 quiet
initrd --name initrd.img ${prefix}/initramfs-4.19.5-300.fc29.x86_64.img
boot || chain https://server-01.example.edu/menu
```

注意：如果在 [插入][4] 变量后需要查看引导模板，你可以在 `boot` 命令之前，在它自己的行中插入 `shell` 命令。然后在你网络引导你的客户端时，iPXE 将在那里给你提供一个用于交互的 shell，你可以在 shell 中输入 `imgstat` 去查看传递到内核的参数。如果一切正确，你可以输入 `exit` 去退出 shell 并继续引导过程。

现在，通过 `sudo` 允许 bootmenu 用户以 root 权限去运行 `mktgt` 脚本（仅这个脚本）：

```
# echo "bootmenu ALL = NOPASSWD: $MY_MOJO/scripts/mktgt *" > /etc/sudoers.d/bootmenu
```

bootmenu 用户不应该写访问 `mktgt` 脚本或在它的家目录下的任何其它文件。在 `/opt/bootmenu` 目录下的所有文件的属主应该是 root，并且不应该被其它任何 root 以外的用户可写。

`sudo` 在使用 systemd 的 `DynamicUser` 选项下不能正常工作，因此创建一个普通用户帐户，并设置 systemd 服务以那个用户运行：

```
# useradd -r -c 'iPXE Boot Menu Service' -d /opt/bootmenu -s /sbin/nologin bootmenu
# sed -i 's/^DynamicUser=true$/User=bootmenu/' /etc/systemd/system/bootmenu.service
# systemctl daemon-reload
```

最后，为写时复制覆盖创建一个目录，并创建管理 iSCSI 目标的 `mktgt` 脚本和它们的覆盖支持存储：

```
# mkdir /$MY_FC.cow
# mkdir $MY_MOJO/scripts
# cat << 'END' > $MY_MOJO/scripts/mktgt
#!/usr/bin/env perl

# if another instance of this script is running, wait for it to finish
"$ENV{FLOCKER}" eq 'MKTGT' or exec "env FLOCKER=MKTGT flock /tmp $0 @ARGV";

# use "RETURN" to print to STDOUT; everything else goes to STDERR by default
open(RETURN, '>&', STDOUT);
open(STDOUT, '>&', STDERR);

my $instance = shift or die "instance not provided";
my $username = shift or die "username not provided";

my $img = "/$instance.img";
my $dir = "/$instance.cow";
my $top = "$dir/$username";

-f "$img" or die "'$img' is not a file"; 
-d "$dir" or die "'$dir' is not a directory";

my $base;
die unless $base = `losetup --show --read-only --nooverlap --find $img`;
chomp $base;

my $size;
die unless $size = `blockdev --getsz $base`;
chomp $size;

# create the per-user sparse file if it does not exist
if (! -e "$top") {
   die unless system("dd if=/dev/zero of=$top status=none bs=512 count=0 seek=$size") == 0;
}

# create the copy-on-write overlay if it does not exist
my $cow="$instance-$username";
my $dev="/dev/mapper/$cow";
if (! -e "$dev") {
   my $over;
   die unless $over = `losetup --show --nooverlap --find $top`;
   chomp $over;
   die unless system("echo 0 $size snapshot $base $over p 8 | dmsetup create $cow") == 0;
}

my $tgtadm = '/usr/sbin/tgtadm --lld iscsi';

# get textual representations of the iscsi targets
my $text = `$tgtadm --op show --mode target`;
my @targets = $text =~ /(?:^T.*\n)(?:^ .*\n)*/mg;

# convert the textual representations into a hash table
my $targets = {};
foreach (@targets) {
   my $tgt;
   my $sid;

   foreach (split /\n/) {
      /^Target (\d+)(?{ $tgt = $targets->{$^N} = [] })/;
      /I_T nexus: (\d+)(?{ $sid = $^N })/;
      /Connection: (\d+)(?{ push @{$tgt}, [ $sid, $^N ] })/;
   }
}

my $hostname;
die unless $hostname = `hostname`;
chomp $hostname;

my $target = 'iqn.' . join('.', reverse split('\.', $hostname)) . ":$cow";

# find the target id corresponding to the provided target name and
# close any existing connections to it
my $tid = 0;
foreach (@targets) {
   next unless /^Target (\d+)(?{ $tid = $^N }): $target$/m;
   foreach (@{$targets->{$tid}}) {
      die unless system("$tgtadm --op delete --mode conn --tid $tid --sid $_->[0] --cid $_->[1]") == 0;
   }
}

# create a new target if an existing one was not found
if ($tid == 0) {
   # find an available target id
   my @ids = (0, sort keys %{$targets});
   $tid = 1; while ($ids[$tid]==$tid) { $tid++ }

   # create the target
   die unless -e "$dev";
   die unless system("$tgtadm --op new --mode target --tid $tid --targetname $target") == 0;
   die unless system("$tgtadm --op new --mode logicalunit --tid $tid --lun 1 --backing-store $dev") == 0;
   die unless system("$tgtadm --op bind --mode target --tid $tid --initiator-address ALL") == 0;
}

# (re)set the provided target's chap password
my $password = join('', map(chr(int(rand(26))+65), 1..8));
my $accounts = `$tgtadm --op show --mode account`;
if ($accounts =~ / $username$/m) {
   die unless system("$tgtadm --op delete --mode account --user $username") == 0;
}
die unless system("$tgtadm --op new --mode account --user $username --password $password") == 0;
die unless system("$tgtadm --op bind --mode account --tid $tid --user $username") == 0;

# return the new password to the iscsi target on stdout
print RETURN $password;
END
# chmod +x $MY_MOJO/scripts/mktgt
```

上面的脚本将做以下五件事情：

  1. 创建 `/<instance>.cow/<username>` 稀疏文件（如果不存在的话）。
  2. 创建 `/dev/mapper/<instance>-<username>` 设备节点作为 iSCSI 目标的写时复制支持存储（如果不存在的话）。
  3. 创建 `iqn.<reverse-hostname>:<instance>-<username>` iSCSI 目标（如果不存在的话）。或者，如果已存在了，它将关闭任何已存在的连接，因为在任何时刻，镜像只能以只读模式从一个地方打开。
  4. 它在 `iqn.<reverse-hostname>:<instance>-<username>` iSCSI 目标上（重新）设置 chap 密码为一个新的随机值。
  5. （如果前面的所有任务都成功的话）它在 [标准输出][5] 上显示新的 chap 密码。

你应该可以在命令行上通过使用有效的测试参数来运行它，以测试 `mktgt` 脚本能否正常工作。例如：

```
# echo `$MY_MOJO/scripts/mktgt fc29 jsmith`
```

当你从命令行上运行时，`mktgt` 脚本应该会输出 iSCSI 目标的一个随意的八字符随机密码（如果成功的话）或者是出错位置的行号（如果失败的话）。

有时候，你可能需要在不停止整个服务的情况下删除一个 iSCSI 目标。例如，一个用户可能无意中损坏了他的个人镜像，在那种情况下，你可能需要按步骤撤销上面的 `mktgt` 脚本所做的事情，以便于他下次登入时他将得到一个原始镜像。

下面是用于撤销的 `rmtgt` 脚本，它以相反的顺序做了上面 `mktgt` 脚本所做的事情：

```
# mkdir $HOME/bin
# cat << 'END' > $HOME/bin/rmtgt
#!/usr/bin/env perl

@ARGV >= 2 or die "usage: $0 <instance> <username> [+d|+f]\n";

my $instance = shift;
my $username = shift;

my $rmd = ($ARGV[0] eq '+d'); #remove device node if +d flag is set
my $rmf = ($ARGV[0] eq '+f'); #remove sparse file if +f flag is set
my $cow = "$instance-$username";

my $hostname;
die unless $hostname = `hostname`;
chomp $hostname;

my $tgtadm = '/usr/sbin/tgtadm';
my $target = 'iqn.' . join('.', reverse split('\.', $hostname)) . ":$cow";

my $text = `$tgtadm --op show --mode target`;
my @targets = $text =~ /(?:^T.*\n)(?:^ .*\n)*/mg;

my $targets = {};
foreach (@targets) {
   my $tgt;
   my $sid;

   foreach (split /\n/) {
      /^Target (\d+)(?{ $tgt = $targets->{$^N} = [] })/;
      /I_T nexus: (\d+)(?{ $sid = $^N })/;
      /Connection: (\d+)(?{ push @{$tgt}, [ $sid, $^N ] })/;
   }
}

my $tid = 0;
foreach (@targets) {
   next unless /^Target (\d+)(?{ $tid = $^N }): $target$/m;
   foreach (@{$targets->{$tid}}) {
      die unless system("$tgtadm --op delete --mode conn --tid $tid --sid $_->[0] --cid $_->[1]") == 0;
   }
   die unless system("$tgtadm --op delete --mode target --tid $tid") == 0;
   print "target $tid deleted\n";
   sleep 1;
}

my $dev = "/dev/mapper/$cow";
if ($rmd or ($rmf and -e $dev)) {
   die unless system("dmsetup remove $cow") == 0;
   print "device node $dev deleted\n";
}

if ($rmf) {
   my $sf = "/$instance.cow/$username";
   die "sparse file $sf not found" unless -e "$sf";
   die unless system("rm -f $sf") == 0;
   die unless not -e "$sf";
   print "sparse file $sf deleted\n";
}
END
# chmod +x $HOME/bin/rmtgt
```

例如，使用上面的脚本去完全删除 fc29-jsmith 目标，包含它的支持存储设备节点和稀疏文件，可以按下列方式运行命令：

```
# rmtgt fc29 jsmith +f
```

一旦你验证 `mktgt` 脚本工作正常，你可以重启动 bootmenu 服务。下次有人从网络引导时，他们应该能够接收到一个他们可以写入的、可”私人定制“的网络引导镜像的副本：

```
# systemctl restart bootmenu.service
```

现在，就像下面的截屏示范的那样，用户应该可以修改根文件系统了：

![][6]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-build-a-netboot-server-part-4/

作者：[Gregory Bartholomew][a]
选题：[lujun9972][b]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/glb/
[b]: https://github.com/lujun9972
[1]: http://ipxe.org/crypto
[2]: https://en.wikipedia.org/wiki/Copy-on-write
[3]: https://en.wikipedia.org/wiki/Challenge-Handshake_Authentication_Protocol
[4]: https://en.wikipedia.org/wiki/String_interpolation
[5]: https://en.wikipedia.org/wiki/Standard_streams
[6]: https://fedoramagazine.org/wp-content/uploads/2018/11/netboot-fix-pam_mount-1024x819.png
