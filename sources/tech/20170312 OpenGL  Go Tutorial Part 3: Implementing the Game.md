OpenGL & Go Tutorial Part 3: Implementing the Game
============================================================

[Part 1: Hello, OpenGL][8] | [Part 2: Drawing the Game Board][9] | [Part 3: Implementing the Game][10]

The full source code of the tutorial is available on [GitHub][11].

Welcome back to the OpenGL & Go Tutorial! If you haven’t gone through [Part 1][12] and [Part 2][13] you’ll definitely want to take a step back and check them out.

At this point you should have a grid system created and a matrix of cells to represent each unit of the grid. Now it’s time to implement Conway’s Game of Life using the grid as the game board.

Let’s get started!

### Implement Conway’s Game

One of the keys to Conway’s game is that each cell must determine its next state based on the current state of the board, at the same time. This means that if Cell (X=3, Y=4) changes state during its calculation, its neighbor at (X=4, Y=4) must determine its own state based on what (X=3, Y=4) was, not what is has become. Basically, this means we must loop through the cells and determine their next state without modifying their current state before we draw, and then on the next loop of the game we apply the new state and repeat.

In order to accomplish this, we’ll add two booleans to the cell struct:

```
type cell struct {
    drawable uint32

    alive     bool
    aliveNext bool

    x int
    y int
}
```

Now let’s add two functions that we’ll use to determine the cell’s state:

```
// checkState determines the state of the cell for the next tick of the game.
func (c *cell) checkState(cells [][]*cell) {
    c.alive = c.aliveNext
    c.aliveNext = c.alive

    liveCount := c.liveNeighbors(cells)
    if c.alive {
        // 1\. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
        if liveCount < 2 {
            c.aliveNext = false
        }

        // 2\. Any live cell with two or three live neighbours lives on to the next generation.
        if liveCount == 2 || liveCount == 3 {
            c.aliveNext = true
        }

        // 3\. Any live cell with more than three live neighbours dies, as if by overpopulation.
        if liveCount > 3 {
            c.aliveNext = false
        }
    } else {
        // 4\. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
        if liveCount == 3 {
            c.aliveNext = true
        }
    }
}

// liveNeighbors returns the number of live neighbors for a cell.
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

What’s more interesting is the liveNeighbors function where we return the number of neighbors to the current cell that are in an alivestate. We define an inner function called add that will do some repetitive validation on X and Y coordinates. What it does is check if we’ve passed a number that exceeds the bounds of the board - for example, if cell (X=0, Y=5) wants to check on its neighbor to the left, it has to wrap around to the other side of the board to cell (X=9, Y=5), and likewise for the Y-axis.

Below the inner add function we call add with each of the cell’s eight neighbors, depicted below:

```
[
    [-, -, -],
    [N, N, N],
    [N, C, N],
    [N, N, N],
    [-, -, -]
]
```

In this depiction, each cell labeled N is a neighbor to C.

Now in our main function, where we have our core game loop, let’s call checkState on each cell prior to drawing:

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

```
func (c *cell) draw() {
    if !c.alive {
            return
    }

    gl.BindVertexArray(c.drawable)
    gl.DrawArrays(gl.TRIANGLES, 0, int32(len(square)/3))
}
```

Let’s fix that. Back in makeCells we’ll use a random number between 0.0 and 1.0 to set the initial state of the game. We’ll define a constant threshold of 0.15 meaning that each cell has a 15% chance of starting in an alive state:

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

Next in the loop, after creating a cell with the newCell function we set its alive state equal to the result of a random float, between 0.0and 1.0, being less than threshold (0.15). Again, this means each cell has a 15% chance of starting out alive. You can play with this number to increase or decrease the number of living cells at the outset of the game. We also set aliveNext equal to alive, otherwise we’ll get a massive die-off on the first iteration because aliveNext will always be false!

Now go ahead and give it a run, and you’ll likely see a quick flash of cells that you can’t make heads or tails of. The reason is that your computer is probably way too fast and is running through (or even finishing) the simulation before you have a chance to really see it.

Let’s reduce the game speed by introducing a frames-per-second limitation in the main loop:

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

Now you should be able to see some patterns, albeit very slowly. Increase the FPS to 10 and the size of the grid to 100x100 and you should see some really cool simulations:

```
const (
    ...

    rows = 100
    columns = 100

    fps = 10

    ...
)
```

 ![Conway's Game of Life in OpenGL and Golang Tutorial - Demo Game](https://kylewbanks.com/images/post/golang-opengl-conway-1.gif) 

Try playing with the constants to see how they impact the simulation - cool right? Your very first OpenGL application with Go!

### What’s Next?

This concludes the OpenGL with Go Tutorial, but that doesn’t mean you should stop now. Here’s a few challenges to further improve your OpenGL (and Go) knowledge:

1.  Give each cell a unique color.
2.  Allow the user to specify, via command-line arguments, the grid size, frame rate, seed and threshold. You can see this one implemented on GitHub at [github.com/KyleBanks/conways-gol][4].
3.  Change the shape of the cells into something more interesting, like a hexagon.
4.  Use color to indicate the cell’s state - for example, make cells green on the first frame that they’re alive, and make them yellow if they’ve been alive more than three frames.
5.  Automatically close the window if the simulation completes, meaning all cells are dead or no cells have changed state in the last two frames.
6.  Move the shader source code out into their own files, rather than having them as string constants in the Go source code.

### Summary

Hopefully this tutorial has been helpful in gaining a foundation on OpenGL (and maybe even Go)! It was a lot of fun to make so I can only hope it was fun to go through and learn.

As I’ve mentioned, OpenGL can be very intimidating, but it’s really not so bad once you get started. You just want to break down your goals into small, achievable steps, and enjoy each victory because while OpenGL isn’t always as tough as it looks, it can certainly be very unforgiving. One thing that I have found helpful when stuck on OpenGL issues was to understand that the way go-gl is generated means you can always use C code as a reference, which is much more popular in tutorials around the internet. The only difference usually between the C and Go code is that functions in Go are prefixed with gl. instead of gl, and constants are prefixed with gl instead of GL_. This vastly increases the pool of knowledge you have to draw from!

[Part 1: Hello, OpenGL][14] | [Part 2: Drawing the Game Board][15] | [Part 3: Implementing the Game][16]

The full source code of the tutorial is available on [GitHub][17].

### Checkpoint

Here’s the final contents of main.go:

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

// checkState determines the state of the cell for the next tick of the game.
func (c *cell) checkState(cells [][]*cell) {
	c.alive = c.aliveNext
	c.aliveNext = c.alive

	liveCount := c.liveNeighbors(cells)
	if c.alive {
		// 1\. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
		if liveCount < 2 {
			c.aliveNext = false
		}

		// 2\. Any live cell with two or three live neighbours lives on to the next generation.
		if liveCount == 2 || liveCount == 3 {
			c.aliveNext = true
		}

		// 3\. Any live cell with more than three live neighbours dies, as if by overpopulation.
		if liveCount > 3 {
			c.aliveNext = false
		}
	} else {
		// 4\. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
		if liveCount == 3 {
			c.aliveNext = true
		}
	}
}

// liveNeighbors returns the number of live neighbors for a cell.
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

// initGlfw initializes glfw and returns a Window to use.
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

// initOpenGL initializes OpenGL and returns an intiialized program.
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

// makeVao initializes and returns a vertex array from the points provided.
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

Let me know if this post was helpful on Twitter

 [@kylewbanks][18] 

or down below, and follow me to keep up with future posts!

--------------------------------------------------------------------------------

via: https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-3-implementing-the-game

作者：[kylewbanks ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/kylewbanks
[1]:https://twitter.com/intent/tweet?text=OpenGL%20%26%20Go%20Tutorial%20Part%203%3A%20Implementing%20the%20Game%20https%3A%2F%2Fkylewbanks.com%2Fblog%2Ftutorial-opengl-with-golang-part-3-implementing-the-game%20by%20%40kylewbanks
[2]:mailto:?subject=Check%20Out%20%22OpenGL%20%26%20Go%20Tutorial%20Part%203%3A%20Implementing%20the%20Game%22&body=https%3A%2F%2Fkylewbanks.com%2Fblog%2Ftutorial-opengl-with-golang-part-3-implementing-the-game
[3]:https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fkylewbanks.com%2Fblog%2Ftutorial-opengl-with-golang-part-3-implementing-the-game
[4]:https://github.com/KyleBanks/conways-gol
[5]:https://kylewbanks.com/category/golang
[6]:https://kylewbanks.com/category/opengl
[7]:https://twitter.com/kylewbanks
[8]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-1-hello-opengl
[9]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-2-drawing-the-game-board
[10]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-3-implementing-the-game
[11]:https://github.com/KyleBanks/conways-gol
[12]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-1-hello-opengl
[13]:https://kylewbanks.com/blog/[Part%202:%20Drawing%20the%20Game%20Board](/blog/tutorial-opengl-with-golang-part-2-drawing-the-game-board)
[14]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-1-hello-opengl
[15]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-2-drawing-the-game-board
[16]:https://kylewbanks.com/blog/tutorial-opengl-with-golang-part-3-implementing-the-game
[17]:https://github.com/KyleBanks/conways-gol
[18]:https://twitter.com/kylewbanks
