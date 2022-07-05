[#]: subject: "Hamming Codes: The Error-Correcting Codes"
[#]: via: "https://www.opensourceforu.com/2022/07/hamming-codes-the-error-correcting-codes/"
[#]: author: "Supriyo Ganguly https://www.opensourceforu.com/author/supriyo-ganguly/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Hamming Codes: The Error-Correcting Codes
======
When bits are transmitted or sent over the computer network, they can easily get corrupted due to interference and network problems, and lead to errors. Hamming codes are linear codes used to detect and correct the errors that can occur when data is moved from the sender to the receiver. Let’s take a look at their implementation in Python.

![Hamming-Codes-The-Error-Correcting-Codes][1]

In 1950, R.W. Hamming created an error correction code called the Hamming code. It divides data into fixed length blocks, making it a block based error detection and correction algorithm. Extra or redundant parity bits are generated and embedded into the data message before transmission. After the receiver gets them, these parity bits are recalculated to detect and correct the error.

Up to 2 bit errors can be detected and up to 1 bit errors can be corrected. For example, in case of even parity, the number of 1s in specific positions should turn out to be even. This will ensure the integrity or correctness of the message. The procedure can be described in the following steps:

* Calculation of the number of redundant bits
* Finding the position of parity/redundant bits
* Filling the parity bits
* Sending the message On the receiver side, the steps are:
* Receiving the message
* Finding the position of parity/redundant bits
* Comparing the parity bits to find the error

### Algorithm overview

We are going to use even parity in this example.

The user has to send a data stream of bits from one endpoint to another. The number of bits in the data stream is represented as ‘m’. And the hamming encoding algorithm is going to insert ‘r’ number of extra parity bits in the message for encoding before sending on the wire.
If ‘m’ is the number of data bits and ‘r’ is number of redundant bits, the following condition must be satisfied:

```
2^r ≥ m + r + 1 ....eq1
```

The parity bits will be inserted in specific locations of the encoded data stream. These locations are powers of 2; e.g. (2^0=1, 2^1=2, 2^2=4, 2^3=8, etc).

Let us take an example. Say we have a data stream of 4 bits; so, m=4. This is represented as follows:

| - | - | - | - |
| :- | :- | :- | :- |
| D1 | D2 | D3 | D4 |

We now need to calculate the number of parity bits:

```
If r=1 we put in eq1 2^1 < 4+1+1, so not ok
If r=2 we put in eq1 2^2 < 4+2+1, so not ok
If r=3 we put in eq1 2^3 = 4+3+1, this is ok
```

So the number of redundant bits is r=3. After the insertion of parity bits, the data stream will look like this:

| - | - | - | - | - | - | - |
| :- | :- | :- | :- | :- | :- | :- |
| P1 | P2 | D1 | P3 | D2 | D3 | D4 |

These parity bits are calculated from XOR of data bits at specific locations. The specific data bit positions are found based on the following table (where the corresponding bit is 1).

| bit location | P3 | P2 | P1 | 
| :- | :- | :- | :- |
| 1 | 0 | 0 | 1 | 
| 2 | 0 | 1 | 0 | 
| 3 | 0 | 1 | 1 | 
| 4 | 1 | 0 | 0 | 
| 5 | 1 | 0 | 1 | 
| 6 | 1 | 1 | 0 | 
| 7 | 1 | 1 | 1 |

So,

```
P1=B1 XOR B3 XOR B5 XOR B7
P2=B2 XOR B3 XOR B6 XOR B7
P3=B4 XOR B5 XOR B6 XOR B7
—--eq2
```

This is referred to as (7,4) Hamming code.

### Implementation overview (with code walkthrough)

I have written a Python code to implement the algorithm. Here, *even parity* is used.

*Data* is the input data stream taken as input from the user (example: data=’1101’).

‘m’ is the length of data taken as input from user (m=4).

#### Encoding of data

Step 1: *calculateRedundantBitSize()* function finds the value of ‘r’; r=3.

Step 2: In *createEncodedDat(),* the encodedList is the list initialised with all 0s.

For (7,4), the Hamming code encodedList will look like this:

| - | - | - | - | - | - | - |
| :- | :- | :- | :- | :- | :- | :- |
| 0 | 0 | 0 | 0 | 0 | 0 | 0 |

The next code copies data bits to specific locations:

```
for i in range(1,m+r+1,1):
if(i==(2**j)):
j=j+1
else:
encodedList[i-1]=data[k]
k=k+1
```

The *for* loop is iterating over the complete data length of ‘m+r’. If ‘i’ is power of 2 in the encodedList, the i-1 index will hold the data bit. For (7,4), the Hamming code encodedList will look like this:

| - | - | - | - | - | - | - |
| :- | :- | :- | :- | :- | :- | :- |
| 0 | 0 | 1 | 0 | 1 | 0 | 1 |

Then the parity bits are calculated as follows:

```
for j in range(0,r,1):
parityBitLoc = 2**j
for i in range(1,m+r+1,1):
if((parityBitLoc & i) != 0):
p=parityBitLoc-1
encodedList[p]= str(int(encodedList[i-1]) ^ int(encodedList[p]))
```

‘j’ is iterating over parity bits and ‘i’ is iterating over the full data stream. The condition:

```
if((parityBitLoc & i) != 0)
```

…will verify the specific positions for parity bit calculation, as specified in equation 2. ‘p’ is indicating the position of the parity bit in the list.

For (7,4) Hamming code, the encodedList will look like this:

| - | - | - | - | - | - | - |
| :- | :- | :- | :- | :- | :- | :- |
| 1 | 0 | 1 | 0 | 1 | 0 | 1 |

Finally, the encoded bits are stored as a string in encodedData.

#### Decoding and error correction

We now look at error correction. For error simulation, users can give an input to intentionally alter a bit. *rcvdList* is an erroneous bitString, which is passed on to the decodedData function.

As an example, we assume that bit 4 is corrupted. rcvdList will look like this:

| - | - | - | - | - | - | - |
| :- | :- | :- | :- | :- | :- | :- |
| 1 | 0 | 1 | 1 | 1 | 0 | 1 |

In the decodedData function, execute the following code:

```
chkList[p] = int(rcvdList[i-1]) ^ int(rcvdList[p]) ^ int(chkList[p])
```

After execution of this code, chkList will look like this:

| P1 | P2 |  | P3 |  |  |  | 
| :- | :- | :- | :- | :- | :- | :- |
| 0 | 0 | 0 | 1 | 0 | 0 | 0 |

We convert it to a binary:

```
P3P2P1 = (100)b
```

…which is 4 in decimals. This matches exactly with the user input. Thus it can also detect and correct the error. You can find the full source code on GitHub at *https://github.com/SupriyoGanguly/python-hamming.*

Hamming code is a cost-effective solution for detecting and correcting single-bit errors in computers. But if multiple bits are erroneous, it can totally spoil the data. Satellites and modem communications use hamming code. The simple Python code implementation discussed in this article can be used as a module by programmers for hamming code encoding and decoding for any standard data stream length of 4 bits, 7 bits, 13 bits, and so on.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/07/hamming-codes-the-error-correcting-codes/

作者：[Supriyo Ganguly][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/supriyo-ganguly/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/05/Hamming-Codes-The-Error-Correcting-Codes.jpg
