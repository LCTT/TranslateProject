[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use this script to create, save, and run different rsync configurations via named profiles)
[#]: via: (https://opensource.com/article/20/1/create-save-run-rsync-configurations)
[#]: author: (Petr Beránek https://opensource.com/users/pberanek)

Use this script to create, save, and run different rsync configurations via named profiles
======
A quick explanation of the rpf script.
![Person drinking a hat drink at the computer][1]

The **rpf** script allows you to create, save, and run different rsync configurations via named profiles.

For example, create a new profile named **backup** by typing **rpf -c backup**. Assume that the username is **user**.

**rpf** creates the following directories:

  * **/home/user/.rpf**
  * **/home/user/.rpf/shared** where you can place config files shared by multiple profiles
  * **/home/user/.rpf/profiles** where all profiles are saved as subdirectories



**rpf** also created **/home/user/.rpf/profiles/backup** that contains the files **conf** and **excluded**.

The **conf** file defines rsync's configuration:


```
# rsync config template
#
# Write each rsync option on separate line. For option details see man rsync.
# Empty lines and lines starting with # are ignored. Dynamic references
# (e.g. using command substitution) are not supported.
#
# Config files shared between different profiles should be saved in
# /home/user/.rpf/shared
#
# Example configuration:
#
\--verbose
\--archive
\--human-readable
# exclude all files that match pattern in:
\--exclude-from=/home/user/.rpf/profiles/backup/exclude
\--relative
# perform trial run, make no changes
\--dry-run
# source, e.g.
/home/user
# destination, e.g.
/mnt/usb_drive/users_backup
```

Now you can edit, add, or remove rsync options as needed.

In **exclude**, you can define paths or patterns of files and directories you want to exclude from the transfer. To exclude **Trash** and **Downloads**, add the following lines:


```
\- /home/user/.local/share/Trash
\- /home/user/Downloads
```

Or to transfer only **Documents** and **Projects** and exclude everything else:


```
\+ /home/user/Documents
\+ /home/user/Projects
\- **
```

For subtler pattern configurations, see the FILTER RULES section of **man rsync**, or Google for tutorials.

When you are ready, you can start rsync transfer by typing **rpf backup**.

That's it.

For additional **rpf** options, see **rpf --help**.

### Security

Please be aware that **rpf** is not secure against code injection in the **conf** file. Any additional code (e.g., **; ./run_evil_script**) will also be executed. Therefore, protect your **.rpf/** config directory from malicious users by implementing appropriate permissions. Moreover, exploiting this behavior can lead to unexpected side effects.

### The script


```
#!/usr/bin/env bash
#
# Simple rsync profiler
#
# Author: [petrberanek.mail@gmail.com][2] (Petr Beranek)
#
# For usage details type `rpf --help'
#

set -o errexit
set -o nounset

__name=$(basename "${0}")
__version="0.1"

config_dir="${HOME}/.rpf"
profiles_dir="${config_dir}/profiles"
shared_dir="${config_dir}/shared"
help="\
Usage: ${__name} [OPTION...] PROFILE_NAME

${__name} is simple rsync profiler that stores your different rsync
configurations in named profiles.

Options:
    -c, --create-profile PROFILE_NAME   create new profile (profile data
                            are stored in ${config_dir}/PROFILE_NAME).
                            Profile name can contain alphanumeric
                            characters only.
    -s, --show-profile-config PROFILE_NAME  show content of profile
                            configuration file (stored in
                            ${config_dir}/PROFILE_NAME)
    -l, --list-profiles     list all available profiles
    -h, --help              show this help

Example:
    Create new profile by typing
    ${__name} -c PROFILE_NAME

    edit its config files stored by default in
    ${profiles_dir}/PROFILE_NAME

    and then run it by typing
    ${__name} PROFILE_NAME

    That's it.

${__name} comes with ABSOLUTELY NO WARRANTY. This is free software,
and you are welcome to redistribute it under certain conditions. See
the GNU General Public Licence for details.

Email bug reports or enhancement requests to [petrberanek.mail@gmail.com][2].
"

create_profile() {
    # Create dir with given profile name and with default content.
    #
    # Arguments: $1 -- profile name
    #
    # Creates files: conf, exclude
    #
    # If dir with the same name already exists, exits with error.
    #

    local profile_name="${1}"
    local profile_dir="${profiles_dir}/${profile_name}"

    # create default rpf dirs if missing
    if [[ ! -d "${profiles_dir}" ]]; then
        echo "Creating ${profiles_dir}"
        mkdir --parents "${profiles_dir}"
    fi
    if [[ ! -d "${shared_dir}" ]]; then
        echo "Creating ${shared_dir}"
        mkdir --parents "${shared_dir}"
    fi

    # don't overwrite existing profile
    if [[ -d "${profile_dir}" ]]; then
        echo "${__name}: error: profile already exists."
        exit 1
    fi

    echo "Creating ${profile_dir}"
    mkdir "${profile_dir}"

    # create `conf' template
    local conf="${profile_dir}/conf"
    echo "Creating ${conf}"
    cat &lt;&lt; EOF &gt; "${conf}"
# rsync config template
#
# Write each rsync option on separate line. For details see man rsync.
# Empty lines and lines starting with # are ignored. Dynamic references
# (e.g. using command substitution) are not supported.
#
# Config files shared between different profiles should be saved in
# ${shared_dir}
#
# Example configuration:
#
\--verbose
\--archive
\--human-readable
# file with patterns of files and directories in source excluded
# from transfer
\--exclude-from="${profiles_dir}/${profile_name}/exclude"
\--relative
# perform trial run, make no changes
\--dry-run
# source, e.g.
${HOME}
# destination, e.g.
/mnt/usb_drive/my_backup
EOF

    # create `exclude' template
    local exclude="${profile_dir}/exclude"
    echo "Creating ${exclude}"
    cat &lt;&lt; EOF &gt; "${exclude}"
# \\`exclude' template
#
# Lines starting with # or ; are ignored. For details see man rsync,
# section FILTER RULES.
#
EOF

    # all done
    echo "OK"
    echo "Edit profile config files in ${profile_dir} to fit your needs."
}

list_profiles() {
    # Show all available rpf profiles.
    #
    # Assumes that all dirs in $profiles_dir are profiles.
    #

    for item in "${profiles_dir}"/*; do
        if [[ -d "${item}" ]]; then
            basename "${item}"
        fi
    done
}

show_help() { echo "${help}"; }

show_profile_config() {
    # Show configuration file for given profile.
    #
    # Arguments: $1 -- profile name
    #

    local profile_name="${1}"
    less "${profiles_dir}/${profile_name}/conf"
}

check_profile_name() {
    # Check that name is not empty and contains alphanumeric chars only.
    #
    # Arguments: $1 -- profile name
    #
    # If test fails, exits with error.
    #

    if [[ -z "${1}" ]]; then
        echo "${__name}: error: empty profile name."
        exit 1
    elif [[ "${1}" =~ [^a-zA-Z0-9] ]]; then
        echo "${__name}: error: non-alphanumeric characters in profile name."
        exit 1
    fi
}

check_profile_exists() {
    # Check that $profile_name exists and is a directory.
    #
    # Arguments: $1 -- profile name
    #
    # If test fails, exits with error.
    #

    local profile_name="${1}"
    if [[ ! -d "${profiles_dir}/${profile_name}" ]]; then
        echo "${__name}: error: profile ${profile_name} does not exist."
        exit 1
    fi
}

check_num_args() {
    # Check that value of $1 = number of arguments (excluding $1)
    #
    # Arguments: $1 -- limit (positive int)
    #
    # If test fails, exits with error.
    #

    local num_args=$(( ${#} - 1 ))  # do not count $1 in total num of args
    if [[ "${1}" -ne "${num_args}" ]]; then
        echo "${__name}: error: expected num args: ${1}, received: $num_args"
        exit 1
    fi
}

run_rsync() {
    # Run rsync with configuration coresponding to given profile name.
    #
    # Arguments: $1 -- profile name
    #

    local profile_name="${1}"
    local visual_div="=============================="
    local parsed_args
    parsed_args=$(grep --invert-match '^#' "${profiles_dir}/${profile_name}/conf" \
                    | tr '\n' ' ')

    # Print debug info
    echo "${visual_div}"
    echo "${__name} version: ${__version}"
    echo "args: ${parsed_args}"
    echo "${visual_div}"

    # Expand $parsed_args - each item from conf file becomes rsync argument
    # shellcheck disable=SC2086
    rsync ${parsed_args}
}

if [[ "${#}" == 0 ]]; then
    show_help
    exit 1
fi
while [[ "${#}" -gt 0 ]]; do
    case "${1}" in
        -c | --create-profile)
            check_num_args 2 "${@}"
            shift
            check_profile_name "${1:-}" # If $1 is not declared, set it empty.
            create_profile "${1}"
            exit 0;;
        -s | --show-profile-config)
            check_num_args 2 "${@}"
            shift
            check_profile_name "${1:-}"
            check_profile_exists "${1}"
            show_profile_config "${1}"
            exit 0;;
        -l | --list-profiles)
            check_num_args 1 "${@}"
            list_profiles
            exit 0;;
        -h | --help)
            check_num_args 1 "${@}"
            show_help
            exit 0;;
        -*)
            echo "${__name}: error: unknown option \\`${1}'"
            exit 1;;
        *)
            check_num_args 1 "${@}"
            check_profile_name "${1:-}"
            check_profile_exists "${1}"
            run_rsync "${1}"
            exit 0;;
    esac
    shift
done
```

* * *

This was originally published in [Petr Beranek's GitHub repository][3] and it is licensed under GPLv3.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/create-save-run-rsync-configurations

作者：[Petr Beránek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pberanek
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hat drink at the computer)
[2]: mailto:petrberanek.mail@gmail.com
[3]: https://github.com/beranep/rpf
