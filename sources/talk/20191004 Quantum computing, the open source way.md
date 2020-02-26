[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Quantum computing, the open source way)
[#]: via: (https://opensource.com/article/19/10/open-source-quantum-future)
[#]: author: (Jaouhari Youssef https://opensource.com/users/jaouhari)

Quantum computing, the open source way
======
Quantum computing is promising, provided we overcome hurdles preventing
it from moving deeper into the real world.
![A circuit design in lights][1]

The quantum vision of reality is both strange and mesmerizing at the same time. As theoretical physicist [Michio Kaku][2] once said, "Common sense has no place in quantum mechanics."

Knowing this is a new and uncommon place, we can expect quantum innovations to surpass anything we have seen before. The theory behind it will enable as-yet-unseen capabilities, but there are also some hurdles that are slowing it from being unleashed into the real world.

By using the concepts of entanglement and superposition on quantum bits, a quantum computer can solve some problems faster than a classical computer. For example, quantum computers are useful for solving [NP-hard][3] problems, such as the [Boolean satisfiability problem][4], known as the SAT problem. Using [Grover's algorithm][5], the complexity of the evaluation of a boolean proposition of **$n$** variables goes down from **$O(n2^{n})$** to **$O(n2^{n/2})$** by applying its quantum version.

An even more interesting more problem quantum computing can solve is the [Bernstein–Vazirani problem][6], where given a function **$f$**, such as **$f(x)=x.s=x_{1}s_{1} + x_{2}s_{2} + x_{3}s_{3} + ... x_{n}s_{n}$**, you have to find **$s$**. While the classical solution requires **$n$** queries to find the solution, the quantum version requires only one query.

Quantum computing is very valuable for security issues. One interesting riddle it answers is: How can two communicating parties share a key to encrypt and decrypt their messages without any third party stealing it?

A valid answer would use [quantum key distribution][7], which is a method of communication that implements cryptographic protocols that involve quantum mechanics. This method relies on a quantum principle that "the measurement of a system generally disturbs it." Knowing that a third party measuring the quantum state would disturb the system, the two communicating parties can thereby know if a communication is secure by establishing a threshold for eavesdropping. This method is used for securing bank transfers in China and transferring ballot results in Switzerland.

However, there are some serious hurdles to the progress of quantum computing to meet the requirements for industrial-scale use and deployment. First, quantum computers operate at temperatures near absolute zero since any heat in the system can introduce errors. Second, there is a scalability issue for quantum chipsets. Knowing that there are chips in the order of 1,000 qubits, expanding to millions or billions of qubits for fully fault-tolerant systems, error-corrected algorithms will require significant work.

The best way to tackle real-life problems with quantum solutions is to use a hybridization of classic and quantum algorithms using quantum hardware. This way, the part of the problem that can be solved faster using a quantum algorithm can be transferred to a quantum computer for processing. One example would be using a quantum support vector machine for solving a classification problem, where the matrix-exponentiation task is handled by the quantum computer.

The [Quantum Open Source Foundation][8] is an initiative to support the development of open source tools for quantum computing. Its goal is to expand the role of open source software in quantum computing, focusing on using current or near-term quantum computing technologies. The foundation also offers links to open courses, papers, videos, development tools, and blogs about quantum computing.

The foundation also supports [OQS-OpenSSH][9], an interesting project that concerns quantum cryptography. The project aims to construct a public-key cryptosystem that will be safe even against quantum computing. Since it is still under development, using hybrid-cryptography, with both quantum-safe public key and classic public-key algorithms, is recommended.

A fun way to learn about quantum computing is by playing [Entanglion][10], a two-player game made by IBM Research. The goal is to rebuild a quantum computer from scratch. The game is very instructive and could be a great way to introduce youth to the quantum world.

All in all, the mysteries of the quantum world haven't stopped amazing us, and they will surely continue into the future. The most exciting parts are yet to come!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/open-source-quantum-future

作者：[Jaouhari Youssef][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jaouhari
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/adi-goldstein-eusvweosble-unsplash.jpg?itok=8shMsRyC (Circuit design)
[2]: https://en.wikipedia.org/wiki/Michio_Kaku
[3]: https://en.wikipedia.org/wiki/NP-hardness
[4]: https://en.wikipedia.org/wiki/Boolean_satisfiability_problem
[5]: https://en.wikipedia.org/wiki/Grover%27s_algorithm
[6]: https://en.wikipedia.org/wiki/Bernstein%E2%80%93Vazirani_algorithm
[7]: https://en.wikipedia.org/wiki/Quantum_key_distribution
[8]: https://qosf.org/
[9]: https://github.com/open-quantum-safe/openssh-portable
[10]: https://github.com/Entanglion/entanglion
