[#]: subject: "Writing useful terminal TUI on Linux with dialog and jq"
[#]: via: "https://fedoramagazine.org/writing-useful-terminal-tui-on-linux-with-dialog-and-jq/"
[#]: author: "Jose Nunez https://fedoramagazine.org/author/josevnz/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Writing useful terminal TUI on Linux with dialog and jq
======

![][1]

Photo by [Riku Lu][2] on [Unsplash][3]

### Why a Text User Interface?

Many use the terminal on a daily basis. A Text User Interface (TUI) is a tool that will minimize user errors and allow you to become more productive with the terminal interface.

Let me give you an example: I connect on a daily basics from my home computer into my Physical PC, using Linux. All remote networking is protected using a private [VPN][4]. After a while it was irritating to be repeating the same commands over and over when connecting.

Having a bash function like this was a nice improvement:

```

    export REMOTE_RDP_USER="myremoteuser"
    function remote_machine() {
    /usr/bin/xfreerdp /cert-ignore /sound:sys:alsa /f /u:$REMOTE_RDP_USER /v:$1 /p:$2
    }

```

But then I was constantly doing this (on a single line):

```

    remote_pass=(/bin/cat/.mypassfile) remote_machine $remote_machine $remote_pass

```

_That was annoying._ Not to mention that I had my password in clear text on my machine (I have an encrypted drive but still…)

So I decided to spend a little time and came up with a nice script to handle my basic needs.

#### What information do I need to connect to my remote desktop?

Not much information is needed. It just needs to be structured so a simple JSON file will do:

```

    {"machines": [
    {
    "name": "machine1.domain.com",
    "description": "Personal-PC"
    },
    {
    "name": "machine2.domain.com",
    "description": "Virtual-Machine"
    }
    ],
    "remote_user": "MYUSER@DOMAIN",
    "title" : "MY COMPANY RDP connection"
    }

```

JSON is not the best format for configuration files (as it doesn’t support comments, for example) but it has plenty of tools available on Linux to parse its contents from the command line. A very useful tool that stands out is [_jq_][5]. Let me show you how I can extract the list of machines:

```

    /usr/bin/jq --compact-output --raw-output '.machines[]| .name' \
    $HOME/.config/scripts/kodegeek_rdp.json) \
    "machine1.domain.com" "machine2.domain.com"

```

Documentation for _jq_ is available [here][6]. You can try your expressions at [jq play][7] just by copying and pasting your JSON files there and then use the expression in your scripts.

So now that I have all the ingredients I need to connect to my remote computer, let’s build a nice TUI for it.

#### Dialog to the rescue

[Dialog][8] is one of those underrated Linux tools that you wish you knew about a long time ago. You can build a very nice and simple UI that will work perfectly on your terminal.

For example, to create a simple checkbox list with my favorite languages, selecting Python by default:

```

    dialog --clear --checklist "Favorite programming languages:" 10 30 7 1 \
    Python on 2 Java off 3 Bash off 4 Perl off 5 Ruby off

```

![][9]

We told dialog a few things:

  * Clear the screen (all the options start with –)
  * Create a checklist with title (first positional argument)
  * A list of dimensions (height width list height, 3 items)
  * Then each element of the list is a pair of a Label and a value.



Surprisingly is very concise and intuitive to get a nice selection list with a single line of code.

Full documentation for _dialog_ is available [here][10].

#### Putting everything together: Writing a TUI with Dialog and JQ

I wrote a TUI that uses _jq_ to extract my configuration details from my JSON file and organized the flow with _dialog_. I ask for the password every single time and save it in a temporary file which gets removed after the script is done using it.

The script is pretty basic but is more secure and also lets me focus on more serious tasks 🙂

So what does the [script][11] looks like? Let me show you the code:

```

    #!/bin/bash
    # Author Jose Vicente Nunez
    # Do not use this script on a public computer. It is not secure...
    # https://invisible-island.net/dialog/
    # Below some constants to make it easier to handle Dialog
    # return codes
    : ${DIALOG_OK=0}
    : ${DIALOG_CANCEL=1}
    : ${DIALOG_HELP=2}
    : ${DIALOG_EXTRA=3}
    : ${DIALOG_ITEM_HELP=4}
    : ${DIALOG_ESC=255}
    # Temporary file to store sensitive data. Use a 'trap' to remove
    # at the end of the script or if it gets interrupted
    declare tmp_file=$(/usr/bin/mktemp 2>/dev/null) || declare tmp_file=/tmp/test$$
    trap "/bin/rm -f $tmp_file" QUIT EXIT INT
    /bin/chmod go-wrx ${tmp_file} > /dev/null 2>&1
    :<<DOC
    Extract details like title, remote user and machines using jq from the JSON file
    Use a subshell for the machine list
    DOC
    declare TITLE=$(/usr/bin/jq --compact-output --raw-output '.title' $HOME/.config/scripts/kodegeek_rdp.json)|| exit 100
    declare REMOTE_USER=$(/usr/bin/jq --compact-output --raw-output '.remote_user' $HOME/.config/scripts/kodegeek_rdp.json)|| exit 100
    declare MACHINES=$(
        declare tmp_file2=$(/usr/bin/mktemp 2>/dev/null) || declare tmp_file2=/tmp/test$$
        # trap "/bin/rm -f $tmp_file2" 0 1 2 5 15 EXIT INT
        declare -a MACHINE_INFO=$(/usr/bin/jq --compact-output --raw-output '.machines[]| join(",")' $HOME/.config/scripts/kodegeek_rdp.json > $tmp_file2)
        declare -i i=0
        while read line; do
            declare machine=$(echo $line| /usr/bin/cut -d',' -f1)
            declare desc=$(echo $line| /usr/bin/cut -d',' -f2)
            declare toggle=off
            if [ $i -eq 0 ]; then
                toggle=on
                ((i=i+1))
            fi
            echo $machine $desc $toggle
        done < $tmp_file2
        /bin/cp /dev/null $tmp_file2
    ) || exit 100
    # Create a dialog with a radio list and let the user select the
    # remote machine
    /usr/bin/dialog \
        --clear \
        --title "$TITLE" \
        --radiolist "Which machine do you want to use?" 20 61 2 \
        $MACHINES 2> ${tmp_file}
    return_value=$?
    # Handle the return codes from the machine selection in the
    # previous step
    export remote_machine=""
    case $return_value in
      $DIALOG_OK)
        export remote_machine=$(/bin/cat ${tmp_file})
        ;;
      $DIALOG_CANCEL)
        echo "Cancel pressed.";;
      $DIALOG_HELP)
        echo "Help pressed.";;
      $DIALOG_EXTRA)
        echo "Extra button pressed.";;
      $DIALOG_ITEM_HELP)
        echo "Item-help button pressed.";;
      $DIALOG_ESC)
        if test -s $tmp_file ; then
          /bin/rm -f $tmp_file
        else
          echo "ESC pressed."
        fi
        ;;
    esac

    # No machine selected? No service ...
    if [ -z "${remote_machine}" ]; then
      /usr/bin/dialog \
            --clear  \
            --title "Error, no machine selected?" --clear "$@" \
            --msgbox "No machine was selected!. Will exit now..." 15 30
      exit 100
    fi

    # Send 4 packets to the remote machine. I assume your network
    # administration allows ICMP packets
    # If there is an error show  message box
    /bin/ping -c 4 ${remote_machine} >/dev/null 2>&1
    if [ $? -ne 0 ]; then
      /usr/bin/dialog \
            --clear  \
            --title "VPN issues or machine is off?" --clear "$@" \
            --msgbox "Could not ping ${remote_machine}. Time to troubleshoot..." 15 50
      exit 100
    fi

    # Remote machine is visible, ask for credentials and handle user
    # choices (like password with a password box)
    /bin/rm -f ${tmp_file}
    /usr/bin/dialog \
      --title "$TITLE" \
      --clear  \
      --insecure \
      --passwordbox "Please enter your Windows password for ${remote_machine}\n" 16 51 2> $tmp_file
    return_value=$?
    case $return_value in
      $DIALOG_OK)
        # We have all the information, try to connect using RDP protocol
        /usr/bin/mkdir -p -v $HOME/logs
        /usr/bin/xfreerdp /cert-ignore /sound:sys:alsa /f /u:$REMOTE_USER /v:${remote_machine} /p:$(/bin/cat ${tmp_file})| \
        /usr/bin/tee $HOME/logs/$(/usr/bin/basename $0)-$remote_machine.log
        ;;
      $DIALOG_CANCEL)
        echo "Cancel pressed.";;
      $DIALOG_HELP)
        echo "Help pressed.";;
      $DIALOG_EXTRA)
        echo "Extra button pressed.";;
      $DIALOG_ITEM_HELP)
        echo "Item-help button pressed.";;
      $DIALOG_ESC)
        if test -s $tmp_file ; then
          /bin/rm -f $tmp_file
        else
          echo "ESC pressed."
        fi
        ;;
    esac

```

![][12]

You can see from the code that _dialog_ expects positional arguments and also allows you to capture user responses in variables. This effectively makes it an extension to Bash to write text user interfaces.

My small example above only covers the usage of some of the Widgets, there is plenty more documentation on the [official _dialog_ site][8].

#### Are dialog and JQ the best options?

You can skin this rabbit in many ways ([Textual][13], Gnome [Zenity][14], Python [TKinker][15], etc.) I just wanted to show you one nice way to accomplish this in a short time, with only 100 lines of code.

_It is not perfect_. Specficially, integration with Bash makes the code very verbose, but it is still easy to debug and maintain. This is also much better than copying and pasting the same long command over and over.

One last thing: If you liked _jq_ for JSON processing from Bash, then you will appreciate this [nice collection of _jq_ recipes][16].

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/writing-useful-terminal-tui-on-linux-with-dialog-and-jq/

作者：[Jose Nunez][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/josevnz/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/11/TUI_w_dialog_n_jq-816x345.jpg
[2]: https://unsplash.com/@riku?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[3]: https://unsplash.com/photos/black-flat-screen-computer-monitor-wvJuYrM5iuw?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[4]: https://en.wikipedia.org/wiki/Virtual_private_network
[5]: https://stedolan.github.io/jq/
[6]: https://jqlang.github.io/jq/manual/
[7]: https://jqplay.org/
[8]: https://invisible-island.net/dialog/
[9]: https://fedoramagazine.org/wp-content/uploads/2023/11/dialog-example1.png
[10]: https://invisible-island.net/dialog/#documentation
[11]: https://raw.githubusercontent.com/josevnz/scripts/main/kodegeek_rdp.sh
[12]: https://fedoramagazine.org/wp-content/uploads/2023/11/dialog-example2.png
[13]: https://textual.textualize.io/
[14]: https://gitlab.gnome.org/GNOME/zenity/commits/master?ofs=1900
[15]: https://docs.python.org/3/library/tkinter.html
[16]: https://nntrn.github.io/jq-recipes/
