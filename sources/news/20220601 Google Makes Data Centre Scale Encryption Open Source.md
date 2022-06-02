[#]: subject: "Google Makes Data Centre Scale Encryption Open Source"
[#]: via: "https://www.opensourceforu.com/2022/06/google-makes-data-centre-scale-encryption-open-source/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Google Makes Data Centre Scale Encryption Open Source
======
![google-ranking-factors][1]

Google has made open source an encryption scheme it developed to protect traffic between its data centres. PSP, which stands for PSP Security Protocol, was created to relieve Google’s processors of the growing burden of software-based encryption, according to the company. PSP has been hailed as a success in the company’s own environment, and the company has stated that it is “making PSP open source to encourage broader adoption by the community and hardware implementation by additional NIC [network interface card] vendors.”  PSP offloads encryption to NICs, which was previously possible with existing encryption schemes, but not at the scale or with the traffic coverage required by Google.

“At Google’s scale,” the company wrote when announcing its decision, “the cryptographic offload must support millions of live transmission control protocol (TCP) connections and sustain 100,000 new connections per second at peak.”

Existing security protocols, according to Google Cloud’s Amin Vahdat and Soheil Hassas Yeganeh, had flaws. “While TLS meets our security requirements, it is not an offload-friendly solution because of the tight coupling between the connection state in the kernel and the offload state in hardware. TLS also does not support non-TCP transport protocols, such as UDP”, they stated.

However, the IPSec protocol cannot be offloaded to hardware at the required scale. “IPSec … cannot economically support our scale partly because they store the full encryption state in an associative hardware table with modest update rates,” the post explains.

Google added a custom header and trailer to standard User Datagram Protocol (UDP) encapsulation to create PSP. PSP is currently implemented in three ways: one for Google’s Andromeda Linux virtualisation kernel, one for its Snap networking system, and an application-layer version, SoftPSP, created so Google Cloud customers could use PSP on computers with traditional NICs.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/06/google-makes-data-centre-scale-encryption-open-source/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/06/google-ranking-factors-e1654074528236.jpg
