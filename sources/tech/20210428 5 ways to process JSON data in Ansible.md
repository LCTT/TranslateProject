[#]: subject: (5 ways to process JSON data in Ansible)
[#]: via: (https://opensource.com/article/21/4/process-json-data-ansible)
[#]: author: (Nicolas Leiva https://opensource.com/users/nicolas-leiva)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

5 ways to process JSON data in Ansible
======
Structured data is friendly for automation, and you can take full
advantage of it with Ansible.
![Net catching 1s and 0s or data in the clouds][1]

Exploring and validating data from an environment is a common practice for preventing service disruptions. You can choose to run the process periodically or on-demand, and the data you're checking can come from different sources: telemetry, command outputs, etc.

If the data is _unstructured_, you must do some custom regex magic to retrieve key performance indicators (KPIs) relevant for specific scenarios. If the data is _structured_, you can leverage a wide array of options to make parsing it simpler and more consistent. Structured data conforms to a data model, which allows access to each data field separately. The data for these models is exchanged as key/value pairs and encoded using different formats. JSON, which is widely used in Ansible, is one of them.

There are many resources available in Ansible to work with JSON data, and this article presents five of them. While all these resources are used together in sequence in the examples, it is probably sufficient to use just one or two in most real-life scenarios.

![Magnifying glass looking at 0's and 1's][2]

([Geralt][3], Pixabay License)

The following code snippet is a short JSON document used as input for the examples in this article. If you just want to see the code, it's available in my [GitHub repository][4].

This is sample [pyATS][5] output from a `show ip ospf neighbors` command on a Cisco IOS-XE device:


```
{
   "parsed": {
      "interfaces": {
          "Tunnel0": {
              "neighbors": {
                  "203.0.113.2": {
                      "address": "198.51.100.2",
                      "dead_time": "00:00:39",
                      "priority": 0,
                      "state": "FULL/  -"
                  }
              }
          },
          "Tunnel1": {
              "neighbors": {
                  "203.0.113.2": {
                      "address": "192.0.2.2",
                      "dead_time": "00:00:36",
                      "priority": 0,
                      "state": "INIT/  -"
                  }
              }
          }
      }
   }
}
```

This document lists various interfaces from a networking device describing the Open Shortest Path First ([OSPF][6]) state of any OSPF neighbor present per interface. The goal is to validate that the state of all these OSPF sessions is good (i.e., **FULL**).

This goal is visually simple, but if you have a lot of entries, it wouldn't be. Fortunately, as the following examples demonstrate, you can do this at scale with Ansible.

### 1\. Access a subset of the data

If you are only interested in a specific branch of the data tree, a reference to its path will take you down the JSON structure hierarchy and allow you to select only that portion of the JSON object. The path is made of dot-separated key names.

To begin, create a variable (`input`) in Ansible that reads the JSON-formatted message from a file.

To go two levels down, for example, you need to follow the hierarchy of the key names to that point, which translates to `input.parsed.interfaces`, in this case. `input` is the variable that stores the JSON data, `parsed` the top-level key, and `interfaces` is the subsequent one. In a playbook, this will looks like:


```
\- name: Go down the JSON file 2 levels
  hosts: localhost
  vars:
    input: "{{ lookup('file','output.json') | from_json }}"

  tasks:
   - name: Create interfaces Dictionary
     set_fact:
       interfaces: "{{ input.parsed.interfaces }}"

   - name: Print out interfaces
     debug:
       var: interfaces
```

It gives the following output:


```
TASK [Print out interfaces] *************************************************************************************************************************************
ok: [localhost] =&gt; {
    "msg": {
        "Tunnel0": {
            "neighbors": {
                "203.0.113.2": {
                    "address": "198.51.100.2",
                    "dead_time": "00:00:39",
                    "priority": 0,
                    "state": "FULL/  -"
                }
            }
        },
        "Tunnel1": {
            "neighbors": {
                "203.0.113.2": {
                    "address": "192.0.2.2",
                    "dead_time": "00:00:36",
                    "priority": 0,
                    "state": "INIT/  -"
                }
            }
        }
    }
}
```

The view hasn't changed much; you only trimmed the edges. Baby steps!

### 2\. Flatten out the content

If the previous output doesn't help or you want a better understanding of the data hierarchy, you can produce a more compact output with the `to_paths` filter:


```
\- name: Print out flatten interfaces input
  debug:
    msg: "{{ lookup('ansible.utils.to_paths', interfaces) }}"
```

This will print out as:


```
TASK [Print out flatten interfaces input] ***********************************************************************************************************************
ok: [localhost] =&gt; {
    "msg": {
        "Tunnel0.neighbors['203.0.113.2'].address": "198.51.100.2",
        "Tunnel0.neighbors['203.0.113.2'].dead_time": "00:00:39",
        "Tunnel0.neighbors['203.0.113.2'].priority": 0,
        "Tunnel0.neighbors['203.0.113.2'].state": "FULL/  -",
        "Tunnel1.neighbors['203.0.113.2'].address": "192.0.2.2",
        "Tunnel1.neighbors['203.0.113.2'].dead_time": "00:00:36",
        "Tunnel1.neighbors['203.0.113.2'].priority": 0,
        "Tunnel1.neighbors['203.0.113.2'].state": "INIT/  -"
    }
}
```

### 3\. Use json_query filter (JMESPath)

If you are familiar with a JSON query language such as [JMESPath][7], then Ansible's json_query filter is your friend because it is built upon JMESPath, and you can use the same syntax. If this is new to you, there are plenty of JMESPath examples you can learn from in [JMESPath examples][8]. It is a good resource to have in your toolbox.

Here's how to use it to create a list of the neighbors for all interfaces. The query executed in this is `*.neighbors`:


```
\- name: Create neighbors dictionary (this is now per interface)
  set_fact:
    neighbors: "{{ interfaces | json_query('*.neighbors') }}"

\- name: Print out neighbors
  debug:
    msg: "{{ neighbors }}"
```

Which returns a list you can iterate over:


```
TASK [Print out neighbors] **************************************************************************************************************************************
ok: [localhost] =&gt; {
    "msg": [
        {
            "203.0.113.2": {
                "address": "198.51.100.2",
                "dead_time": "00:00:39",
                "priority": 0,
                "state": "FULL/  -"
            }
        },
        {
            "203.0.113.2": {
                "address": "192.0.2.2",
                "dead_time": "00:00:36",
                "priority": 0,
                "state": "INIT/  -"
            }
        }
    ]
}
```

Other options to query JSON are [jq][9] or [Dq][10] (for pyATS).

### 4\. Access specific data fields

Now you can go through the list of neighbors in a loop to access individual data. This example is interested in the `state` of each one. Based on the field's value, you can trigger an action.

This will generate a message to alert the user if the state of a session isn't **FULL**. Typically, you would notify users through mechanisms like email or a chat message rather than just a log entry, as in this example.

As you loop over the `neighbors` list generated in the previous step, it executes the tasks described in `tasks.yml` to instruct Ansible to print out a **WARNING** message only if the state of the neighbor isn't **FULL** (i.e., `info.value.state is not match("FULL.*")`):


```
\- name: Loop over neighbors
  include_tasks: tasks.yml
  with_items: "{{ neighbors }}"
```

The `tasks.yml` file considers `info` as the dictionary item produced for each neighbor in the list you iterate over:


```
\- name: Print out a WARNING if OSPF state is not FULL
 debug:
   msg: "WARNING: Neighbor {{ info.key }}, with address {{ info.value.address }} is in state {{ info.value.state[0:4]  }}"
 vars:
   info: "{{ lookup('dict', item) }}"
 when: info.value.state is not match("FULL.*")
```

This produces a custom-generated message with different data fields for each neighbor that isn't operational:


```
TASK [Print out a WARNING if OSPF state is not FULL] ************************************************************************************************************
ok: [localhost] =&gt; {
    "msg": "WARNING: Neighbor 203.0.113.2, with address 192.0.2.2 is in state INIT"
}
```

> Note: Filter JSON data in Ansible using [json_query][11].

### 5\. Use a JSON schema to validate your data

A more sophisticated way to validate the data from a JSON message is by using a JSON schema. This gives you more flexibility and a wider array of options to validate different types of data. A schema for this example would need to specify `state` is a `string` that starts with **FULL** if that's the only state you want to be valid (you can access this code in my [GitHub repository][12]):


```
{
 "$schema": "<http://json-schema.org/draft-07/schema\#>",
 "definitions": {
     "neighbor" : {
         "type" : "object",
         "properties" : {
             "address" : {"type" : "string"},
             "dead_time" : {"type" : "string"},
             "priority" : {"type" : "number"},
             "state" : {
                 "type" : "string",
                 "pattern" : "^FULL"
                 }
             },
         "required" : [ "address","state" ]
     }
 },
 "type": "object",
 "patternProperties": {
     ".*" : { "$ref" : "#/definitions/neighbor" }
 }
}
```

As you loop over the neighbors, it reads this schema (`schema.json`) and uses it to validate each neighbor item with the module `validate` and engine `jsonschema`:


```
\- name: Validate state of the neighbor is FULL
  ansible.utils.validate:
    data: "{{ item }}"
    criteria:
     - "{{ lookup('file',  'schema.json') | from_json }}"
    engine: ansible.utils.jsonschema
  ignore_errors: true
  register: result

\- name: Print the neighbor that does not satisfy the desired state
  ansible.builtin.debug:
    msg:
     - "WARNING: Neighbor {{ info.key }}, with address {{ info.value.address }} is in state {{ info.value.state[0:4] }}"
     - "{{ error.data_path }}, found: {{ error.found }}, expected: {{ error.expected }}"
  when: "'errors' in result"
  vars:
    info: "{{ lookup('dict', item) }}"
    error: "{{ result['errors'][0] }}"
```

Save the output of the ones that fail the validation so that you can alert the user with a message:


```
TASK [Validate state of the neighbor is FULL] *******************************************************************************************************************
fatal: [localhost]: FAILED! =&gt; {"changed": false, "errors": [{"data_path": "203.0.113.2.state", "expected": "^FULL", "found": "INIT/  -", "json_path": "$.203.0.113.2.state", "message": "'INIT/  -' does not match '^FULL'", "relative_schema": {"pattern": "^FULL", "type": "string"}, "schema_path": "patternProperties..*.properties.state.pattern", "validator": "pattern"}], "msg": "Validation errors were found.\nAt 'patternProperties..*.properties.state.pattern' 'INIT/  -' does not match '^FULL'. "}
...ignoring

TASK [Print the neighbor that does not satisfy the desired state] ***********************************************************************************************
ok: [localhost] =&gt; {
    "msg": [
        "WARNING: Neighbor 203.0.113.2, with address 192.0.2.2 is in state INIT",
        "203.0.113.2.state, found: INIT/  -, expected: ^FULL"
    ]
}
```

If you'd like a deeper dive:

  * You can find a more elaborated example and references in [Using new Ansible utilities for operational state management and remediation][13].
  * A good resource to practice JSON schema generation is the [JSON Schema Validator and Generator][14].
  * A similar approach is the [Schema Enforcer][15], which lets you create the schema in YAML (helpful if you prefer that syntax).



### Conclusion

Structured data is friendly for automation, and you can take full advantage of it with Ansible. As you determine your KPIs, you can automate checks on them to give you peace of mind in situations such as before and after a maintenance window.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/process-json-data-ansible

作者：[Nicolas Leiva][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nicolas-leiva
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_analytics_cloud.png?itok=eE4uIoaB (Net catching 1s and 0s or data in the clouds)
[2]: https://opensource.com/sites/default/files/uploads/data_pixabay.jpg (Magnifying glass looking at 0's and 1's)
[3]: https://pixabay.com/illustrations/window-hand-magnifying-glass-binary-4354467/
[4]: https://github.com/nleiva/ansible-networking/blob/master/test-json.md#parsing-json-outputs
[5]: https://pypi.org/project/pyats/
[6]: https://en.wikipedia.org/wiki/Open_Shortest_Path_First
[7]: https://jmespath.org/
[8]: https://jmespath.org/examples.html
[9]: https://stedolan.github.io/jq/
[10]: https://pubhub.devnetcloud.com/media/genie-docs/docs/userguide/utils/index.html
[11]: https://blog.networktocode.com/post/ansible-filtering-json-query/
[12]: https://github.com/nleiva/ansible-networking/blob/master/files/schema.json
[13]: https://www.ansible.com/blog/using-new-ansible-utilities-for-operational-state-management-and-remediation
[14]: https://extendsclass.com/json-schema-validator.html
[15]: https://blog.networktocode.com/post/introducing_schema_enforcer/
