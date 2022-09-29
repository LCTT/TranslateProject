[#]: subject: "Google Unveils An Open Source C++ And Python Library, TensorStore"
[#]: via: "https://www.opensourceforu.com/2022/09/google-unveils-an-open-source-c-and-python-library-tensorstore/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Google Unveils An Open Source C++ And Python Library, TensorStore
======
*TensorStore, an open source software library written in C++ and Python for the storage and manipulation of n-dimensional data.*

Multidimensional datasets that span a single broad coordinate system are used in a variety of contemporary computer science and machine learning applications. Examples include forecasting the weather using air measurements over a grid of locations or predicting medical imaging outcomes using multi-channel image intensity values from a 2D or 3D scan. These datasets can be difficult to work with since users frequently wish to run studies on multiple workstations at once and may receive and write data at unpredictable intervals and varied scales. Under these conditions, even a single dataset might require petabytes of storage.

Google’s TensorStore has already been used to solve fundamental engineering issues in scientific computing related to the administration and processing of big datasets in neuroscience. To solve the issue of storing and manipulating n-dimensional data, Google Research created the open source TensorStore C++ and Python software package. Numerous storage systems, including local and network filesystems, Google Cloud Storage, etc. are supported by this module. It provides a uniform API that can read and write a variety of array types. The library offers read/writeback caching, transactions, and a robust atomicity, isolation, consistency, and durability (ACID) guarantee. Concurrency that is optimistic guarantees secure access from several processes and systems.

TensorStore offers a straightforward Python API that can be used to load and manipulate huge arrays of data. Due to the fact that no actual data is read or maintained in memory until the specific slice is needed, arbitrary large underlying datasets can be loaded and edited without having to store the entire dataset in memory. The syntax for indexing and manipulation, which is much the same as that used for NumPy operations, makes this possible. TensorStore also supports virtual views, broadcasting, alignment, and other advanced indexing features (data type conversion, downsampling, lazily on-the-fly generated arrays).

Processing and analysing large numerical datasets requires a lot of processing power. Typically, this is done by parallelizing activities among a large number of CPU or accelerator cores dispersed across multiple devices. Since reading and writing to TensorStore does not become a bottleneck during computation, one of TensorStore’s key goals has been to enable simultaneous processing of specific datasets while maintaining good performance (by preventing corruption or inconsistencies resulting from concurrent access patterns).

Additionally, TensorStore includes an asynchronous API that enables read or write operations to go concurrently. The application also does various operations and customisable in-memory caching at the same time (which decreases slower storage system interactions for frequently accessed data). When multiple machines are accessing the same dataset, optimistic concurrency protects the security of parallel operations. Without significantly reducing performance, it maintains compatibility with a number of underlying storage layers. In order to make TensorStore distributed computing compatible with many existing data processing workflows, TensorStore has also been integrated with parallel computing frameworks like Apache Beam and Dask.

PaLM and other advanced big language models are among the exciting TensorStore application cases. With their hundreds of billions of parameters, these neural networks push the boundaries of computing infrastructure while displaying unexpected ability in producing and understanding plain language. During this training process, accuracy in reading and writing the model parameters provides a challenge. Despite the fact that training is distributed across many workstations, it is required to regularly store parameters to a single checkpoint on a long-term storage system without causing the training process to lag. TensorStore has already been used to resolve these problems. Large-scale (“multipod”) models trained using JAX have been connected to checkpoints using this framework, which has been integrated with frameworks like T5X and Pathways.

An other fascinating application is brain mapping. The goal of synapse-resolution connectomics is to map the complex network of individual synapses in the brains of both animals and people. Petabyte-sized datasets are required for this, which are created by imaging the brain at a very high resolution with fields of view as small as a millimetre or more. Current datasets, however, present major storage, manipulation, and processing challenges because they require millions of gigabytes to store, modify, and process data inside a coordinate system. TensorStore has been utilised to handle the computational challenges provided by some of the biggest and most well-known connectomic datasets, with Google Cloud Storage acting as the underlying object storage system.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/09/google-unveils-an-open-source-c-and-python-library-tensorstore/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
