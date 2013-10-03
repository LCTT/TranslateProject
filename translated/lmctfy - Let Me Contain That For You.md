lmctfy - Let Me Contain That For you 讓我用集裝箱為你的程式打包
====================================
Imctfy(發音是 lem-kut-fee)是谷歌[Google](http://www.google.com)開發的容器棧，可以為Linux程式提供容器（container）。這些容器可以讓一台機器上的不同程式使用相互隔離的資源。這可以讓那些程式以獨佔的方式運行在一台機器上。這些程式也可以擁有容器，因此能夠創建和管理屬於他們自己的子容器。

這項項目旨在提供一組以用戶的意圖為原點的高級API，來實現對容器概念的抽象化。這些創建的容器自身也通過繼承也可以擁有了自己的容器、也能夠杯其他的用戶程序所管理。

Lmctfy是為某些特定的場景（配置環境）設計、實現的，所以可能不能在所有場景（配置環境）中正常運作。我們目標是為更多的場景（配置環境）提供更多的支持，所以你可以為這項項目[貢獻](#貢獻])你的補丁 或是 在[郵件列表](#郵件列表)中發送郵件，這樣我們可以朝著[路線圖](#路線圖)前進。

Imctfy 內包含一個C++庫 和一個CLI（命令行界面程序）
lmctfy is released as both a C++ library and a CLI.

## 最新進展

Imctfy 還是一個在beta階段程式，目前仍在高度的開發中。最新的版本是0.1。她目前只支持CPU和內存資源的隔離。點擊查看我們的[路線圖](#路線圖)查看各部分的開發情況，點擊查看[貢獻](#貢獻)。

## 從此開始

這一節描述如何編譯你的CLI，運行所有的UI測試，和初始化機器的細節。[CLI](#cli)這節提供了一些CLI操作的例子，[C++ 庫](#c-library)描述了這個庫的使用詳情。

### 依賴

編譯本程序需要使用make和g++4.7。lmcfy使用了C++11，所以需要支援這項feature的編譯器。我們在 **Ubuntu 12.04+** 上測試過編譯。如果有為其他環境的編譯提供支援的補丁，我們很哈皮而且希望這越多越好。

Imctfy 依賴下列幾個庫，需要這些庫存在於你的計算機系統裡。
* [Protocol Buffers](https://code.google.com/p/protobuf/)
* [gflags](https://code.google.com/p/gflags/)
* [RE2](https://code.google.com/p/re2/)

### 編譯CLI

編譯lmctfy的CLI：

```bash
make -j <進程數> lmctfy
```

CLI程序會生成在 `bin/lmctfy/cli/lmctfy`
### Building the C++ Library
編譯C++庫
編譯Lmctfy的庫：


```bash
make -j <進程數> liblmctfy.a
```

庫文件會生成在  `bin/liblmctfy.a`.
### 運行測試

編譯和運行所有的UI測試：

```bash
make -j <進程數> check
```

### 初始化

lmctfy已經在 **Ubuntu 12.04+** 和 **Ubuntu 3.3** and **3.8** 內核上測試過。Imctfy當一台機器的所有容器都是運行她得時候 運轉得最好。所以不建議讓她運行在  [LXC](http://lxc.sourceforge.net/) 或者 其他container系統上（儘管在某些特殊得配置下這能夠跑起來）。

為了運行lmctfy，我們必須首先初始化計算機。這只需要運行一次就可以，而且一般是在計算機第一次啓動時候就完成了。當cgroup的hierarchies已經掛載了，接下來通常一個空的配置會可以讓lmctfy自動監測到目前的掛載。

```bash
lmctfy init ""
```

如果cgroup的hierarchies沒有被掛載，那麼這些資源必須被指明，這樣lmctfy才可以掛載他們。目前版本需要以下 cgroup 的hierarchies資源 `cpu`, `cpuset`, `cpuacct`, `memory`, and `freezer` 。 `cpu` and `cpuacct` 是目前衛衣可以被共享掛載的，其他的必須被單獨地掛載。具體配置說明可以查看`InitSpec` 在 [lmctfy.proto](/include/lmctfy.proto) 中。以下的例子是一個掛載 `/dev/cgroup` 中地所有hierarachies的配置文件：


```bash
lmctfy init "
  cgroup_mount:{
    mount_path:'/dev/cgroup/cpu'
    hierarchy:CGROUP_CPU hierarchy:CGROUP_CPUACCT
  }
  cgroup_mount:{
    mount_path:'/dev/cgroup/cpuset' hierarchy:CGROUP_CPUSET
  }
  cgroup_mount:{
    mount_path:'/dev/cgroup/freezer' hierarchy:CGROUP_FREEZER
  }
  cgroup_mount:{
    mount_path:'/dev/cgroup/memory' hierarchy:CGROUP_MEMORY
  }"
```

這樣，機器就可以被lmctfy使用、進行容器的操作。
The machine should now be ready to use `lmctfy` for container operations.

## 容器的命名

容器的命名系統簡化了文件系統的路徑，因為以後之需要一系列容器的繼承（容器的容器、子容器、子子容器）就可以了♪───Ｏ（≧∇≦）Ｏ────♪。

容器名稱允許的字符集：
* 英文字母＋阿拉伯數字 (`[a-zA-Z0-9]+`)
* 下劃線 (`_`)
* 橫縣 (`-`)
* 西文句號 (`.`)

絕對路徑是由從容器（比如是 `/sys/subcont`）的根目錄(`/`)開始計算的 。容器的名字也可以是相對的（比如 `subcont`）。一般地（除非特殊情況說明），都是沿用正常的文件路徑計算規則。

### 例子

```
   /           : 容器的根目錄
   /sys        : "sys" 容器
   /sys/sub    : "sub" 容器，"sys"容器的子容器
   .           : 當前的容器
   ./          : 當前的容器
   ..          : 當前的容器的父容器
   sub         : 當前的容器的"sub" 子容器
   ./sub       : 當前的容器的"sub" 子容器
   /sub        : "sub" 容器
   ../sibling  : 當前的父容器的“sibling”子容器
```


## CLI

### 創建

創建一個容器：

```bash
lmctfy create <名稱> <參數>
```

更完整的細節參見 [lmctfy.proto](/include/lmctfy.proto)

例子 (創建一個內存限制在100MB的容器)：

```bash
lmctfy create memory_only "memory:{limit:100000000}"
```

### 摧毀

摧毀一個容器：

```bash
lmctfy destroy <名稱>
```

### List
列表
從根目錄遞歸顯示當前機器的所有容器：

```bash
lmctfy list containers -r /
```

你也可以指列出當前的子容器：

```bash
lmctfy list containers
```

### 啓動

在一台容器中運行程式：

```bash
lmctfy run <名稱> <命令式>
```

例子：

```bash
lmctfy run test "echo hello world"
lmctfy run /test/sub bash
lmctfy run -n /test "echo hello from a daemon"
```

### 其他

鍵入`lmctfy help`查看全部的命令和文檔
Use `lmctfy help` to see the full command listing and documentation.

## C++ Library

此庫包含了`::containers::lmctfy::ContainerApi` 用來創建、獲取、銷毀、監測`::containers::lmctfy::Container`類型的對象，並且被獨立的容器相互交流。具體的lmctfy C++庫的文檔可以查看頭文件[lmctfy.h](/include/lmctfy.h)（你是認真的嗎(￣▽￣)）。

## 路線圖


lmctfy項目通過兩個層（CL1、CL2）來實現一個容器棧。CL1圍繞這驅動程式，並執行CL2製定的容器策略。CL1會為更高層創建和維護容器的抽象。她應當是唯一直接和內核交流以維護容器的層。CL2發展和設定容器策略，她使用CL1來執行策略和操控容器。比如，CL2（後台程式）實現了一個策略：所有容器的CPU和內存使用綜合不可以超過現提供的CPU和內存資源（以防止對內存資源的過度使用）。為了執行這條策略，她（CL2）會使用CL1（庫／CLI）來創建帶這條內存限制規則的容器。另一條對應的策略可能包括了允許過度使用X％的機器資源或者對不同資源的多重層次控制。

lmcfty項目現在提供了CL1組件，CL2還沒有實現。

### CL1
現在只提供高性能CPU和內存隔離。在我們的路線圖中我們還需要實現以下幾項：
* *Disk IO Isolation:* The specification is mostly complete, we’re missing the controller and resource handler.
* *磁盤IO隔離:* 這部分幾乎完成了，但是我們還缺少控制器和資源處理器。
* *Network Isolation:* The specification and cgroup implementation is up in the air.
* *網絡隔離:* 這部分和cgroup實現還在計劃中。
* *Support for Namespaces:* Bringing support for all namespaces and integrating them to the relevant resources.
* *命名空間支援:* 給所有命名空間支援並且整合到相關的資源中。
* *Support for Root File Systems:* Specifying and building root file systems.
* *根文件系統支援:* 識別並建立根文件系統。
* *Disk Images:* Being able to import/export a container’s root file system image.
* *磁盤鏡像:* 可以導入和導出容器的根文件系統的鏡像。
* *Support for Pause/Resume:* Using the freezer hierarchy.
* *為暫停／繼續提供支援:* 使用繼承的 freezer。
* *Checkpoint Restore:* Being able to checkpoint and restore containers on different machines.
* *還原點恢復:* 可以建立還原點並恢復到不同機器的容器中。

### CL2
最基礎的CL2 應當有一個容器策略來保證在機器不允許超載運行情況下的資源合理分配。我們的目標是CL2最終實現提供不同層次的服務。在這個框架下一些層次可以比其他的獲得更多好的服務。
* Monitoring and statistics support.
* 檢視和統計支援。
* Admission control and feasibility checks.
* 管理功能和功能檢查。
* Quality of Service guarantees and enforcement.
* 服務的質量保證和執行。

## 內核支援

lmctfy 最初的設計和實現是在一個自定義的內核上（一個原生linux內核外加一些列自選的補丁）上。由此，一些特性在這些內核補丁上跑得最理想。但是lmctfy應該在沒有他們得情況下正常運行。她應當監測可用得內核支援並且與之適應。我們已經在原生的 **Ubuntu 3.3*** and **3.8** 系列內核上測試過。如果你發現在其他版本內核下的問題，請匯報。

一些相關的內核補丁：
* *CPU latency:* This adds the `cpu.lat` cgroup file to the cpu hierarchy. It bounds the CPU wakeup latency a cgroup can expect.
* *CPU 延時:* 這個補丁為cpu hierarchy增加了 `cpu.lat`的 cgroup 文件。她限制了cgroup能預測的CPU喚醒延時時間。
* *CPU histogram accounting:* This adds the `cpuacct.histogram` cgroup file to the cpuacct hierarchy. It provides various histograms of CPU scheduling behavior.
* *CPU 柱狀圖統計:* 這個補丁為cpuacct hierarchy增加了 `cpuacct.histogram` cgroup 文件。她為CPU計劃行為提供了多種柱狀圖方案。
* *OOM management:* Series of patches to enforce priorities during out of memory conditions.
* *OOM 管理:* 一系列的補丁，用於在內存用盡的情況下執行優先權。

## 貢獻

對項目感到興趣了？檢視下我們的i[路線圖](#路線圖)，看看你是不是由很多想貢獻的方向呢？[從此開始](#從此開始)，你應該可以運行我們的程式。如果無法運行，請讓我們知道，這樣我們可以改進這份指南。

## 郵件列表


本項目的郵件列表是 <lmctfy@googlegroups.com>。本郵件列表用來發佈、討論、一般性支持。

---

原文引入: [github](https://github.com/google/lmctfy/)

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][Chilledheart](http://linux.cn/space/Chilledheart) 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID
