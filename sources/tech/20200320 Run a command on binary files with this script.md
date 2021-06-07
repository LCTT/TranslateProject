[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Run a command on binary files with this script)
[#]: via: (https://opensource.com/article/20/3/run-binaries-script)
[#]: author: (Nick Clifton https://opensource.com/users/nickclifton)

Run a command on binary files with this script
======
Try this simple script to easily run a command on binary files
regardless of their packaging.
![Binary code on a computer screen][1]

Examining files from the command-line is generally an easy thing to do. You just run the command you want, followed by a list of files to be examined. Dealing with binary files, however, is more complicated. These files are often packaged up into archives, tarballs, or other packaging formats. The run-on-binaries script provides a convenient way to run a command on a collection of files, regardless of how they are packaged.

The invocation of the script is quite simple:


```
`run-on-binaries <file(s}>`
```

So, for example:


```
`run-on-binaries /usr/bin/ls foo.rpm`
```

will list all of the files inside the **foo.rpm** file, while:


```
`run-on-binaries /usr/bin/readelf -a libc.a`
```

will run the **readelf** program, with the **-a** command-line option, on all of the object files inside the **libc.a library**.

If necessary, the script can be passed a file containing a list of other files to be processed, rather than specifying them on the command line—like this:


```
`run-on-binaries --files-from=foo.lst /usr/bin/ps2ascii`
```

This will run the **ps2ascii** script on all of the files listed in **foo.lst**. (The files just need to be separated by white space. There can be multiple files on a single line if desired).

Also, a skip list can be provided to stop the script from processing specified files:


```
`run-on-binaries --skip-list=skip.lst /usr/bin/wc *`
```

This will run the **wc** program on all of the files in the current directory, except for those specified in **skip.lst**.

The script does not recurse into directories, but this can be handled by combining it with the **find** command, like this:


```
`find . -type f -exec run-on-binaries @ ;`
```

or


```
`find . -type d -exec run-on-binaries @/* ;`
```

The only difference between these two invocations is that the second one only runs the target program once per directory, but gives it a long command-line of all of the files in the directory.

Though convenient, the script is lacking in several areas. Right now, it does not examine the PATH environment variable to find the command that it is asked to run, so a full path must be provided. Also, the script ought to be able to handle recursion on its own, without needing help from the find command.

The run-on-binaries script is part of the annobin package, which is available on Fedora. The sources for annobin can also be obtained from the git repository at <git://sourceware.org/git/annobin.git>.

### The script


```
#!/bin/bash

# Script to run another script/program on the executables inside a given file.
#
# Created by Nick Clifton.  &lt;[nickc@redhat.com][2]&gt;
# Copyright (c) 2018 Red Hat.
#
# This is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published
# by the Free Software Foundation; either version 3, or (at your
# option) any later version.

# It is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# Usage:
#   run-on-binaries-in [options] program [options-for-the-program] file(s)
#
# This script does not handle directories.  This is deliberate.
# It is intended that if recursion is needed then it will be
# invoked from find, like this:
#
#   find . -name "*.rpm" -exec run-on-binaries-in &lt;script-to-run&gt; {} \;

version=1.0

help ()
{
  # The following exec goop is so that we don't have to manually
  # redirect every message to stderr in this function.
  exec 4&gt;&amp;1    # save stdout fd to fd #4
  exec 1&gt;&amp;2    # redirect stdout to stderr

  cat &lt;&lt;__EOM__

This is a shell script to run another script/program on one or more binary
files.  If the file(s) specified are archives of some kind (including rpms)
then the script/program is run on the binary executables inside the archive.

Usage: $prog {options} program {options-for-the-program} files(s)

  {options} are:
  -h         --help               Display this information and then exit.
  -v         --version            Report the version number of this script.
  -V         --verbose            Report on progress.
  -q         --quiet              Do not include the script name in the output.
  -i         --ignore             Silently ignore files that are not executables or archives.
  -p=&lt;TEXT&gt;  --prefix=&lt;TEXT&gt;      Prefix normal output with this string.
  -t=&lt;DIR&gt;   --tmpdir=&lt;DIR&gt;       Temporary directory to use when opening archives.
  -f=&lt;FILE&gt;  --files-from=&lt;FILE&gt;  Process files listed in &lt;FILE&gt;.
  -s=&lt;FILE&gt;  --skip-list=&lt;FILE&gt;   Skip any file listed in &lt;FILE&gt;.
  --                              Stop accumulating options.

Examples:

  $prog hardened foo.rpm
                              Runs the hardened script on the executable
                              files inside foo.rpm.

  $prog check-abi -v fred.tar.xz
                              Runs the check-abi script on the decompressed
                              contents of the fred.tar.xz archive, passing the
                              -v option to check-abi as it does so.      

  $prog -V -f=list.txt readelf -a
                              Runs the readelf program, with the -a option on
                              every file listed in the list.txt.  Describes
                              what is being done as it works.

  $prog -v -- -fred -a jim -b bert -- -c harry
                              Runs the script "-fred" on the files jim, bert,
                              "-c" and harry.  Passes the options "-a" and
                              "-b" to the script (even when run on jim).
                              Reports the version of this script as well.

__EOM__
  exec 1&gt;&amp;4   # Copy stdout fd back from temporary save fd, #4
}

main ()
{
    init
   
    parse_args ${1+"$@"}

    if [ $failed -eq 0 ];
    then
        run_script_on_files
    fi

    if [ $failed -ne 0 ];
    then
        exit 1
    else
        exit 0
    fi
}

report ()
{
    if [ $quiet -eq 0 ];
    then
        echo -n $prog": "
    fi
   
    echo ${1+"$@"}
}

ice ()
{
    report "Internal error: " ${1+"$@"}
    exit 1
}

fail ()
{
    report "Failure:" ${1+"$@"}
    failed=1
}

verbose ()
{
    if [ $verbose -ne 0 ]
    then
        report ${1+"$@"}
    fi
}

# Initialise global variables.
init ()
{
    files[0]="";  
    # num_files is the number of files to be scanned.
    # files[0] is the script to run on the files.
    num_files=0;

    script=""
    script_opts="";

    prog_opts="-i"

    tmpdir=/dev/shm
    prefix=""    
    files_from=""
    skip_list=""

    failed=0
    verbose=0
    ignore=0
    quiet=0
}

# Parse our command line
parse_args ()
{
    abs_prog=$0;
    prog=`basename $abs_prog`;

    # Locate any additional command line switches
    # Likewise accumulate non-switches to the files list.
    while [ $# -gt 0 ]
    do
        optname="`echo $1 | sed 's,=.*,,'`"
        optarg="`echo $1 | sed 's,^[^=]*=,,'`"
        case "$optname" in
            -v | --version)
                report "version: $version"
                ;;
            -h | --help)
                help
                exit 0
                ;;
            -q | --quiet)
                quiet=1;
                prog_opts="$prog_opts -q"
                ;;
            -V | --verbose)
                if [ $verbose -eq 1 ];
                then
                    # This has the effect of cancelling out the prog_opts="-i"
                    # in the init function, so that recursive invocations of this
                    # script will complain about unrecognised file types.
                    if [ $quiet -eq 0 ];
                    then
                        prog_opts="-V -V"
                    else
                        prog_opts="-V -V -q"
                    fi
                else
                    verbose=1;
                    prog_opts="$prog_opts -V"
                fi
                ;;
            -i | --ignore)
                ignore=1
                ;;
            -t | --tmpdir)
                if test "x$optarg" = "x$optname" ;
                then
                    shift
                    if [ $# -eq 0 ]
                    then
                        fail "$optname needs a directory name"
                    else
                        tmpdir=$1
                    fi
                else
                    tmpdir="$optarg"
                fi
                ;;
            -p | --prefix)
                if test "x$optarg" = "x$optname" ;
                then
                    shift
                    if [ $# -eq 0 ]
                    then
                        fail "$optname needs a string argument"
                    else
                        prefix=$1
                    fi
                else
                    prefix="$optarg"
                fi
                ;;
            -f | --files_from)
                if test "x$optarg" = "x$optname" ;
                then
                    shift
                    if [ $# -eq 0 ]
                    then
                        fail "$optname needs a file name"
                    else
                        files_from=$1
                    fi
                else
                    files_from="$optarg"
                fi
                ;;
           
            -s | --skip-list)
                if test "x$optarg" = "x$optname" ;
                then
                    shift
                    if [ $# -eq 0 ]
                    then
                        fail "$optname needs a file name"
                    else
                        skip_list=$1
                    fi
                else
                    skip_list="$optarg"
                fi
                ;;
           
            --)
                shift
                break;
                ;;
            --*)
                fail "unrecognised option: $1"
                help
                ;;
            *)
                script="$1";
                if ! [ -a "$script" ]
                then
                    fail "$script: program/script not found"
                elif  ! [ -x "$script" ]
                then
                    fail "$script: program/script not executable"
                fi
                # After we have seen the first non-option we stop
                # accumulating options for this script and instead
                # start accumulating options for the script to be
                # run.
                shift
                break;
                ;;
        esac
        shift
    done

    # Read in the contents of the --file-from list, if specified.
    if test "x$files_from" != "x" ;
    then
        if ! [ -a "$files_from" ]
        then
            fail "$files_from: file not found"
        elif ! [ -r "$files_from" ]
        then
            fail "$files_from: file not readable"
        else
            eval 'files=($(cat $files_from))'
            num_files=${#files[*]}
        fi
    fi
    skip_files[foo]=bar

    # Check that the skip list exists, if specified.
    if test "x$skip_list" != "x" ;
    then
        if ! [ -a "$skip_list" ]
        then
            fail "$skip_list: file not found"
        elif ! [ -r "$skip_list" ]
        then
            fail "$files_from: file not readable"
        fi
    fi

    # Accumulate any remaining arguments separating out the arguments
    # for the script from the names of the files to scan.
    while [ $# -gt 0 ]
    do
        optname="`echo $1 | sed 's,=.*,,'`"
        optarg="`echo $1 | sed 's,^[^=]*=,,'`"
        case "$optname" in
            --)
                shift
                break;
                ;;
            -*)
                script_opts="$script_opts $1"
                ;;
            *)
                files[$num_files]="$1";
                let "num_files++"
                ;;
        esac
        shift
    done

    # Accumulate any remaining arguments without processing them.
    while [ $# -gt 0 ]
    do
        files[$num_files]="$1";
        let "num_files++";
        shift
    done

    if [ $num_files -gt 0 ];
    then
        # Remember that we are counting from zero not one.
        let "num_files--"
    else
        fail "Must specify a program/script and at least one file to scan."
    fi
}

run_script_on_files ()
{
    local i

    i=0;
    while [ $i -le $num_files ]
    do
        run_on_file i
        let "i++"
    done
}

# syntax: run &lt;command&gt; [&lt;args&gt;]
#  If being verbose report the command being run, and
#   the directory in which it is run.
run ()
{
  local where

  if test "x$1" = "x" ;
  then
    fail "run() called without an argument."
  fi

  verbose "  Running: ${1+$@}"

  ${1+$@}
}

decompress ()
{
    local abs_file decompressor decomp_args orig_file base_file

    # Paranoia checks - the user should never encounter these.
    if test "x$4" = "x" ;
    then
        ice "decompress called with too few arguments"
    fi
    if test "x$5" != "x" ;
    then
        ice "decompress called with too many arguments"
    fi

    abs_file=$1
    decompressor=$2
    decomp_args=$3
    orig_file=$4

    base_file=`basename $abs_file`

    run cp $abs_file $base_file
    run $decompressor $decomp_args $base_file
    if [ $? != 0 ];
    then
        fail "$orig_file: Unable to decompress"
    fi

    rm -f $base_file
}

run_on_file ()
{
    local file

    # Paranoia checks - the user should never encounter these.
    if test "x$1" = "x" ;
    then
        ice "scan_file called without an argument"
    fi
    if test "x$2" != "x" ;
    then
        ice "scan_file called with too many arguments"
    fi

    # Use quotes when accessing files in order to preserve
    # any spaces that might be in the directory name.
    file="${files[$1]}";

    # Catch names that start with a dash - they might confuse readelf
    if test "x${file:0:1}" = "x-" ;
    then
        file="./$file"
    fi

    # See if we should skip this file.
    if test "x$skip_list" != "x" ;
    then
        # This regexp looks for $file being the first text on a line, either
        # on its own, or with additional text separated from it by at least
        # one space character.  So searching for "fred" in the following gives:
        #  fr         &lt;\- no match
        #  fred       &lt;\- match
        #  fredjim    &lt;\- no match
        #  fred bert  &lt;\- match
        regexp="^$file[^[:graph:]]*"
        grep --silent --regexp="$regexp" $skip_list
        if [ $? = 0 ];
        then
            verbose "$file: skipping"
            return
        fi
    fi

    # Check the file.
    if ! [ -a "$file" ]
    then
        fail "$file: file not found"
        return
    elif ! [ -r "$file" ]
    then
        if [ $ignore -eq 0 ];
        then
            fail "$file: not readable"
        fi
        return
    elif [ -d "$file" ]
    then
        if [ $ignore -eq 0 ];
        then
            if [ $num_files -gt 1 ];
            then
                verbose "$file: skipping - it is a directory"
            else
                report "$file: skipping - it is a directory"
            fi
        fi
        return
    elif ! [ -f "$file" ]
    then
        if [ $ignore -eq 0 ];
        then
            fail "$file: not an ordinary file"
        fi
        return
    fi

    file_type=`file -b $file`
    case "$file_type" in
        *"ELF "*)
            verbose "$file: ELF format - running script/program"
            if test "x$prefix" != "x" ;
            then
                report "$prefix:"
            fi
            run $script $script_opts $file
            return
            ;;
        "RPM "*)
            verbose "$file: RPM format."
            ;;
        *" cpio "*)
            verbose "$file: CPIO format."
            ;;
        *"tar "*)
            verbose "$file: TAR archive."
            ;;
        *"Zip archive"*)
            verbose "$file: ZIP archive."
            ;;
        *"ar archive"*)
            verbose "$file: AR archive."
            ;;
        *"bzip2 compressed data"*)
            verbose "$file: contains bzip2 compressed data"
            ;;
        *"gzip compressed data"*)
            verbose "$file: contains gzip compressed data"
            ;;
        *"lzip compressed data"*)
            verbose "$file: contains lzip compressed data"
            ;;
        *"XZ compressed data"*)
            verbose "$file: contains xz compressed data"
            ;;
        *"shell script"* | *"ASCII text"*)
            if [ $ignore -eq 0 ];
            then
                fail "$file: test/scripts cannot be scanned."
            fi
            return
            ;;
        *"symbolic link"*)
            if [ $ignore -eq 0 ];
            then
                # FIXME: We ought to be able to follow symbolic links
                fail "$file: symbolic links are not followed."
            fi
            return
            ;;
        *)
            if [ $ignore -eq 0 ];
            then
                fail "$file: Unsupported file type: $file_type"
            fi
            return
            ;;
    esac
   
    # We now know that we will need a temporary directory
    # so create one, and create paths to the file and scripts.
    if test "x${file:0:1}" = "x/" ;
    then
        abs_file=$file
    else
        abs_file="$PWD/$file"
    fi
   
    if test "x${abs_prog:0:1}" != "x/" ;
    then
        abs_prog="$PWD/$abs_prog"
    fi

    if test "x${script:0:1}" = "x/" ;
    then
        abs_script=$script
    else
        abs_script="$PWD/$script"
    fi
   
    tmp_root=$tmpdir/delme.run.on.binary
    run mkdir -p "$tmp_root/$file"

    verbose "  Changing to directory: $tmp_root/$file"
    pushd "$tmp_root/$file" &gt; /dev/null
    if [ $? != 0 ];
    then
        fail "Unable to change to temporary directory: $tmp_root/$file"
        return
    fi
                         
    # Run the file type switch again, although this time we do not need to
    # check for unrecognised types.  (But we do, just in case...)
    # Note since are transforming the file we re-invoke the run-on-binaries
    # script on the decoded contents.  This allows for archives that contain
    # other archives, and so on.  We normally pass the -i option to the
    # invoked script so that it will not complain about unrecognised files in
    # the decoded archive, although we do not do this when running in very
    # verbose mode.  We also pass an extended -t option to ensure that any
    # sub-archives are extracted into a unique directory tree.

    case "$file_type" in
        "RPM "*)
            # The output redirect confuses the run function...
            verbose "  Running: rpm2cpio $abs_file &gt; delme.cpio"
            rpm2cpio $abs_file &gt; delme.cpio
            if [ $? != 0 ];
            then
                fail "$file: Unable to extract from rpm archive"
            else
                # Save time - run cpio now.
                run cpio --quiet --extract --make-directories --file delme.cpio
                if [ $? != 0 ];
                then
                    fail "$file: Unable to extract files from cpio archive"
                fi
                run rm -f delme.cpio
            fi
            ;;

        *" cpio "*)
            run cpio --quiet --extract --make-directories --file=$abs_file
            if [ $? != 0 ];
            then
                fail "$file: Unable to extract files from cpio archive"
            fi
            ;;

        *"tar "*)
            run tar --extract --file=$abs_file
            if [ $? != 0 ];
            then
                fail "$file: Unable to extract files from tarball"
            fi
            ;;

        *"ar archive"*)
            run ar x $abs_file
            if [ $? != 0 ];
            then
                fail "$file: Unable to extract files from ar archive"
            fi
            ;;

        *"Zip archive"*)
            decompress $abs_file unzip "-q" $file
            ;;
        *"bzip2 compressed data"*)
            decompress $abs_file bzip2 "--quiet --decompress" $file
            ;;
        *"gzip compressed data"*)
            decompress $abs_file gzip "--quiet --decompress" $file
            ;;
        *"lzip compressed data"*)
            decompress $abs_file lzip "--quiet --decompress" $file
            ;;
        *"XZ compressed data"*)
            decompress $abs_file xz "--quiet --decompress" $file
            ;;
        *)
            ice "unhandled file type: $file_type"
            ;;
     esac

    if [ $failed -eq 0 ];
    then
        # Now scan the file(s) created in the previous step.
        run find . -type f -execdir $abs_prog $prog_opts -t=$tmp_root/$file -p=$file $abs_script $script_opts {} +
    fi

    verbose "  Deleting temporary directory: $tmp_root"
    rm -fr $tmp_root

    verbose "  Return to previous directory"
    popd &gt; /dev/null
}

# Invoke main
main ${1+"$@"}
```

 

Git has extensions for handling binary blobs such as multimedia files, so today we will learn how...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/run-binaries-script

作者：[Nick Clifton][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nickclifton
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/binary_code_computer_screen.png?itok=7IzHK1nn (Binary code on a computer screen)
[2]: mailto:nickc@redhat.com
