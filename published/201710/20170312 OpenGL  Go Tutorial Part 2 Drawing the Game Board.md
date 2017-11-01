OpenGL 与 Go 教程（二）绘制游戏面板
============================================================

- [第一节: Hello, OpenGL][6]
- [第二节: 绘制游戏面板][7]
- [第三节：实现游戏功能][8]

这篇教程的所有源代码都可以在 [GitHub][9] 上找到。

欢迎回到《OpenGL 与 Go 教程》。如果你还没有看过[第一节][15]，那就要回过头去看看那一节。

你现在应该能够创造一个漂亮的白色三角形，但我们不会把三角形当成我们游戏的基本单元，是时候把三角形变成正方形了，然后我们会做出一个完整的方格。

让我们现在开始做吧！

### 利用三角形绘制方形

在我们绘制方形之前，先把三角形变成直角三角形。打开 `main.go` 文件，把 `triangle` 的定义改成像这个样子：

```
triangle = []float32{
    -0.5, 0.5, 0,
    -0.5, -0.5, 0,
    0.5, -0.5, 0,
}
```

我们做的事情是，把最上面的顶点 X 坐标移动到左边（也就是变为 `-0.5`），这就变成了像这样的三角形：

![Conway's Game of Life - 右弦三角形](https://kylewbanks.com/images/post/golang-opengl-conway-4.png) 

很简单，对吧？现在让我们用两个这样的三角形顶点做成正方形。把 `triangle` 重命名为 `square`，然后添加第二个倒置的三角形的顶点数据，把直角三角形变成这样的：

```
square = []float32{
    -0.5, 0.5, 0,
    -0.5, -0.5, 0,
    0.5, -0.5, 0,

    -0.5, 0.5, 0,
    0.5, 0.5, 0,
    0.5, -0.5, 0,
}
```

注意：你也要把在 `main` 和 `draw` 里面命名的 `triangle` 改为 `square`。

我们通过添加三个顶点，把顶点数增加了一倍，这三个顶点就是右上角的三角形，用来拼成方形。运行它看看效果：

 ![Conway's Game of Life - 两个三角形构成方形](https://kylewbanks.com/images/post/golang-opengl-conway-5.png) 

很好，现在我们能够绘制正方形了！OpenGL 一点都不难，对吧？

### 在窗口中绘制方形格子

现在我们能画一个方形，怎么画 100 个吗？我们来创建一个 `cell` 结构体，用来表示格子的每一个单元，因此我们能够很灵活的选择绘制的数量：

```
type cell struct {
    drawable uint32

    x int
    y int
}
```

`cell` 结构体包含一个 `drawable` 属性，这是一个顶点数组对象，就像我们在之前创建的一样，这个结构体还包含 X 和 Y 坐标，用来表示这个格子的位置。

我们还需要两个常量，用来设定格子的大小和形状：

```
const (
    ...

    rows = 10
    columns = 10
)
```

现在我们添加一个创建格子的函数：

```
func makeCells() [][]*cell {
    cells := make([][]*cell, rows, rows)
    for x := 0; x < rows; x++ {
        for y := 0; y < columns; y++ {
            c := newCell(x, y)
            cells[x] = append(cells[x], c)
        }
    }

    return cells
}
```

这里我们创建多维的<ruby>切片<rt>slice</rt></ruby>，代表我们的游戏面板，用名为 `newCell` 的新函数创建的 `cell` 来填充矩阵的每个元素，我们待会就来实现 `newCell` 这个函数。

在接着往下阅读前，我们先花一点时间来看看 `makeCells` 函数做了些什么。我们创造了一个切片，这个切片的长度和格子的行数相等，每一个切片里面都有一个<ruby>细胞<rt>cell</rt></ruby>的切片，这些细胞的数量与列数相等。如果我们把 `rows` 和 `columns` 都设定成 2，那么就会创建如下的矩阵：

```
[
    [cell, cell],
    [cell, cell]
]
```

还可以创建一个更大的矩阵，包含 `10x10` 个细胞：

```
[
    [cell, cell, cell, cell, cell, cell, cell, cell, cell, cell],
    [cell, cell, cell, cell, cell, cell, cell, cell, cell, cell],
    [cell, cell, cell, cell, cell, cell, cell, cell, cell, cell],
    [cell, cell, cell, cell, cell, cell, cell, cell, cell, cell],
    [cell, cell, cell, cell, cell, cell, cell, cell, cell, cell],
    [cell, cell, cell, cell, cell, cell, cell, cell, cell, cell],
    [cell, cell, cell, cell, cell, cell, cell, cell, cell, cell],
    [cell, cell, cell, cell, cell, cell, cell, cell, cell, cell],
    [cell, cell, cell, cell, cell, cell, cell, cell, cell, cell],
    [cell, cell, cell, cell, cell, cell, cell, cell, cell, cell]
]
```

现在应该理解了我们创造的矩阵的形状和表示方法。让我们看看 `newCell` 函数到底是怎么填充矩阵的：

```
func newCell(x, y int) *cell {
    points := make([]float32, len(square), len(square))
    copy(points, square)

    for i := 0; i < len(points); i++ {
        var position float32
        var size float32
        switch i % 3 {
        case 0:
                size = 1.0 / float32(columns)
                position = float32(x) * size
        case 1:
                size = 1.0 / float32(rows)
                position = float32(y) * size
        default:
                continue
        }

        if points[i] < 0 {
                points[i] = (position * 2) - 1
        } else {
                points[i] = ((position + size) * 2) - 1
        }
    }

    return &cell{
        drawable: makeVao(points),

        x: x,
        y: y,
    }
}
```

这个函数里有很多内容，我们把它分成几个部分。我们做的第一件事是复制了 `square`  的定义。这让我们能够修改该定义，定制当前的细胞位置，而不会影响其它使用 `square` 切片定义的细胞。然后我们基于当前索引迭代 `points` 副本。我们用求余数的方法来判断我们是在操作 X 坐标（`i % 3 == 0`），还是在操作 Y 坐标（`i % 3 == 1`）（跳过 Z 坐标是因为我们仅在二维层面上进行操作），跟着确定细胞的大小（也就是占据整个游戏面板的比例），当然它的位置是基于细胞在 `相对游戏面板的` X 和 Y 坐标。

接着，我们改变那些包含在 `square` 切片中定义的 `0.5`，`0`， `-0.5` 这样的点。如果点小于 0，我们就把它设置成原来的 2 倍（因为 OpenGL 坐标的范围在 `-1` 到 `1` 之间，范围大小是 2），减 1 是为了归一化 OpenGL 坐标。如果点大于等于 0，我们的做法还是一样的，不过要加上我们计算出的尺寸。

这样做是为了设置每个细胞的大小，这样它就能只填充它在面板中的部分。因为我们有 10 行 10 列，每一个格子能分到游戏面板的 10% 宽度和高度。

最后，确定了所有点的位置和大小，我们用提供的 X 和 Y 坐标创建一个 `cell`，并设置 `drawable` 字段与我们刚刚操作 `points` 得到的顶点数组对象（vao）一致。

好了，现在我们在 `main` 函数里可以移去对 `makeVao` 的调用了，用 `makeCells` 代替。我们还修改了 `draw`，让它绘制一系列的细胞而不是一个 `vao`。

```
func main() {
    ...

    // vao := makeVao(square)
    cells := makeCells()

    for !window.ShouldClose() {
        draw(cells, window, program)
    }
}

func draw(cells [][]*cell, window *glfw.Window, program uint32) {
    gl.Clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT)
    gl.UseProgram(program)

    // TODO

    glfw.PollEvents()
    window.SwapBuffers()
}
```

现在我们要让每个细胞知道怎么绘制出自己。在 `cell` 里面添加一个 `draw` 函数：

```
func (c *cell) draw() {
    gl.BindVertexArray(c.drawable)
    gl.DrawArrays(gl.TRIANGLES, 0, int32(len(square) / 3))
}
```

这看上去很熟悉，它很像我们之前在 `vao` 里写的 `draw`，唯一的区别是我们的 `BindVertexArray` 函数用的是 `c.drawable`，这是我们在 `newCell` 中创造的细胞的 `vao`。

回到 main 中的 `draw` 函数上，我们可以循环每个细胞，让它们自己绘制自己：

```
func draw(cells [][]*cell, window *glfw.Window, program uint32) {
    gl.Clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT)
    gl.UseProgram(program)

    for x := range cells {
        for _, c := range cells[x] {
            c.draw()
        }
    }

    glfw.PollEvents()
    window.SwapBuffers()
}
```

如你所见，我们循环每一个细胞，调用它的 `draw` 函数。如果运行这段代码，你能看到像下面这样的东西：

![Conway's Game of Life - 全部格子](https://kylewbanks.com/images/post/golang-opengl-conway-6.png) 

这是你想看到的吗？我们做的是在格子里为每一行每一列创建了一个方块，然后给它上色，这就填满了整个面板！

注释掉 for 循环，我们就可以看到一个明显独立的细胞，像这样：

```
// for x := range cells {
//     for _, c := range cells[x] {
//         c.draw()
//     }
// }

cells[2][3].draw()
```

![Conway's Game of Life - 一个单独的细胞](https://kylewbanks.com/images/post/golang-opengl-conway-7.png) 

这只绘制坐标在 `(X=2, Y=3)` 的格子。你可以看到，每一个独立的细胞占据着面板的一小块部分，并且负责绘制自己那部分空间。我们也能看到游戏面板有自己的原点，也就是坐标为 `(X=0, Y=0)` 的点，在窗口的左下方。这仅仅是我们的 `newCell` 函数计算位置的方式，也可以用右上角，右下角，左上角，中央，或者其它任何位置当作原点。

接着往下做，移除 `cells[2][3].draw()` 这一行，取消 for 循环的那部分注释，变成之前那样全部绘制的样子。

### 总结

好了，我们现在能用两个三角形画出一个正方形了，我们还有一个游戏的面板了！我们该为此自豪，目前为止我们已经接触到了很多零碎的内容，老实说，最难的部分还在前面等着我们！

在接下来的第三节，我们会实现游戏核心逻辑，看到很酷的东西！

### 回顾

这是这一部分教程中 `main.go` 文件的内容：

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

	rows    = 10
	columns = 10
)

var (
	square = []float32{
		-0.5, 0.5, 0,
		-0.5, -0.5, 0,
		0.5, -0.5, 0,

		-0.5, 0.5, 0,
		0.5, 0.5, 0,
		0.5, -0.5, 0,
	}
)

type cell struct {
	drawable uint32

	x int
	y int
}

func main() {
	runtime.LockOSThread()

	window := initGlfw()
	defer glfw.Terminate()
	program := initOpenGL()

	cells := makeCells()
	for !window.ShouldClose() {
		draw(cells, window, program)
	}
}

func draw(cells [][]*cell, window *glfw.Window, program uint32) {
	gl.Clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT)
	gl.UseProgram(program)

	for x := range cells {
		for _, c := range cells[x] {
			c.draw()
		}
	}

	glfw.PollEvents()
	window.SwapBuffers()
}

func makeCells() [][]*cell {
	cells := make([][]*cell, rows, rows)
	for x := 0; x < rows; x++ {
		for y := 0; y < columns; y++ {
			c := newCell(x, y)
			cells[x] = append(cells[x], c)
		}
	}

	return cells
}

func newCell(x, y int) *cell {
	points := make([]float32, len(square), len(square))
	copy(points, square)

	for i := 0; i < len(points); i++ {
		var position float32
		var size float32
		switch i % 3 {
		case 0:
			size = 1.0 / float32(columns)
			position = float32(x) * size
		case 1:
			size = 1.0 / float32(rows)
			position = float32(y) * size
		default:
			continue
		}

		if points[i] < 0 {
			points[i] = (position * 2) - 1
		} else {
			points[i] = ((position + size) * 2) - 1
		}
	}

	return &cell{
		drawable: makeVao(points),

		x: x,
		y: y,
	}
}

func (c *cell) draw() {
	gl.BindVertexArray(c.drawable)
	gl.DrawArrays(gl.TRIANGLES, 0, int32(len(square)/3))
}

// 初始化 glfw，返回一个可用的 Window
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

// 初始化 OpenGL 并返回一个可用的着色器程序
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

// 初始化并返回由 points 提供的顶点数组
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

让我知道这篇文章对你有没有帮助，在 Twitter [@kylewbanks][20] 或者下方的连接，关注我以便获取最新的文章！


--------------------------------------------------------------------------------

via: https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-2-drawing-the-game-board

作者：[kylewbanks][a]
译者：[GitFtuture](https://github.com/GitFuture)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/kylewbanks
[1]:https://kylewbanks.com/category/golang
[2]:https://kylewbanks.com/category/opengl
[3]:https://twitter.com/intent/tweet?text=OpenGL%20%26%20Go%20Tutorial%20Part%202%3A%20Drawing%20the%20Game%20Board%20https%3A%2F%2Fkylewbanks.com%2Fblog%2Ftutorial-opengl-with-golang-part-2-drawing-the-game-board%20by%20%40kylewbanks
[4]:mailto:?subject=Check%20Out%20%22OpenGL%20%26%20Go%20Tutorial%20Part%202%3A%20Drawing%20the%20Game%20Board%22&body=https%3A%2F%2Fkylewbanks.com%2Fblog%2Ftutorial-opengl-with-golang-part-2-drawing-the-game-board
[5]:https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fkylewbanks.com%2Fblog%2Ftutorial-opengl-with-golang-part-2-drawing-the-game-board
[6]:https://linux.cn/article-8933-1.html
[7]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-2-drawing-the-game-board
[8]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-3-implementing-the-game
[9]:https://github.com/KyleBanks/conways-gol
[10]:https://linux.cn/article-8933-1.html
[11]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-2-drawing-the-game-board
[12]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-3-implementing-the-game
[13]:https://github.com/KyleBanks/conways-gol
[14]:https://twitter.com/kylewbanks
[15]:https://linux.cn/article-8933-1.html
[16]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-3-implementing-the-game
[17]:https://twitter.com/intent/tweet?text=OpenGL%20%26%20Go%20Tutorial%20Part%202%3A%20Drawing%20the%20Game%20Board%20https%3A%2F%2Fkylewbanks.com%2Fblog%2Ftutorial-opengl-with-golang-part-2-drawing-the-game-board%20by%20%40kylewbanks
[18]:mailto:?subject=Check%20Out%20%22OpenGL%20%26%20Go%20Tutorial%20Part%202%3A%20Drawing%20the%20Game%20Board%22&body=https%3A%2F%2Fkylewbanks.com%2Fblog%2Ftutorial-opengl-with-golang-part-2-drawing-the-game-board
[19]:https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fkylewbanks.com%2Fblog%2Ftutorial-opengl-with-golang-part-2-drawing-the-game-board
[20]:https://twitter.com/kylewbanks
