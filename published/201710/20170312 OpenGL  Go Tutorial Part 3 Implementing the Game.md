OpenGL 与 Go 教程（三）实现游戏
============================================================

- [第一节: Hello, OpenGL][8]
- [第二节: 绘制游戏面板][9]
- [第三节：实现游戏功能][10] 

该教程的完整源代码可以从 [GitHub][11] 上找到。

欢迎回到《OpenGL 与 Go 教程》！如果你还没有看过 [第一节][12] 和 [第二节][13]，那就要回过头去看一看。

到目前为止，你应该懂得如何创建网格系统以及创建代表方格中每一个单元的格子阵列。现在可以开始把网格当作游戏面板实现<ruby>康威生命游戏<rt>Conway's Game of Life</rt></ruby>。

开始吧！

### 实现康威生命游戏

康威生命游戏的其中一个要点是所有<ruby>细胞<rt>cell</rt></ruby>必须同时基于当前细胞在面板中的状态确定下一个细胞的状态。也就是说如果细胞 `(X=3,Y=4)` 在计算过程中状态发生了改变，那么邻近的细胞 `(X=4,Y=4)` 必须基于 `(X=3,Y=4)` 的状态决定自己的状态变化，而不是基于自己现在的状态。简单的讲，这意味着我们必须遍历细胞，确定下一个细胞的状态，而在绘制之前不改变他们的当前状态，然后在下一次循环中我们将新状态应用到游戏里，依此循环往复。

为了完成这个功能，我们需要在 `cell` 结构体中添加两个布尔型变量：

```
type cell struct {
    drawable uint32

    alive     bool
    aliveNext bool

    x int
    y int
}
```

这里我们添加了 `alive` 和 `aliveNext`，前一个是细胞当前的专题，后一个是经过计算后下一回合的状态。

现在添加两个函数，我们会用它们来确定 cell 的状态：

```
// checkState 函数决定下一次游戏循环时的 cell 状态
func (c *cell) checkState(cells [][]*cell) {
    c.alive = c.aliveNext
    c.aliveNext = c.alive

    liveCount := c.liveNeighbors(cells)
    if c.alive {
		// 1. 当任何一个存活的 cell 的附近少于 2 个存活的 cell 时，该 cell 将会消亡，就像人口过少所导致的结果一样
        if liveCount < 2 {
            c.aliveNext = false
        }

		// 2. 当任何一个存活的 cell 的附近有 2 至 3 个存活的 cell 时，该 cell 在下一代中仍然存活。
        if liveCount == 2 || liveCount == 3 {
            c.aliveNext = true
        }

		// 3. 当任何一个存活的 cell 的附近多于 3 个存活的 cell 时，该 cell 将会消亡，就像人口过多所导致的结果一样
        if liveCount > 3 {
            c.aliveNext = false
        }
    } else {
		// 4. 任何一个消亡的 cell 附近刚好有 3 个存活的 cell，该 cell 会变为存活的状态，就像重生一样。
        if liveCount == 3 {
            c.aliveNext = true
        }
    }
}

// liveNeighbors 函数返回当前 cell 附近存活的 cell 数
func (c *cell) liveNeighbors(cells [][]*cell) int {
    var liveCount int
    add := func(x, y int) {
        // If we're at an edge, check the other side of the board.
        if x == len(cells) {
            x = 0
        } else if x == -1 {
            x = len(cells) - 1
        }
        if y == len(cells[x]) {
            y = 0
        } else if y == -1 {
            y = len(cells[x]) - 1
        }

        if cells[x][y].alive {
            liveCount++
        }
    }

    add(c.x-1, c.y)   // To the left
    add(c.x+1, c.y)   // To the right
    add(c.x, c.y+1)   // up
    add(c.x, c.y-1)   // down
    add(c.x-1, c.y+1) // top-left
    add(c.x+1, c.y+1) // top-right
    add(c.x-1, c.y-1) // bottom-left
    add(c.x+1, c.y-1) // bottom-right

    return liveCount
}
```

在 `checkState` 中我们设置当前状态（`alive`） 等于我们最近迭代结果（`aliveNext`）。接下来我们计数邻居数量，并根据游戏的规则来决定 `aliveNext` 状态。该规则是比较清晰的，而且我们在上面的代码当中也有说明，所以这里不再赘述。

更加值得注意的是 `liveNeighbors` 函数里，我们返回的是当前处于存活（`alive`）状态的细胞的邻居个数。我们定义了一个叫做 `add` 的内嵌函数，它会对 `X` 和 `Y` 坐标做一些重复性的验证。它所做的事情是检查我们传递的数字是否超出了范围——比如说，如果细胞 `(X=0,Y=5)` 想要验证它左边的细胞，它就得验证面板另一边的细胞 `(X=9,Y=5)`，Y 轴与之类似。

在 `add` 内嵌函数后面，我们给当前细胞附近的八个细胞分别调用 `add` 函数，示意如下：

```
[
    [-, -, -],
    [N, N, N],
    [N, C, N],
    [N, N, N],
    [-, -, -]
]
```

在该示意中，每一个叫做 N 的细胞是 C 的邻居。

现在是我们的 `main` 函数，这里我们执行核心游戏循环，调用每个细胞的 `checkState` 函数进行绘制：

```
func main() {
    ...

    for !window.ShouldClose() {
        for x := range cells {
            for _, c := range cells[x] {
                c.checkState(cells)
            }
        }

        draw(cells, window, program)
    }
}
```

现在我们的游戏逻辑全都设置好了，我们需要修改细胞绘制函数来跳过绘制不存活的细胞：

```
func (c *cell) draw() {
    if !c.alive {
            return
    }

    gl.BindVertexArray(c.drawable)
    gl.DrawArrays(gl.TRIANGLES, 0, int32(len(square)/3))
}
```

如果我们现在运行这个游戏，你将看到一个纯黑的屏幕，而不是我们辛苦工作后应该看到生命模拟。为什么呢？其实这正是模拟在工作。因为我们没有活着的细胞，所以就一个都不会绘制出来。


现在完善这个函数。回到 `makeCells` 函数，我们用 `0.0` 到 `1.0` 之间的一个随机数来设置游戏的初始状态。我们会定义一个大小为 `0.15` 的常量阈值，也就是说每个细胞都有 15% 的几率处于存活状态。

```
import (
    "math/rand"
    "time"
    ...
)

const (
    ...

    threshold = 0.15
)

func makeCells() [][]*cell {
    rand.Seed(time.Now().UnixNano())

    cells := make([][]*cell, rows, rows)
    for x := 0; x < rows; x++ {
        for y := 0; y < columns; y++ {
            c := newCell(x, y)

            c.alive = rand.Float64() < threshold
            c.aliveNext = c.alive

            cells[x] = append(cells[x], c)
        }
    }

	return cells
}
```

我们首先增加两个引入：随机（`math/rand`）和时间（`time`），并定义我们的常量阈值。然后在 `makeCells` 中我们使用当前时间作为随机种子，给每个游戏一个独特的起始状态。你也可也指定一个特定的种子值，来始终得到一个相同的游戏，这在你想重放某个有趣的模拟时很有用。

接下来在循环中，在用 `newCell` 函数创造一个新的细胞时，我们根据随机浮点数的大小设置它的存活状态，随机数在 `0.0` 到 `1.0` 之间，如果比阈值（`0.15`）小，就是存活状态。再次强调，这意味着每个细胞在开始时都有 15% 的几率是存活的。你可以修改数值大小，增加或者减少当前游戏中存活的细胞。我们还把 `aliveNext` 设成 `alive` 状态，否则在第一次迭代之后我们会发现一大片细胞消亡了，这是因为 `aliveNext` 将永远是 `false`。

现在继续运行它，你很有可能看到细胞们一闪而过，但你却无法理解这是为什么。原因可能在于你的电脑太快了，在你能够看清楚之前就运行了（甚至完成了）模拟过程。

让我们降低游戏速度，在主循环中引入一个帧率（FPS）限制：

```
const (
    ...

    fps = 2
)

func main() {
    ...

    for !window.ShouldClose() {
        t := time.Now()

        for x := range cells {
            for _, c := range cells[x] {
                c.checkState(cells)
            }
        }

        if err := draw(prog, window, cells); err != nil {
            panic(err)
        }

        time.Sleep(time.Second/time.Duration(fps) - time.Since(t))
    }
}
```

现在你能给看出一些图案了，尽管它变换的很慢。把 FPS 加到 10，把方格的尺寸加到 100x100，你就能看到更真实的模拟：

```
const (
    ...

    rows = 100
    columns = 100

    fps = 10

    ...
)
```

 ![ “Conway's Game of Life” - 示例游戏](https://kylewbanks.com/images/post/golang-opengl-conway-1.gif) 

试着修改常量，看看它们是怎么影响模拟过程的 —— 这是你用 Go 语言写的第一个 OpenGL 程序，很酷吧？

### 进阶内容？

这是《OpenGL 与 Go 教程》的最后一节，但是这不意味着到此而止。这里有些新的挑战，能够增进你对 OpenGL （以及 Go）的理解。

1.  给每个细胞一种不同的颜色。
2.  让用户能够通过命令行参数指定格子尺寸、帧率、种子和阈值。在 GitHub 上的 [github.com/KyleBanks/conways-gol][4] 里你可以看到一个已经实现的程序。
3.  把格子的形状变成其它更有意思的，比如六边形。
4.  用颜色表示细胞的状态 —— 比如，在第一帧把存活状态的格子设成绿色，如果它们存活了超过三帧的时间，就变成黄色。
5.  如果模拟过程结束了，就自动关闭窗口，也就是说所有细胞都消亡了，或者是最后两帧里没有格子的状态有改变。
6.  将着色器源代码放到单独的文件中，而不是把它们用字符串的形式放在 Go 的源代码中。

### 总结

希望这篇教程对想要入门 OpenGL （或者是 Go）的人有所帮助！这很有趣，因此我也希望理解学习它也很有趣。

正如我所说的，OpenGL 可能是非常恐怖的，但只要你开始着手了就不会太差。你只用制定一个个可达成的小目标，然后享受每一次成功，因为尽管 OpenGL 不会总像它看上去的那么难，但也肯定有些难懂的东西。我发现，当遇到一个难于理解用 go-gl 生成的代码的 OpenGL 问题时，你总是可以参考一下在网上更流行的当作教程的 C 语言代码，这很有用。通常 C 语言和 Go 语言的唯一区别是在 Go 中，gl 函数的前缀是 `gl.` 而不是 `gl`，常量的前缀是 `gl` 而不是 `GL_`。这可以极大地增加了你的绘制知识！

该教程的完整源代码可从 [GitHub][17] 上获得。

### 回顾

这是 main.go 文件最终的内容：

```
package main

import (
	"fmt"
	"log"
	"math/rand"
	"runtime"
	"strings"
	"time"

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

	rows    = 100
	columns = 100

	threshold = 0.15
	fps       = 10
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

	alive     bool
	aliveNext bool

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
		t := time.Now()

		for x := range cells {
			for _, c := range cells[x] {
				c.checkState(cells)
			}
		}

		draw(cells, window, program)

		time.Sleep(time.Second/time.Duration(fps) - time.Since(t))
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
	rand.Seed(time.Now().UnixNano())

	cells := make([][]*cell, rows, rows)
	for x := 0; x < rows; x++ {
		for y := 0; y < columns; y++ {
			c := newCell(x, y)

			c.alive = rand.Float64() < threshold
			c.aliveNext = c.alive

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
	if !c.alive {
		return
	}

	gl.BindVertexArray(c.drawable)
	gl.DrawArrays(gl.TRIANGLES, 0, int32(len(square)/3))
}

// checkState 函数决定下一次游戏循环时的 cell 状态
func (c *cell) checkState(cells [][]*cell) {
    c.alive = c.aliveNext
    c.aliveNext = c.alive

    liveCount := c.liveNeighbors(cells)
    if c.alive {
		// 1. 当任何一个存活的 cell 的附近少于 2 个存活的 cell 时，该 cell 将会消亡，就像人口过少所导致的结果一样
        if liveCount < 2 {
            c.aliveNext = false
        }

		// 2. 当任何一个存活的 cell 的附近有 2 至 3 个存活的 cell 时，该 cell 在下一代中仍然存活。
        if liveCount == 2 || liveCount == 3 {
            c.aliveNext = true
        }

		// 3. 当任何一个存活的 cell 的附近多于 3 个存活的 cell 时，该 cell 将会消亡，就像人口过多所导致的结果一样
        if liveCount > 3 {
            c.aliveNext = false
        }
    } else {
		// 4. 任何一个消亡的 cell 附近刚好有 3 个存活的 cell，该 cell 会变为存活的状态，就像重生一样。
        if liveCount == 3 {
            c.aliveNext = true
        }
    }
}

// liveNeighbors 函数返回当前 cell 附近存活的 cell 数
func (c *cell) liveNeighbors(cells [][]*cell) int {
	var liveCount int
	add := func(x, y int) {
		// If we're at an edge, check the other side of the board.
		if x == len(cells) {
			x = 0
		} else if x == -1 {
			x = len(cells) - 1
		}
		if y == len(cells[x]) {
			y = 0
		} else if y == -1 {
			y = len(cells[x]) - 1
		}

		if cells[x][y].alive {
			liveCount++
		}
	}

	add(c.x-1, c.y)   // To the left
	add(c.x+1, c.y)   // To the right
	add(c.x, c.y+1)   // up
	add(c.x, c.y-1)   // down
	add(c.x-1, c.y+1) // top-left
	add(c.x+1, c.y+1) // top-right
	add(c.x-1, c.y-1) // bottom-left
	add(c.x+1, c.y-1) // bottom-right

	return liveCount
}

// initGlfw 初始化 glfw，返回一个可用的 Window
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

// makeVao 初始化并从提供的点里面返回一个顶点数组
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

请在 Twitter 上告诉我这篇文章对你是否有帮助。

 [@kylewbanks][18] 

或者在 Twitter 下方关注我以便及时获取最新文章！

--------------------------------------------------------------------------------

via: https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-3-implementing-the-game

作者：[kylewbanks][a]
译者：[GitFuture](https://github.com/GitFuture)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/kylewbanks
[1]:https://twitter.com/intent/tweet?text=OpenGL%20%26%20Go%20Tutorial%20Part%203%3A%20Implementing%20the%20Game%20https%3A%2F%2Fkylewbanks.com%2Fblog%2Ftutorial-opengl-with-golang-part-3-implementing-the-game%20by%20%40kylewbanks
[2]:mailto:?subject=Check%20Out%20%22OpenGL%20%26%20Go%20Tutorial%20Part%203%3A%20Implementing%20the%20Game%22&body=https%3A%2F%2Fkylewbanks.com%2Fblog%2Ftutorial-opengl-with-golang-part-3-implementing-the-game
[3]:https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fkylewbanks.com%2Fblog%2Ftutorial-opengl-with-golang-part-3-implementing-the-game
[4]:https://github.com/KyleBanks/conways-gol
[5]:https://kylewbanks.com/category/golang
[6]:https://kylewbanks.com/category/opengl
[7]:https://twitter.com/kylewbanks
[8]:https://linux.cn/article-8933-1.html
[9]:https://linux.cn/article-8937-1.html
[10]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-3-implementing-the-game
[11]:https://github.com/KyleBanks/conways-gol
[12]:https://linux.cn/article-8933-1.html
[13]:https://kylewbanks.com/blog/[Part%202:%20Drawing%20the%20Game%20Board](/blog/tutorial-opengl-with-golang-part-2-drawing-the-game-board)
[14]:https://linux.cn/article-8933-1.html
[15]:https://linux.cn/article-8937-1.html
[16]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-3-implementing-the-game
[17]:https://github.com/KyleBanks/conways-gol
[18]:https://twitter.com/kylewbanks
