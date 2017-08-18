translating by sugarfillet
Functional testing Gtk+ applications in C
============================================================

### Learn how to test your application's function with this simple tutorial.


![Functional testing Gtk+ applications in C ](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/cube_innovation_block_collaboration.png?itok=CbG3Mpqi "Functional testing Gtk+ applications in C ")
Image by : 

opensource.com

Automated tests are required to ensure your program's quality and that it works as expected. Unit tests examine only certain parts of your algorithm, but don't look at how each component fits together. That's where functional testing, sometimes referred as integration testing, comes in.

A functional test basically interacts with your user interface, whether through a website or a desktop application. To show you how that works, let's look at how to test a Gtk+ application. For simplicity, in this tutorial let's use the [Tictactoe][6] example from the Gtk+ 2.0 tutorial.

### Basic setup

For every functional test, you usually define some global variables, such as "user interaction delay" or "timeout until a failure is indicated" (i.e., when an event doesn't occur until the specified time and the application is doomed).

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

Now we can implement our dead-time functions. Here, we'll use the **usleep** function in order to get the desired delay.

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

The timeout function delays execution until a state of a control is applied. It is useful for actions that are applied asynchronously, and that is why it delays for a longer period of time.

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

### Interacting with the graphical user interface

In order to simulate user interaction, the [**Gdk library**][7] provides the functions we need. To do our work here, we need only these three functions:

*   gdk_display_warp_pointer()

*   gdk_test_simulate_button()

*   gdk_test_simulate_key()

For instance, to test a button click, we do the following:

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

We want to ensure the button has an active state, so we provide an idle-condition function:

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

### The test scenario

Since the Tictactoe program is very simple, we just need to ensure that a [**GtkToggleButton**][8] was clicked. The functional test can proceed once it asserts the button entered the active state. To click the buttons, we use the handy **util** function provided above.

For illustration, let's assume player A wins immediately by filling the very first row, because player B is not paying attention and just filled the second row:

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

--------------------------------------------------------------------------------

作者简介：

Joël Krähemann - Free software enthusiast with a strong knowledge about the C programming language. I don't fear any code complexity as long it is written in a simple manner. As developer of Advanced Gtk+ Sequencer I know how challenging multi-threaded applications can be and with it we have a great basis for future demands.my personal website


via: https://opensource.com/article/17/7/functional-testing

作者：[Joël Krähemann][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
