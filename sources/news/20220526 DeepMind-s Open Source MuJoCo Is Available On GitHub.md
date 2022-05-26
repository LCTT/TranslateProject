[#]: subject: "DeepMind’s Open Source MuJoCo Is Available On GitHub"
[#]: via: "https://www.opensourceforu.com/2022/05/deepminds-open-source-mujoco-is-available-on-github/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

DeepMind’s Open Source MuJoCo Is Available On GitHub
======
![deepmind1][1]

DeepMind, an Alphabet subsidiary and AI research lab, acquired the MuJoCo physics engine for robotics research and development in October 2021. The simulator was to be open-sourced and maintained as a free, open source, community-driven project. DeepMind claims that the open sourcing is now complete, with the entire codebase [available on GitHub][2].

MuJoCo, which stands for Multi-Joint Dynamics with Contact, is a physics engine designed to aid research and development in robotics, biomechanics, graphics and animation, and other fields that require fast and accurate simulation. MuJoCo can be used to implement model-based computations for machine learning applications such as control synthesis, state estimation, system identification, mechanism design, data analysis through inverse dynamics, and parallel sampling. It can also be used as a standard simulator, such as for gaming and interactive virtual environments.

According to DeepMind, the following are some of the features that make MuJoCo appealing for collaboration:

* Comprehensive simulator capable of simulating complex mechanisms
* Readable, performant, portable code
* Codebase that is easily extensible
* Extensive documentation, including both user-facing and code comments – We hope that colleagues from academia and the OSS community will use this platform and contribute to the codebase, thereby improving research for all.

DeepMind has more to say:

“As a C library with no dynamic memory allocation, MuJoCo is very fast. Unfortunately, raw physics speed has historically been hindered by Python wrappers, which made batched, multi-threaded operations non-performant due to the presence of the Global Interpreter Lock (GIL) and non-compiled code. In our roadmap below, we address this issue going forward.

“For now, we’d like to share some benchmarking results for two common models. The results were obtained on a standard AMD Ryzen 9 5950X machine, running Windows 10.”

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/05/deepminds-open-source-mujoco-is-available-on-github/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/05/deepmind1.jpg
[2]: https://github.com/deepmind/mujoco
