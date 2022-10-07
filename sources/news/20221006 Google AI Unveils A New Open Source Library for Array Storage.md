[#]: subject: "Google AI Unveils A New Open Source Library for Array Storage"
[#]: via: "https://www.opensourceforu.com/2022/10/google-ai-unveils-a-new-open-source-library-for-array-storage/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Google AI Unveils A New Open Source Library for Array Storage
======
*TensorStore, a High-Performance Open Source Library for Array Storage, has been introduced by Google AI.*

The open source C++ and Python framework TensorStore, developed by Google, aims to accelerate the design for reading and writing huge multidimensional arrays. Multidimensional datasets that cover a single large coordinate system are commonly used in contemporary computer science and machine learning applications. These datasets are challenging to work with because customers frequently wish to conduct investigations involving numerous workstations operating in parallel and may receive and output data at unpredictable intervals and varied scales.

Google Research developed TensorStore, a library that provides users with access to an API that can manage huge datasets without the requirement for sophisticated hardware, to address issues with data storage and manipulation. Numerous storage systems, including local and network filesystems, Google Cloud Storage, and others are supported by this library.

To load and work with enormous arrays of data, TensorStore provides a simple Python API. Any arbitrary big underlying datasets can be loaded and updated without having to store the complete dataset in memory because no actual data is read or kept in memory until the precise slice is required.

This is made possible by the indexing and manipulation grammar, which is quite similar to the syntax used for NumPy operations. Along with virtual views, broadcasting, alignment, and other sophisticated indexing features like data type conversion, downsampling, and haphazardly created arrays, TensorStore also supports these.

Additionally, TensorStore includes an asynchronous API that enables read or write operations to go concurrently. While performing other duties, a software can perform configurable in-memory caching, which reduces the need to deal with a slower storage system when accessing frequently used data.

Large numerical datasets demand a lot of processing power to examine and analyse. The usual method for accomplishing this is via parallelizing tasks among a sizable number of CPU or accelerator cores scattered across many devices. The ability to analyse individual datasets in parallel while retaining excellent speed has been a key goal of TensorStore. PaLM, brain mapping, and other complex large-scale machine learning models are some examples of TensorStore application cases.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/10/google-ai-unveils-a-new-open-source-library-for-array-storage/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
