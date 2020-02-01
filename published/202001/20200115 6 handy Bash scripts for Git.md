[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11797-1.html)
[#]: subject: (6 handy Bash scripts for Git)
[#]: via: (https://opensource.com/article/20/1/bash-scripts-git)
[#]: author: (Bob Peterson https://opensource.com/users/bobpeterson)

6 个方便的 Git 脚本
======

> 当使用 Git 存储库时，这六个 Bash 脚本将使你的生活更轻松。

![](https://img.linux.net.cn/data/attachment/album/202001/18/231713jegbk8fyek798gxb.jpg)

我编写了许多 Bash 脚本，这些脚本使我在使用 Git 存储库时工作更加轻松。我的许多同事说没有必要：我所做的一切都可以用 Git 命令完成。虽然这可能是正确的，但我发现脚本远比尝试找出适当的 Git 命令来执行我想要的操作更加方便。

### 1、gitlog

`gitlog` 打印针对 master 分支的当前补丁的简短列表。它从最旧到最新打印它们，并显示作者和描述，其中 `H` 代表 `HEAD`，`^` 代表 `HEAD^`，`2` 代表 `HEAD~2`，依此类推。例如：

```
$ gitlog
-----------------------[ recovery25 ]-----------------------
(snip)
11 340d27a33895 Bob Peterson     gfs2: drain the ail2 list after io errors
10 9b3c4e6efb10 Bob Peterson     gfs2: clean up iopen glock mess in gfs2_create_inode
 9 d2e8c22be39b Bob Peterson     gfs2: Do proper error checking for go_sync family of glops
 8 9563e31f8bfd Christoph Hellwig gfs2: use page_offset in gfs2_page_mkwrite
 7 ebac7a38036c Christoph Hellwig gfs2: don't use buffer_heads in gfs2_allocate_page_backing
 6 f703a3c27874 Andreas Gruenbacher gfs2: Improve mmap write vs. punch_hole consistency
 5 a3e86d2ef30e Andreas Gruenbacher gfs2: Multi-block allocations in gfs2_page_mkwrite
 4 da3c604755b0 Andreas Gruenbacher gfs2: Fix end-of-file handling in gfs2_page_mkwrite
 3 4525c2f5b46f Bob Peterson     Rafael Aquini's slab instrumentation
 2 a06a5b7dea02 Bob Peterson     GFS2: Add go_get_holdtime to gl_ops
 ^ 8ba93c796d5c Bob Peterson     gfs2: introduce new function remaining_hold_time and use it in dq
 H e8b5ff851bb9 Bob Peterson     gfs2: Allow rgrps to have a minimum hold time
```

如果我想查看其他分支上有哪些补丁，可以指定一个替代分支：

```
$ gitlog recovery24
```

### 2、gitlog.id

`gitlog.id` 只是打印出补丁的 SHA1 ID：

```
$ gitlog.id
-----------------------[ recovery25 ]-----------------------
56908eeb6940 2ca4a6b628a1 fc64ad5d99fe 02031a00a251 f6f38da7dd18 d8546e8f0023 fc3cc1f98f6b 12c3e0cb3523 76cce178b134 6fc1dce3ab9c 1b681ab074ca 26fed8de719b 802ff51a5670 49f67a512d8c f04f20193bbb 5f6afe809d23 2030521dc70e dada79b3be94 9b19a1e08161 78a035041d3e f03da011cae2 0d2b2e068fcd 2449976aa133 57dfb5e12ccd 53abedfdcf72 6fbdda3474b3 49544a547188 187032f7a63c 6f75dae23d93 95fc2a261b00 ebfb14ded191 f653ee9e414a 0e2911cb8111 73968b76e2e3 8a3e4cb5e92c a5f2da803b5b 7c9ef68388ed 71ca19d0cba8 340d27a33895 9b3c4e6efb10 d2e8c22be39b 9563e31f8bfd ebac7a38036c f703a3c27874 a3e86d2ef30e da3c604755b0 4525c2f5b46f a06a5b7dea02 8ba93c796d5c e8b5ff851bb9
```

同样，它假定是当前分支，但是如果需要，我可以指定其他分支。

### 3、gitlog.id2

`gitlog.id2` 与 `gitlog.id` 相同，但顶部没有显示分支的行。这对于从一个分支挑选所有补丁到当前分支很方便：

```
$ # 创建一个新分支
$ git branch --track origin/master
$ # 检出刚刚创建的新分支
$ git checkout recovery26
$ # 从旧的分支挑选所有补丁到新分支
$ for i in `gitlog.id2 recovery25` ; do git cherry-pick $i ;done
```

### 4、gitlog.grep

`gitlog.grep` 会在该补丁集合中寻找一个字符串。例如，如果我发现一个错误并想修复引用了函数 `inode_go_sync` 的补丁，我可以简单地执行以下操作：

```
$ gitlog.grep inode_go_sync
-----------------------[ recovery25 - 50 patches ]-----------------------
(snip)
11 340d27a33895 Bob Peterson     gfs2: drain the ail2 list after io errors
10 9b3c4e6efb10 Bob Peterson     gfs2: clean up iopen glock mess in gfs2_create_inode
 9 d2e8c22be39b Bob Peterson     gfs2: Do proper error checking for go_sync family of glops
152:-static void inode_go_sync(struct gfs2_glock *gl)
153:+static int inode_go_sync(struct gfs2_glock *gl)
163:@@ -296,6 +302,7 @@ static void inode_go_sync(struct gfs2_glock *gl)
 8 9563e31f8bfd Christoph Hellwig gfs2: use page_offset in gfs2_page_mkwrite
 7 ebac7a38036c Christoph Hellwig gfs2: don't use buffer_heads in gfs2_allocate_page_backing
 6 f703a3c27874 Andreas Gruenbacher gfs2: Improve mmap write vs. punch_hole consistency
 5 a3e86d2ef30e Andreas Gruenbacher gfs2: Multi-block allocations in gfs2_page_mkwrite
 4 da3c604755b0 Andreas Gruenbacher gfs2: Fix end-of-file handling in gfs2_page_mkwrite
 3 4525c2f5b46f Bob Peterson     Rafael Aquini's slab instrumentation
 2 a06a5b7dea02 Bob Peterson     GFS2: Add go_get_holdtime to gl_ops
 ^ 8ba93c796d5c Bob Peterson     gfs2: introduce new function remaining_hold_time and use it in dq
 H e8b5ff851bb9 Bob Peterson     gfs2: Allow rgrps to have a minimum hold time
```

因此，现在我知道补丁 `HEAD~9` 是需要修复的补丁。我使用 `git rebase -i HEAD~10` 编辑补丁 9，`git commit -a --amend`，然后 `git rebase --continue` 以进行必要的调整。

### 5、gitbranchcmp3

`gitbranchcmp3` 使我可以将当前分支与另一个分支进行比较，因此我可以将较旧版本的补丁与我的较新版本进行比较，并快速查看已更改和未更改的内容。它生成一个比较脚本（使用了 KDE 工具 [Kompare][2]，该工具也可在 GNOME3 上使用）以比较不太相同的补丁。如果除行号外没有其他差异，则打印 `[SAME]`。如果仅存在注释差异，则打印 `[same]`（小写）。例如：

```
$ gitbranchcmp3 recovery24
Branch recovery24 has 47 patches
Branch recovery25 has 50 patches

(snip)
38 87eb6901607a 340d27a33895 [same] gfs2: drain the ail2 list after io errors
39 90fefb577a26 9b3c4e6efb10 [same] gfs2: clean up iopen glock mess in gfs2_create_inode
40 ba3ae06b8b0e d2e8c22be39b [same] gfs2: Do proper error checking for go_sync family of glops
41 2ab662294329 9563e31f8bfd [SAME] gfs2: use page_offset in gfs2_page_mkwrite
42 0adc6d817b7a ebac7a38036c [SAME] gfs2: don't use buffer_heads in gfs2_allocate_page_backing
43 55ef1f8d0be8 f703a3c27874 [SAME] gfs2: Improve mmap write vs. punch_hole consistency
44 de57c2f72570 a3e86d2ef30e [SAME] gfs2: Multi-block allocations in gfs2_page_mkwrite
45 7c5305fbd68a da3c604755b0 [SAME] gfs2: Fix end-of-file handling in gfs2_page_mkwrite
46 162524005151 4525c2f5b46f [SAME] Rafael Aquini's slab instrumentation
47              a06a5b7dea02 [    ] GFS2: Add go_get_holdtime to gl_ops
48              8ba93c796d5c [    ] gfs2: introduce new function remaining_hold_time and use it in dq
49              e8b5ff851bb9 [    ] gfs2: Allow rgrps to have a minimum hold time

Missing from recovery25:
The missing:
Compare script generated at: /tmp/compare_mismatches.sh
```

### 6、gitlog.find

最后，我有一个 `gitlog.find` 脚本，可以帮助我识别补丁程序的上游版本在哪里以及每个补丁的当前状态。它通过匹配补丁说明来实现。它还会生成一个比较脚本（再次使用了 Kompare），以将当前补丁与上游对应补丁进行比较：

```
$ gitlog.find
-----------------------[ recovery25 - 50 patches ]-----------------------
(snip)
11 340d27a33895 Bob Peterson     gfs2: drain the ail2 list after io errors
lo 5bcb9be74b2a Bob Peterson     gfs2: drain the ail2 list after io errors
10 9b3c4e6efb10 Bob Peterson     gfs2: clean up iopen glock mess in gfs2_create_inode
fn 2c47c1be51fb Bob Peterson     gfs2: clean up iopen glock mess in gfs2_create_inode
 9 d2e8c22be39b Bob Peterson     gfs2: Do proper error checking for go_sync family of glops
lo feb7ea639472 Bob Peterson     gfs2: Do proper error checking for go_sync family of glops
 8 9563e31f8bfd Christoph Hellwig gfs2: use page_offset in gfs2_page_mkwrite
ms f3915f83e84c Christoph Hellwig gfs2: use page_offset in gfs2_page_mkwrite
 7 ebac7a38036c Christoph Hellwig gfs2: don't use buffer_heads in gfs2_allocate_page_backing
ms 35af80aef99b Christoph Hellwig gfs2: don't use buffer_heads in gfs2_allocate_page_backing
 6 f703a3c27874 Andreas Gruenbacher gfs2: Improve mmap write vs. punch_hole consistency
fn 39c3a948ecf6 Andreas Gruenbacher gfs2: Improve mmap write vs. punch_hole consistency
 5 a3e86d2ef30e Andreas Gruenbacher gfs2: Multi-block allocations in gfs2_page_mkwrite
fn f53056c43063 Andreas Gruenbacher gfs2: Multi-block allocations in gfs2_page_mkwrite
 4 da3c604755b0 Andreas Gruenbacher gfs2: Fix end-of-file handling in gfs2_page_mkwrite
fn 184b4e60853d Andreas Gruenbacher gfs2: Fix end-of-file handling in gfs2_page_mkwrite
 3 4525c2f5b46f Bob Peterson     Rafael Aquini's slab instrumentation
   Not found upstream
 2 a06a5b7dea02 Bob Peterson     GFS2: Add go_get_holdtime to gl_ops
   Not found upstream
 ^ 8ba93c796d5c Bob Peterson     gfs2: introduce new function remaining_hold_time and use it in dq
   Not found upstream
 H e8b5ff851bb9 Bob Peterson     gfs2: Allow rgrps to have a minimum hold time
   Not found upstream
Compare script generated: /tmp/compare_upstream.sh
```

补丁显示为两行，第一行是你当前的修补程序，然后是相应的上游补丁，以及 2 个字符的缩写，以指示其上游状态：

* `lo` 表示补丁仅在本地（`local`）上游 Git 存储库中（即尚未推送到上游）。
* `ms` 表示补丁位于 Linus Torvald 的主（`master`）分支中。
* `fn` 意味着补丁被推送到我的 “for-next” 开发分支，用于下一个上游合并窗口。
   
我的一些脚本根据我通常使用 Git 的方式做出假设。例如，当搜索上游补丁时，它使用我众所周知的 Git 树的位置。因此，你需要调整或改进它们以适合你的条件。`gitlog.find` 脚本旨在仅定位 [GFS2][3] 和 [DLM][4] 补丁，因此，除非你是 GFS2 开发人员，否则你需要针对你感兴趣的组件对其进行自定义。

### 源代码

以下是这些脚本的源代码。

#### 1、gitlog

```
#!/bin/bash
branch=$1

if test "x$branch" = x; then
    branch=`git branch -a | grep "*" | cut -d ' ' -f2`
fi

patches=0
tracking=`git rev-parse --abbrev-ref --symbolic-full-name @{u}`

LIST=`git log --reverse --abbrev-commit --pretty=oneline $tracking..$branch | cut -d ' ' -f1 |paste -s -d ' '`
for i in $LIST; do patches=$(echo $patches + 1 | bc);done

if [[ $branch =~ .*for-next.* ]]
then
    start=HEAD
#    start=origin/for-next
else
    start=origin/master
fi

tracking=`git rev-parse --abbrev-ref --symbolic-full-name @{u}`

/usr/bin/echo "-----------------------[" $branch "]-----------------------"
patches=$(echo $patches - 1 | bc);
for i in $LIST; do
    if [ $patches -eq 1 ]; then
        cnt=" ^"
    elif [ $patches -eq 0 ]; then
        cnt=" H"
    else
        if [ $patches -lt 10 ]; then
            cnt=" $patches"
        else
            cnt="$patches"
        fi
    fi
    /usr/bin/git show --abbrev-commit -s --pretty=format:"$cnt %h %<|(32)%an %s %n" $i
    patches=$(echo $patches - 1 | bc)
done
#git log --reverse --abbrev-commit --pretty=format:"%h %<|(32)%an %s" $tracking..$branch
#git log --reverse --abbrev-commit --pretty=format:"%h %<|(32)%an %s" ^origin/master ^linux-gfs2/for-next $branch
```

#### 2、gitlog.id

```
#!/bin/bash
branch=$1

if test "x$branch" = x; then
    branch=`git branch -a | grep "*" | cut -d ' ' -f2`
fi

tracking=`git rev-parse --abbrev-ref --symbolic-full-name @{u}`

/usr/bin/echo "-----------------------[" $branch "]-----------------------"
git log --reverse --abbrev-commit --pretty=oneline $tracking..$branch | cut -d ' ' -f1 |paste -s -d ' '
```

#### 3、gitlog.id2

```
#!/bin/bash
branch=$1

if test "x$branch" = x; then
    branch=`git branch -a | grep "*" | cut -d ' ' -f2`
fi

tracking=`git rev-parse --abbrev-ref --symbolic-full-name @{u}`
git log --reverse --abbrev-commit --pretty=oneline $tracking..$branch | cut -d ' ' -f1 |paste -s -d ' '
```

#### 4、gitlog.grep

```
#!/bin/bash
param1=$1
param2=$2

if test "x$param2" = x; then
    branch=`git branch -a | grep "*" | cut -d ' ' -f2`
    string=$param1
else
    branch=$param1
    string=$param2
fi

patches=0
tracking=`git rev-parse --abbrev-ref --symbolic-full-name @{u}`

LIST=`git log --reverse --abbrev-commit --pretty=oneline $tracking..$branch | cut -d ' ' -f1 |paste -s -d ' '`
for i in $LIST; do patches=$(echo $patches + 1 | bc);done
/usr/bin/echo "-----------------------[" $branch "-" $patches "patches ]-----------------------"
patches=$(echo $patches - 1 | bc);
for i in $LIST; do
    if [ $patches -eq 1 ]; then
        cnt=" ^"
    elif [ $patches -eq 0 ]; then
        cnt=" H"
    else
        if [ $patches -lt 10 ]; then
            cnt=" $patches"
        else
            cnt="$patches"
        fi
    fi
    /usr/bin/git show --abbrev-commit -s --pretty=format:"$cnt %h %<|(32)%an %s" $i
    /usr/bin/git show --pretty=email --patch-with-stat $i | grep -n "$string"
    patches=$(echo $patches - 1 | bc)
done
```

#### 5、gitbranchcmp3

```
#!/bin/bash
#
# gitbranchcmp3 <old branch> [<new_branch>]
#
oldbranch=$1
newbranch=$2
script=/tmp/compare_mismatches.sh

/usr/bin/rm -f $script
echo "#!/bin/bash" > $script
/usr/bin/chmod 755 $script
echo "# Generated by gitbranchcmp3.sh" >> $script
echo "# Run this script to compare the mismatched patches" >> $script
echo " " >> $script
echo "function compare_them()" >> $script
echo "{"  >> $script
echo "    git show --pretty=email --patch-with-stat \$1 > /tmp/gronk1" >> $script
echo "    git show --pretty=email --patch-with-stat \$2 > /tmp/gronk2" >> $script
echo "    kompare /tmp/gronk1 /tmp/gronk2" >> $script
echo "}" >> $script
echo " " >> $script

if test "x$newbranch" = x; then
    newbranch=`git branch -a | grep "*" | cut -d ' ' -f2`
fi

tracking=`git rev-parse --abbrev-ref --symbolic-full-name @{u}`

declare -a oldsha1s=(`git log --reverse --abbrev-commit --pretty=oneline $tracking..$oldbranch | cut -d ' ' -f1 |paste -s -d ' '`)
declare -a newsha1s=(`git log --reverse --abbrev-commit --pretty=oneline $tracking..$newbranch | cut -d ' ' -f1 |paste -s -d ' '`)

#echo "old: " $oldsha1s
oldcount=${#oldsha1s[@]}
echo "Branch $oldbranch has $oldcount patches"
oldcount=$(echo $oldcount - 1 | bc)
#for o in `seq 0 ${#oldsha1s[@]}`; do
#    echo -n ${oldsha1s[$o]} " "
#    desc=`git show $i | head -5 | tail -1|cut -b5-`
#done

#echo "new: " $newsha1s
newcount=${#newsha1s[@]}
echo "Branch $newbranch has $newcount patches"
newcount=$(echo $newcount - 1 | bc)
#for o in `seq 0 ${#newsha1s[@]}`; do
#    echo -n ${newsha1s[$o]} " "
#    desc=`git show $i | head -5 | tail -1|cut -b5-`
#done
echo

for new in `seq 0 $newcount`; do
    newsha=${newsha1s[$new]}
    newdesc=`git show $newsha | head -5 | tail -1|cut -b5-`
    oldsha="            "
    same="[    ]"
    for old in `seq 0 $oldcount`; do
        if test "${oldsha1s[$old]}" = "match"; then
            continue;
        fi
        olddesc=`git show ${oldsha1s[$old]} | head -5 | tail -1|cut -b5-`
        if test "$olddesc" = "$newdesc" ; then
            oldsha=${oldsha1s[$old]}
            #echo $oldsha
            git show $oldsha |tail -n +2 |grep -v "index.*\.\." |grep -v "@@" > /tmp/gronk1
            git show $newsha |tail -n +2 |grep -v "index.*\.\." |grep -v "@@"  > /tmp/gronk2
            diff /tmp/gronk1 /tmp/gronk2 &> /dev/null
            if [ $? -eq 0 ] ;then
# No differences
                same="[SAME]"
                oldsha1s[$old]="match"
                break
            fi
            git show $oldsha |sed -n '/diff/,$p' |grep -v "index.*\.\." |grep -v "@@" > /tmp/gronk1
            git show $newsha |sed -n '/diff/,$p' |grep -v "index.*\.\." |grep -v "@@" > /tmp/gronk2
            diff /tmp/gronk1 /tmp/gronk2 &> /dev/null
            if [ $? -eq 0 ] ;then
# Differences in comments only
                same="[same]"
                oldsha1s[$old]="match"
                break
            fi
            oldsha1s[$old]="match"
            echo "compare_them $oldsha $newsha" >> $script
        fi
    done
    echo "$new $oldsha $newsha $same $newdesc"
done

echo
echo "Missing from $newbranch:"
the_missing=""
# Now run through the olds we haven't matched up
for old in `seq 0 $oldcount`; do
    if test ${oldsha1s[$old]} != "match"; then
        olddesc=`git show ${oldsha1s[$old]} | head -5 | tail -1|cut -b5-`
        echo "${oldsha1s[$old]} $olddesc"
        the_missing=`echo "$the_missing ${oldsha1s[$old]}"`
    fi
done

echo "The missing: " $the_missing
echo "Compare script generated at: $script"
#git log --reverse --abbrev-commit --pretty=oneline $tracking..$branch | cut -d ' ' -f1 |paste -s -d ' '
```

#### 6、gitlog.find

```
#!/bin/bash
#
# Find the upstream equivalent patch
#
# gitlog.find
#
cwd=$PWD
param1=$1
ubranch=$2
patches=0
script=/tmp/compare_upstream.sh
echo "#!/bin/bash" > $script
/usr/bin/chmod 755 $script
echo "# Generated by gitbranchcmp3.sh" >> $script
echo "# Run this script to compare the mismatched patches" >> $script
echo " " >> $script
echo "function compare_them()" >> $script
echo "{"  >> $script
echo "    cwd=$PWD" >> $script
echo "    git show --pretty=email --patch-with-stat \$2 > /tmp/gronk2" >> $script
echo "    cd ~/linux.git/fs/gfs2" >> $script
echo "    git show --pretty=email --patch-with-stat \$1 > /tmp/gronk1" >> $script
echo "    cd $cwd" >> $script
echo "    kompare /tmp/gronk1 /tmp/gronk2" >> $script
echo "}" >> $script
echo " " >> $script

#echo "Gathering upstream patch info. Please wait."
branch=`git branch -a | grep "*" | cut -d ' ' -f2`
tracking=`git rev-parse --abbrev-ref --symbolic-full-name @{u}`

cd ~/linux.git
if test "X${ubranch}" = "X"; then
    ubranch=`git branch -a | grep "*" | cut -d ' ' -f2`
fi
utracking=`git rev-parse --abbrev-ref --symbolic-full-name @{u}`
#
# gather a list of gfs2 patches from master just in case we can't find it
#
#git log --abbrev-commit --pretty=format:"   %h %<|(32)%an %s" master |grep -i -e "gfs2" -e "dlm" > /tmp/gronk
git log --reverse --abbrev-commit --pretty=format:"ms %h %<|(32)%an %s" master fs/gfs2/ > /tmp/gronk.gfs2
# ms = in Linus's master
git log --reverse --abbrev-commit --pretty=format:"ms %h %<|(32)%an %s" master fs/dlm/ > /tmp/gronk.dlm

cd $cwd
LIST=`git log --reverse --abbrev-commit --pretty=oneline $tracking..$branch | cut -d ' ' -f1 |paste -s -d ' '`
for i in $LIST; do patches=$(echo $patches + 1 | bc);done
/usr/bin/echo "-----------------------[" $branch "-" $patches "patches ]-----------------------"
patches=$(echo $patches - 1 | bc);
for i in $LIST; do
    if [ $patches -eq 1 ]; then
        cnt=" ^"
    elif [ $patches -eq 0 ]; then
        cnt=" H"
    else
        if [ $patches -lt 10 ]; then
            cnt=" $patches"
        else
            cnt="$patches"
        fi
    fi
    /usr/bin/git show --abbrev-commit -s --pretty=format:"$cnt %h %<|(32)%an %s" $i
    desc=`/usr/bin/git show --abbrev-commit -s --pretty=format:"%s" $i`
    cd ~/linux.git
    cmp=1
    up_eq=`git log --reverse --abbrev-commit --pretty=format:"lo %h %<|(32)%an %s" $utracking..$ubranch | grep "$desc"`
# lo = in local for-next
    if test "X$up_eq" = "X"; then
        up_eq=`git log --reverse --abbrev-commit --pretty=format:"fn %h %<|(32)%an %s" master..$utracking | grep "$desc"`
# fn = in for-next for next merge window
        if test "X$up_eq" = "X"; then
            up_eq=`grep "$desc" /tmp/gronk.gfs2`
            if test "X$up_eq" = "X"; then
                up_eq=`grep "$desc" /tmp/gronk.dlm`
                if test "X$up_eq" = "X"; then
                    up_eq="   Not found upstream"
                    cmp=0
                fi
            fi
        fi
    fi
    echo "$up_eq"
    if [ $cmp -eq 1 ] ; then
        UP_SHA1=`echo $up_eq|cut -d' ' -f2`
        echo "compare_them $UP_SHA1 $i" >> $script
    fi
    cd $cwd
    patches=$(echo $patches - 1 | bc)
done
echo "Compare script generated: $script"
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/bash-scripts-git

作者：[Bob Peterson][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bobpeterson
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003588_01_rd3os.combacktoschoolseriesk12_rh_021x_0.png?itok=fvorN0e- (Digital hand surrounding by objects, bike, light bulb, graphs)
[2]: https://kde.org/applications/development/org.kde.kompare
[3]: https://en.wikipedia.org/wiki/GFS2
[4]: https://en.wikipedia.org/wiki/Distributed_lock_manager
