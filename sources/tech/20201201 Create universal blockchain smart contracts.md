[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create universal blockchain smart contracts)
[#]: via: (https://opensource.com/article/20/12/blockchain-smart-contracts)
[#]: author: (Gage Mondok https://opensource.com/users/matt-coolidge)

Create universal blockchain smart contracts
======
Chainlink connects blockchain data with external, "real-world" data
using decentralized oracles.
![cubes coming together to create a larger cube][1]

Blockchain [smart contracts][2] have the ability to access off-chain data by integrating [decentralized oracles][3]. Before diving into how to use them, it's important to understand why smart contracts matter in the big picture and why they need oracles for data access.

Transactions happen every day, as they have for tens of thousands of years. They're generally governed by an agreement or contract. This may be driven by a vendor's terms of service, regulatory frameworks, or some combination of both. Parameters for these agreements are not always clear or transparent, and they are ultimately governed by a brand (whether that's a person or a company) and its willingness to act upon terms agreed upon in advance.

Contracts, like the rest of the world, are going digital. The rise of blockchain technology has introduced smart contracts, a more tamper-proof, transparent, and fair system for governing such agreements. Smart contracts are governed by math, not brands. They automatically enforce the parameters of a contract once they're executed, creating a more equitable structure for all parties.

The challenge with smart contracts is that they generally depend on their ability to bridge real-world data with blockchains (or data from one blockchain to another) so that the smart contract can recognize quality, assess reliable data, and trigger agreed-upon outcomes once terms are met. Traditionally, this has been an overly complex and difficult process, which limited broader adoption.

### About Chainlink

[Chainlink][4] is an open source abstraction layer that provides a framework to easily connect any blockchain with any external (or separate blockchain) API. You can think of Chainlink as the blockchain equivalent of the transport layer in TCP/IP, ensuring data is reliably transmitted in and out. Chainlink was designed to be the standard data layer for smart contracts, unlocking their true capability to affect the external world, and turning them into externally aware, universal smart contracts.

Smart contracts have the power to revolutionize how trust and automation are handled in business, but their restriction in scope to events on the blockchain has severely limited their potential. A majority of what developers want to interact with exists in the "real world," such as pricing data, shipping events, world events, etc. To create universal smart contracts, which are externally aware and thus can handle a wide, universal set of jobs with the world's data at its fingertips, the Chainlink network gives [Solidity][5] and other blockchain developers a framework of decentralized oracles to build with.

You can use these oracles to retrieve data for your decentralized application (dApp) in real-time on the Ethereum mainnet.

#### Chainlink adapters

[Adapters][6] are the default data manipulation functions that every Chainlink node supports by default. The nodes are the decentralized oracles in this case. They fulfill the data requests, and the Chainlink network is composed of an ever-growing number of them. Nodes are run by a multitude of independent operators. Through adapters, all developers have a standard interface for making data requests, and node operators have a standard for serving that data. These adapters include functionality such as HTTP GET, HTTP POST, Compare, Copy, etc. Adapters are a dApp's connection to the external world's data.

For example, here are the parameters for the [HttpGet][7] adapter:

  * **get**: Takes a string containing the API URL to make a GET request to
  * **headers**: Takes an object containing keys as strings and values as arrays of strings
  * **queryParams**: Takes a string or array of strings for the URL's query parameters
  * **extPath**: Takes a slash-delimited string or array of strings to be appended to the job's URL



#### Chainlink requests

For a universal smart contract to interact with these adapters, you need another functionality, requests. All contracts that inherit from [ChainlinkClient][8] can create a Chainlink.Request struct that allows developers to form a request to a Chainlink decentralized oracle. This request should add the desired adapter parameters to the struct according to the request you want to make. Submitting this request requires some basic fields, such as the address of the node you want to use as your oracle, the jobId, and the agreed-upon fee. In addition to those default fields, you can add your desired adapter parameters to the request struct:


```
// Set the URL to perform the GET request on
request.add("get", "[https://min-api.cryptocompare.com/data/price?fsym=ETH\&amp;tsyms=USD][9]");
```

With this struct, requests are flexible and can be formulated to fit various situations involving getting, posting, and manipulating data from any API because the requests can contain any of the adapter functions. What makes this system decentralized is that Chainlink's oracle network consists of many of these nodes, and developers are free to choose which and how many they want to request from based on their needs. This enables redundant failover and error checking via multiple sources, as high-reliability dApps often require.

For more information on constructing a request and the functions needed to submit it and receive a response within a ChainlinkClient contract, see Chainlink's full [HTTP GET request example][10].

For common requests, a node operator may already have an existing oracle job preconfigured, and in this case, the request is much simpler. Rather than building a custom request struct and adding the necessary adapters, the default request struct is all you need to create. No additional adapter parameters are needed; the set of decentralized oracles you choose will know how to respond based on the jobId provided when creating the request struct.

This example comes from the full [CoinGecko Consumer API][11]:


```
Chainlink.[Request][12] memory req = buildChainlinkRequest(jobId, address(this),     this.fulfillEthereumPrice.selector);
sendChainlinkRequestTo(oracle, req, fee);
```

You can use a decentralized oracle data service, such as [Chainlink Market][13], to search through existing oracles and the jobs they support in order to find the jobId you require.

### External adapters

But what if you have a complex use case for your smart contract that isn't covered by the default adapter functions? What if you need to perform some advanced data manipulation? Maybe it's not raw data you want to submit to your contract but rather metadata generated by statistical analysis of multiple data points. Maybe you can manipulate the data on-chain with the default adapters but want to reduce gas costs. Perhaps you don't want your API request on-chain due to using a credentialed source, and you don't want to specify those credentials on-chain or in the oracle job spec. This is where [external adapters][14] come in.

![Chainlink External Adapter for IoT Devices][15]

(Chainlink, ©2020)

External adapters are the "whatever data you need; we can handle it" of Chainlink. When we say universal smart contracts, we really mean _universal_. Since external adapters are pieces of code that exist off-chain with the Chainlink oracle node, they can be written in any language of your choice and perform whatever functionality you can think up—so long as the data input and output adhere to the adapter's JSON specification. External adapters act as the interface between the Chainlink decentralized oracle network and external data, letting the node operators know how to request and receive the JSON response that is then consumed on-chain.

Defining this interface specification off-chain through an external adapter opens up vast possibilities: You can now store your API credentials off-chain per your personal security standards, data can be programmed in any way in the language of your choice, and all of this happens without using any Ethereum gas fees to fund an on-chain transaction. In a sense, external adapters are like another layer of a decentralized oracle, packaging up data outside the blockchain with speed and at low cost and putting it into one tidy JSON format to be verifiably committed on-chain by the Chainlink oracle node.

External adapters are a large part of what makes Chainlink such a versatile decentralized oracle network. Contract developers are free to implement these adapters as needed, or they can choose from [existing adapters][16] on the Chainlink Market. If you are a smart contract developer looking to create an external adapter, Chainlink merely requires you to specify the JSON interfaces for the data request and the return data; between those two interfaces is where developers are free to create and manipulate the data to fit their use case. As an oracle node operator, to support the external adapter and handle the additional requests, you must [create a bridge][17] for it in your node user interface and add the adapter's bridge name to your supported tasks.

![Create a new bridge in Chainlink][18]

(ChainLink, ©2020)


```
{
  "initiators": [
    { "type": "runLog" }
  ],
  "tasks": [
    { "type": "randomNumber" },
    { "type": "copy",
      "params": {"copyPath": ["details", "current"]}},
    { "type": "multiply",
      "params": {"times": 100 }},
    { "type": "ethuint256" },
    { "type": "ethtx" }
  ]
}
```

You can access a full example of creating an external adapter on Chainlink's [building external adapters][19] page.

Chainlink is striving to give blockchain and smart contract developers the tools to empower universal smart contracts with real-world data, exactly how they need it. Chainlink's design, incorporating direct calls to any API through default adapters and extensible external adapters, gives developers a flexible platform to create as they see fit, with any data they might need. This opens up smart contracts to a literal world of data and the new use cases this empowers.

### Start building with Chainlink

If you're a smart contract developer looking to increase your smart contracts' utility with external data, try out this Chainlink [example walkthrough][20] to deploy a universal smart contract that interacts with off-chain data.

Chainlink is open source under the [MIT License][21], so if you're developing a product that could benefit from Chainlink decentralized oracles or would like to assist in developing the Chainlink Network, visit the [developer documentation][22] or join the technical discussion on [Discord][23]. You can also learn more on Chainlink's [website][4], [Twitter][24], [Reddit][25], [YouTube][26], [Telegram][27], and [GitHub][28].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/blockchain-smart-contracts

作者：[Gage Mondok][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/matt-coolidge
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cube_innovation_process_block_container.png?itok=vkPYmSRQ (cubes coming together to create a larger cube)
[2]: https://blog.chain.link/what-is-a-smart-contract-and-why-it-is-a-superior-form-of-digital-agreement/
[3]: https://blog.chain.link/what-is-the-blockchain-oracle-problem/
[4]: https://chain.link/
[5]: https://github.com/ethereum/solidity
[6]: https://docs.chain.link/docs/adapters
[7]: https://docs.chain.link/docs/adapters#httpget
[8]: https://github.com/smartcontractkit/chainlink/blob/develop/evm-contracts/src/v0.6/ChainlinkClient.sol
[9]: https://min-api.cryptocompare.com/data/price?fsym=ETH\&tsyms=USD
[10]: https://docs.chain.link/docs/make-a-http-get-request
[11]: https://docs.chain.link/docs/existing-job-request
[12]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+request
[13]: https://market.link/
[14]: https://docs.chain.link/docs/external-adapters
[15]: https://opensource.com/sites/default/files/chainlink-external-adapter.png (Chainlink External Adapters enable smart contracts to easily integrate with specialized APIs)
[16]: https://market.link/search/adapters
[17]: https://docs.chain.link/docs/node-operators#config
[18]: https://opensource.com/sites/default/files/uploads/chainlink_newbridge.png (Create a new bridge in Chainlink)
[19]: https://docs.chain.link/docs/developers
[20]: https://docs.chain.link/docs/example-walkthrough
[21]: https://github.com/smartcontractkit/chainlink/blob/develop/LICENSE
[22]: https://docs.chain.link/
[23]: https://discordapp.com/invite/aSK4zew
[24]: https://twitter.com/chainlink
[25]: https://www.reddit.com/r/Chainlink/
[26]: https://www.youtube.com/channel/UCnjkrlqaWEBSnKZQ71gdyFA
[27]: https://t.me/chainlinkofficial
[28]: https://github.com/smartcontractkit/chainlink
