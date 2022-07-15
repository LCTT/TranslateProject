[#]: subject: "How I create music playlists on Linux"
[#]: via: "https://opensource.com/article/22/7/c-linux-mp3"
[#]: author: "Rikard Grossman-Nielsen https://opensource.com/users/rikardgn"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I create music playlists on Linux
======
Use this C program I made on Linux to listen to your favorite songs on the go.

![Open source software helps artists create music][1]

Image by: Opensource.com

I recently wrote a C program in Linux to create a smaller random selection of MP3 files from my extensive MP3 library. The program goes through a directory containing my MP3 library, and then creates a directory with a random, smaller selection of songs. I then copy the MP3 files to my smartphone to listen to them on the go.

Sweden is a sparsely populated country with many rural areas where you don't have full cell phone coverage. That's one reason for having MP3 files on a smartphone. Another reason is that I don't always have the money for a streaming service, so I like to have my own copies of the songs I enjoy.

You can download my application from its [Git repository][2]. I wrote it for Linux specifically in part because it's easy to find well-tested file I/O routines on Linux. Many years ago, I tried writing the same program on Windows using proprietary C libraries, and I got stuck trying to get the file copying routing to work. Linux gives the user easy and direct access to the file system.

In the spirit of open source, it didn't take much searching before I found file I/O code for Linux to inspire me. I also found some code for allocating memory which inspired me. I wrote the code for random number generation.

The program works as described here:

1. It asks for the source and destination directory.
2. It asks for the number of files in the directory of MP3 files.
3. It searches for the percentage (from 1.0 to 88.0 percent) of your collection that you wish to copy. You can also enter a number like 12.5%, if you have a collection of 1000 files and wish to copy 125 files from your collection rather than 120 files. I put the cap at 88% because copying more than 88% of your library would mostly generate a collection similar to your base collection. Of course, the code is open source so you can freely modify it to your liking.
4. It allocates memory using pointers and malloc. Memory is required for several actions, including the list of strings representing the files in your music collection. There is also a list to hold the randomly generated numbers.
5. It generates a list of random numbers in the range of all the files (for example, 1 to 1000, if the collection has 1000 files).
6. It copies the files.

Some of these parts are simpler than others, but the code is only about 100 lines:

```
#include <dirent.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h> /* include necessary header files */
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>

#define BUF_SIZE 4096 /* use buffer of 4096 bytes */
#define OUTPUT_MODE 0700 /*protect output file */
#define MAX_STR_LEN 256

int main(void) {
  DIR *d;
  struct dirent *dir;
  char strTemp[256], srcFile[256],
  dstFile[256], srcDir[256], dstDir[256];
  char **ptrFileLst;

  char buffer[BUF_SIZE];
  int nrOfStrs=-1, srcFileDesc,
  dstFileDesc, readByteCount,
  writeByteCount, numFiles;
  int indPtrFileAcc, q;

  float nrFilesCopy;
  // vars for generatingRandNumList
  int i, k, curRanNum, curLstInd,
  numFound, numsToGen, largNumRange;
  int *numLst;

  float procFilesCopy;
  printf("Enter name of source Directory\n");
  scanf("%s", srcDir);
  printf("Enter name of destionation Directory\n");
  scanf("%s", dstDir);
  printf("How many files does the directory with mp3 files contain?\n");
  scanf("%d", &numFiles);
  printf("What percent of the files do you wish to make a random selection of\n");
  printf("enter a number between 1 and 88\n");
  scanf("%f", &procFilesCopy);

  // allocate memory for filesList, list of random numbers
  ptrFileLst= (char**) malloc(numFiles * sizeof(char*));

  for (i = 0; i < numFiles; i++) {
    ptrFileLst[i] = (char*)malloc(MAX_STR_LEN * sizeof(char));
  }
  
  largNumRange = numFiles;
  nrFilesCopy = (procFilesCopy / 100) * numFiles;

  numsToGen = (int)((procFilesCopy / 100) * numFiles);
  printf("nrFilesCopy=%f", nrFilesCopy);
  printf("NumsToGen=%d", numsToGen);
  numLst = malloc(numsToGen * sizeof(int));
  srand(time(0));

  numLst[0] = rand() % largNumRange + 1;
  numFound=0;
  do { 
    curRanNum = (int)rand() % largNumRange + 1;
    if (numLst[0] == curRanNum) {
      numFound=1; 
    }
  } while(numFound == 1);

  numLst[1] = curRanNum;
  getchar();
  curLstInd = 1;
  i = 0;
  while(1) {
    do {
      numFound = 0;
      curRanNum = (int)rand() % largNumRange + 1;
      for (int k = 0; k <= curLstInd; k++){
        if (numLst[k] == curRanNum)
        numFound = 1;
      }
    } while(numFound == 1);
    numLst[curLstInd+1] = curRanNum;
    curLstInd++;
    i++;
    // numsToGen=Total numbers to generate minus two
    // already generated by the code above this loop
    if (i == (numsToGen-2))
      break;
    }

    d = opendir(srcDir);
    if (d) {
      while ( (dir = readdir(d)) != NULL ) {
      strcpy(strTemp, dir->d_name);

      if (strTemp[0] != '.') {
        nrOfStrs++;
        strcpy(ptrFileLst[nrOfStrs], strTemp);
      } 
    }
    closedir(d); 
  }

  for (q = 0; q <= curLstInd; q++) {
    indPtrFileAcc = numLst[q];
    strcpy(srcFile, srcDir);
    strcat(srcFile, "/");
    strcat(srcFile, ptrFileLst[indPtrFileAcc]);
    strcpy(dstFile, dstDir);
    strcat(dstFile, "/");
    strcat(dstFile, ptrFileLst[indPtrFileAcc]);
    
    srcFileDesc = open(srcFile, O_RDONLY);
    dstFileDesc = creat(dstFile, OUTPUT_MODE);

    while(1) {
      readByteCount = read(srcFileDesc, buffer, BUF_SIZE);
      if (readByteCount <= 0) 
        break;
      
      writeByteCount = write(dstFileDesc, buffer, readByteCount);
      if(writeByteCount <= 0)
        exit(4);
    }

    //close the files 
    close(srcFileDesc);
    close(dstFileDesc); 
  }
}
```

This code is possibly the most complex:

```
while(1) {
  readByteCount = read(srcFileDesc, buffer, BUF_SIZE);
  if (readByteCount <= 0) 
    break;

  writeByteCount = write(dstFileDesc, buffer, readByteCount);
  if (writeByteCount <= 0)
      exit(4); 
}
```

This reads a number of bytes (readByteCount) from a file specified into the character buffer. The first parameter to the function is the file name (srcFileDesc). The second parameter is a pointer to the character buffer, declared previously in the program. The last parameter of the function is the size of the buffer.

The program returns the number of the bytes read (in this case, 4 bytes). The first `if` clause breaks out of the loop if a number of 0 or less is returned.

If the number of read bytes is 0, then all of the writing is done, and the loop breaks to write the next file. If the number of bytes read is less than 0, then an error has occurred and the program exits.

When the 4 bytes are read, it will write to them.The write function takes three arguments.The first is the file to write to, the second is the character buffer, and the third is the number of bytes to write (4 bytes). The function returns the number of bytes written.

If 0 bytes are written, then a write error has occurred, so the second `if` clause exits the program.

The `while` loop reads and copies the file, 4 bytes at a time, until the file is copied. When the copying is done, you can copy the directory of randomly generated mp3 files to your smartphone.

The copy and write routine are fairly efficient because they use file system calls in Linux.

### Improving the code

This program is simple and it could be improved in terms of its user interface, and how flexible it is. You can implement a function that calculates the number of files in the source directory so you don't have to enter it manually, for instance. You can add options so you can pass the percentage and path non-interactively.nBut the code does what I need it to do, and it's a demonstration of the simple efficiency of the C programming language.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/c-linux-mp3

作者：[Rikard Grossman-Nielsen][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rikardgn
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/LIFE_musicinfinity.png
[2]: https://github.com/rikardgn/learnC/blob/main/randMp3Copy.c
