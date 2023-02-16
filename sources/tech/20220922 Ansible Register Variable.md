[#]: subject: "Ansible Register Variable"
[#]: via: "https://ostechnix.com/ansible-register/"
[#]: author: "Karthick https://ostechnix.com/author/karthick/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Ansible Register Variable
======
This guide explains **what is Ansible register** and how to **capture a task output in Ansible using the register** variables in Linux.

#### Contents

1. Introduction To Ansible Register Variable
2. Register The Output
3. Accessing Individual Attributes
4. Decision Making Using Control Statement
5. Writing Register Output To A File
6. Iterate And Register
7. Conclusion

### Introduction To Ansible Register Variable

**Register** is used to capture the output of any task and store it in a variable. This variable can later be used along with print, loops, conditionals etc.

When you run a task in **[Ansible][1]**, the entire output of the task will not be printed to stdout(Terminal). If you wish to see the output of the task, then you have to store it in the register variable and then later print it.

In ansible, **[debug module][2]** is used to print the output to the terminal. You can also create a decision-based task by combining the register attributes with the conditional statement(when).

In the upcoming sections, you will learn how to register the output, understand the structure of the register output, print the output to stdout, Write output to a file and use register with when statement.

### Register The Output

Let's see how to use the register module through a use case. On my Ubuntu managed node, I need to check whether the virtualenv package is installed. If the package is not installed I will install it.

Create a new **[playbook][3]** and add the following play definition. Modify the play definition parameters as per your requirements.

```
- name: Test playbook - ansible register
  hosts: ubuntu.anslab.com
  gather_facts: False
  become: True
```

I have the following task which will use the shell module to run the `"which virtualenv"` command. The output of this task is captured in the register variable named **"virtualenv_output"**. You can name this variable as per your wish.

In the second task, the register variable "`virtualenv_output` " will be printed using the debug module.

```
tasks:

    - name: First Task - Using shell module to check if virtualenv is present or not
      ansible.builtin.shell:
        cmd: which virtualenv 
      register: virtualenv_output
      ignore_errors: True

    - name: Second Task - Print the full output
      ansible.builtin.debug:
        var: virtualenv_output
```

**Heads Up:** Using the **apt** module, you can simplify this task. But for demonstration purposes, I am using the **shell** module.

Check if there is any syntax error before submitting the playbook by running the following command.

```
$ ansible-playbook --syntax-check
```

Run the following command to submit the playbook.

```
$ ansible-playbook
```

In the below output, you can see the output of the first task. The output will be in `JSON` format. Depending upon the module and the task, the output will vary.

![Register The Output][4]

A few important attributes in the output will help you to write further logic in the playbook.

1. Failed - Return "True" if the task is failed and "False" if successfully executed.
2. Rc - The return code of the command submitted through the shell module.
3. Stderr, `Stderr`_line - Error messages.
4. Stdout, `Stdout`_lines - Stdout messages.

### Accessing Individual Attributes

Take a look at the below task. Instead of printing the entire output of the register variable, I am just trying to print the return code.

```
- name: Just checking the exit code 
     ansible.builtin.debug:
       msg: "{{ virtualenv_output.rc }}"
```

In the below output, you can see only the return code is printed instead of the full output.

![Print Only Return Code][5]

Alternative to the **dot** notation, you can also access the attributes using the **python dictionary** notation.

```
- name: Just checking the exit code - Python dict way
     ansible.builtin.debug:
       msg: "{{ virtualenv_output['rc'] }}"
```

### Decision Making Using Control Statement

Let’s build further logic based on the return code from the first task. If the return code is 1, then the task is said to be failed meaning there is no virtualenv package in my managed node.

Take a look at the below task where I am using the apt module to install the **"python3-virtualenv"** package. This task will only run when if the return code of the register variable is not equal to zero. Again I am registering this task output to the variable called **"virtualevn_install_output"**.

```
- name: Install the package based on the return code
     ansible.builtin.apt:
       pkg: python3-virtualenv
       state: present
     when: virtualenv_output.rc != 0
     register: virtualenv_install_output
```

### Writing Register Output To A File

Instead of using the debug module to print the output to stdout(Terminal), you can write the output to a file. There are many modules to do this task but here I am using the **copy** module and storing the content of the register variable in the file `virtualenv_output`.

```
- name: Reroute the output to a file
     ansible.builtin.copy:
       content: "{{virtualenv_install_output}}"
       dest: "/home/vagrant/virtualenv_output"
```

![Writing Register Output To A File][6]

### Iterate And Register

Take a look at the below task where I am using the **shell** module to remove some dummy files I manually created. Using **loop**, I am iterating through the list of files and passing it as the argument to the shell module.

The result of each iteration will be appended to the register variable **removed_output**.

```
- name: Using loops
     ansible.builtin.shell:
       cmd: rm -f "{{item}}"
     register: removed_output
     loop:
       - test_file.txt
       - abc.txt

   - name: Print the removed output
     ansible.builtin.debug:
       msg:
         - Return code for {{removed_output.results.0.item}} is {{removed_output.results.0.rc}}
         - Return code for {{removed_output.results.1.item}} is {{removed_output.results.1.rc}}
```

![Iterate And Register][7]

### Conclusion

In this article, we have discussed what is ansible register variable and how to register the task output. We also discussed how to use the attributes from the register variable along with a conditional statement to create the condition-based task. Finally, we have seen how the output is appended to the register variable when you run a task iteratively.

--------------------------------------------------------------------------------

via: https://ostechnix.com/ansible-register/

作者：[Karthick][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/karthick/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/introduction-to-ansible-automation-platform/
[2]: https://ostechnix.com/ansible-debug-module/
[3]: https://ostechnix.com/ansible-playbooks/
[4]: https://ostechnix.com/wp-content/uploads/2022/09/Register-The-Output.png
[5]: https://ostechnix.com/wp-content/uploads/2022/09/Print-Only-Return-Code.png
[6]: https://ostechnix.com/wp-content/uploads/2022/09/Writing-Register-Output-To-A-File.png
[7]: https://ostechnix.com/wp-content/uploads/2022/09/Iterate-And-Register.png
