OpenGL 与 Go 教程（一）Hello, OpenGL
============================================================

- [第一节： Hello, OpenGL][6]
- [第二节： 绘制游戏面板][7]
- [第三节： 实现游戏功能][8]

这篇教程的所有源代码都可以在 [GitHub][9] 上找到。

### 介绍

[OpenGL][19] 是一门相当好的技术，适用于从桌面的 GUI 到游戏，到移动应用甚至 web 应用的多种类型的绘图工作。我敢保证，你今天看到的图形有些就是用 OpenGL 渲染的。可是，不管 OpenGL 多受欢迎、有多好用，与学习其它高级绘图库相比，学习 OpenGL 是要相当足够的决心的。

这个教程的目的是给你一个切入点，让你对 OpenGL 有个基本的了解，然后教你怎么用 [Go][20] 操作它。几乎每种编程语言都有绑定 OpenGL 的库，Go 也不例外，它有 [go-gl][21] 这个包。这是一个完整的套件，可以绑定 OpenGL ，适用于多种版本的 OpenGL。

这篇教程会按照下面列出的几个阶段进行介绍，我们最终的目标是用 OpenGL 在桌面窗口绘制游戏面板，进而实现[康威生命游戏][22]。完整的源代码可以在 GitHub [github.com/KyleBanks/conways-gol][23] 上获得，当你有疑惑的时候可以随时查看源代码，或者你要按照自己的方式学习也可以参考这个代码。

在我们开始之前，我们要先弄明白<ruby>康威生命游戏<rt>Conway's Game of Life</rt></ruby> 到底是什么。这里是 [Wikipedia][24] 上面的总结：

> 《生命游戏》，也可以简称为 Life，是一个细胞自动变化的过程，由英国数学家 John Horton Conway 于 1970 年提出。
>
> 这个“游戏”没有玩家，也就是说它的发展依靠的是它的初始状态，不需要输入。用户通过创建初始配置文件、观察它如何演变，或者对于高级“玩家”可以创建特殊属性的模式，进而与《生命游戏》进行交互。
>
> `规则`
>
> 《生命游戏》的世界是一个无穷多的二维正交的正方形细胞的格子世界，每一个格子都有两种可能的状态，“存活”或者“死亡”，也可以说是“填充态”或“未填充态”（区别可能很小，可以把它看作一个模拟人类/哺乳动物行为的早期模型，这要看一个人是如何看待方格里的空白）。每一个细胞与它周围的八个细胞相关联，这八个细胞分别是水平、垂直、斜对角相接的。在游戏中的每一步，下列事情中的一件将会发生：
> 
> 1. 当任何一个存活的细胞的附近少于 2 个存活的细胞时，该细胞将会消亡，就像人口过少所导致的结果一样
> 2. 当任何一个存活的细胞的附近有 2 至 3 个存活的细胞时，该细胞在下一代中仍然存活。
> 3. 当任何一个存活的细胞的附近多于 3 个存活的细胞时，该细胞将会消亡，就像人口过多所导致的结果一样
> 4. 任何一个消亡的细胞附近刚好有 3 个存活的细胞，该细胞会变为存活的状态，就像重生一样。

不需要其他工具，这里有一个我们将会制作的演示程序：

![Conway's Game of Life - 示例游戏](https://kylewbanks.com/images/post/golang-opengl-conway-1.gif) 

在我们的运行过程中，白色的细胞表示它是存活着的，黑色的细胞表示它已经死亡。

### 概述

本教程将会涉及到很多基础内容，从最基本的开始，但是你还是要对 Go 由一些最基本的了解 —— 至少你应该知道变量、切片、函数和结构体，并且装了一个 Go 的运行环境。我写这篇教程用的 Go 版本是 1.8，但它应该与之前的版本兼容。这里用 Go 语言实现没有什么特别新奇的东西，因此只要你有过类似的编程经历就行。

这里是我们在这个教程里将会讲到的东西：

*   [第一节: Hello, OpenGL][10]： 安装 OpenGL 和 [GLFW][11]，在窗口上绘制一个三角形。
*   [第二节: 绘制游戏面板][12]： 用三角形拼成方形，在窗口上用方形绘成格子。
*   [第三节: 实现游戏功能][13]： 实现 Conway 游戏

最后的源代码可以在 [GitHub][25] 上获得，每一节的末尾有个_回顾_，包含该节相关的代码。如果有什么不清楚的地方或者是你感到疑惑的，看看每一节末尾的完整代码。

现在就开始吧！

### 安装 OpenGL 和 GLFW

我们介绍过 OpenGL，但是为了使用它，我们要有个窗口可以绘制东西。 [GLFW][26] 是一款用于 OpenGL 的跨平台 API，允许我们创建并使用窗口，而且它也是 [go-gl][27] 套件中提供的。

我们要做的第一件事就是确定 OpenGL 的版本。为了方便本教程，我们将会使用 `OpenGL v4.1`，但要是你的操作系统不支持最新的 OpenGL，你也可以用 `v2.1`。要安装 OpenGL，我们需要做这些事：

```
# 对于 OpenGL 4.1
$ go get github.com/go-gl/gl/v4.1-core/gl

# 或者 2.1
$ go get github.com/go-gl/gl/v2.1/gl
```

然后是安装 GLFW：

```
$ go get github.com/go-gl/glfw/v3.2/glfw
```

安装好这两个包之后，我们就可以开始了！先创建 `main.go` 文件，导入相应的包（我们待会儿会用到的其它东西）。

```
package main

import (
    "log"
    "runtime"

    "github.com/go-gl/gl/v4.1-core/gl" // OR: github.com/go-gl/gl/v2.1/gl
    "github.com/go-gl/glfw/v3.2/glfw"
)
```

接下来定义一个叫做 `main` 的函数，这是用来初始化 OpenGL 以及 GLFW，并显示窗口的：

```
const (
    width  = 500
    height = 500
)

func main() {
    runtime.LockOSThread()

    window := initGlfw()
    defer glfw.Terminate()

    for !window.ShouldClose() {
        // TODO
    }
}

// initGlfw 初始化 glfw 并且返回一个可用的窗口。
func initGlfw() *glfw.Window {
    if err := glfw.Init(); err != nil {
            panic(err)
    }

    glfw.WindowHint(glfw.Resizable, glfw.False)
    glfw.WindowHint(glfw.ContextVersionMajor, 4) // OR 2
    glfw.WindowHint(glfw.ContextVersionMinor, 1)
    glfw.WindowHint(glfw.OpenGLProfile, glfw.OpenGLCoreProfile)
    glfw.WindowHint(glfw.OpenGLForwardCompatible, glfw.True)

    window, err := glfw.CreateWindow(width, height, "Conway's Game of Life", nil, nil)
    if err != nil {
            panic(err)
    }
    window.MakeContextCurrent()

    return window
}
```

好了，让我们花一分钟来运行一下这个程序，看看会发生什么。首先定义了一些常量， `width` 和 `height` —— 它们决定窗口的像素大小。

然后就是 `main` 函数。这里我们使用了 `runtime` 包的 `LockOSThread()`，这能确保我们总是在操作系统的同一个线程中运行代码，这对 GLFW 来说很重要，GLFW 需要在其被初始化之后的线程里被调用。讲完这个，接下来我们调用 `initGlfw` 来获得一个窗口的引用，并且推迟（`defer`）其终止。窗口的引用会被用在一个 `for` 循环中，只要窗口处于打开的状态，就执行某些事情。我们待会儿会讲要做的事情是什么。

`initGlfw` 是另一个函数，这里我们调用 `glfw.Init()` 来初始化 GLFW 包。然后我们定义了 GLFW 的一些全局属性，包括禁用调整窗口大小和改变 OpenGL 的属性。然后创建了 `glfw.Window`，这会在稍后的绘图中用到。我们仅仅告诉它我们想要的宽度和高度，以及标题，然后调用 `window.MakeContextCurrent`，将窗口绑定到当前的线程中。最后就是返回窗口的引用了。

如果你现在就构建、运行这个程序，你看不到任何东西。很合理，因为我们还没有用这个窗口做什么实质性的事。

定义一个新函数，初始化 OpenGL，就可以解决这个问题：

```
// initOpenGL 初始化 OpenGL 并且返回一个初始化了的程序。
func initOpenGL() uint32 {
    if err := gl.Init(); err != nil {
            panic(err)
    }
    version := gl.GoStr(gl.GetString(gl.VERSION))
    log.Println("OpenGL version", version)

    prog := gl.CreateProgram()
    gl.LinkProgram(prog)
    return prog
}
```

`initOpenGL` 就像之前的 `initGlfw` 函数一样，初始化 OpenGL 库，创建一个<ruby>程序<rt>program</rt></ruby>。“程序”是一个包含了<ruby>着色器<rt>shader</rt></ruby>的引用，稍后会用<ruby>着色器<rt>shader</rt></ruby>绘图。待会儿会讲这一点，现在只用知道 OpenGL 已经初始化完成了，我们有一个程序的引用。我们还打印了 OpenGL 的版本，可以用于之后的调试。

回到 `main` 函数里，调用这个新函数：

```
func main() {
    runtime.LockOSThread()

    window := initGlfw()
    defer glfw.Terminate()

    program := initOpenGL()

    for !window.ShouldClose() {
        draw(window, program)
    }
}
```

你应该注意到了现在我们有 `program` 的引用，在我们的窗口循环中，调用新的 `draw` 函数。最终这个函数会绘制出所有细胞，让游戏状态变得可视化，但是现在它做的仅仅是清除窗口，所以我们只能看到一个全黑的屏幕：

```
func draw(window *glfw.Window, program uint32) {
    gl.Clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT)
    gl.UseProgram(prog)

    glfw.PollEvents()
    window.SwapBuffers()
}
```

我们首先做的是调用 `gl.clear` 函数来清除上一帧在窗口中绘制的东西，给我们一个干净的面板。然后我们告诉 OpenGL 去使用我们的程序引用，这个引用还没有做什么事。最终我们告诉 GLFW 用 `PollEvents` 去检查是否有鼠标或者键盘事件（这一节里还不会对这些事件进行处理），告诉窗口去交换缓冲区 `SwapBuffers`。 [交换缓冲区][28] 很重要，因为 GLFW（像其他图形库一样）使用双缓冲，也就是说你绘制的所有东西实际上是绘制到一个不可见的画布上，当你准备好进行展示的时候就把绘制的这些东西放到可见的画布中 —— 这种情况下，就需要调用 `SwapBuffers` 函数。

好了，到这里我们已经讲了很多东西，花一点时间看看我们的实验成果。运行这个程序，你应该可以看到你所绘制的第一个东西：

![Conway's Game of Life - 第一个窗口](https://kylewbanks.com/images/post/golang-opengl-conway-2.png) 

完美！

### 在窗口里绘制三角形

我们已经完成了一些复杂的步骤，即使看起来不多，但我们仍然需要绘制一些东西。我们会以三角形绘制开始，可能这第一眼看上去要比我们最终要绘制的方形更难，但你会知道这样的想法是错的。你可能不知道的是三角形或许是绘制的图形中最简单的，实际上我们最终会用某种方式把三角形拼成方形。

好吧，那么我们想要绘制一个三角形，怎么做呢？我们通过定义图形的顶点来绘制图形，把它们交给 OpenGL 来进行绘制。先在 `main.go` 的顶部里定义我们的三角形：

```
var (
    triangle = []float32{
        0, 0.5, 0, // top
        -0.5, -0.5, 0, // left
        0.5, -0.5, 0, // right
    }
)
```

这看上去很奇怪，让我们分开来看。首先我们用了一个 `float32` <ruby>切片<rt>slice</rt></ruby>，这是一种我们总会在向 OpenGL 传递顶点时用到的数据类型。这个切片包含 9 个值，每三个值构成三角形的一个点。第一行， `0, 0.5, 0` 表示的是 X、Y、Z 坐标，是最上方的顶点，第二行是左边的顶点，第三行是右边的顶点。每一组的三个点都表示相对于窗口中心点的 X、Y、Z 坐标，大小在 `-1` 和 `1` 之间。因此最上面的顶点 X 坐标是 `0`，因为它在 X 方向上位于窗口中央，Y 坐标是 `0.5` 意味着它会相对窗口中央上移 1/4 个单位（因为窗口的范围是 `-1` 到 `1`），Z 坐标是 0。因为我们只需要在二维空间中绘图，所以 Z 值永远是 `0`。现在看一看左右两边的顶点，看看你能不能理解为什么它们是这样定义的 —— 如果不能立刻就弄清楚也没关系，我们将会在屏幕上去观察它，因此我们需要一个完美的图形来进行观察。

好了，我们定义了一个三角形，但是现在我们得把它画出来。要画出这个三角形，我们需要一个叫做<ruby>顶点数组对象<rt>Vertex Array Object</rt></ruby>或者叫 vao 的东西，这是由一系列的点（也就是我们定义的三角形）创造的，这个东西可以提供给 OpenGL 来进行绘制。创建一个叫做 `makeVao` 的函数，然后我们可以提供一个点的切片，让它返回一个指向 OpenGL 顶点数组对象的指针：

```
// makeVao 执行初始化并从提供的点里面返回一个顶点数组
func makeVao(points []float32) uint32 {
    var vbo uint32
    gl.GenBuffers(1, &vbo)
    gl.BindBuffer(gl.ARRAY_BUFFER, vbo)
    gl.BufferData(gl.ARRAY_BUFFER, 4*len(points), gl.Ptr(points), gl.STATIC_DRAW)

    var vao uint32
    gl.GenVertexArrays(1, &vao)
    gl.BindVertexArray(vao)
    gl.EnableVertexAttribArray(0)
    gl.BindBuffer(gl.ARRAY_BUFFER, vbo)
    gl.VertexAttribPointer(0, 3, gl.FLOAT, false, 0, nil)

    return vao
}
```

首先我们创造了<ruby>顶点缓冲区对象<rt>Vertex Buffer Object</rt></ruby> 或者说 vbo 绑定到我们的 `vao` 上，`vbo` 是通过所占空间（也就是 4 倍 `len(points)` 大小的空间）和一个指向顶点的指针（`gl.Ptr(points)`）来创建的。你也许会好奇为什么它是 4 倍 —— 而不是 6 或者 3 或者 1078 呢？原因在于我们用的是 `float32` 切片，32 个位的浮点型变量是 4 个字节，因此我们说这个缓冲区以字节为单位的大小是点个数的 4 倍。

现在我们有缓冲区了，可以创建 `vao` 并用 `gl.BindBuffer` 把它绑定到缓冲区上，最后返回 `vao`。这个 `vao` 将会被用于绘制三角形！

回到 `main` 函数：

```
func main() {
    ...

    vao := makeVao(triangle)
    for !window.ShouldClose() {
        draw(vao, window, program)
    }
}

这里我们调用了 `makeVao` ，从我们之前定义的 `triangle` 顶点中获得 `vao` 引用，将它作为一个新的参数传递给 `draw` 函数：

func draw(vao uint32, window *glfw.Window, program uint32) {
    gl.Clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT)
    gl.UseProgram(program)

    gl.BindVertexArray(vao)
    gl.DrawArrays(gl.TRIANGLES, 0, int32(len(triangle) / 3))

    glfw.PollEvents()
    window.SwapBuffers()
}
```

然后我们把 OpenGL 绑定到 `vao` 上，这样当我们告诉 OpenGL 三角形切片的顶点数（除以 3，是因为每一个点有 X、Y、Z 坐标），让它去 `DrawArrays` ，它就知道要画多少个顶点了。

如果你这时候运行程序，你可能希望在窗口中央看到一个美丽的三角形，但是不幸的是你还看不到。还有一件事情没做，我们告诉 OpenGL 我们要画一个三角形，但是我们还要告诉它_怎么_画出来。

要让它画出来，我们需要叫做<ruby>片元着色器<rt>fragment shader</rt></ruby>和<ruby>顶点着色器<rt>vertex shader</rt></ruby>的东西，这些已经超出本教程的范围了（老实说，也超出了我对 OpenGL 的了解），但 [Harold Serrano 在 Quora][29] 上对对它们是什么给出了完美的介绍。我们只需要理解，对于这个应用来说，着色器是它内部的小程序（用 [OpenGL Shader Language 或 GLSL][30] 编写的），它操作顶点进行绘制，也可用于确定图形的颜色。

添加两个 `import` 和一个叫做 `compileShader` 的函数：

```
import (
    "strings"
    "fmt"
)

func compileShader(source string, shaderType uint32) (uint32, error) {
    shader := gl.CreateShader(shaderType)

    csources, free := gl.Strs(source)
    gl.ShaderSource(shader, 1, csources, nil)
    free()
    gl.CompileShader(shader)

    var status int32
    gl.GetShaderiv(shader, gl.COMPILE_STATUS, &status)
    if status == gl.FALSE {
        var logLength int32
        gl.GetShaderiv(shader, gl.INFO_LOG_LENGTH, &logLength)

        log := strings.Repeat("\x00", int(logLength+1))
        gl.GetShaderInfoLog(shader, logLength, nil, gl.Str(log))

        return 0, fmt.Errorf("failed to compile %v: %v", source, log)
    }

    return shader, nil
}
```

这个函数的目的是以字符串的形式接受着色器源代码和它的类型，然后返回一个指向这个编译好的着色器的指针。如果编译失败，我们就会获得出错的详细信息。

现在定义着色器，在 `makeProgram` 里编译。回到我们的 `const` 块中，我们在这里定义了 `width` 和 `hegiht`。

```
vertexShaderSource = `
    #version 410
    in vec3 vp;
    void main() {
        gl_Position = vec4(vp, 1.0);
    }
` + "\x00"

fragmentShaderSource = `
    #version 410
    out vec4 frag_colour;
    void main() {
        frag_colour = vec4(1, 1, 1, 1);
    }
` + "\x00"
```

如你所见，这是两个包含了 GLSL 源代码字符串的着色器，一个是<ruby>顶点着色器<rt>vertex shader</rt></ruby>，另一个是<ruby>片元着色器<rt>fragment shader</rt></ruby>。唯一比较特殊的地方是它们都要在末尾加上一个空终止字符，`\x00` —— OpenGL 需要它才能编译着色器。注意 `fragmentShaderSource`，这是我们用 RGBA 形式的值通过 `vec4` 来定义我们图形的颜色。你可以修改这里的值来改变这个三角形的颜色，现在的值是 `RGBA(1, 1, 1, 1)` 或者说是白色。

同样需要注意的是这两个程序都是运行在 `#version 410` 版本下，如果你用的是 OpenGL 2.1，那你也可以改成 `#version 120`。这里 `120` 不是打错的，如果你用的是 OpenGL 2.1，要用 `120` 而不是 `210`！

接下来在 `initOpenGL` 中我们会编译着色器，把它们附加到我们的 `program` 中。

```
func initOpenGL() uint32 {
	if err := gl.Init(); err != nil {
		panic(err)
	}
	version := gl.GoStr(gl.GetString(gl.VERSION))
	log.Println("OpenGL version", version)

    vertexShader, err := compileShader(vertexShaderSource, gl.VERTEX_SHADER)
    if err != nil {
        panic(err)
    }
    fragmentShader, err := compileShader(fragmentShaderSource, gl.FRAGMENT_SHADER)
    if err != nil {
        panic(err)
    }

    prog := gl.CreateProgram()
    gl.AttachShader(prog, vertexShader)
    gl.AttachShader(prog, fragmentShader)    
    gl.LinkProgram(prog)
    return prog
}
```

这里我们用顶点着色器（`vertexShader`）调用了 `compileShader` 函数，指定它的类型是 `gl.VERTEX_SHADER`，对片元着色器（`fragmentShader`）做了同样的事情，但是指定的类型是 `gl.FRAGMENT_SHADER`。编译完成后，我们把它们附加到程序中，调用 `gl.AttachShader`，传递程序（`prog`）以及编译好的着色器作为参数。

现在我们终于可以看到我们漂亮的三角形了！运行程序，如果一切顺利的话你会看到这些：

![Conway's Game of Life - Hello, Triangle!](https://kylewbanks.com/images/post/golang-opengl-conway-3.png) 

### 总结

是不是很惊喜！这些代码画出了一个三角形，但我保证我们已经完成了大部分的 OpenGL 代码，在接下来的章节中我们还会用到这些代码。我十分推荐你花几分钟修改一下代码，看看你能不能移动三角形，改变三角形的大小和颜色。OpenGL 可以令人心生畏惧，有时想要理解发生了什么很困难，但是要记住，这不是魔法 - 它只不过看上去像魔法。

下一节里我们讲会用两个锐角三角形拼出一个方形 - 看看你能不能在进入下一节前试着修改这一节的代码。不能也没有关系，因为我们在 [第二节][31] 还会编写代码， 接着创建一个有许多方形的格子，我们把它当做游戏面板。

最后，在[第三节][32] 里我们会用格子来实现 _Conway’s Game of Life_！


### 回顾

本教程 `main.go` 文件的内容如下：

```
package main

import (
	"fmt"
	"log"
	"runtime"
	"strings"

	"github.com/go-gl/gl/v4.1-core/gl" // OR: github.com/go-gl/gl/v2.1/gl
	"github.com/go-gl/glfw/v3.2/glfw"
)

const (
	width  = 500
	height = 500

	vertexShaderSource = `
		#version 410
		in vec3 vp;
		void main() {
			gl_Position = vec4(vp, 1.0);
		}
	` + "\x00"

	fragmentShaderSource = `
		#version 410
		out vec4 frag_colour;
		void main() {
			frag_colour = vec4(1, 1, 1, 1.0);
		}
	` + "\x00"
)

var (
	triangle = []float32{
		0, 0.5, 0,
		-0.5, -0.5, 0,
		0.5, -0.5, 0,
	}
)

func main() {
	runtime.LockOSThread()

	window := initGlfw()
	defer glfw.Terminate()
	program := initOpenGL()

	vao := makeVao(triangle)
	for !window.ShouldClose() {
		draw(vao, window, program)
	}
}

func draw(vao uint32, window *glfw.Window, program uint32) {
	gl.Clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT)
	gl.UseProgram(program)

	gl.BindVertexArray(vao)
	gl.DrawArrays(gl.TRIANGLES, 0, int32(len(triangle)/3))

	glfw.PollEvents()
	window.SwapBuffers()
}

// initGlfw 初始化 glfw 并返回一个窗口供使用。
func initGlfw() *glfw.Window {
	if err := glfw.Init(); err != nil {
		panic(err)
	}
	glfw.WindowHint(glfw.Resizable, glfw.False)
	glfw.WindowHint(glfw.ContextVersionMajor, 4)
	glfw.WindowHint(glfw.ContextVersionMinor, 1)
	glfw.WindowHint(glfw.OpenGLProfile, glfw.OpenGLCoreProfile)
	glfw.WindowHint(glfw.OpenGLForwardCompatible, glfw.True)

	window, err := glfw.CreateWindow(width, height, "Conway's Game of Life", nil, nil)
	if err != nil {
		panic(err)
	}
	window.MakeContextCurrent()

	return window
}

// initOpenGL 初始化 OpenGL 并返回一个已经编译好的着色器程序
func initOpenGL() uint32 {
	if err := gl.Init(); err != nil {
		panic(err)
	}
	version := gl.GoStr(gl.GetString(gl.VERSION))
	log.Println("OpenGL version", version)

	vertexShader, err := compileShader(vertexShaderSource, gl.VERTEX_SHADER)
	if err != nil {
		panic(err)
	}

	fragmentShader, err := compileShader(fragmentShaderSource, gl.FRAGMENT_SHADER)
	if err != nil {
		panic(err)
	}

	prog := gl.CreateProgram()
	gl.AttachShader(prog, vertexShader)
	gl.AttachShader(prog, fragmentShader)
	gl.LinkProgram(prog)
	return prog
}

// makeVao 执行初始化并从提供的点里面返回一个顶点数组
func makeVao(points []float32) uint32 {
	var vbo uint32
	gl.GenBuffers(1, &vbo)
	gl.BindBuffer(gl.ARRAY_BUFFER, vbo)
	gl.BufferData(gl.ARRAY_BUFFER, 4*len(points), gl.Ptr(points), gl.STATIC_DRAW)

	var vao uint32
	gl.GenVertexArrays(1, &vao)
	gl.BindVertexArray(vao)
	gl.EnableVertexAttribArray(0)
	gl.BindBuffer(gl.ARRAY_BUFFER, vbo)
	gl.VertexAttribPointer(0, 3, gl.FLOAT, false, 0, nil)

	return vao
}

func compileShader(source string, shaderType uint32) (uint32, error) {
	shader := gl.CreateShader(shaderType)

	csources, free := gl.Strs(source)
	gl.ShaderSource(shader, 1, csources, nil)
	free()
	gl.CompileShader(shader)

	var status int32
	gl.GetShaderiv(shader, gl.COMPILE_STATUS, &status)
	if status == gl.FALSE {
		var logLength int32
		gl.GetShaderiv(shader, gl.INFO_LOG_LENGTH, &logLength)

		log := strings.Repeat("\x00", int(logLength+1))
		gl.GetShaderInfoLog(shader, logLength, nil, gl.Str(log))

		return 0, fmt.Errorf("failed to compile %v: %v", source, log)
	}

	return shader, nil
}
```

请在 Twitter [@kylewbanks][33] 上告诉我这篇文章对你是否有帮助，或者点击下方的关注，以便及时获取最新文章！

--------------------------------------------------------------------------------

via: https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-1-hello-opengl

作者：[kylewbanks][a]
译者：[GitFuture](https://github.com/GitFuture)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/kylewbanks
[1]:https://kylewbanks.com/category/golang
[2]:https://kylewbanks.com/category/opengl
[3]:https://twitter.com/intent/tweet?text=OpenGL%20%26%20Go%20Tutorial%20Part%201%3A%20Hello%2C%20OpenGL%20https%3A%2F%2Fkylewbanks.com%2Fblog%2Ftutorial-opengl-with-golang-part-1-hello-opengl%20by%20%40kylewbanks
[4]:mailto:?subject=Check%20Out%20%22OpenGL%20%26%20Go%20Tutorial%20Part%201%3A%20Hello%2C%20OpenGL%22&body=https%3A%2F%2Fkylewbanks.com%2Fblog%2Ftutorial-opengl-with-golang-part-1-hello-opengl
[5]:https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fkylewbanks.com%2Fblog%2Ftutorial-opengl-with-golang-part-1-hello-opengl
[6]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-1-hello-opengl
[7]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-2-drawing-the-game-board
[8]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-3-implementing-the-game
[9]:https://github.com/KyleBanks/conways-gol
[10]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-1-hello-opengl
[11]:http://www.glfw.org/
[12]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-2-drawing-the-game-board
[13]:https://kylewbanks.com/blog/blog/tutorial-opengl-with-golang-part-3-implementing-the-game
[14]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-1-hello-opengl
[15]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-2-drawing-the-game-board
[16]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-3-implementing-the-game
[17]:https://github.com/KyleBanks/conways-gol
[18]:https://twitter.com/kylewbanks
[19]:https://www.opengl.org/
[20]:https://golang.org/
[21]:https://github.com/go-gl/gl
[22]:https://en.wikipedia.org/wiki/Conway's_Game_of_Life
[23]:https://github.com/KyleBanks/conways-gol
[24]:https://en.wikipedia.org/wiki/Conway's_Game_of_Life
[25]:https://github.com/KyleBanks/conways-gol
[26]:http://www.glfw.org/
[27]:https://github.com/go-gl/glfw
[28]:http://www.glfw.org/docs/latest/window_guide.html#buffer_swap
[29]:https://www.quora.com/What-is-a-vertex-shader-and-what-is-a-fragment-shader/answer/Harold-Serrano?srid=aVb
[30]:https://www.opengl.org/sdk/docs/tutorials/ClockworkCoders/glsl_overview.php
[31]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-2-drawing-the-game-board
[32]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-3-implementing-the-game
[33]:https://twitter.com/kylewbanks
