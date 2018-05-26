Token ERC Comparison for Fungible Tokens – Blockchainers
======
“The good thing about standards is that there are so many to choose from.” [_Andrew S. Tanenbaum_][1]

### Current State of Token Standards

The current state of Token standards on the Ethereum platform is surprisingly simple: ERC-20 Token Standard is the only accepted and adopted (as [EIP-20][2]) standard for a Token interface.

Proposed in 2015, it has finally been accepted at the end of 2017.

In the meantime, many Ethereum Requests for Comments (ERC) have been proposed which address shortcomings of the ERC-20, which partly were caused by changes in the Ethereum platform itself, eg. the fix for the re-entrancy bug with [EIP-150][3]. Other ERC propose enhancements to the ERC-20 Token model. These enhancements were identified by experiences gathered due to the broad adoption of the Ethereum blockchain and the ERC-20 Token standard. The actual usage of the ERC-20 Token interface resulted in new demands and requirements to address non-functional requirements like permissioning and operations.

This blogpost should give a superficial, but complete, overview of all proposals for Token(-like) standards on the Ethereum platform. This comparison tries to be objective but most certainly will fail in doing so.

### The Mother of all Token Standards: ERC-20

There are dozens of [very good][4] and detailed description of the ERC-20, which will not be repeated here. Just the core concepts relevant for comparing the proposals are mentioned in this post.

#### The Withdraw Pattern

Users trying to understand the ERC-20 interface and especially the usage pattern for _transfer_ ing Tokens _from_ one externally owned account (EOA), ie. an end-user (“Alice”), to a smart contract, have a hard time getting the approve/transferFrom pattern right.

![][5]

From a software engineering perspective, this withdraw pattern is very similar to the [Hollywood principle][6] (“Don’t call us, we’ll call you!”). The idea is that the call chain is reversed: during the ERC-20 Token transfer, the Token doesn’t call the contract, but the contract does the call transferFrom on the Token.

While the Hollywood Principle is often used to implement Separation-of-Concerns (SoC), in Ethereum it is a security pattern to avoid having the Token contract to call an unknown function on an external contract. This behaviour was necessary due to the [Call Depth Attack][7] until [EIP-150][3] was activated. After this hard fork, the re-entrancy bug was not possible anymore and the withdraw pattern did not provide any more security than calling the Token directly.

But why should it be a problem now, the usage might be somehow clumsy, but we can fix this in the DApp frontend, right?

So, let’s see what happens if a user used transfer to send Tokens to a smart contract. Alice calls transfer on the Token contract with the contract address

**….aaaaand it’s gone!**

That’s right, the Tokens are gone. Most likely, nobody will ever get the Tokens back. But Alice is not alone, as Dexaran, inventor of ERC-223, found out, about $400.000 in tokens (let’s just say _a lot_ due to the high volatility of ETH) are irretrievably lost for all of us due to users accidentally sending Tokens to smart contracts.

Even if the contract developer was extremely user friendly and altruistic, he couldn’t create the contract so that it could react to getting Tokens transferred to it and eg. return them, as the contract will never be notified of this transfer and the event is only emitted on the Token contract.

From a software engineering perspective that’s a severe shortcoming of ERC-20. If an event occurs (and for the sake of simplicity, we are now assuming Ethereum transactions are actually events), there should be a notification to the parties involved. However, there is an event, but it’s triggered in the Token smart contract which the receiving contract cannot know.

Currently, it’s not possible to prevent users sending Tokens to smart contracts and losing them forever using the unintuitive transfer on the ERC-20 Token contract.

### The Empire Strikes Back: ERC-223

The first attempt at fixing the problems of ERC-20 was proposed by [Dexaran][8]. The main issue solved by this proposal is the different handling of EOA and smart contract accounts.

The compelling strategy is to reverse the calling chain (and with [EIP-150][3] solved this is now possible) and use a pre-defined callback (tokenFallback) on the receiving smart contract. If this callback is not implemented, the transfer will fail (costing all gas for the sender, a common criticism for ERC-223).

![][9]

#### Pros:

  * Establishes a new interface, intentionally being not compliant to ERC-20 with respect to the deprecated functions

  * Allows contract developers to handle incoming tokens (eg. accept/reject) since event pattern is followed

  * Uses one transaction instead of two (transfer vs. approve/transferFrom) and thus saves gas and Blockchain storage




#### Cons:

  * If tokenFallback doesn’t exist then the contract fallback function is executed, this might have unintended side-effects

  * If contracts assume that transfer works with Tokens, eg. for sending Tokens to specific contracts like multi-sig wallets, this would fail with ERC-223 Tokens, making it impossible to move them (ie. they are lost)


### The Pragmatic Programmer: ERC-677

The [ERC-667 transferAndCall Token Standard][10] tries to marriage the ERC-20 and ERC-223. The idea is to introduce a transferAndCall function to the ERC-20, but keep the standard as is. ERC-223 intentionally is not completely backwards compatible, since the approve/allowance pattern is not needed anymore and was therefore removed.

The main goal of ERC-667 is backward compatibility, providing a safe way for new contracts to transfer tokens to external contracts.

![][11]

#### Pros:

  * Easy to adapt for new Tokens

  * Compatible to ERC-20

  * Adapter for ERC-20 to use ERC-20 safely

#### Cons:

  * No real innovations. A compromise of ERC-20 and ERC-223

  * Current implementation [is not finished][12]


### The Reunion: ERC-777

[ERC-777 A New Advanced Token Standard][13] was introduced to establish an evolved Token standard which learned from misconceptions like approve() with a value and the aforementioned send-tokens-to-contract-issue.

Additionally, the ERC-777 uses the new standard [ERC-820: Pseudo-introspection using a registry contract][14] which allows for registering meta-data for contracts to provide a simple type of introspection. This allows for backwards compatibility and other functionality extensions, depending on the ITokenRecipient returned by a EIP-820 lookup on the to address, and the functions implemented by the target contract.

ERC-777 adds a lot of learnings from using ERC-20 Tokens, eg. white-listed operators, providing Ether-compliant interfaces with send(…), using the ERC-820 to override and adapt functionality for backwards compatibility.

![][15]

#### Pros:

  * Well thought and evolved interface for tokens, learnings from ERC-20 usage

  * Uses the new standard request ERC-820 for introspection, allowing for added functionality

  * White-listed operators are very useful and are more necessary than approve/allowance , which was often left infinite


#### Cons:

  * Is just starting, complex construction with dependent contract calls

  * Dependencies raise the probability of security issues: first security issues have been [identified (and solved)][16] not in the ERC-777, but in the even newer ERC-820




### (Pure Subjective) Conclusion

For now, if you want to go with the “industry standard” you have to choose ERC-20. It is widely supported and well understood. However, it has its flaws, the biggest one being the risk of non-professional users actually losing money due to design and specification issues. ERC-223 is a very good and theoretically founded answer for the issues in ERC-20 and should be considered a good alternative standard. Implementing both interfaces in a new token is not complicated and allows for reduced gas usage.

A pragmatic solution to the event and money loss problem is ERC-677, however it doesn’t offer enough innovation to establish itself as a standard. It could however be a good candidate for an ERC-20 2.0.

ERC-777 is an advanced token standard which should be the legitimate successor to ERC-20, it offers great concepts which are needed on the matured Ethereum platform, like white-listed operators, and allows for extension in an elegant way. Due to its complexity and dependency on other new standards, it will take time till the first ERC-777 tokens will be on the Mainnet.

### Links

[1] Security Issues with approve/transferFrom-Pattern in ERC-20: <https://drive.google.com/file/d/0ByMtMw2hul0EN3NCaVFHSFdxRzA/view>

[2] No Event Handling in ERC-20: <https://docs.google.com/document/d/1Feh5sP6oQL1-1NHi-X1dbgT3ch2WdhbXRevDN681Jv4>

[3] Statement for ERC-20 failures and history: <https://github.com/ethereum/EIPs/issues/223#issuecomment-317979258>

[4] List of differences ERC-20/223: <https://ethereum.stackexchange.com/questions/17054/erc20-vs-erc223-list-of-differences>


--------------------------------------------------------------------------------

via: http://blockchainers.org/index.php/2018/02/08/token-erc-comparison-for-fungible-tokens/

作者：[Alexander Culum][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://blockchainers.org/index.php/author/alex/
[1]:https://www.goodreads.com/quotes/589703-the-good-thing-about-standards-is-that-there-are-so
[2]:https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
[3]:https://github.com/ethereum/EIPs/blob/master/EIPS/eip-150.md
[4]:https://medium.com/@jgm.orinoco/understanding-erc-20-token-contracts-a809a7310aa5
[5]:http://blockchainers.org/wp-content/uploads/2018/02/ERC-20-Token-Transfer-2.png
[6]:http://matthewtmead.com/blog/hollywood-principle-dont-call-us-well-call-you-4/
[7]:https://consensys.github.io/smart-contract-best-practices/known_attacks/
[8]:https://github.com/Dexaran
[9]:http://blockchainers.org/wp-content/uploads/2018/02/ERC-223-Token-Transfer-1.png
[10]:https://github.com/ethereum/EIPs/issues/677
[11]:http://blockchainers.org/wp-content/uploads/2018/02/ERC-677-Token-Transfer.png
[12]:https://github.com/ethereum/EIPs/issues/677#issuecomment-353871138
[13]:https://github.com/ethereum/EIPs/issues/777
[14]:https://github.com/ethereum/EIPs/issues/820
[15]:http://blockchainers.org/wp-content/uploads/2018/02/ERC-777-Token-Transfer.png
[16]:https://github.com/ethereum/EIPs/issues/820#issuecomment-362049573
