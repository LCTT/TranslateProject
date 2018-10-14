An Introduction to Quantum Computing with Open Source Cirq Framework
======
As the title suggests what we are about to begin discussing, this article is an effort to understand how far we have come in Quantum Computing and where we are headed in the field in order to accelerate scientific and technological research, through an Open Source perspective with Cirq.

First, we will introduce you to the world of Quantum Computing. We will try our best to explain the basic idea behind the same before we look into how Cirq would be playing a significant role in the future of Quantum Computing. Cirq, as you might have heard of recently, has been breaking news in the field and in this Open Science article, we will try to find out why.

<https://www.youtube.com/embed/WVv5OAR4Nik?enablejsapi=1&autoplay=0&cc_load_policy=0&iv_load_policy=1&loop=0&modestbranding=1&rel=0&showinfo=0&fs=1&playsinline=0&autohide=2&theme=dark&color=red&controls=2&>

Before we start with what Quantum Computing is, it is essential to get to know about the term Quantum, that is, a [subatomic particle][1] referring to the smallest known entity. The word [Quantum][2] is based on the Latin word Quantus, meaning, “how little”, as described in this short video:

<https://www.youtube.com/embed/-pUOxVsxu3o?enablejsapi=1&autoplay=0&cc_load_policy=0&iv_load_policy=1&loop=0&modestbranding=1&rel=0&showinfo=0&fs=1&playsinline=0&autohide=2&theme=dark&color=red&controls=2&>

It will be easier for us to understand Quantum Computing by comparing it first to Classical Computing. Classical Computing refers to how today’s conventional computers are designed to work. The device with which you are reading this article right now, can also be referred to as a Classical Computing Device.

### Classical Computing

Classical Computing is just another way to describe how a conventional computer works. They work via a binary system, i.e, information is stored using either 1 or 0. Our Classical computers cannot understand any other form.

In literal terms inside the computer, a transistor can be either on (1) or off (0). Whatever information we provide input to, is translated into 0s and 1s, so that the computer can understand and store that information. Everything is represented only with the help of a combination of 0s and 1s.

<https://www.youtube.com/embed/Xpk67YzOn5w?enablejsapi=1&autoplay=0&cc_load_policy=0&iv_load_policy=1&loop=0&modestbranding=1&rel=0&showinfo=0&fs=1&playsinline=0&autohide=2&theme=dark&color=red&controls=2&>

### Quantum Computing

Quantum Computing, on the other hand, does not follow an “on or off” model like Classical Computing. Instead, it can simultaneously handle multiple states of information with help of two phenomena called [superimposition and entanglement][3], thus accelerating computing at a much faster rate and also facilitating greater productivity in information storage.

Please note that superposition and entanglement are [not the same phenomena][4].

<https://www.youtube.com/embed/jiXuVIEg10Q?enablejsapi=1&autoplay=0&cc_load_policy=0&iv_load_policy=1&loop=0&modestbranding=1&rel=0&showinfo=0&fs=1&playsinline=0&autohide=2&theme=dark&color=red&controls=2&>

![][5]

So, if we have bits in Classical Computing, then in the case of Quantum Computing, we would have qubits (or Quantum bits) instead. To know more about the vast difference between the two, check this [page][6] from where the above pic was obtained for explanation.

Quantum Computers are not going to replace our Classical Computers. But, there are certain humongous tasks that our Classical Computers will never be able to accomplish and that is when Quantum Computers would prove extremely resourceful. The following video describes the same in detail while also describing how Quantum Computers work:

<https://www.youtube.com/embed/JhHMJCUmq28?enablejsapi=1&autoplay=0&cc_load_policy=0&iv_load_policy=1&loop=0&modestbranding=1&rel=0&showinfo=0&fs=1&playsinline=0&autohide=2&theme=dark&color=red&controls=2&>

A comprehensive video on the progress in Quantum Computing so far:

<https://www.youtube.com/embed/CeuIop_j2bI?enablejsapi=1&autoplay=0&cc_load_policy=0&iv_load_policy=1&loop=0&modestbranding=1&rel=0&showinfo=0&fs=1&playsinline=0&autohide=2&theme=dark&color=red&controls=2&>

### Noisy Intermediate Scale Quantum

According to the very recently updated research paper (31st July 2018), the term “Noisy” refers to inaccuracy because of producing an incorrect value caused by imperfect control over qubits. This inaccuracy is why there will be serious limitations on what Quantum devices can achieve in the near term.

“Intermediate Scale” refers to the size of Quantum Computers which will be available in the next few years, where the number of qubits can range from 50 to a few hundred. 50 qubits is a significant milestone because that’s beyond what can be simulated by [brute force][7] using the most powerful existing digital [supercomputers][8]. Read more in the paper [here][9].

With the advent of Cirq, a lot is about to change.

### What is Cirq?

Cirq is a python framework for creating, editing, and invoking Noisy Intermediate Scale Quantum (NISQ) circuits that we just talked about. In other words, Cirq can address challenges to improve accuracy and reduce noise in Quantum Computing.

Cirq does not necessarily require an actual Quantum Computer for execution. Cirq can also use a simulator-like interface to perform Quantum circuit simulations.

Cirq is gradually grabbing a lot of pace, with one of its first users being [Zapata][10], formed last year by a [group of scientists][11] from Harvard University focused on Quantum Computing.

### Getting started with Cirq on Linux

The developers of the Open Source [Cirq library][12] recommend the installation in a [virtual python environment][13] like [virtualenv][14]. The developers’ installation guide for Linux can be found [here][15].

However, we successfully installed and tested Cirq directly for Python3 on an Ubuntu 16.04 system via the following steps:

#### Installing Cirq on Ubuntu

![Cirq Framework for Quantum Computing in Linux][16]

First, we would require pip or pip3 to install Cirq. [Pip][17] is a tool recommended for installing and managing Python packages.

For Python 3.x versions, Pip can be installed with:
```
sudo apt-get install python3-pip

```

Python3 packages can be installed via:
```
pip3 install <package-name>

```

We went ahead and installed the Cirq library with Pip3 for Python3:
```
pip3 install cirq

```

#### Enabling Plot and PDF generation (optional)

Optional system dependencies not install-able with pip can be installed with:
```
sudo apt-get install python3-tk texlive-latex-base latexmk

```

  * python3-tk is Python’s own graphic library which enables plotting functionality.
  * texlive-latex-base and latexmk enable PDF writing functionality.



Later, we successfully tested Cirq with the following command and code:
```
python3 -c 'import cirq; print(cirq.google.Foxtail)'

```

We got the resulting output as:

![][18]

#### Configuring Pycharm IDE for Cirq

We also configured a Python IDE [PyCharm on Ubuntu][19] to test the same results:

Since we installed Cirq for Python3 on our Linux system, we set the path to the project interpreter in the IDE settings to be:
```
/usr/bin/python3

```

![][20]

In the output above, you can note that the path to the project interpreter that we just set, is shown along with the path to the test program file (test.py). An exit code of 0 shows that the program has finished executing successfully without errors.

So, that’s a ready-to-use IDE environment where you can import the Cirq library to start programming with Python and simulate Quantum circuits.

#### Get started with Cirq

A good place to start are the [examples][21] that have been made available on Cirq’s Github page.

The developers have included this [tutorial][22] on GitHub to get started with learning Cirq. If you are serious about learning Quantum Computing, they recommend an excellent book called [“Quantum Computation and Quantum Information” by Nielsen and Chuang][23].

#### OpenFermion-Cirq

[OpenFermion][24] is an open source library for obtaining and manipulating representations of fermionic systems (including Quantum Chemistry) for simulation on Quantum Computers. Fermionic systems are related to the generation of [fermions][25], which according to [particle physics][26], follow [Fermi-Dirac statistics][27].

OpenFermion has been hailed as [a great practice tool][28] for chemists and researchers involved with [Quantum Chemistry][29]. The main focus of Quantum Chemistry is the application of [Quantum Mechanics][30] in physical models and experiments of chemical systems. Quantum Chemistry is also referred to as [Molecular Quantum Mechanics][31].

The advent of Cirq has now made it possible for OpenFermion to extend its functionality by providing routines and tools for using Cirq to compile and compose circuits for Quantum simulation algorithms.

#### Google Bristlecone

On March 5, 2018, Google presented [Bristlecone][32], their new Quantum processor, at the annual [American Physical Society meeting][33] in Los Angeles. The [gate-based superconducting system][34] provides a test platform for research into [system error rates][35] and [scalability][36] of Google’s [qubit technology][37], along-with applications in Quantum [simulation][38], [optimization][39], and [machine learning.][40]

In the near future, Google wants to make its 72 qubit Bristlecone Quantum processor [cloud accessible][41]. Bristlecone will gradually become quite capable to perform a task that a Classical Supercomputer would not be able to complete in a reasonable amount of time.

Cirq would make it easier for researchers to directly write programs for Bristlecone on the cloud, serving as a very convenient interface for real-time Quantum programming and testing.

Cirq will allow us to:

  * Fine tune control over Quantum circuits,
  * Specify [gate][42] behavior using native gates,
  * Place gates appropriately on the device &
  * Schedule the timing of these gates.



### The Open Science Perspective on Cirq

As we all know Cirq is Open Source on GitHub, its addition to the Open Source Scientific Communities, especially those which are focused on Quantum Research, can now efficiently collaborate to solve the current challenges in Quantum Computing today by developing new ways to reduce error rates and improve accuracy in the existing Quantum models.

Had Cirq not followed an Open Source model, things would have definitely been a lot more challenging. A great initiative would have been missed out and we would not have been one step closer in the field of Quantum Computing.

### Summary

To summarize in the end, we first introduced you to the concept of Quantum Computing by comparing it to existing Classical Computing techniques followed by a very important video on recent developmental updates in Quantum Computing since last year. We then briefly discussed Noisy Intermediate Scale Quantum, which is what Cirq is specifically built for.

We saw how we can install and test Cirq on an Ubuntu system. We also tested the installation for usability on an IDE environment with some resources to get started to learn the concept.

Finally, we also saw two examples of how Cirq would be an essential advantage in the development of research in Quantum Computing, namely OpenFermion and Bristlecone. We concluded the discussion by highlighting some thoughts on Cirq with an Open Science Perspective.

We hope we were able to introduce you to Quantum Computing with Cirq in an easy to understand manner. If you have any feedback related to the same, please let us know in the comments section. Thank you for reading and we look forward to see you in our next Open Science article.

--------------------------------------------------------------------------------

via: https://itsfoss.com/qunatum-computing-cirq-framework/

作者：[Avimanyu Bandyopadhyay][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/avimanyu/
[1]:https://en.wikipedia.org/wiki/Subatomic_particle
[2]:https://en.wikipedia.org/wiki/Quantum
[3]:https://www.clerro.com/guide/491/quantum-superposition-and-entanglement-explained
[4]:https://physics.stackexchange.com/questions/148131/can-quantum-entanglement-and-quantum-superposition-be-considered-the-same-phenom
[5]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/bit-vs-qubit.jpg
[6]:http://www.rfwireless-world.com/Terminology/Difference-between-Bit-and-Qubit.html
[7]:https://en.wikipedia.org/wiki/Proof_by_exhaustion
[8]:https://www.explainthatstuff.com/how-supercomputers-work.html
[9]:https://arxiv.org/abs/1801.00862
[10]:https://www.xconomy.com/san-francisco/2018/07/19/google-partners-with-zapata-on-open-source-quantum-computing-effort/
[11]:https://www.zapatacomputing.com/about/
[12]:https://github.com/quantumlib/Cirq
[13]:https://itsfoss.com/python-setup-linux/
[14]:https://virtualenv.pypa.io
[15]:https://cirq.readthedocs.io/en/latest/install.html#installing-on-linux
[16]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/cirq-framework-linux.jpeg
[17]:https://pypi.org/project/pip/
[18]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/cirq-test-output.jpg
[19]:https://itsfoss.com/install-pycharm-ubuntu/
[20]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/cirq-tested-on-pycharm.jpg
[21]:https://github.com/quantumlib/Cirq/tree/master/examples
[22]:https://github.com/quantumlib/Cirq/blob/master/docs/tutorial.md
[23]:http://mmrc.amss.cas.cn/tlb/201702/W020170224608149940643.pdf
[24]:http://openfermion.org
[25]:https://en.wikipedia.org/wiki/Fermion
[26]:https://en.wikipedia.org/wiki/Particle_physics
[27]:https://en.wikipedia.org/wiki/Fermi-Dirac_statistics
[28]:https://phys.org/news/2018-03-openfermion-tool-quantum-coding.html
[29]:https://en.wikipedia.org/wiki/Quantum_chemistry
[30]:https://en.wikipedia.org/wiki/Quantum_mechanics
[31]:https://ocw.mit.edu/courses/chemical-engineering/10-675j-computational-quantum-mechanics-of-molecular-and-extended-systems-fall-2004/lecture-notes/
[32]:https://techcrunch.com/2018/03/05/googles-new-bristlecone-processor-brings-it-one-step-closer-to-quantum-supremacy/
[33]:http://meetings.aps.org/Meeting/MAR18/Content/3475
[34]:https://en.wikipedia.org/wiki/Superconducting_quantum_computing
[35]:https://en.wikipedia.org/wiki/Quantum_error_correction
[36]:https://en.wikipedia.org/wiki/Scalability
[37]:https://research.googleblog.com/2015/03/a-step-closer-to-quantum-computation.html
[38]:https://research.googleblog.com/2017/10/announcing-openfermion-open-source.html
[39]:https://research.googleblog.com/2016/06/quantum-annealing-with-digital-twist.html
[40]:https://arxiv.org/abs/1802.06002
[41]:https://www.computerworld.com.au/article/644051/google-launches-quantum-framework-cirq-plans-bristlecone-cloud-move/
[42]:https://en.wikipedia.org/wiki/Logic_gate
