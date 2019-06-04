[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using Testinfra with Ansible to verify server state)
[#]: via: (https://opensource.com/article/19/5/using-testinfra-ansible-verify-server-state)
[#]: author: (Clement Verna https://opensource.com/users/cverna/users/paulbischoff/users/dcritch/users/cobiacomm/users/wgarry155/users/kadinroob/users/koreyhilpert)

Using Testinfra with Ansible to verify server state
======
Testinfra is a powerful library for writing tests to verify an
infrastructure's state. Coupled with Ansible and Nagios, it offers a
simple solution to enforce infrastructure as code.
![Terminal command prompt on orange background][1]

By design, [Ansible][2] expresses the desired state of a machine to ensure that the content of an Ansible playbook or role is deployed to the targeted machines. But what if you need to make sure all the infrastructure changes are in Ansible? Or verify the state of a server at any time?

[Testinfra][3] is an infrastructure testing framework that makes it easy to write unit tests to verify the state of a server. It is a Python library and uses the powerful [pytest][4] test engine.

### Getting started with Testinfra

Testinfra can be easily installed using the Python package manager (pip) and a Python virtual environment.


```
$ python3 -m venv venv
$ source venv/bin/activate
(venv) $ pip install testinfra
```

Testinfra is also available in the package repositories of Fedora and CentOS using the EPEL repository. For example, on CentOS 7 you can install it with the following commands:


```
$ yum install -y epel-release
$ yum install -y python-testinfra
```

#### A simple test script

Writing tests in Testinfra is easy. Using the code editor of your choice, add the following to a file named **test_simple.py** :


```
import testinfra

def test_os_release(host):
assert host.file("/etc/os-release").contains("Fedora")

def test_sshd_inactive(host):
assert host.service("sshd").is_running is False
```

By default, Testinfra provides a host object to the test case; this object gives access to different helper modules. For example, the first test uses the **file** module to verify the content of the file on the host, and the second test case uses the **service** module to check the state of a systemd service.

To run these tests on your local machine, execute the following command:


```
(venv)$ pytest test_simple.py
================================ test session starts ================================
platform linux -- Python 3.7.3, pytest-4.4.1, py-1.8.0, pluggy-0.9.0
rootdir: /home/cverna/Documents/Python/testinfra
plugins: testinfra-3.0.0
collected 2 items
test_simple.py ..

================================ 2 passed in 0.05 seconds ================================
```

For a full list of Testinfra's APIs, you can consult the [documentation][5].

### Testinfra and Ansible

One of Testinfra's supported backends is Ansible, which means Testinfra can directly use Ansible's inventory file and a group of machines defined in the inventory to run tests against them.

Let's use the following inventory file as an example:


```
[web]
app-frontend01
app-frontend02

[database]
db-backend01
```

We want to make sure that our Apache web server service is running on **app-frontend01** and **app-frontend02**. Let's write the test in a file called **test_web.py** :


```
def check_httpd_service(host):
"""Check that the httpd service is running on the host"""
assert host.service("httpd").is_running
```

To run this test using Testinfra and Ansible, use the following command:


```
(venv) $ pip install ansible
(venv) $ py.test --hosts=web --ansible-inventory=inventory --connection=ansible test_web.py
```

When invoking the tests, we use the Ansible inventory **[web]** group as the targeted machines and also specify that we want to use Ansible as the connection backend.

#### Using the Ansible module

Testinfra also provides a nice API to Ansible that can be used in the tests. The Ansible module enables access to run Ansible plays inside a test and makes it easy to inspect the result of the play.


```
def check_ansible_play(host):
"""
Verify that a package is installed using Ansible
package module
"""
assert not host.ansible("package", "name=httpd state=present")["changed"]
```

By default, Ansible's [Check Mode][6] is enabled, which means that Ansible will report what would change if the play were executed on the remote host.

### Testinfra and Nagios

Now that we can easily run tests to validate the state of a machine, we can use those tests to trigger alerts on a monitoring system. This is a great way to catch unexpected changes.

Testinfra offers an integration with [Nagios][7], a popular monitoring solution. By default, Nagios uses the [NRPE][8] plugin to execute checks on remote hosts, but using Testinfra allows you to run the tests directly from the Nagios master.

To get a Testinfra output compatible with Nagios, we have to use the **\--nagios** flag when triggering the test. We also use the **-qq** pytest flag to enable pytest's **quiet** mode so all the test details will not be displayed.


```
(venv) $ py.test --hosts=web --ansible-inventory=inventory --connection=ansible --nagios -qq line test.py
TESTINFRA OK - 1 passed, 0 failed, 0 skipped in 2.55 seconds
```

Testinfra is a powerful library for writing tests to verify an infrastructure's state. Coupled with Ansible and Nagios, it offers a simple solution to enforce infrastructure as code. It is also a key component of adding testing during the development of your Ansible roles using [Molecule][9].

* * *

Sysadmins who think the cloud is a buzzword and a bunch of hype should check out Ansible.

Can you really do DevOps without sharing scripts or code? DevOps manifesto proponents value cross-...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/using-testinfra-ansible-verify-server-state

作者：[Clement Verna][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cverna/users/paulbischoff/users/dcritch/users/cobiacomm/users/wgarry155/users/kadinroob/users/koreyhilpert
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE (Terminal command prompt on orange background)
[2]: https://www.ansible.com/
[3]: https://testinfra.readthedocs.io/en/latest/
[4]: https://pytest.org/
[5]: https://testinfra.readthedocs.io/en/latest/modules.html#modules
[6]: https://docs.ansible.com/ansible/playbooks_checkmode.html
[7]: https://www.nagios.org/
[8]: https://en.wikipedia.org/wiki/Nagios#NRPE
[9]: https://github.com/ansible/molecule
