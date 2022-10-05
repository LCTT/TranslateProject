[#]: subject: "String Processing in LibreOffice Calc Macro with Examples"
[#]: via: "https://www.debugpoint.com/string-processing-in-libreoffice-calc-macro-with-examples/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

String Processing in LibreOffice Calc Macro with Examples
======
This tutorial will show how to do various common string processing using macro in LibreOffice.

We will use LibreOffice Calc cells to use the strings for this tutorial. These processes are essential for any macro development.

![LibreOffice Calc Macro - Join Data][1]

Let’s put three strings like below in a LibreOffice calc sheet and join them.

### Joining Strings in Calc

In basic, to join two strings/texts, use the “&” operator. We will use this to join three columns of strings and put the results in another column.

```
Sub String_join()
  part1 = ThisComponent.Sheets(0).getCellByPosition(0,1)
  part2 = ThisComponent.Sheets(0).getCellByPosition(1,1) 
  part3 = ThisComponent.Sheets(0).getCellByPosition(2,1)

  result_cell = ThisComponent.Sheets(0).getCellByPosition(3,1)
  result_cell.String = part1.String & "." & part2.String & "." & part3.String
End Sub
```

![LibreOffice Calc Macro – Join][2]

Let’s put some more strings in Column A as below in LibreOffice. We will use these three strings for the rest of the processing in this tutorial.

### Left

The `left` function returns the number of characters from a string from the left side. The number of characters can be specified in the argument of the function. Put a string in cell A1 – “www.google.com” and run the function on the A1 cell as below. This function will return sub-string “www”.

```
Sub left_demo()
  part1 = ThisComponent.Sheets(0).getCellByPosition(0,0)
  result = ThisComponent.Sheets(0).getCellByPosition(2,0)
  result.String = left(part1.String,3)	
End Sub
```

![LibreOffice Calc Macro – Left Example][3]

### Right

Just like the `left` function above, the `right` returns the given no of characters from the right side. With the same example, in this case, the below function would return “com”.

```
Sub right_demo()
  part1 = ThisComponent.Sheets(0).getCellByPosition(0,0)
  result = ThisComponent.Sheets(0).getCellByPosition(2,0)
  result.String = right(part1.String,3)	
End Sub
```

![LibreOffice Calc Macro – Right Example][4]

### Mid

The `mid` function returns any size of the sub-string from a given string. The argument of this function is `Mid(string, start position, length of the sub-string)`. To have the Mid function work, put some strings in a column in LibreOffice calc and run the Mid function.

In this example below, the strings from A columns are converted to sub-string in column B. The sub-string starts from character 4 of the string, and the length is six characters.

```
Sub mid_demo()
  part1 = ThisComponent.Sheets(0).getCellByPosition(0,1) 
  result = ThisComponent.Sheets(0).getCellByPosition(1,1)
  result.String = mid(part1.String,5,6) 
  
  part2 = ThisComponent.Sheets(0).getCellByPosition(0,2)
  result = ThisComponent.Sheets(0).getCellByPosition(1,2)
  result.String= mid(part2.String,5,6) 
  
  part3 = ThisComponent.Sheets(0).getCellByPosition(0,3)
  result = ThisComponent.Sheets(0).getCellByPosition(1,3)
  result.String = mid(part3.String,5,6) 
End Sub
```

![LibreOffice Calc Macro – Mid Example][5]

### Trim

The trim function is used to remove leading and trailing spaces from a string.The function can be used like this: `Trim(your_string_here)`

### Len

Len function returns the number of characters present, i.e. the length of a string.Usage: `Len(string)`

### Instr

The `Instr` function is used to search a string within a string. If a match is found, Instr returns the starting position number of the searched string, and if not found, it returns 0.

```
Sub instr_demo()
  part1 = ThisComponent.Sheets(0).getCellByPosition(0,1) 
  result = ThisComponent.Sheets(0).getCellByPosition(1,1)
  result.Value = instr(part1.String,"oogl") 
  
  part2 = ThisComponent.Sheets(0).getCellByPosition(0,2)
  result = ThisComponent.Sheets(0).getCellByPosition(1,2)
  result.Value = instr(part2.String,"dd") 
  
  part3 = ThisComponent.Sheets(0).getCellByPosition(0,3)
  result = ThisComponent.Sheets(0).getCellByPosition(1,3)
  result.Value = instr(part3.String,"untu")   	
End Sub
```

![LibreOffice Calc Macro – Instr Example][6]

In this tutorial, basic string processing is covered, which can be used in LibreOffice Macro.

### Looking for Something Else?

If you are looking for something else in LibreOffice macro tutorials, Or want to learn more about it, please follow the below link for the complete Macro Tutorials Index:

[LibreOffice Macro Tutorial Index][7]

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/string-processing-in-libreoffice-calc-macro-with-examples/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2014/11/LibreOffice-Calc-Macro-Join-Data.png
[2]: https://www.debugpoint.com/wp-content/uploads/2014/11/LibreOffice-Calc-Macro-Join.png
[3]: https://www.debugpoint.com/wp-content/uploads/2014/11/LibreOffice-Calc-Macro-Left-Example.png
[4]: https://www.debugpoint.com/wp-content/uploads/2014/11/LibreOffice-Calc-Macro-Right-Example.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2014/11/LibreOffice-Calc-Macro-Mid-Example.png
[6]: https://www.debugpoint.com/wp-content/uploads/2014/11/LibreOffice-Calc-Macro-Instr-Example.png
[7]: http://www.debugpoint.com/libreoffice-basic-macro-tutorial-index/
[8]: https://www.debugpoint.com/enable-rpm-fusion-fedora-rhel-centos/
[9]: https://news.google.com/publications/CAAqBwgKMOCfmgsw-qmyAw
[10]: https://t.me/debugpoint
