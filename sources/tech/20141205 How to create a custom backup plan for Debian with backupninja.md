SPccman translating
How to create a custom backup plan for Debian with backupninja
================================================================================
Backupninja is a powerful and highly-configurable backup tool for Debian based distributions. In the [previous tutorial][1], we explored how to install backupninja and how to set up two backup actions for the program to perform. However, we should note that those examples were only "the tip of the iceberg," so to speak. In this post we will discuss how to leverage custom handlers and helpers that allow this program to be customized in order to accomplish almost any backup need that you can think of. 

And believe me - that is not an overstatement, so let's begin.

### A Quick Review of Backupninja ###

One of backupninja's distinguishing features is the fact that you can just drop plain text configuration or action files in /etc/backup.d, and the program will take care of the rest. In addition, we can write custom scripts (aka "handlers") and place them in /usr/share/backupninja to handle each type of backup action. Furthermore, we can have these scripts be executed via ninjahelper's ncurses-based interactive menus (aka "helpers") to guide us to create the configuration files we mentioned earlier, minimizing the chances of human error.

### Creating a Custom Handler and Helper ###

Our goal in this case is to create a script to handle the backup of chosen home directories into a tarball with either **gzip** or **bzip2** compression, excluding music and video files. We will simply name this script home, and place it under /usr/backup/ninja. 

Although you could achieve the same objective with the default tar handler (refer to /usr/share/backupninja/tar and /usr/share/backupninja/tar.helper), we will use this approach to show how to create a useful handler script and ncurses-based helper from scratch. You can then decide how to apply the same principles depending on your specific needs.

Note that since handlers are sourced from the main script, there is no need to start with #!/bin/bash at the top.

Our proposed handler (/usr/share/backupninja/home) is as follows. It is heavily commented for clarification. The getconf function is used to read the backup action's configuration file. If you specify a value for a variable here, it will override the corresponding value present in the configuration file:

    # home handler script for backupninja
     
    # Every backup file will identify the host by its FQDN
    getconf backupname
     
    # Directory to store backups
    getconf backupdir
     
    # Default compression
    getconf compress
     
    # Include /home directory
    getconf includes
     
    # Exclude files with *.mp3 and *.mp4 extensions
    getconf excludes
     
    # Default extension for the packaged backup file
    getconf EXTENSION
     
    # Absolute path to date binary
    getconf TAR `which tar`
     
    # Absolute path to date binary
    getconf DATE    `which date`
     
    # Chosen date format
    DATEFORMAT="%Y-%m-%d"
     
    # If backupdir does not exist, exit with fatal error
    if [ ! -d "$backupdir" ]
    then
       mkdir -p "$backupdir" || fatal "Can not make directory $backupdir"
    fi
     
    # If backupdir is not writeable, exit with fatal error as well
    if [ ! -w "$backupdir" ]
    then
       fatal "Directory $backupdir is not writable"
    fi
     
    # Set the right tar option as per the chosen compression format
    case $compress in
       "gzip")
        compress_option="-z"
        EXTENSION="tar.gz"
        ;;
       "bzip")
        compress_option="-j"
        EXTENSION="tar.bz2"
        ;;
       "none")
        compress_option=""
        ;;
       *)
        warning "Unknown compress filter ($tar_compress)"
        compress_option=""
        EXTENSION="tar.gz"
        ;;
    esac
     
    # Exclude the following file types / directories
    exclude_options=""
    for i in $excludes
    do
       exclude_options="$exclude_options --exclude $i"
    done
     
    # Debugging messages, performing backup
    debug "Running backup: " $TAR -c -p -v $compress_option $exclude_options \
       -f "$backupdir/$backupname-"`$DATE "+$DATEFORMAT"`".$EXTENSION" \
       $includes
     
    # Redirect standard output to a file with .list extension
    # and standard error to a file with .err extension
    $TAR -c -p -v $compress_option $exclude_options \
       -f "$backupdir/$backupname-"`$DATE "+$DATEFORMAT"`".$EXTENSION" \
       $includes \
       > "$backupdir/$backupname-"`$DATE "+$DATEFORMAT"`.list \
       2> "$backupdir/$backupname-"`$DATE "+$DATEFORMAT"`.err
     
    [ $? -ne 0 ] && fatal "Tar backup failed"

Next, we will create our helper file (/usr/share/backupninja/home.helper) so that our handlers shows up as a menu in **ninjahelper**:

    # Backup action's description. Separate words with underscores.
    HELPERS="$HELPERS home:backup_of_home_directories"
     
    home_wizard() {
       home_title="Home action wizard"
     
       backupname=`hostname --fqdn`
     
    # Specify default value for the time when this backup actions is supposed to run
       inputBox "$home_title" "When to run this action?" "everyday at 01"
       [ $? = 1 ] && return
       home_when_run="when = $REPLY"
     
    # Specify default value for backup file name
       inputBox "$home_title" "\"Name\" of backups" "$backupname"
       [ $? = 1 ] && return
       home_backupname="backupname = $REPLY"
       backupname="$REPLY"
     
    # Specify default directory to store the backups
       inputBox "$home_title" "Directory where to store the backups" "/var/backups/home"
       [ $? = 1 ] && return
       home_backupdir="backupdir = $REPLY"
     
    # Specify default values for the radiobox
       radioBox "$home_title" "Compression" \
        "none"  "No compression" off \
        "gzip"  "Compress with gzip" on \
        "bzip"  "Compress with bzip" off
       [ $? = 1 ] && return;
       result="$REPLY"
       home_compress="compress = $REPLY "
     
       REPLY=
       while [ -z "$REPLY" ]; do
        formBegin "$home_title: Includes"
            formItem "Include:" /home/gacanepa
        formDisplay
        [ $? = 0 ] || return 1
        home_includes="includes = "
        for i in $REPLY; do
            [ -n "$i" ] && home_includes="$home_includes $i"
        done
       done
     
       REPLY=
       while [ -z "$REPLY" ]; do
        formBegin "$home_title: Excludes"
            formItem "Exclude:" *.mp3
            formItem "Exclude:" *.mp4
            # Add as many “Exclude” text boxes as needed to specify other exclude options
    formItem "Exclude:"
            formItem "Exclude:"
        formDisplay
        [ $? = 0 ] || return 1
        home_excludes="excludes = "
        for i in $REPLY; do
            [ -n "$i" ] && home_excludes="$home_excludes $i"
        done
       done
     
    # Save the config
       get_next_filename $configdirectory/10.home
       cat > $next_filename <<EOF
    $home_when_run
    $home_backupname
    $home_backupdir
    $home_compress
    $home_includes
    $home_excludes
     
    # tar binary - have to be GNU tar
    TAR    `which tar`
    DATE    `which date`
    DATEFORMAT  "%Y-%m-%d"
    EXTENSION    tar
     
    EOF
    # Backupninja requires that configuration files be chmoded to 600
       chmod 600 $next_filename
    }

### Running Ninjahelper ###

Once we have created our handler script named home and the corresponding helper named home.helper, let's run ninjahelper command to create a new backup action:

    # ninjahelper 

And choose create a new backup action.

![](https://farm8.staticflickr.com/7467/15322605273_90edaa5bc1_z.jpg)

We will now be presented with the available action types. Let's select "backup of home directories":

![](https://farm9.staticflickr.com/8636/15754955450_f3ef82217b_z.jpg)

The next screens will display the default values as set in the helper (only 3 of them are shown here). Feel free to edit the values in the text box. Particularly, refer to the scheduling section of the documentation for the right syntax for the when variable.

![](https://farm8.staticflickr.com/7508/15941578982_24b680e1c3_z.jpg)

![](https://farm8.staticflickr.com/7562/15916429476_6e84b307aa_z.jpg)

![](https://farm8.staticflickr.com/7528/15319968994_41705b7283_z.jpg)

When you are done creating the backup action, it will show in ninjahelper's initial menu:

![](https://farm8.staticflickr.com/7534/15942239225_bb66dbdb63.jpg)

Then you can press ENTER to show the options available for this action. Feel free to experiment with them, as their description is quite straightforward.

Particularly, "run this action now" will execute the backup action in debug mode immediately regardless of the scheduled time:

![](https://farm8.staticflickr.com/7508/15754955470_9af6251096_z.jpg)

Should the backup action fail for some reason, the debug will display an informative message to help you locate the error and correct it. Consider, for example, the following error messages that were displayed after running a backup action with bugs that have not been corrected yet:

![](https://farm9.staticflickr.com/8662/15754955480_487d040fcd_z.jpg)

The image above tells you that the connection needed to complete the backup action could not be completed because the remote host seems to be down. In addition, the destination directory specified in the helper file does not exist. Once you correct the problems, re-run the backup action.

A few things to remember:

- If you create a custom script in /usr/share/backupninja (e.g., foobar) to handle a specific backup action, you also need to write a corresponding helper (e.g., foobar.helper) in order to create, through ninjahelper, a file named 10.foobar (11 and onward for further actions as well) in /etc/backup.d, which is the actual configuration file for the backup action.
- You can execute your backups at any given time via ninjahelper as explained earlier, or have them run as per the specified frequency in the when variable. 

### Summary ###

In this post we have discussed how to create our own backup actions from scratch and how to add a related menu in ninjahelper to facilitate the creation of configuration files. With the previous [backupninja article][2] and the present one I hope I've given you enough good reasons to go ahead and at least try it. 

--------------------------------------------------------------------------------

via: http://xmodulo.com/create-custom-backup-plan-debian.html

作者：[ Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/gabriel
[1]:http://xmodulo.com/backup-debian-system-backupninja.html
[2]:http://xmodulo.com/backup-debian-system-backupninja.html
