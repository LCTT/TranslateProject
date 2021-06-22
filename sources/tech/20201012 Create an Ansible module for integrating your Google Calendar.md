[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create an Ansible module for integrating your Google Calendar)
[#]: via: (https://opensource.com/article/20/10/ansible-module-go)
[#]: author: (Nicolas Leiva https://opensource.com/users/nicolas-leiva)

Create an Ansible module for integrating your Google Calendar
======
Learn how to write an Ansible module in Go to integrate Google Calendar
into your automation workflow.
![Business woman on laptop sitting in front of window][1]

In a [previous article][2], I explored how [Ansible][3] can integrate with Google Calendar for change management, but I didn't get into the details of the [Ansible module][4] that was built for this purpose. In this article, I will cover the nuts and bolts of it.

While most [Ansible modules][5]** **are written in [Python][6] (see [this example][7]), that's not the only option you have. You can use other programming languages if you prefer. And if you like [Go][8], this post is for you!

![Gopher illustration][9]

([Maria Letta's Free Gophers Pack][10], [Free Gophers License v1.0][11], modified with permission)

If you are new to Go, check out these [pointers to get started][12].

## Ansible and Go

There are at least four different ways that you can run a Go program from Ansible:

  1. Install Go and run your Go code with the `go run` command from Ansible.
  2. Cross-compile your Go code for different platforms before execution. Then call the proper binary from Ansible, based on the facts you collect from the host.
  3. Run your Go code or compiled binary from a container with the `containers.podman` [collection][13]. Something along the lines of: [code] - name: Run Go container
  podman_container:
    name: go_test_container
    image: golang
    command: go version
    rm: true
    log_options: "path={{ log_file }}" 
```
  4. Create an [RPM][14] package of your Go code with something like [NFPM][15], and install it in the system of the target host. You can then call it with the Ansible modules [shell][16] or [command][17].



Running an RPM package or container is not Go-specific (cases 3 and 4), so I will focus on the first two options.

## Google Calendar API

You will need to interact with the [Google Calendar API][18], which provides code examples for different programming languages. The one for Go will be the base for your Ansible module.

The tricky part is [enabling the Calendar API][19] and downloading the credentials you generate in the [Google API Console][20] (`Credentials` &gt; `+ CREATE CREDENTIALS` &gt; `OAuth client ID` &gt; `Desktop App`).

![Downloading credentials from Google API Console][21]

(Nicolas Leiva, [CC BY-SA 4.0][22])

The arrow shows where to download your OAuth 2.0 client credentials (JSON file) once you create them in [API Credentials][23].

## Calling the module from Ansible

The `calendar` module takes the `time` to validate as an argument. The example below provides the current time. You can typically get this from [Ansible facts][24] (`ansible_date_time`). The JSON output of the module is registered in a variable named `output` to be used in a subsequent task:
```


\- name: Check if timeslot is taken
  calendar:
    time: "{{ ansible_date_time.iso8601 }}"
  register: output

```
You might wonder where the `calendar` module code lives and how Ansible executes it. Please bear with me for a moment; I'll get to this after I cover other pieces of the puzzle.

## Employ the time logic

With the Calendar API nuances out of the way, you can proceed to interact with the API and build a Go function to capture the module logic. The `time` is taken from the input arguments—in the playbook above—as the initial time (`min`) of the time window to validate (I arbitrarily chose a one-hour duration):
```


func isItBusy(min string) (bool, error) {
        ...
        // max -&gt; min.Add(1 * time.Hour)
        max, err := maxTime(min)
        // ...
        srv, err := calendar.New(client)
        // ...
        freebusyRequest := calendar.FreeBusyRequest{
                TimeMin: min,
                TimeMax: max,
                Items:   []*calendar.FreeBusyRequestItem{&amp;cal},
        }
        // ...
        freebusyRequestResponse, err := freebusyRequestCall.Do()
        // ...
        if len(freebusyRequestResponse.Calendars[name].Busy) == 0 {
                return false, nil
        }
        return true, nil
}

```
It [sends a `FreeBusyRequest`][25] to Google Calendar with the time window's initial and finish time (`min` and `max`). It also creates a calendar [client][26] (`srv`) to authenticate the account correctly using the JSON file with the OAuth 2.0 client credentials. In return, you get a list of events during this time window.

If you get zero events, the function returns `busy=false`. However, if there is at least one event during this time window, it means `busy=true`. You can check out the [full code][27] in my GitHub repository.

## Process the input and creating a response

Now, how does the Go code read the inputs arguments from Ansible and, in turn, generate a response that Ansible can process? The answer to this depends on whether you are running the [Go CLI][28] (command-line interface) or just executing a pre-compiled Go program binary (i.e., options 1 and 2 above).

Both options have their pros and cons. If you use the Go CLI, you can pass the arguments the way you prefer. However, to make it consistent with how it works for binaries you run from Ansible, both alternatives will read a JSON file in the examples presented here.

### Reading the arguments

As shown in the Go code snippet below, an input file is processed, and Ansible provides a path to it when it calls a binary.

The content of the file is unmarshaled into an instance (`moduleArg`) of a previously defined struct (`ModuleArgs`). This is how you tell the Go code which data you expect to receive. This method enables you to gain access to the `time` specified in the playbook via `moduleArg.time`, which is then passed to the time logic function (`isItBusy`) for processing:
```


// ModuleArgs are the module inputs
type ModuleArgs struct {
        Time string
}

func main() {
        ...
        argsFile := os.Args[1]
        text, err := ioutil.ReadFile(argsFile)
        ...
        var moduleArgs ModuleArgs
        err = json.Unmarshal(text, &amp;moduleArgs)
        ...
        busy, err := isItBusy(moduleArg.time)
        ...
}

```
### Generating a response

The values to return are assigned to an instance of a `Response` object. Ansible will need this response includes a couple of boolean flags (`Changed` and `Failed`). You can add any other field you need; in this case, a `Busy` boolean value is carried to signal the response of the time logic function.

The response is marshaled into a message that you print out and Ansible can read:
```


// Response are the values returned from the module
type Response struct {
        Msg     string `json:"msg"`
        Busy    bool   `json:"busy"`
        Changed bool   `json:"changed"`
        Failed  bool   `json:"failed"`
}

func returnResponse(r Response) {
  ...
        response, err = json.Marshal(r)
        ...
        fmt.Println(string(response))
        ...
}

```
You can check out the [full code][29] on GitHub.

## Execute a binary or Go code on the fly?

One of the cool things about Go is that you can cross-compile a Go program to run on different target operating systems and architectures. The binary files you compile can be executed in the target host without installing Go or any dependency.

This flexibility plays nicely with Ansible, which provides the target host details (`ansible_system` and `ansible_architecture`) via Ansible facts. In this example, the target architecture is fixed when compiling (`x86_64`), but binaries for macOS, Linux, and Windows are generated (via `make compile`). This produces the three files that are included in the [`library` folder][30] of the `go_role` role with the form of: `calendar_$system`:
```


⇨  tree roles/go_role/
roles/go_role/
├── library
│   ├── calendar_darwin
│   ├── calendar_linux
│   ├── calendar_windows
│   └── go_run
└── tasks
    ├── Darwin.yml
    ├── Go.yml
    ├── Linux.yml
    ├── main.yml
    └── Win32NT.yml

```
The [`go_role` role][31] that packages the `calendar` 