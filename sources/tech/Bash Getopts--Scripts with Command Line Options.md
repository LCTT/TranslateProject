CNprober 翻译中<619913541,travelwithheart@yeah.net>

Bash Getopts – Scripts with Command Line Options
================================================================================
I've always wanted to know how to create command line options for my Bash scripts. After some research I found there are two functions available to handle this; **getopt** and **getopts**. I'm not going to get into the debate about which one is better. **getopts** is a shell builtin and seems a little easier to implement than **getopt**, so I'll go with that for now.

### bash getopts ###

I started out just trying to figure out how to process command line switches in my scripts. Eventually, I added some other useful functionality that makes this a good starting template for any interactive script. I've also included a help function with text formatting to make it a little easier to read.

Rather than go into a lengthy explanation of how **getopts** works in **bash**, I think it's simpler to just show some working code in a script.

    #!/bin/bash
    
    ######################################################################
    #This is an example of using getopts in Bash. It also contains some
    #other bits of code I find useful.
    #Author: Linerd
    #Website: http://tuxtweaks.com/
    #Copyright 2014
    #License: Creative Commons Attribution-ShareAlike 4.0
    #http://creativecommons.org/licenses/by-sa/4.0/legalcode
    ######################################################################
        
    #Set Script Name variable
    SCRIPT=`basename ${BASH_SOURCE[0]}`
    
    #Initialize variables to default values.
    OPT_A=A
    OPT_B=B
    OPT_C=C
    OPT_D=D
    
    #Set fonts for Help.
    NORM=`tput sgr0`
    BOLD=`tput bold`
    REV=`tput smso`
    
    #Help function
    function HELP {
      echo -e \\n"Help documentation for ${BOLD}${SCRIPT}.${NORM}"\\n
      echo -e "${REV}Basic usage:${NORM} ${BOLD}$SCRIPT file.ext${NORM}"\\n
      echo "Command line switches are optional. The following switches are recognized."
      echo "${REV}-a${NORM}  --Sets the value for option ${BOLD}a${NORM}. Default is ${BOLD}A${NORM}."
      echo "${REV}-b${NORM}  --Sets the value for option ${BOLD}b${NORM}. Default is ${BOLD}B${NORM}."
      echo "${REV}-c${NORM}  --Sets the value for option ${BOLD}c${NORM}. Default is ${BOLD}C${NORM}."
      echo "${REV}-d${NORM}  --Sets the value for option ${BOLD}d${NORM}. Default is ${BOLD}D${NORM}."
      echo -e "${REV}-h${NORM}  --Displays this help message. No further functions are performed."\\n
      echo -e "Example: ${BOLD}$SCRIPT -a foo -b man -c chu -d bar file.ext${NORM}"\\n
      exit 1
    }
    
    #Check the number of arguments. If none are passed, print help and exit.
    NUMARGS=$#
    echo -e \\n"Number of arguments: $NUMARGS"
    if [ $NUMARGS -eq 0 ]; then
      HELP
    fi
    
    ### Start getopts code ###
    
    #Parse command line flags
    #If an option should be followed by an argument, it should be followed by a ":".
    #Notice there is no ":" after "h". The leading ":" suppresses error messages from
    #getopts. This is required to get my unrecognized option code to work.
    
    while getopts :a:b:c:d:h FLAG; do
      case $FLAG in
        a)  #set option "a"
          OPT_A=$OPTARG
          echo "-a used: $OPTARG"
          echo "OPT_A = $OPT_A"
          ;;
        b)  #set option "b"
          OPT_B=$OPTARG
          echo "-b used: $OPTARG"
          echo "OPT_B = $OPT_B"
          ;;
        c)  #set option "c"
          OPT_C=$OPTARG
          echo "-c used: $OPTARG"
          echo "OPT_C = $OPT_C"
          ;;
        d)  #set option "d"
          OPT_D=$OPTARG
          echo "-d used: $OPTARG"
          echo "OPT_D = $OPT_D"
          ;;
        h)  #show help
          HELP
          ;;
        \?) #unrecognized option - show help
          echo -e \\n"Option -${BOLD}$OPTARG${NORM} not allowed."
          HELP
          #If you just want to display a simple error message instead of the full
          #help, remove the 2 lines above and uncomment the 2 lines below.
          #echo -e "Use ${BOLD}$SCRIPT -h${NORM} to see the help documentation."\\n
          #exit 2
          ;;
      esac
    done
    
    shift $((OPTIND-1))  #This tells getopts to move on to the next argument.
    
    ### End getopts code ###
    
    
    ### Main loop to process files ###
    
    #This is where your main file processing will take place. This example is just
    #printing the files and extensions to the terminal. You should place any other
    #file processing tasks within the while-do loop.
    
    while [ $# -ne 0 ]; do
      FILE=$1
      TEMPFILE=`basename $FILE`
      #TEMPFILE="${FILE##*/}"  #This is another way to get the base file name.
      FILE_BASE=`echo "${TEMPFILE%.*}"`  #file without extension
      FILE_EXT="${TEMPFILE##*.}"  #file extension
    
    
      echo -e \\n"Input file is: $FILE"
      echo "File withouth extension is: $FILE_BASE"
      echo -e "File extension is: $FILE_EXT"\\n
      shift  #Move on to next input file.
    done
    
    ### End main loop ###
    
    exit 0

Paste the above text into a text editor and then save it somewhere in your executable path. I chose to call the script **options** and I saved it under **/home/linerd/bin**. Once you save it, make sure to make it executable.

    chmod +x ~/bin/options

Now you can run the script. Try running it with the **-h** switch to show the help information.

    options -h

Now try running it with an unsupported option.

    options -z

Finally, getopts can handle your command line options in any order. The only rule is that the file or files you are processing have to come after all of the option switches.

    options -d bar -c chu -b man -a foo example1.txt example2.txt

So you can see from these examples how you can set variables in your scripts with command line options. There's more  going on than just getopts in this script, but I think these are valuable additions that make this a good starting template for new scripts. If you'd like to learn more about bash getopts, you can find the documentation buried deep within the bash man page in the "Builtins" section. You can also find info in the [Bash Reference Manual][1].

### What Next? ###

So what will you use getopts for? Let me know in the comments.

--------------------------------------------------------------------------------

via: http://tuxtweaks.com/2014/05/bash-getopts/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://tuxtweaks.com/2014/05/bash-getopts/www.gnu.org/software/bash/manual/html_node/Bourne-Shell-Builtins.html
