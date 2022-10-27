[#]: subject: (Processing modular and dynamic configuration files in shell)
[#]: via: (https://opensource.com/article/21/5/processing-configuration-files-shell)
[#]: author: (Evan "Hippy" Slatis https://opensource.com/users/hippyod)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Processing modular and dynamic configuration files in shell
======
Learn how to manage frequent changes within configuration files better.
![Coding on a computer][1]

While working on a continuous integration/continuous development (CI/CD) solution for a customer, one of my first tasks was to automate the bootstrapping of a CI/CD Jenkins server in OpenShift. Following DevOps best practices, I quickly created a configuration file that drove a script to complete the job. That quickly became two configuration files when I realized I needed a separate Jenkins server for production. After that came the request that the customer needed more than one pair of engineering and production CI/CD servers for different groups, and each server had similar but slightly different configurations.

When the inevitable changes had to be made to the values common to two or more of the servers, it was very difficult and error-prone to propagate the changes across two or four files. As CI/CD environments were added for more complex testing and deployments, the number of shared and specific values for each group and environment grew.

As the changes became more frequent and the data more complex, making changes within the configuration files became more and more unmanageable. I needed a better solution to solve this age-old problem and manage changes faster and more reliably. More importantly, I needed a solution that would allow my clients to do the same after turning my completed work over to them.

### Defining the problem

On the surface, this sounds like a very straightforward problem. Given `my-config-file.conf` (or a `*.ini` or `*.properties`) file:


```
KEY_1=value-1
KEY_2=value-2
```

You just have to execute this line at the top of your script:


```
#!/usr/bin/bash

set -o allexport
source my-config-file.conf
set +o allexport
```

This code realizes all the variables inside your configuration file in the environment, and `set -o allexport` automatically exports them all. The original file, being a typical key/value properties file, is also very standard and easy to parse into another system. Where it gets more complicated is in the following scenarios:

  1. **Some of the values are copied and pasted from variable to variable and are related.** Besides violating the DRY ("don't repeat yourself") principle, it's error-prone, especially when values need to be changed. How can values within the file be reused?
  2. **Portions of the configuration file are reusable over multiple runs of the original script, and others are useful only for a specific run.** How do you move beyond copy and paste and modularize the data so that some pieces can be reused elsewhere?
  3. **Once the files are modularized, how do you handle conflicts and define precedent?** If a key is defined twice in the same file, which value do you take? If two configuration files define the same key, which gets precedence? How can a specific install override a shared value?
  4. **The configuration files are initially intended to be used by a shell script and are written for processing by shell scripts. If the configuration files need to be loaded or reused in another environment, is there a way to make them easily available to other systems without further processing?** I wanted to move some of the key/value pairs into a single ConfigMap in Kubernetes. What's the best way to make the processed data available to make the import process straightforward and easy so that other systems don't have to understand how the config files are structured?



This article will take you through some simple code snippets and show how easy this is to implement.

### Defining the configuration file content

Sourcing a file means it will source variables as well as other shell statements like commands. For this purpose, configuration files should only be about key/value pairs and not about defining functions or executing code. Therefore, I'll define these files similarly to property and .ini files:


```
KEY_1=${KEY_2}
KEY_2=value-2
...
KEY_N=value-n
```

From this file, you should expect the following behavior:


```
$ source my-config-file.conf
$ echo $KEY_1
value-2
```

I purposefully made this a little counterintuitive in that it refers to a value I haven't even defined yet. Later in this article, I will show you the code to handle this scenario.

### Defining modularization and precedence

To keep the code simple and make defining the files intuitive, I implemented a left-to-right, top-to-bottom precedence strategy for files and variables, respectively. More specifically, given a list of configuration files:

  1. Each file in the list would be processed first-to-last (left-to-right)
  2. The first definition of a key would define the value, and subsequent values would be ignored



There are many ways to do this, but I found this strategy straightforward, easy to code, and easy to explain to others. In other words, I am not claiming this is the best design decision, but it works, and it simplifies debugging.

Given this colon-delimited list of two configuration files:


```
`first.conf:second.conf`
```

with these contents:


```
# first.conf
KEY_1=value-1
KEY_1=ignored-value

[/code] [code]

# first.conf
KEY_1=ignored-value
```

you would expect:


```
$ echo $KEY_1
value-1
```

### The solution

This function will implement the defined requirements:


```
_create_final_configuration_file() {
    # convert the list of files into an array
    local CONFIG_FILE_LIST=($(echo ${1} | tr ':' ' '))
    local WORKING_DIR=${2}

    # removes any trailing whitespace from each file, if any
    # this is absolutely required when importing into ConfigMaps
    # put quotes around values if extra spaces are necessary
    sed -i -e 's/\s*$//' -e '/^$/d' -e '/^#.*$/d' ${CONFIG_FILE_LIST[@]}

    # iterates over each file and prints (default awk behavior)
    # each unique line; only takes first value and ignores duplicates
    awk -F= '!line[$1]++' ${CONFIG_FILE_LIST[@]} &gt; ${COMBINED_CONFIG_FILE}

    # have to export everything, and source it twice:
    # 1) first source is to realize variables
    # 2) second time is to realize references
    set -o allexport
    source ${COMBINED_CONFIG_FILE}
    source ${COMBINED_CONFIG_FILE}
    set +o allexport

    # use envsubst command to realize value references
    cat ${COMBINED_CONFIG_FILE} | envsubst &gt; ${FINAL_CONFIG_FILE}
```

It performs the following steps:

  1. It trims extraneous white space from each line.
  2. It iterates through each file and writes out each line with a unique key (i.e. thanks to `awk` magic, it skips duplicate keys) to an intermediate configuration file.
  3. It sources the intermediate file twice to realize all references in memory.
  4. The referenced values in the intermediate file are realized from the values now in memory and written out to a final configuration file, which can be used for further processing.



As the above notes, when the combined configuration intermediate file is sourced, it must be done twice. This is so that the referenced values that are defined after being referenced can be properly realized in memory. The `envsubst` substitutes the values of environment variables, and the output is redirected to the final configuration file for possible postprocessing. Per the previous example's requirement, this can take the form of realizing the data in a ConfigMap:


```
kubectl create cm my-config-map --from-env-file=${FINAL_CONFIG_FILE} \
    -n my-namespace
```

### Sample code

You can find sample code with `specific.conf` and `shared.conf` files demonstrating how you can combine files representing a specific configuration file and a general, shared configuration file in my GitHub repository [modular-config-file-sample][2]. The configuration files are composed of:


```
# specific.conf
KEY_1=${KEY_2}
KEY_2='some value'
KEY_1='this value will be ignored'

[/code] [code]

# shared.conf
SHARED_KEY_1='some shared value'
SHARED_KEY_2=${SHARED_KEY_1}
SHARED_KEY_1='this value will never see the light of day'
KEY_1='this was overridden'
```

Note the single quotes around the values. I purposefully chose example values with spaces to make things more interesting and so that the values had to be in quotes; otherwise, when the files are sourced, each word would be interpreted as a separate command. However, the variable references do not need to be in quotes once the values are set.

The repository contains a small shell script utility, `pconfs.sh`. Here's what happens when you run the following command from within the sample code directory:


```
# NOTE: see the sample code for the full set of command line options
$ ./pconfs.sh -f specific.conf:shared.conf

================== COMBINED CONFIGS BEFORE =================
KEY_1=${KEY_2}
KEY_2='some value'
SHARED_KEY_1='some shared value'
SHARED_KEY_2=${SHARED_KEY_1}
================ COMBINED CONFIGS BEFORE END ===============

================= PROOF OF SUBST IN MEMORY =================
KEY_1: some value
SHARED_KEY_2: some shared value
=============== PROOF OF SUBST IN MEMORY END ===============

================== PROOF OF SUBST IN FILE ==================
KEY_1=some value
KEY_2='some value'
SHARED_KEY_1='some shared value'
SHARED_KEY_2=some shared value
================ PROOF OF SUBST IN FILE END ================
```

This proves that even complex values may be referenced before and after a value is defined. It also shows that only the first definition of the value is retained, whether within or across files, and that precedence is given left to right in your list of files. This is why I specify parsing specific.conf first when running this command; this allows a specific configuration to override any of the more general, shared values in the example.

You should now have an easy-to-implement solution for creating and using modular configuration files in the shell. Also, the results of processing the files should be easy enough to use or import without requiring the other system to understand the data's original format or organization.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/processing-configuration-files-shell

作者：[Evan "Hippy" Slatis][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hippyod
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://github.com/hippyod/modular-config-file-sample
