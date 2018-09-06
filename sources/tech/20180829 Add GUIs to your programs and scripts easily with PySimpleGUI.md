pinewall translating

Add GUIs to your programs and scripts easily with PySimpleGUI
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web_browser_desktop_devlopment_design_system_computer.jpg?itok=pfqRrJgh)

Few people run Python programs by double-clicking the .py file as if it were a .exe file. When a typical user (non-programmer types) double-clicks an .exe file, they expect it to pop open with a window they can interact with. While GUIs, using tkinter, are possible using standard Python installations, it's unlikely many programs do this.

What if it were so easy to open a Python program into a GUI that complete beginners could do it? Would anyone care? Would anyone use it? It's difficult to answer because to date it's not been easy to build a custom GUI.

There seems to be a gap in the ability to add a GUI onto a Python program/script. Complete beginners are left using only the command line and many advanced programmers don't want to take the time required to code up a tkinter GUI.

### GUI frameworks

There is no shortage of GUI frameworks for Python. Tkinter, WxPython, Qt, and Kivy are a few of the major packages. In addition, there are a good number of dumbed-down GUI packages that "wrap" one of the major packages, including EasyGUI, PyGUI, and Pyforms.

The problem is that beginners (those with less than six weeks of experience) can't learn even the simplest of the major packages. That leaves the wrapper packages as a potential option, but it will still be difficult or impossible for most new users to build a custom GUI layout. Even if it's possible, the wrappers still require pages of code.

[PySimpleGUI][1] attempts to address these GUI challenges by providing a super-simple, easy-to-understand interface to GUIs that can be easily customized. Even many complex GUIs require less than 20 lines of code when PySimpleGUI is used.

### The secret

What makes PySimpleGUI superior for newcomers is that the package contains the majority of the code that the user is normally expected to write. Button callbacks are handled by PySimpleGUI, not the user's code. Beginners struggle to grasp the concept of a function, and expecting them to understand a call-back function in the first few weeks is a stretch.

With most GUIs, arranging GUI widgets often requires several lines of code… at least one or two lines per widget. PySimpleGUI uses an "auto-packer" that automatically creates the layout. No pack or grid system is needed to lay out a GUI window.

Finally, PySimpleGUI leverages the Python language constructs in clever ways that shorten the amount of code and return the GUI data in a straightforward manner. When a widget is created in a form layout, it is configured in place, not several lines of code away.

### What is a GUI?

Most GUIs do one thing: collect information from the user and return it. From a programmer's viewpoint, this could be summed up as a function call that looks like this:
```
button, values = GUI_Display(gui_layout)

```

What's expected from most GUIs is the button that was clicked (e.g., OK, cancel, save, yes, no, etc.) and the values input by the user. The essence of a GUI can be boiled down to a single line of code.

This is exactly how PySimpleGUI works (for simple GUIs). When the call is made to display the GUI, nothing executes until a button is clicked that closes the form.

There are more complex GUIs, such as those that don't close after a button is clicked. Examples include a remote control interface for a robot and a chat window. These complex forms can also be created with PySimpleGUI.

### Making a quick GUI

When is PySimpleGUI useful? Immediately, whenever you need a GUI. It takes less than five minutes to create and try a GUI. The quickest way to make a GUI is to copy one from the [PySimpleGUI Cookbook][2]. Follow these steps:

  * Find a GUI that looks similar to what you want to create
  * Copy code from the Cookbook
  * Paste it into your IDE and run it



Let's look at the first recipe from the book.
```
import PySimpleGUI as sg

# Very basic form.  Return values as a list
form = sg.FlexForm('Simple data entry form')  # begin with a blank form

layout = [
          [sg.Text('Please enter your Name, Address, Phone')],
          [sg.Text('Name', size=(15, 1)), sg.InputText('name')],
          [sg.Text('Address', size=(15, 1)), sg.InputText('address')],
          [sg.Text('Phone', size=(15, 1)), sg.InputText('phone')],
          [sg.Submit(), sg.Cancel()]
         ]

button, values = form.LayoutAndRead(layout)

print(button, values[0], values[1], values[2])
```
It's a reasonably sized form.

![](https://opensource.com/sites/default/files/uploads/pysimplegui_cookbook-form.jpg)

If you just need to collect a few values and they're all basically strings, you could copy this recipe and modify it to suit your needs.

You can even create a custom GUI layout in just five lines of code.
```
import PySimpleGUI as sg

form = sg.FlexForm('My first GUI')

layout = [ [sg.Text('Enter your name'), sg.InputText()],
           [sg.OK()] ]

button, (name,) = form.LayoutAndRead(layout)
```

![](https://opensource.com/sites/default/files/uploads/pysimplegui-5-line-form.jpg)

### Making a custom GUI in five minutes

If you have a straightforward layout, you should be able create a custom layout in PySimpleGUI in less than five minutes by modifying code from the Cookbook.

Widgets are called elements in PySimpleGUI. These elements are spelled exactly as you would type them into your Python code.

#### Core elements
```
Text
InputText
Multiline
InputCombo
Listbox
Radio
Checkbox
Spin
Output
SimpleButton
RealtimeButton
ReadFormButton
ProgressBar
Image
Slider
Column
```

#### Shortcut list

PySimpleGUI also has two types of element shortcuts. One type is simply other names for the exact same element (e.g., `T` instead of `Text`). The second type configures an element with a particular setting, sparing you from specifying all parameters (e.g., `Submit` is a button with the text "Submit" on it)
```
T = Text
Txt = Text
In = InputText
Input = IntputText
Combo = InputCombo
DropDown = InputCombo
Drop = InputCombo
```

#### Button shortcuts

A number of common buttons have been implemented as shortcuts. These include:
```
FolderBrowse
FileBrowse
FileSaveAs
Save
Submit
OK
Ok
Cancel
Quit
Exit
Yes
No
```

There are also shortcuts for more generic button functions.
```
SimpleButton
ReadFormButton
RealtimeButton
```

These are all the GUI widgets you can choose from in PySimpleGUI. If one isn't on these lists, it doesn't go in your form layout.

#### GUI design pattern

The stuff that tends not to change in GUIs are the calls that set up and show a window. The layout of the elements is what changes from one program to another.

Here is the code from the example above with the layout removed:
```
import PySimpleGUI as sg

form = sg.FlexForm('Simple data entry form')
# Define your form here (it's a list of lists)
button, values = form.LayoutAndRead(layout)
```

The flow for most GUIs is:

  * Create the form object
  * Define the GUI as a list of lists
  * Show the GUI and get results



These are line-for-line what you see in PySimpleGUI's design pattern.

#### GUI layout

To create your custom GUI, first break your form down into rows, because forms are defined one row at a time. Then place one element after another, working from left to right.

The result is a "list of lists" that looks something like this:
```
layout = [  [Text('Row 1')],
            [Text('Row 2'), Checkbox('Checkbox 1', OK()), Checkbox('Checkbox 2'), OK()] ]

```

This layout produces this window:

![](https://opensource.com/sites/default/files/uploads/pysimplegui-custom-form.jpg)

### Displaying the GUI

Once you have your layout complete and you've copied the lines of code that set up and show the form, it's time to display the form and get values from the user.

This is the line of code that displays the form and provides the results:
```
button, values = form.LayoutAndRead(layout)
```

Forms return two values: the text of the button that is clicked and a list of values the user enters into the form.

If the example form is displayed and the user does nothing other than clicking the OK button, the results would be:
```
button == 'OK'
values == [False, False]
```

Checkbox elements return a value of True or False. Because the checkboxes defaulted to unchecked, both the values returned were False.

### Displaying results

Once you have the values from the GUI, it's nice to check what values are in the variables. Rather than printing them out using a `print` statement, let's stick with the GUI idea and output the data to a window.

PySimpleGUI has a number of message boxes to choose from. The data passed to the message box is displayed in a window. The function takes any number of arguments. You can simply indicate all the variables you want to see in the call.

The most commonly used message box in PySimpleGUI is MsgBox. To display the results from the previous example, write:
```
MsgBox('The GUI returned:', button, values)
```

### Putting it all together

Now that you know the basics, let's put together a form that contains as many of PySimpleGUI's elements as possible. Also, to give it a nice appearance, we'll change the "look and feel" to a green and tan color scheme.
```
import PySimpleGUI as sg

sg.ChangeLookAndFeel('GreenTan')

form = sg.FlexForm('Everything bagel', default_element_size=(40, 1))

column1 = [[sg.Text('Column 1', background_color='#d3dfda', justification='center', size=(10,1))],
           [sg.Spin(values=('Spin Box 1', '2', '3'), initial_value='Spin Box 1')],
           [sg.Spin(values=('Spin Box 1', '2', '3'), initial_value='Spin Box 2')],
           [sg.Spin(values=('Spin Box 1', '2', '3'), initial_value='Spin Box 3')]]
layout = [
    [sg.Text('All graphic widgets in one form!', size=(30, 1), font=("Helvetica", 25))],
    [sg.Text('Here is some text.... and a place to enter text')],
    [sg.InputText('This is my text')],
    [sg.Checkbox('My first checkbox!'), sg.Checkbox('My second checkbox!', default=True)],
    [sg.Radio('My first Radio!     ', "RADIO1", default=True), sg.Radio('My second Radio!', "RADIO1")],
    [sg.Multiline(default_text='This is the default Text should you decide not to type anything', size=(35, 3)),
     sg.Multiline(default_text='A second multi-line', size=(35, 3))],
    [sg.InputCombo(('Combobox 1', 'Combobox 2'), size=(20, 3)),
     sg.Slider(range=(1, 100), orientation='h', size=(34, 20), default_value=85)],
    [sg.Listbox(values=('Listbox 1', 'Listbox 2', 'Listbox 3'), size=(30, 3)),
     sg.Slider(range=(1, 100), orientation='v', size=(5, 20), default_value=25),
     sg.Slider(range=(1, 100), orientation='v', size=(5, 20), default_value=75),
     sg.Slider(range=(1, 100), orientation='v', size=(5, 20), default_value=10),
     sg.Column(column1, background_color='#d3dfda')],
    [sg.Text('_'  * 80)],
    [sg.Text('Choose A Folder', size=(35, 1))],
    [sg.Text('Your Folder', size=(15, 1), auto_size_text=False, justification='right'),
     sg.InputText('Default Folder'), sg.FolderBrowse()],
    [sg.Submit(), sg.Cancel()]
     ]

button, values = form.LayoutAndRead(layout)
sg.MsgBox(button, values)
```

This may seem like a lot of code, but try coding this same GUI layout directly in tkinter and you'll quickly realize how tiny it is.

![](https://opensource.com/sites/default/files/uploads/pysimplegui-everything.jpg)

The last line of code opens a message box. This is how it looks:

![](https://opensource.com/sites/default/files/uploads/pysimplegui-message-box.jpg)

Each parameter to the message box call is displayed on a new line. There are two lines of text in the message box; the second line is very long and wrapped a number of times

Take a moment and pair up the results values with the GUI to get an understanding of how results are created and returned.

### Adding a GUI to Your Program or Script

If you have a script that uses the command line, you don't have to abandon it in order to add a GUI. An easy solution is that if there are zero parameters given on the command line, then the GUI is run. Otherwise, execute the command line as you do today.

This kind of logic is all that's needed:
```
if len(sys.argv) == 1:
        # collect arguments from GUI
else:
    # collect arguements from sys.argv
```

The easiest way to get a GUI up and running quickly is to copy and modify one of the recipes from the [PySimpleGUI Cookbook][2].

Have some fun! Spice up the scripts you're tired of running by hand. Spend 5 or 10 minutes playing with the demo scripts. You may find one already exists that does exactly what you need. If not, you will find it's simple to create your own. If you really get lost, you've only invested 10 minutes.

### Resources

#### Installation

PySimpleGUI works on all systems that run tkinter, including Raspberry Pi, and it requires Python 3
```
pip install PySimpleGUI
```

#### Documentation

+ [Manual][3]
+ [Cookbook][4]
+ [GitHub repository][5]


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/pysimplegui

作者：[Mike Barnett][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pysimplegui
[1]: https://github.com/MikeTheWatchGuy/PySimpleGUI
[2]: https://pysimplegui.readthedocs.io/en/latest/cookbook/
[3]: https://pysimplegui.readthedocs.io/en/latest/cookbook/
[4]: https://pysimplegui.readthedocs.io/en/latest/cookbook/
[5]: https://github.com/MikeTheWatchGuy/PySimpleGUI
