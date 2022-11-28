[#]: subject: "Open source blockchain development: Get started with Hyperledger FireFly"
[#]: via: "https://opensource.com/article/22/9/blockchain-hyperledger-firefly"
[#]: author: "Nicko Guyer https://opensource.com/users/nickoguyerkaleidoio"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Open source blockchain development: Get started with Hyperledger FireFly
======
Hyperledger FireFly brings a complete open source stack for developers who want to build and scale secure, enterprise-grade applications with access to blockchain technology.

It takes more than a blockchain node to build enterprise-grade applications at scale. As a result, developers often find themselves building plumbing from scratch to make their business logic work. The release of [Hyperledger FireFly][2] changed blockchain development, offering developers a full stack of tools to build and scale secure web applications using familiar APIs. FireFly’s next-gen platform simplifies development, making it easy to connect across multiple public and private chains while running many use cases simultaneously. Whether you want to build on permissioned chains like Hyperledger Fabric, Corda, or Enterprise Ethereum, or public chains like Ethereum, Polygon, Avalanche, Optimism, BNB Chain, Arbitrum, Moonbeam, or Fantom, FireFly has you covered.

In this article I'll walk you through where to download Hyperledger FireFly, how to set up a local development environment, and introduce you to the FireFly Sandbox. But first, a quick introduction to the Supernode.

### What is a Supernode?

Hyperledger FireFly is an open source project that was contributed to the [Hyperledger Foundation][3] by Kaleido, a blockchain and digital asset platform provider. To make FireFly a reality, the Raleigh, NC-based company collaborated with the blockchain community to fit vital technology components into an enterprise-grade, pluggable development and runtime stack called a Supernode.

![Image of a development stack][4]

This development stack offers three key advantages to blockchain developers, especially those looking to build enterprise-grade applications with scale.

* Accelerate: Hyperledger FireFly helps developers create applications on the blockchain protocol of their choice, and build quickly with familiar REST APIs. Users can leverage pre-built services for tokens, wallets, storage, and identity to reach production faster.
* Orchestrate: Hyperledger FireFly makes it easier to manage data end-to-end from blockchain to back-office. APIs allow developers to trigger business processes based on blockchain activities, and off-chain storage and messaging to protect sensitive data.
* Support: Hyperledger FireFly supports high-volume workloads, integrates with existing IT systems and databases, and communicates with network participants.

### Getting Started with Hyperledger

FireFly makes it super easy to build powerful blockchain applications. Installing the stack on your machine is a simple process, too. Below I'm going to walk you through the three step process to get up and running so you can start testing the FireFly functionality today.

![Image depicting the FireFly install process][5]

### Install FireFly CLI

The FireFly command-line interface (CLI) creates local FireFly stacks for offline development of blockchain apps. Having FireFly locally allows developers to test and iterate on ideas without worrying about setting up extra infrastructure.

The easiest way to install the FireFly CLI is to download a pre-compiled binary of the latest release. To do this, visit the [release page][6].

Next, extract the binary and move it to `/usr/bin/local`. Assuming you downloaded the package from GitHub into your `Downloads` directory:

```
$ sudo tar -zxf ~/Downloads/firefly-cli_*.tar.gz -C /usr/local/bin ff
```

This places the `ff` executable in `/usr/local/bin`.

If you downloaded the package from GitHub to a different directory, change the `tar` command above to wherever the `firefly-cli_*.tar.gz` file is located.

Alternatively, you can install the `FireFly CLI` using `Go`. If you have a local Go development environment, and you have included `${GOPATH}/bin` in your path, you can use Go to install the `FireFly CLI` by running:

```
$ go install github.com/hyperledger/firefly-cli/ff@latest
```

Finally, verify the installation by running ff version. This prints the current version:

```
{
 "Version": "v1.1.0",
 "License": "Apache-2.0"
}
```

With the FireFly CLI installed, you are ready to run some Supernodes on your machine.

### Start Your Environment

A FireFly stack is a collection of Supernodes that work together on a single development machine. A stack has multiple members (also referred to as organizations). Every member has their own Supernode within the stack. This allows developers to build and test data flows with a mix of public and private data between various parties, all within a single development environment.

![Image of the FireFly development stack][7]

Creating a new FireFly stack is relatively easy. The `ff init` command creates a new stack for you, and prompts you for a few details such as the name, and how many members you want in your stack.

There are also some settings you can change. The defaults are the simplest way to get going, but you can see a full list of options by running `ff init --help`.

Once you've created your stack, use the command `ff start dev` to run your environment.

After your stack has started, it prints the links to each member's UI, and the Sandbox for that node.

### Use the FireFly Sandbox

![Image of the Firefly sandbox][8]

Each member gets an instance of the FireFly Sandbox as well. The Sandbox is like an example application. It can be used to test, iterate, and practice using FireFly features. It provides code snippets as examples of how to build those features into your own application backend.

There are a couple of things in the Sandbox you may want to check out to experience the full capabilities of Hyperledger FireFly.

The `Messages` tab helps you send messages, and view the data payload, in every member's FireFly Explorer, or send a private message to one member, and verify that the data payload is not visible in a third member's FireFly Explorer. You can send an image file, and download it from another member's FireFly Explorer.

The `Tokens` tab creates a non-fungible token pool, and allows you to transfer an NFT to another member and verify the account balances in FireFly Explorer.

The `Contracts` tab can create a contract interface and API, then view the Swagger UI for your new API, or create an event listener. You can also use the Swagger UI to call a smart contract function that emits an event. Any event received in the Sandbox also shows up in FireFly Explorer.

### Build your app

Hyperledger FireFly brings a complete open source stack for developers who want to build and scale secure, enterprise-grade applications with access to blockchain technology. It's simple to install on your machine, and the Sandbox allows developers to view code snippets and test ideas—all so blockchain applications reach production faster. Read more about Hyperledger FireFly's capabilities in the [project documentation][9] and give it a try yourself.

Image by: (Nicko Guyer, CC BY-SA 4.0)

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/blockchain-hyperledger-firefly

作者：[Nicko Guyer][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nickoguyerkaleidoio
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/cube_innovation_process_block_container.png
[2]: https://www.kaleido.io/hyperledger-firefly
[3]: https://www.hyperledger.org
[4]: https://opensource.com/sites/default/files/2022-09/development%20stack.png
[5]: https://opensource.com/sites/default/files/2022-09/install%20firefly%20process.png
[6]: https://github.com/hyperledger/firefly-cli/releases/latest
[7]: https://opensource.com/sites/default/files/2022-09/Firefly%20development%20stack.png
[8]: https://opensource.com/sites/default/files/2022-09/Firefly%20sandbox.png
[9]: https://hyperledger.github.io/firefly
