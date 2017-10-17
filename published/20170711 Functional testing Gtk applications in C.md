用 C 语言对 Gtk+ 应用进行功能测试
========

> 这个简单教程教你如何测试你应用的功能

![Functional testing Gtk+ applications in C](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cube_innovation_block_collaboration.png?itok=pKbXpr1e "Functional testing Gtk+ applications in C ")

自动化测试用来保证你程序的质量以及让它以预想的运行。单元测试只是检测你算法的某一部分，而并不注重各组件间的适应性。这就是为什么会有功能测试，它有时也称为集成测试。

功能测试简单地与你的用户界面进行交互，无论它是网站还是桌面应用。为了展示功能测试如何工作，我们以测试一个 Gtk+ 应用为例。为了简单起见，这个教程里，我们使用 Gtk+ 2.0 教程的示例。

### 基础设置

对于每一个功能测试，你通常需要定义一些全局变量，比如 “用户交互时延” 或者 “失败的超时时间”（也就是说，如果在指定的时间内一个事件没有发生，程序就要中断）。

```
#define TTT_FUNCTIONAL_TEST_UTIL_IDLE_CONDITION(f) ((TttFunctionalTestUtilIdleCondition)(f))
#define TTT_FUNCTIONAL_TEST_UTIL_REACTION_TIME (125000)
#define TTT_FUNCTIONAL_TEST_UTIL_REACTION_TIME_LONG (500000)
typedef gboolean (*TttFunctionalTestUtilIdleCondition)(gpointer data);
struct timespec ttt_functional_test_util_default_timeout = {
  20,
  0,
};
```

现在我们可以实现我们自己的超时函数。这里，为了能够得到期望的延迟，我们采用 `usleep` 函数。

```
void
ttt_functional_test_util_reaction_time()
{
  usleep(TTT_FUNCTIONAL_TEST_UTIL_REACTION_TIME);
}

void
ttt_functional_test_util_reaction_time_long()
{
  usleep(TTT_FUNCTIONAL_TEST_UTIL_REACTION_TIME_LONG);
}
```

直到获得控制状态，超时函数才会推迟执行。这对于一个异步执行的动作很有帮助，这也是为什么采用这么长的时延。

```
void
ttt_functional_test_util_idle_condition_and_timeout(
     TttFunctionalTestUtilIdleCondition idle_condition,
     struct timespec *timeout,
     pointer data)
{
  struct timespec start_time, current_time;

  clock_gettime(CLOCK_MONOTONIC,
                &start_time);

  while(TTT_FUNCTIONAL_TEST_UTIL_IDLE_CONDITION(idle_condition)(data)){
    ttt_functional_test_util_reaction_time();

    clock_gettime(CLOCK_MONOTONIC,
                  &current_time);

    if(start_time.tv_sec + timeout->tv_sec < current_time.tv_sec){
      break;
    }
  }

  ttt_functional_test_util_reaction_time();
}
```

### 与图形化用户界面交互

为了模拟用户交互的操作， [Gdk 库][7] 为我们提供了一些需要的函数。要完成我们的工作，我们只需要如下 3 个函数：

*   `gdk_display_warp_pointer()`
*   `gdk_test_simulate_button()`
*   `gdk_test_simulate_key()`


举个例子，为了测试按钮点击，我们可以这么做：

```
gboolean
ttt_functional_test_util_button_click(GtkButton *button)
{
  GtkWidget *widget;

  GdkWindow *window;

  gint x, y;
  gint origin_x, origin_y;

  if(button == NULL ||
     !GTK_IS_BUTTON(button)){
    return(FALSE);
  }

  widget = button;

  if(!GTK_WIDGET_REALIZED(widget)){
    ttt_functional_test_util_reaction_time_long();
  }

  /* retrieve window and pointer position */
  gdk_threads_enter();

  window = gtk_widget_get_window(widget);

  x = widget->allocation.x + widget->allocation.width / 2.0;
  y = widget->allocation.y + widget->allocation.height / 2.0;

  gdk_window_get_origin(window, &origin_x, &origin_y);

  gdk_display_warp_pointer(gtk_widget_get_display(widget),
                           gtk_widget_get_screen(widget),
                           origin_x + x, origin_y + y);

  gdk_threads_leave();

  /* click the button */
  ttt_functional_test_util_reaction_time();

  gdk_test_simulate_button(window,
                           x,
                           y,
                           1,
                           GDK_BUTTON1_MASK,
                           GDK_BUTTON_PRESS);

  ttt_functional_test_util_reaction_time();

  gdk_test_simulate_button(window,
                           x,
                           y,
                           1,
                           GDK_BUTTON1_MASK,
                           GDK_BUTTON_RELEASE);

  ttt_functional_test_util_reaction_time();

  ttt_functional_test_util_reaction_time_long();

  return(TRUE);
}
```


我们想要保证按钮处于激活状态，因此我们提供一个空闲条件函数：

```
gboolean
ttt_functional_test_util_idle_test_toggle_active(
     GtkToggleButton **toggle_button)
{
  gboolean do_idle;

  do_idle = TRUE;

  gdk_threads_enter();

  if(*toggle_button != NULL &&
     GTK_IS_TOGGLE_BUTTON(*toggle_button) &&
     gtk_toggle_button_get_active(*toggle_button)){
    do_idle = FALSE;
  }

  gdk_threads_leave();

  return(do_idle);
}
```


### 测试场景

因为这个 Tictactoe 程序非常简单，我们只需要确保点击了一个 [**GtkToggleButton**][8] 按钮即可。一旦该按钮肯定进入了激活状态，功能测试就可以执行。为了点击按钮，我们使用上面提到的很方便的 `util` 函数。

如图所示，我们假设，填满第一行，玩家 A 就赢，因为玩家 B 没有注意，只填充了第二行。

```
GtkWindow *window;
Tictactoe *ttt;

void*
ttt_functional_test_gtk_main(void *)
{
  gtk_main();

  pthread_exit(NULL);
}

void
ttt_functional_test_dumb_player_b()
{
  GtkButton *buttons[3][3];

  guint i;

  /* to avoid race-conditions copy the buttons */
  gdk_threads_enter();

  memcpy(buttons, ttt->buttons, 9 * sizeof(GtkButton *));

  gdk_threads_leave();

  /* TEST 1 - the dumb player B */
  for(i = 0; i < 3; i++){
    /* assert player A clicks the button successfully */
    if(!ttt_functional_test_util_button_click(buttons[0][i])){
      exit(-1);
    }

    functional_test_util_idle_condition_and_timeout(
         ttt_functional_test_util_idle_test_toggle_active,
         ttt_functional_test_util_default_timeout,
         &buttons[0][i]);

    /* assert player B clicks the button successfully */
    if(!ttt_functional_test_util_button_click(buttons[1][i])){
      exit(-1);
    }

    functional_test_util_idle_condition_and_timeout(
         ttt_functional_test_util_idle_test_toggle_active,
         ttt_functional_test_util_default_timeout,
         &buttons[1][i]);
  }
}

int
main(int argc, char **argv)
{
  pthread_t thread;

  gtk_init(&argc, &argv);

  /* start the tictactoe application */
  window = gtk_window_new(GTK_WINDOW_TOPLEVEL);

  ttt = tictactoe_new();
  gtk_container_add(window, ttt);

  gtk_widget_show_all(window);

  /* start the Gtk+ dispatcher */
  pthread_create(&thread, NULL,
                 ttt_functional_test_gtk_main, NULL);

  /* launch test routines */
  ttt_functional_test_dumb_player_b();

  /* terminate the application */
  gdk_threads_enter();

  gtk_main_quit();

  gdk_threads_leave();

  return(0);
}
```

（题图：opensource.com）

--------------------------------------------------------------------------------

作者简介：


Joël Krähemann - 精通 C 语言编程的自由软件爱好者。不管代码多复杂，它也是一点点写成的。作为高级的 Gtk+ 程序开发者，我知道多线程编程有多大的挑战性，有了多线程编程，我们就有了未来需求的良好基础。

----
via: https://opensource.com/article/17/7/functional-testing

作者：[Joël Krähemann][a]
译者：[sugarfillet](https://github.com/sugarfillet)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/joel2001k
[1]:http://www.opengroup.org/onlinepubs/009695399/functions/memcpy.html
[2]:http://www.opengroup.org/onlinepubs/009695399/functions/exit.html
[3]:http://www.opengroup.org/onlinepubs/009695399/functions/exit.html
[4]:https://opensource.com/article/17/7/functional-testing?rate=BxwmcarRgeZ4CW_9EkWQKKS2LxDGFqMMiUtt9z-ofhY
[5]:https://opensource.com/user/127961/feed
[6]:https://developer.gnome.org/gtk-tutorial/stable/
[7]:https://developer.gnome.org/gdk3/stable/
[8]:https://developer.gnome.org/gtk3/stable/GtkToggleButton.html
[9]:https://opensource.com/users/joel2001k
[10]:https://opensource.com/users/joel2001k
[11]:https://opensource.com/article/17/7/functional-testing#comments
