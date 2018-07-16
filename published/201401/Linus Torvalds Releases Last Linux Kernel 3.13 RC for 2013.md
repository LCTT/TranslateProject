2013年的最后一个Linux内核3.13RC版本
================================================================================
**在2013年结束前，Linux Torvalds宣布Linux内核3.13分支中的第六个候选版本已发布，即时可用。** 

Linux内核3.13 RC6仅包含了很小数量的一些提交，使得此次候选版本成为了迄今体积最小的一个，至少在这一个开发周期中如此。

Linus Torvalds在官方发布中说道：“正如我们之前期望的那样，整个一周假期都没有什么大的bug出现。因此，我们这次只有一些小的随机更新：驱动方面（例如无限宽带、GPU、CPUfreg、libata、块设备等），一些小的文件系统修复（ext4/jdb2)，以及一些ARM SoC方面的更新。x86、perCPU 和 cgroup 方面的更新很少。甚至没什么值得注意的，只有81个很平常的小提交。”

大神平常是非常健谈的，但是对于年底的这次小发布却如此惜字如金，估计是为了避免更多的非议，打算过个好年。

Linus Torvalds还在[12月18号庆祝了自己的生日][1]，但并没有大操大办。

###Linux内核 3.13 RC6 的亮点###

- 修正了音频pins的数目（drm/radeon/dce6)
- 在Cayman上禁用了SS(drm/radeon/dpm)
- 检查了扬声器分配和SAD代码中的0计数（drm/radeon)
- 修复了拔掉块设备时的内存泄露问题
- 修复了SDHI资源的大小
- 修复了执行缓存中分配内存失败后仍然释放引用的问题（drm/i9150)
- 修复了 reset_status 中对 batch_obj 的错误引用释放
- Sandybridge+ 启用了正确的 GMCH_CTRL 注册
- 对废弃的消息 JBD->JBD2 进行了重命名
- 增加对 ValleyView Soc 的支持
- 增加对 PWM 背光电源的支持

完整的修改、改进以及修复列表请参看官方[修改日志][2]。

下载Linux内核3.13 RC6：

- [Linux kernel 3.13 Release Candidate 6 tar.xz][3][源码] [73.60 MB]

*请注意这是一个测试版本，仅用于测试目的，请不要用在任何生产环境中。*

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Linus-Torvalds-Releases-Last-Linux-Kernel-3-13-RC-for-2013-412622.shtml

译者：[Mr小眼儿](https://github.com/tinyeyeser) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://news.softpedia.com/news/Happy-Birthday-Linus-Torvalds-412474.shtml
[2]:https://lkml.org/lkml/2013/12/29/95
[3]:https://www.kernel.org/pub/linux/kernel/v3.x/testing/linux-3.13-rc6.tar.xz
