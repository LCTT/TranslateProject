[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Try this Bash script for large filesystems)
[#]: via: (https://opensource.com/article/20/2/script-large-files)
[#]: author: (Nick Clifton https://opensource.com/users/nickclifton)

Try this Bash script for large filesystems
======
A simple script to list files, directories, executables, and links.
![bash logo on green background][1]

Have you ever wanted to list all the files in a directory, but just the files, nothing else? How about just the directories? If you have, then the following script, which is open source under GPLv3, could be what you have been looking for.

Of course, you could use the **find** command:


```
`find . -maxdepth 1 -type f -print`
```

But this is cumbersome to type, produces unfriendly output, and lacks some of the refinement of the **ls** command. You could also combine **ls** and **grep** to achieve the same result:


```
`ls -F . | grep -v /`
```

But again, this is clunky. This script provides a simple alternative.

### Usage

The script provides four main functions, which depend upon which name you call: **lsf** lists files, **lsd** lists directories, **lsx** lists executables, and **lsl** lists links.

There is no need to install multiple copies of the script, as symbolic links work. This saves space and makes updating the script easier.

The script works by using the **find** command to do the searching, and then it runs **ls** on each item it finds. The nice thing about this is that any arguments given to the script are passed to the **ls** command. So, for example, this lists all files, even those that start with a dot:


```
`lsf -a`
```

To list directories in long format, use the **lsd** command:


```
`lsd -l`
```

You can provide multiple arguments, and also file and directory paths.

This provides a long classified listing of all of files in the current directory's parent directory, and in the **/usr/bin** directory:


```
`lsf -F -l .. /usr/bin`
```

One thing that the script does not currently handle, however, is recursion. This command lists only the files in the current directory.


```
`lsf -R`
```

The script does not descend into any subdirectories. This is something that may be fixed one day.

### Internals

The script is written in a top-down fashion with the initial functions at the start of the script and the body of the work performed near the end. There are only two functions that really matter in the script. The **parse_args()** function peruses the command line, separates options from pathnames, and scripts specific options from the **ls** command-line options.

The **list_things_in_dir()** function  takes a directory name as an argument and runs the **find** command on it. Each item found is passed to the **ls** command for display.

### Conclusion

This is a simple script to accomplish a simple function. It is a time saver and can be surprisingly useful when working with large filesystems.

### The script


```
#!/bin/bash

# Script to list:
#      directories (if called "lsd")
#      files       (if called "lsf")
#      links       (if called "lsl")
#  or  executables (if called "lsx")
# but not any other type of filesystem object.
# FIXME: add lsp   (list pipes)
#
# Usage:
#   &lt;command_name&gt; [switches valid for ls command] [dirname...]
#
# Works with names that includes spaces and that start with a hyphen.
#
# Created by Nick Clifton.
# Version 1.4
# Copyright (c) 2006, 2007 Red Hat.
#
# This is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published
# by the Free Software Foundation; either version 3, or (at your
# option) any later version.

# It is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# ToDo:
#  Handle recursion, eg:  lsl -R
#  Handle switches that take arguments, eg --block-size
#  Handle --almost-all, --ignore-backups, --format and --ignore

main ()
{
  init
 
  parse_args ${1+"$@"}

  list_objects

  exit 0
}

report ()
{
  echo $prog": " ${1+"$@"}
}

fail ()
{
  report " Internal error: " ${1+"$@"}
  exit 1
}

# Initialise global variables.
init ()
{
  # Default to listing things in the current directory.
  dirs[0]=".";
 
  # num_dirs is the number of directories to be listed minus one.
  # This is because we are indexing the dirs[] array from zero.
  num_dirs=0;
 
  # Default to ignoring things that start with a period.
  no_dots=1
 
  # Note - the global variables 'type' and 'opts' are initialised in
  # parse_args function.
}

# Parse our command line
parse_args ()
{
  local no_more_args

  no_more_args=0 ;

  prog=`basename $0` ;

  # Decide if we are listing files or directories.
  case $prog in
    lsf | lsf.sh)
      type=f
      opts="";
      ;;
    lsd | lsd.sh)
      type=d
      # The -d switch to "ls" is presumed when listing directories.
      opts="-d";
      ;;
    lsl | lsl.sh)
      type=l
      # Use -d to prevent the listed links from being followed.
      opts="-d";
      ;;
    lsx | lsx.sh)
      type=f
      find_extras="-perm /111"
      ;;    
    *)
      fail "Unrecognised program name: '$prog', expected either 'lsd', 'lsf', 'lsl' or 'lsx'"
      ;;
  esac

  # Locate any additional command line switches for ls and accumulate them.
  # Likewise accumulate non-switches to the directories list.
  while [ $# -gt 0 ]
  do
    case "$1" in
      # FIXME: Handle switches that take arguments, eg --block-size
      # FIXME: Properly handle --almost-all, --ignore-backups, --format
      # FIXME:   and --ignore
      # FIXME: Properly handle --recursive
      -a | -A | --all | --almost-all)
        no_dots=0;
        ;;
      --version)
        report "version 1.2"
        exit 0
        ;;
      --help)
        case $type in
          d) report "a version of 'ls' that lists only directories" ;;
          l) report "a version of 'ls' that lists only links" ;;
          f) if [ "x$find_extras" = "x" ] ; then
               report "a version of 'ls' that lists only files" ;
             else
              report "a version of 'ls' that lists only executables";
             fi ;;
        esac
        exit 0
        ;;
      --)
        # A switch to say that all further items on the command line are
        # arguments and not switches.
        no_more_args=1 ;
        ;;
      -*)
        if [ "x$no_more_args" = "x1" ] ;
        then
          dirs[$num_dirs]="$1";
          let "num_dirs++"
        else
          # Check for a switch that just uses a single dash, not a double
          # dash.  This could actually be multiple switches combined into
          # one word, eg "lsd -alF".  In this case, scan for the -a switch.
          # XXX: FIXME: The use of =~ requires bash v3.0+.
          if [[ "x${1:1:1}" != "x-" &amp;&amp; "x$1" =~ "x-.*a.*" ]] ;
          then
            no_dots=0;
          fi
          opts="$opts $1";
        fi
        ;;
      *)
        dirs[$num_dirs]="$1";
        let "num_dirs++"
        ;;
    esac
    shift
  done

  # Remember that we are counting from zero not one.
  if [ $num_dirs -gt 0 ] ;
  then
    let "num_dirs--"
  fi
}

list_things_in_dir ()
{
  local dir

  # Paranoia checks - the user should never encounter these.
  if test "x$1" = "x" ;
  then
    fail "list_things_in_dir called without an argument"
  fi

  if test "x$2" != "x" ;
  then
    fail "list_things_in_dir called with too many arguments"
  fi

  # Use quotes when accessing $dir in order to preserve
  # any spaces that might be in the directory name.
  dir="${dirs[$1]}";

  # Catch directory names that start with a dash - they
  # confuse pushd.
  if test "x${dir:0:1}" = "x-" ;
  then
    dir="./$dir"
  fi
 
  if [ -d "$dir" ]
  then
    if [ $num_dirs -gt 0 ]
    then
      echo "  $dir:"
    fi

    # Use pushd rather passing the directory name to find so that the
    # names that find passes on to xargs do not have any paths prepended.
    pushd "$dir" &gt; /dev/null
    if [ $no_dots -ne 0 ] ; then
      find . -maxdepth 1 -type $type $find_extras -not -name ".*" -printf "%f\000" \
        | xargs --null --no-run-if-empty ls $opts -- ;
    else
      find . -maxdepth 1 -type $type $find_extras -printf "%f\000" \
        | xargs --null --no-run-if-empty ls $opts -- ;
    fi
    popd &gt; /dev/null
  else
    report "directory '$dir' could not be found"
  fi
}

list_objects ()
{
  local i

  i=0;
  while [ $i -le $num_dirs ]
  do
    list_things_in_dir i
    let "i++"
  done
}

# Invoke main
main ${1+"$@"}
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/script-large-files

作者：[Nick Clifton][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nickclifton
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
