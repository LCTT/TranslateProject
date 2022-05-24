[#]: subject: "DAML: The Programming Language for Smart Contracts in a Blockchain"
[#]: via: "https://www.opensourceforu.com/2022/05/daml-the-programming-language-for-smart-contracts-in-a-blockchain/"
[#]: author: "Dr Kumar Gaurav https://www.opensourceforu.com/author/dr-gaurav-kumar/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

DAML: The Programming Language for Smart Contracts in a Blockchain
======
The DAML smart contract language is a purpose-built domain specific language designed to encode the shared business logic of an application. It is used for the development and deployment of distributed applications in the blockchain environment.

![blockchain-hand-shake][1]

Blockchain technology is a secure mechanism to keep track of information in a way that makes it hard or impossible to modify or hack it. A blockchain integrates the digital ledger of transactions, which is copied and sent to every computer on its network. In each block of the chain, there are a number of transactions. When a new transaction takes place on the blockchain, a record of that transaction is added to the ledgers of everyone who is part of the chain.

Blockchain uses distributed ledger technology (DLT), in which a database isn’t kept in one server or node. In a blockchain, transactions are recorded with an immutable cryptographic sign known as a hash. This means that if one block in one channel or chain is changed, it will be hard for hackers to change that block in the chain, as they would have to do this for every single version of the chain that is out there. Blockchains, like Bitcoin and Ethereum, keep growing as new blocks are added to the chain, which makes the ledger safer.

With the implementation of smart contracts in blockchain, there is automatic execution of scenarios without any human intervention. Smart contract technology makes it possible to enforce the highest level of security, privacy and anti-hacking implementations.

![Figure 1: Market size of blockchain technology (Source: Statista.com)][2]

The use cases and applications of blockchain are:

* Cryptocurrencies
* Smart contracts
* Secured personal information
* Digital health records
* E-governance
* Non-fungible tokens (NFTs)
* Gaming
* Cross-border financial transactions
* Digital voting
* Supply chain management

As per *Statista.com*, the size of the blockchain technology market is increasing at a very fast speed since the last few years and is predicted to touch US$ 40 billion by 2025.

### Programming languages and toolkits for blockchain

A number of programming languages and development toolkits are available for distributed applications and smart contracts. Programming and scripting languages for the blockchain include Solidity, Java, Vyper, Serpent, Python, JavaScript, GoLang, PHP, C++, Ruby, Rust, Erlang, etc, and are employed depending upon the implementation scenarios and use cases.

The choice of a suitable platform for the development and deployment of a blockchain depends on a range of factors including the need for security, privacy, speed of transactions and scalability (Figure 2).

![Figure 2: Factors to look at when selecting a blockchain platform][3]

The main platforms for the development of blockchain are:

* Ethereum
* XDC Network
* Tezos
* Stellar
* Hyperledger
* Ripple
* Hedera Hashgraph
* Quorum
* Corda
* NEO
* OpenChain
* EOS
* Dragonchain
* Monero

### DAML: A high performance programming language

Digital Asset Modeling Language or DAML (daml.com) is a high performance programming language for the development and deployment of distributed applications in the blockchain environment. It is a lightweight and concise platform for rapid applications development.

![Figure 3: Official portal of DAML][4]

The key features of DAML are:

* Fine-grained permissions
* Scenario based testing
* Data model
* Business logic
* Deterministic execution
* Storage abstraction
* No double spends
* Accountability tracking
* Atomic composability
* Authorisation checks
* Need-to-know privacy

### Installation and working with DAML

The DAML SDK can be installed on Linux, macOS or Windows. The detailed instructions for installing DAML on multiple operating systems are available at *https://docs.daml.com/getting-started/installation.html.*

You must have the following to work with DAML:

* Visual Studio Code
* Java Development Kit (JDK)

DAML can be installed on Windows by downloading and running the executable installer available at *https://github.com/digital-asset/daml/releases/download/v1.18.1/daml-sdk-1.18.1-windows.exe.*

Installation of DAML on Linux or Mac can be done by executing the following in the terminal:

```
$ curl -sSL https://get.daml.com/ | sh
```

After installation of DAML, the new blockchain based app can be created, as shown in Figures 4 and 5.

![Figure 4: Creating a new app][5]

In another terminal, the new app is navigated and project dependencies are installed:

![Figure 5: Running DAML][6]

```
WorkingDirectory>cd myapp/ui
WorkingDirectory>npm install
WorkingDirectory>npm start
```

The WebUI is started and the app is accessed on the Web browser with the URL *http://localhost:3000/.*

![Figure 6: Login panel in DAML app][7]

### Scope for research and development

Blockchain technology has a wide range of development platforms and frameworks for different categories of applications. Many of these platforms are free and open source, which can be downloaded and deployed for research based implementations. Research scholars, practitioners and academicians can use these platforms to propose and implement their algorithms for numerous applications.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/05/daml-the-programming-language-for-smart-contracts-in-a-blockchain/

作者：[Dr Kumar Gaurav][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/dr-gaurav-kumar/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/04/blockchain-hand-shake.jpg
[2]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-1-Market-size-of-blockchain-technology.jpg
[3]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-2-Factors-to-look-at-when-selecting-a-blockchain-platform-2.jpg
[4]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-3-Official-portal-of-DAML-1.jpg
[5]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-4-Creating-a-new-app.jpg
[6]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-5-Running-DAML.jpg
[7]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-6-Login-panel-in-DAML-app.jpg
