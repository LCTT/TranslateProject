[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Introduction to the Linux goto shell utility)
[#]: via: (https://opensource.com/article/20/1/directories-autocomplete-linux)
[#]: author: (Lazarus Lazaridis https://opensource.com/users/iridakos)

Introduction to the Linux goto shell utility
======
Learn how to use goto to alias and navigate to directories with
autocomplete in Linux.
![Files in a folder][1]

The goto shell utility allows users to navigate to aliased directories and also supports autocompletion.

## How it works

Before you can use goto, you need to register your directory aliases. For example:


```
`goto -r dev /home/iridakos/development`
```

then change to that directory, e.g.:


```
`goto dev`
```

![goto demo][2]

## Autocompletion in goto

**goto** comes with a nice autocompletion script—whenever you press the Tab key after the **goto** command, Bash or Zsh will prompt you with suggestions of the aliases that are available:


```
$ goto &lt;tab&gt;
bc /etc/bash_completion.d                    
dev /home/iridakos/development
rubies /home/iridakos/.rvm/rubies
```

## Installing goto

There are several ways to install goto.

### Via script

Clone the repository and run the install script as a superuser or root:


```
git clone <https://github.com/iridakos/goto.git>
cd goto
sudo ./install
```

### Manually

Copy the file **goto.sh** somewhere in your filesystem and add a line in your **.zshrc** or **.bashrc** to source it.

For example, if you placed the file in your home folder, all you have to do is add the following line to your **.zshrc** or **.bashrc** file:


```
`source ~/goto.sh`
```

### MacOS Homebrew

A formula named **goto** is available for the Bash shell in MacOS:


```
`brew install goto`
```

### Add colored output


```
`echo -e "\$include /etc/inputrc\nset colored-completion-prefix on" >> ~/.inputrc`
```

**Notes:**

  * You need to restart your shell after installation.
  * You need to have the Bash completion feature enabled for Bash in MacOS (see this [issue][3]).
    * You can install it with **brew install bash-completion** if you don't have it enabled.



## Ways to use goto

### Change to an aliased directory

To change to an aliased directory, type:


```
`goto <alias>`
```

For example:


```
`goto dev`
```

### Register an alias

To register a directory alias, type:


```
`goto -r <alias> <directory>`
```

or


```
`goto --register <alias> <directory>`
```

For example:


```
`goto -r blog /mnt/external/projects/html/blog`
```

or


```
`goto --register blog /mnt/external/projects/html/blog`
```

**Notes:**

  * **goto** **expands** the directories, so you can easily alias your current directory with the following command and it will automatically be aliased to the whole path: [code]`goto -r last_release .`
```
  * Pressing the Tab key after the alias name provides the shell's default directory suggestions.



### Unregister an alias

To unregister an alias, use:
```
`goto -u <alias>`
```
or
```
`goto --unregister <alias>`
```
For example:
```
`goto -u last_release`
```
or
```
`goto --unregister last_release`
```
**Note:** By pressing the Tab key after the command (**-u** or **\--unregister**), the completion script will prompt you with the list of registered aliases.

### List aliases

To get a list of your currently registered aliases, use:
```
`goto -l`
```
or
```
`goto --list`
```
### Expand an alias

To expand an alias to its value, use:
```
`goto -x <alias>`
```
or
```
`goto --expand <alias>`
```
For example:
```
`goto -x last_release`
```
or
```
`goto --expand last_release`
```
### Clean up aliases

To clean up the aliases from directories that are no longer accessible in your filesystem, use:
```
`goto -c`
```
or
```
`goto --cleanup`
```
### Get help

To view the tool's help information, use:
```
`goto -h`
```
or
```
`goto --help`
```
### Check the version

To view the tool's version, use:
```
`goto -v`
```
or
```
`goto --version`
```
### Push before changing directories

To push the current directory onto the directory stack before changing directories, type:
```
`goto -p <alias>`
```
or
```
`goto --push <alias>`
```
### Revert to a pushed directory

To return to a pushed directory, type:
```
`goto -o`
```
or
```
`goto --pop`
```
**Note:** This command is equivalent to **popd** but within the **goto** command.

## Troubleshooting

If you see the error **command not found: compdef** in Zsh, it means you need to load **bashcompinit**. To do so, append this to your **.zshrc** file:
```


autoload bashcompinit
bashcompinit

```
## Get involved

The goto tool is open source under the [MIT License][4] terms, and contributions are welcomed. To learn more, visit the [Contributing][5] section in goto's GitHub repository.

## The goto script
```


goto()
{
  local target
  _goto_resolve_db

  if [ -z "$1" ]; then
    # display usage and exit when no args
    _goto_usage
    return
  fi

  subcommand="$1"
  shift
  case "$subcommand" in
    -c|--cleanup)
      _goto_cleanup "$@"
      ;;
    -r|--register) # Register an alias
      _goto_register_alias "$@"
      ;;
    -u|--unregister) # Unregister an alias
      _goto_unregister_alias "$@"
      ;;
    -p|--push) # Push the current directory onto the pushd stack, then goto
      _goto_directory_push "$@"
      ;;
    -o|--pop) # Pop the top directory off of the pushd stack, then change that directory
      _goto_directory_pop
      ;;
    -l|--list)
      _goto_list_aliases
      ;;
    -x|--expand) # Expand an alias
      _goto_expand_alias "$@"
      ;;
    -h|--help)
      _goto_usage
      ;;
    -v|--version)
      _goto_version
      ;;
    *)
      _goto_directory "$subcommand"
      ;;
  esac
  return $?
}

_goto_resolve_db()
{
  GOTO_DB="${GOTO_DB:-$HOME/.goto}"
  touch -a "$GOTO_DB"
}

_goto_usage()
{
  cat &lt;&lt;\USAGE
usage: goto [&lt;option&gt;] &lt;alias&gt; [&lt;directory&gt;]

default usage:
  goto &lt;alias&gt; \- changes to the directory registered for the given alias

OPTIONS:
  -r, --register: registers an alias
    goto -r|--register &lt;alias&gt; &lt;directory&gt;
  -u, --unregister: unregisters an alias
    goto -u|--unregister &lt;alias&gt;
  -p, --push: pushes the current directory onto the stack, then performs goto
    goto -p|--push &lt;alias&gt;
  -o, --pop: pops the top directory from the stack, then changes to that directory
    goto -o|--pop
  -l, --list: lists aliases
    goto -l|--list
  -x, --expand: expands an alias
    goto -x|--expand &lt;alias&gt;
  -c, --cleanup: cleans up non existent directory aliases
    goto -c|--cleanup
  -h, --help: prints this help
    goto -h|--help
  -v, --version: displays the version of the goto script
    goto -v|--version
USAGE
}

# Displays version
_goto_version()
{
  echo "goto version 1.2.4.1"
}

# Expands directory.
# Helpful for ~, ., .. paths
_goto_expand_directory()
{
  builtin cd "$1" 2&gt;/dev/null &amp;&amp; pwd
}

# Lists registered aliases.
_goto_list_aliases()
{
  local IFS=$' '
  if [ -f "$GOTO_DB" ]; then
    while read -r name directory; do
      printf '\e[1;36m%20s  \e[0m%s\n' "$name" "$directory"
    done &lt; "$GOTO_DB"
  else
    echo "You haven't configured any directory aliases yet."
  fi
}

# Expands a registered alias.
_goto_expand_alias()
{
  if [ "$#" -ne "1" ]; then
    _goto_error "usage: goto -x|--expand &lt;alias&gt;"
    return
  fi

  local resolved

  resolved=$(_goto_find_alias_directory "$1")
  if [ -z "$resolved" ]; then
    _goto_error "alias '$1' does not exist"
    return
  fi

  echo "$resolved"
}

# Lists duplicate directory aliases
_goto_find_duplicate()
{
  local duplicates=

  duplicates=$(sed -n 's:[^ ]* '"$1"'$:&amp;:p' "$GOTO_DB" 2&gt;/dev/null)
  echo "$duplicates"
}

# Registers and alias.
_goto_register_alias()
{
  if [ "$#" -ne "2" ]; then
    _goto_error "usage: goto -r|--register &lt;alias&gt; &lt;directory&gt;"
    return 1
  fi

  if ! [[ $1 =~ ^[[:alnum:]]+[a-zA-Z0-9_-]*$ ]]; then
    _goto_error "invalid alias - can start with letters or digits followed by letters, digits, hyphens or underscores"
    return 1
  fi

  local resolved
  resolved=$(_goto_find_alias_directory "$1")

  if [ -n "$resolved" ]; then
    _goto_error "alias '$1' exists"
    return 1
  fi

  local directory
  directory=$(_goto_expand_directory "$2")
  if [ -z "$directory" ]; then
    _goto_error "failed to register '$1' to '$2' - can't cd to directory"
    return 1
  fi

  local duplicate
  duplicate=$(_goto_find_duplicate "$directory")
  if [ -n "$duplicate" ]; then
    _goto_warning "duplicate alias(es) found: \\\n$duplicate"
  fi

  # Append entry to file.
  echo "$1 $directory" &gt;&gt; "$GOTO_DB"
  echo "Alias '$1' registered successfully."
}

# Unregisters the given alias.
_goto_unregister_alias()
{
  if [ "$#" -ne "1" ]; then
    _goto_error "usage: goto -u|--unregister &lt;alias&gt;"
    return 1
  fi

  local resolved
  resolved=$(_goto_find_alias_directory "$1")
  if [ -z "$resolved" ]; then
    _goto_error "alias '$1' does not exist"
    return 1
  fi

  # shellcheck disable=SC2034
  local readonly GOTO_DB_TMP="$HOME/.goto_"
  # Delete entry from file.
  sed "/^$1 /d" "$GOTO_DB" &gt; "$GOTO_DB_TMP" &amp;&amp; mv "$GOTO_DB_TMP" "$GOTO_DB"
  echo "Alias '$1' unregistered successfully."
}

# Pushes the current directory onto the stack, then goto
_goto_directory_push()
{
  if [ "$#" -ne "1" ]; then
    _goto_error "usage: goto -p|--push &lt;alias&gt;"
    return
  fi

  { pushd . || return; } 1&gt;/dev/null 2&gt;&amp;1

  _goto_directory "$@"
}

# Pops the top directory from the stack, then goto
_goto_directory_pop()
{
  { popd || return; } 1&gt;/dev/null 2&gt;&amp;1
}

# Unregisters aliases whose directories no longer exist.
_goto_cleanup()
{
  if ! [ -f "$GOTO_DB" ]; then
    return
  fi

  while IFS= read -r i &amp;&amp; [ -n "$i" ]; do
    echo "Cleaning up: $i"
    _goto_unregister_alias "$i"
  done &lt;&lt;&lt; "$(awk '{al=$1; $1=""; dir=substr($0,2);
                    system("[ ! -d \"" dir "\" ] &amp;&amp; echo " al)}' "$GOTO_DB")"
}

# Changes to the given alias' directory
_goto_directory()
{
  local target

  target=$(_goto_resolve_alias "$1") || return 1

  builtin cd "$target" 2&gt; /dev/null || \
    { _goto_error "Failed to goto '$target'" &amp;&amp; return 1; }
}

# Fetches the alias directory.
_goto_find_alias_directory()
{
  local resolved

  resolved=$(sed -n "s/^$1 \\\\(.*\\\\)/\\\1/p" "$GOTO_DB" 2&gt;/dev/null)
  echo "$resolved"
}

# Displays the given error.
# Used for common error output.
_goto_error()
{
  (&gt;&amp;2 echo -e "goto error: $1")
}

# Displays the given warning.
# Used for common warning output.
_goto_warning()
{
  (&gt;&amp;2 echo -e "goto warning: $1")
}

# Displays entries with aliases starting as the given one.
_goto_print_similar()
{
  local similar

  similar=$(sed -n "/^$1[^ ]* .*/p" "$GOTO_DB" 2&gt;/dev/null)
  if [ -n "$similar" ]; then
    (&gt;&amp;2 echo "Did you mean:")
    (&gt;&amp;2 column -t &lt;&lt;&lt; "$similar")
  fi
}

# Fetches alias directory, errors if it doesn't exist.
_goto_resolve_alias()
{
  local resolved

  resolved=$(_goto_find_alias_directory "$1")

  if [ -z "$resolved" ]; then
    _goto_error "unregistered alias $1"
    _goto_print_similar "$1"
    return 1
  else
    echo "${resolved}"
  fi
}

# Completes the goto function with the available commands
_complete_goto_commands()
{
  local IFS=$' \t\n'

  # shellcheck disable=SC2207
  COMPREPLY=($(compgen -W "-r --register -u --unregister -p --push -o --pop -l --list -x --expand -c --cleanup -v --version" -- "$1"))
}

# Completes the goto function with the available aliases
_complete_goto_aliases()
{
  local IFS=$'\n' matches
  _goto_resolve_db

  # shellcheck disable=SC2207
  matches=($(sed -n "/^$1/p" "$GOTO_DB" 2&gt;/dev/null))

  if [ "${#matches[@]}" -eq "1" ]; then
    # remove the filenames attribute from the completion method
    compopt +o filenames 2&gt;/dev/null

    # if you find only one alias don't append the directory
    COMPREPLY=("${matches[0]// *}")
  else
    for i in "${!matches[@]}"; do
      # remove the filenames attribute from the completion method
      compopt +o filenames 2&gt;/dev/null

      if ! [[ $(uname -s) =~ Darwin* ]]; then
        matches[$i]=$(printf '%*s' "-$COLUMNS" "${matches[$i]}")

        COMPREPLY+=("$(compgen -W "${matches[$i]}")")
      els