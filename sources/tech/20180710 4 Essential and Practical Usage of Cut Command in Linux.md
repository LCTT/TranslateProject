FSSlc is translating

4 Essential and Practical Usage of Cut Command in Linux
============================================================

The cut command is the canonical tool to remove “columns” from a text file. In this context, a “column” can be defined as a range of characters or bytes identified by their physical position on the line, or a range of fields delimited by a separator.

I have written about [using AWK commands][13] earlier. In this detailed guide, I’ll explain four essential and practical examples of cut command in Linux that will help you big time.

![Cut Linux command examples](https://i1.wp.com/linuxhandbook.com/wp-content/uploads/2018/07/cut-command-linux.jpeg?resize=702%2C395&ssl=1)

### 4 Practical examples of Cut command in Linux

If you prefer, you can watch this video explaining the same practical examples of cut command that I have listed in the article.


Table of Contents:

*   [Working with character ranges][8]
    *   [What’s a range?][1]

*   [Working with byte ranges][9]
    *   [Working with multibyte characters][2]

*   [Working with fields][10]
    *   [Handling lines not containing the delimiter][3]

    *   [Changing the output delimiter][4]

*   [Non-POSIX GNU extensions][11]

### 1\. Working with character ranges

When invoked with the `-c` command line option, the cut command will remove characterranges.

Like any other filter, the cut command does not change the input file in place but it will copy the modified data to its standard output. It is your responsibility to redirect the command output to a file to save the result or to use a pipe to send it as input to another command.

If you’ve downloaded the [sample test files][26] used in the video above, you can see the `BALANCE.txt` data file, coming straight out of an accounting software my wife is using at her work:

```
sh$ head BALANCE.txt
ACCDOC    ACCDOCDATE    ACCOUNTNUM ACCOUNTLIB              ACCDOCLIB                        DEBIT          CREDIT
4         1012017       623477     TIDE SCHEDULE           ALNEENRE-4701-LOC                00000001615,00
4         1012017       445452     VAT BS/ENC              ALNEENRE-4701-LOC                00000000323,00
4         1012017       4356       PAYABLES                ALNEENRE-4701-LOC                               00000001938,00
5         1012017       623372     ACCOMODATION GUIDE      ALNEENRE-4771-LOC                00000001333,00
5         1012017       445452     VAT BS/ENC              ALNEENRE-4771-LOC                00000000266,60
5         1012017       4356       PAYABLES                ALNEENRE-4771-LOC                               00000001599,60
6         1012017       4356       PAYABLES                FACT FA00006253 - BIT QUIROBEN                  00000001837,20
6         1012017       445452     VAT BS/ENC              FACT FA00006253 - BIT QUIROBEN   00000000306,20
6         1012017       623795     TOURIST GUIDE BOOK      FACT FA00006253 - BIT QUIROBEN   00000001531,00
```

This is a fixed-width text file since the data fields are padded with a variable number of spaces to ensure they are displayed as a nicely aligned table.

As a corollary, a data column always starts and ends at the same character position on each line. There is a little pitfall though: despite its name, the `cut` command actually requires you to specify the range of data you want to  _keep_ , not the range you want to  _remove_ . So, if I need  _only_  the `ACCOUNTNUM` and `ACCOUNTLIB` columns in the data file above, I would write that:

```
sh$ cut -c 25-59 BALANCE.txt | head
ACCOUNTNUM ACCOUNTLIB
623477     TIDE SCHEDULE
445452     VAT BS/ENC
4356       /accountPAYABLES
623372     ACCOMODATION GUIDE
445452     VAT BS/ENC
4356       PAYABLES
4356       PAYABLES
445452     VAT BS/ENC
623795     TOURIST GUIDE BOOK
```

#### What’s a range?

As we have just seen it, the cut command requires we specify the  _range_  of data we want to keep. So, let’s introduce more formally what is a range: for the `cut` command, a range is defined by a starting and ending position separated by a hyphen. Ranges are 1-based, that is the first item of the line is the item number 1, not 0\. Ranges are inclusive: the start and end will be preserved in the output, as well as all characters between them. It is an error to specify a range whose ending position is before (“lower”) than its starting position. As a shortcut, you can omit the start  _or_  end value as described in the table below:


|||
|--|--|
| `a-b` | the range between a and b (inclusive) |
|`a` | equivalent to the range `a-a` |
| `-b` | equivalent to `1-a` |
| `b-` | equivalent to `b-∞` |

The cut commands allow you to specify several ranges by separating them with a comma. Here are a couple of examples:

```
# Keep characters from 1 to 24 (inclusive)
cut -c -24 BALANCE.txt

# Keep characters from 1 to 24 and 36 to 59 (inclusive)
cut -c -24,36-59 BALANCE.txt

# Keep characters from 1 to 24, 36 to 59 and 93 to the end of the line (inclusive)
cut -c -24,36-59,93- BALANCE.txt
```

One limitation (or feature, depending on the way you see it) of the `cut` command is it will  _never reorder the data_ . So the following command will produce exactly the same result as the previous one, despite the ranges being specified in a different order:

```
cut -c 93-,-24,36-59 BALANCE.txt
```

You can check that easily using the `diff` command:

```
diff -s <(cut -c -24,36-59,93- BALANCE.txt) \
              <(cut -c 93-,-24,36-59 BALANCE.txt)
Files /dev/fd/63 and /dev/fd/62 are identical
```

Similarly, the `cut` command  _never duplicates data_ :

```
# One might expect that could be a way to repeat
# the first column three times, but no...
cut -c -10,-10,-10 BALANCE.txt | head -5
ACCDOC
4
4
4
5
```

Worth mentioning there was a proposal for a `-o` option to lift those two last limitations, allowing the `cut` utility to reorder or duplicate data. But this was [rejected by the POSIX committee][14] _“because this type of enhancement is outside the scope of the IEEE P1003.2b draft standard.”_ 

As of myself, I don’t know any cut version implementing that proposal as an extension. But if you do, please, share that with us using the comment section!

### 2\. Working with byte ranges

When invoked with the `-b` command line option, the cut command will remove byte ranges.

At first sight, there is no obvious difference between  _character_  and  _byte_  ranges:

```
sh$ diff -s <(cut -b -24,36-59,93- BALANCE.txt) \
              <(cut -c -24,36-59,93- BALANCE.txt)
Files /dev/fd/63 and /dev/fd/62 are identical
```

That’s because my sample data file is using the [US-ASCII character encoding][27] (“charset”) as the `file -i` command can correctly guess it:

```
sh$ file -i BALANCE.txt
BALANCE.txt: text/plain; charset=us-ascii
```

In that character encoding, there is a one-to-one mapping between characters and bytes. Using only one byte, you can theoretically encode up to 256 different characters (digits, letters, punctuations, symbols, … ) In practice, that number is much lower since character encodings make provision for some special values (like the 32 or 65 [control characters][28]generally found). Anyway, even if we could use the full byte range, that would be far from enough to store the variety of human writing. So, today, the one-to-one mapping between characters and byte is more the exception than the norm and is almost always replaced by the ubiquitous UTF-8 multibyte encoding. Let’s see now how the cut command could handle that.

#### Working with multibyte characters

As I said previously, the sample data files used as examples for that article are coming from an accounting software used by my wife. It appends she updated that software recently and, after that, the exported text files were subtlely different. I let you try spotting the difference by yourself:

```
sh$ head BALANCE-V2.txt
ACCDOC    ACCDOCDATE    ACCOUNTNUM ACCOUNTLIB              ACCDOCLIB                        DEBIT          CREDIT
4         1012017       623477     TIDE SCHEDULE           ALNÉENRE-4701-LOC                00000001615,00
4         1012017       445452     VAT BS/ENC              ALNÉENRE-4701-LOC                00000000323,00
4         1012017       4356       PAYABLES                ALNÉENRE-4701-LOC                               00000001938,00
5         1012017       623372     ACCOMODATION GUIDE      ALNÉENRE-4771-LOC                00000001333,00
5         1012017       445452     VAT BS/ENC              ALNÉENRE-4771-LOC                00000000266,60
5         1012017       4356       PAYABLES                ALNÉENRE-4771-LOC                               00000001599,60
6         1012017       4356       PAYABLES                FACT FA00006253 - BIT QUIROBEN                  00000001837,20
6         1012017       445452     VAT BS/ENC              FACT FA00006253 - BIT QUIROBEN   00000000306,20
6         1012017       623795     TOURIST GUIDE BOOK      FACT FA00006253 - BIT QUIROBEN   00000001531,00
```

The title of this section might help you in finding what has changed. But, found or not, let see now the consequences of that change:

```
sh$ cut -c 93-,-24,36-59 BALANCE-V2.txt
ACCDOC    ACCDOCDATE    ACCOUNTLIB              DEBIT          CREDIT
4         1012017       TIDE SCHEDULE            00000001615,00
4         1012017       VAT BS/ENC               00000000323,00
4         1012017       PAYABLES                                00000001938,00
5         1012017       ACCOMODATION GUIDE       00000001333,00
5         1012017       VAT BS/ENC               00000000266,60
5         1012017       PAYABLES                                00000001599,60
6         1012017       PAYABLES                               00000001837,20
6         1012017       VAT BS/ENC              00000000306,20
6         1012017       TOURIST GUIDE BOOK      00000001531,00
19        1012017       SEMINAR FEES            00000000080,00
19        1012017       PAYABLES                               00000000080,00
28        1012017       MAINTENANCE             00000000746,58
28        1012017       VAT BS/ENC              00000000149,32
28        1012017       PAYABLES                               00000000895,90
31        1012017       PAYABLES                                00000000240,00
31        1012017       VAT BS/DEBIT             00000000040,00
31        1012017       ADVERTISEMENTS           00000000200,00
32        1012017       WATER                   00000000202,20
32        1012017       VAT BS/DEBIT            00000000020,22
32        1012017       WATER                   00000000170,24
32        1012017       VAT BS/DEBIT            00000000009,37
32        1012017       PAYABLES                               00000000402,03
34        1012017       RENTAL COSTS            00000000018,00
34        1012017       PAYABLES                               00000000018,00
35        1012017       MISCELLANEOUS CHARGES   00000000015,00
35        1012017       VAT BS/DEBIT            00000000003,00
35        1012017       PAYABLES                               00000000018,00
36        1012017       LANDLINE TELEPHONE        00000000069,14
36        1012017       VAT BS/ENC                00000000013,83
```

I have copied above the command output  _in-extenso_  so it should be obvious something has gone wrong with the column alignment.

The explanation is the original data file contained only US-ASCII characters (symbol, punctuations, numbers and Latin letters without any diacritical marks)

But if you look closely at the file produced after the software update, you can see that new export data file now preserves accented letters. For example, the company named “ALNÉENRE” is now properly spelled whereas it was previously exported as “ALNEENRE” (no accent)

The `file -i` utility did not miss that change since it reports now the file as being [UTF-8 encoded][15]:

```
sh$ file -i BALANCE-V2.txt
BALANCE-V2.txt: text/plain; charset=utf-8
```

To see how are encoded accented letters in an UTF-8 file, we can use the `[hexdump][12]` utility that allows us to look directly at the bytes in a file:

```
# To reduce clutter, let's focus only on the second line of the file
sh$ sed '2!d' BALANCE-V2.txt
4         1012017       623477     TIDE SCHEDULE           ALNÉENRE-4701-LOC                00000001615,00
sh$ sed '2!d' BALANCE-V2.txt  | hexdump -C
00000000  34 20 20 20 20 20 20 20  20 20 31 30 31 32 30 31  |4         101201|
00000010  37 20 20 20 20 20 20 20  36 32 33 34 37 37 20 20  |7       623477  |
00000020  20 20 20 54 49 44 45 20  53 43 48 45 44 55 4c 45  |   TIDE SCHEDULE|
00000030  20 20 20 20 20 20 20 20  20 20 20 41 4c 4e c3 89  |           ALN..|
00000040  45 4e 52 45 2d 34 37 30  31 2d 4c 4f 43 20 20 20  |ENRE-4701-LOC   |
00000050  20 20 20 20 20 20 20 20  20 20 20 20 20 30 30 30  |             000|
00000060  30 30 30 30 31 36 31 35  2c 30 30 20 20 20 20 20  |00001615,00     |
00000070  20 20 20 20 20 20 20 20  20 20 20 0a              |           .|
0000007c
```

On the line 00000030 of the `hexdump` output, after a bunch of spaces (byte `20`), you can see:

*   the letter `A` is encoded as the byte `41`,

*   the letter `L` is encoded a the byte `4c`,

*   and the letter `N` is encoded as the byte `4e`.

But, the uppercase [LATIN CAPITAL LETTER E WITH ACUTE][16] (as it is the official name of the letter  _É_  in the Unicode standard) is encoded using the  _two_  bytes `c3 89`

And here is the problem: using the `cut` command with ranges expressed as byte positions works well for fixed length encodings, but not for variable length ones like UTF-8 or [Shift JIS][17]. This is clearly explained in the following [non-normative extract of the POSIX standard][18]:

> Earlier versions of the cut utility worked in an environment where bytes and characters were considered equivalent (modulo <backspace> and <tab> processing in some implementations). In the extended world of multi-byte characters, the new -b option has been added.

Hey, wait a minute! I wasn’t using the `-b` option in the “faulty” example above, but the `-c`option. So,  _shouldn’t_  that have worked?!?

Yes, it  _should_ : it is unfortunate, but we are in 2018 and despite that, as of GNU Coreutils 8.30, the GNU implementation of the cut utility still does not handle multi-byte characters properly. To quote the [GNU documentation][19], the `-c` option is  _“The same as -b for now, but internationalization will change that[… ]”_  — a mention that is present since more than 10 years now!

On the other hand, the [OpenBSD][20] implementation of the cut utility is POSIX compliant, and will honor the current locale settings to handle multi-byte characters properly:

```
# Ensure subseauent commands will know we are using UTF-8 encoded
# text files
openbsd-6.3$ export LC_CTYPE=en_US.UTF-8

# With the `-c` option, cut works properly with multi-byte characters
openbsd-6.3$ cut -c -24,36-59,93- BALANCE-V2.txt
ACCDOC    ACCDOCDATE    ACCOUNTLIB              DEBIT          CREDIT
4         1012017       TIDE SCHEDULE           00000001615,00
4         1012017       VAT BS/ENC              00000000323,00
4         1012017       PAYABLES                               00000001938,00
5         1012017       ACCOMODATION GUIDE      00000001333,00
5         1012017       VAT BS/ENC              00000000266,60
5         1012017       PAYABLES                               00000001599,60
6         1012017       PAYABLES                               00000001837,20
6         1012017       VAT BS/ENC              00000000306,20
6         1012017       TOURIST GUIDE BOOK      00000001531,00
19        1012017       SEMINAR FEES            00000000080,00
19        1012017       PAYABLES                               00000000080,00
28        1012017       MAINTENANCE             00000000746,58
28        1012017       VAT BS/ENC              00000000149,32
28        1012017       PAYABLES                               00000000895,90
31        1012017       PAYABLES                               00000000240,00
31        1012017       VAT BS/DEBIT            00000000040,00
31        1012017       ADVERTISEMENTS          00000000200,00
32        1012017       WATER                   00000000202,20
32        1012017       VAT BS/DEBIT            00000000020,22
32        1012017       WATER                   00000000170,24
32        1012017       VAT BS/DEBIT            00000000009,37
32        1012017       PAYABLES                               00000000402,03
34        1012017       RENTAL COSTS            00000000018,00
34        1012017       PAYABLES                               00000000018,00
35        1012017       MISCELLANEOUS CHARGES   00000000015,00
35        1012017       VAT BS/DEBIT            00000000003,00
35        1012017       PAYABLES                               00000000018,00
36        1012017       LANDLINE TELEPHONE      00000000069,14
36        1012017       VAT BS/ENC              00000000013,83
```

As expected, when using the `-b` byte mode instead of the `-c` character mode, the OpenBSD cut implementation behave like the legacy `cut`:

```
openbsd-6.3$ cut -b -24,36-59,93- BALANCE-V2.txt
ACCDOC    ACCDOCDATE    ACCOUNTLIB              DEBIT          CREDIT
4         1012017       TIDE SCHEDULE            00000001615,00
4         1012017       VAT BS/ENC               00000000323,00
4         1012017       PAYABLES                                00000001938,00
5         1012017       ACCOMODATION GUIDE       00000001333,00
5         1012017       VAT BS/ENC               00000000266,60
5         1012017       PAYABLES                                00000001599,60
6         1012017       PAYABLES                               00000001837,20
6         1012017       VAT BS/ENC              00000000306,20
6         1012017       TOURIST GUIDE BOOK      00000001531,00
19        1012017       SEMINAR FEES            00000000080,00
19        1012017       PAYABLES                               00000000080,00
28        1012017       MAINTENANCE             00000000746,58
28        1012017       VAT BS/ENC              00000000149,32
28        1012017       PAYABLES                               00000000895,90
31        1012017       PAYABLES                                00000000240,00
31        1012017       VAT BS/DEBIT             00000000040,00
31        1012017       ADVERTISEMENTS           00000000200,00
32        1012017       WATER                   00000000202,20
32        1012017       VAT BS/DEBIT            00000000020,22
32        1012017       WATER                   00000000170,24
32        1012017       VAT BS/DEBIT            00000000009,37
32        1012017       PAYABLES                               00000000402,03
34        1012017       RENTAL COSTS            00000000018,00
34        1012017       PAYABLES                               00000000018,00
35        1012017       MISCELLANEOUS CHARGES   00000000015,00
35        1012017       VAT BS/DEBIT            00000000003,00
35        1012017       PAYABLES                               00000000018,00
36        1012017       LANDLINE TELEPHONE        00000000069,14
36        1012017       VAT BS/ENC                00000000013,83
```

### 3\. Working with fields

In some sense, working with fields in a delimited text file is easier for the `cut` utility, since it will only have to locate the (one byte) field delimiters on each row, copying then verbatim the field content to the output without bothering with any encoding issues.

Here is a sample delimited text file:

```
sh$ head BALANCE.csv
ACCDOC;ACCDOCDATE;ACCOUNTNUM;ACCOUNTLIB;ACCDOCLIB;DEBIT;CREDIT
4;1012017;623477;TIDE SCHEDULE;ALNEENRE-4701-LOC;00000001615,00;
4;1012017;445452;VAT BS/ENC;ALNEENRE-4701-LOC;00000000323,00;
4;1012017;4356;PAYABLES;ALNEENRE-4701-LOC;;00000001938,00
5;1012017;623372;ACCOMODATION GUIDE;ALNEENRE-4771-LOC;00000001333,00;
5;1012017;445452;VAT BS/ENC;ALNEENRE-4771-LOC;00000000266,60;
5;1012017;4356;PAYABLES;ALNEENRE-4771-LOC;;00000001599,60
6;1012017;4356;PAYABLES;FACT FA00006253 - BIT QUIROBEN;;00000001837,20
6;1012017;445452;VAT BS/ENC;FACT FA00006253 - BIT QUIROBEN;00000000306,20;
6;1012017;623795;TOURIST GUIDE BOOK;FACT FA00006253 - BIT QUIROBEN;00000001531,00;
```

You may know that file format as [CSV][29] (for Comma-separated Value), even if the field separator is not always a comma. For example, the semi-colon (`;`) is frequently encountered as a field separator, and it is often the default choice when exporting data as “CSV” in countries already using the comma as the [decimal separator][30] (like we do in France — hence the choice of that character in my sample file). Another popular variant uses a [tab character][31] as the field separator, producing what is sometimes called a [tab-separated values][32] file. Finally, in the Unix and Linux world, the colon (`:`) is yet another relatively common field separator you may find, for example, in the standard `/etc/passwd` and `/etc/group` files.

When using a delimited text file format, you provide to the cut command the range of fields to keep using the `-f` option, and you have to specify the delimiter using the `-d` option (without the `-d` option, the cut utility defaults to a tab character for the separator):

```
sh$ cut -f 5- -d';' BALANCE.csv | head
ACCDOCLIB;DEBIT;CREDIT
ALNEENRE-4701-LOC;00000001615,00;
ALNEENRE-4701-LOC;00000000323,00;
ALNEENRE-4701-LOC;;00000001938,00
ALNEENRE-4771-LOC;00000001333,00;
ALNEENRE-4771-LOC;00000000266,60;
ALNEENRE-4771-LOC;;00000001599,60
FACT FA00006253 - BIT QUIROBEN;;00000001837,20
FACT FA00006253 - BIT QUIROBEN;00000000306,20;
FACT FA00006253 - BIT QUIROBEN;00000001531,00;
```

#### Handling lines not containing the delimiter

But what if some line in the input file does not contain the delimiter? It is tempting to imagine that as a row containing only the first field. But this is  _not_  what the cut utility does.

By default, when using the `-f` option, the cut utility will always output verbatim a line that does not contain the delimiter (probably assuming this is a non-data row like a header or comment of some sort):

```
sh$ (echo "# 2018-03 BALANCE"; cat BALANCE.csv) > BALANCE-WITH-HEADER.csv

sh$ cut -f 6,7 -d';' BALANCE-WITH-HEADER.csv | head -5
# 2018-03 BALANCE
DEBIT;CREDIT
00000001615,00;
00000000323,00;
;00000001938,00
```

Using the `-s` option, you can reverse that behavior, so `cut` will always ignore such line:

```
sh$ cut -s -f 6,7 -d';' BALANCE-WITH-HEADER.csv | head -5
DEBIT;CREDIT
00000001615,00;
00000000323,00;
;00000001938,00
00000001333,00;
```

If you are in a hackish mood, you can exploit that feature as a relatively obscure way to keep only lines containing a given character:

```
# Keep lines containing a `e`
sh$ printf "%s\n" {mighty,bold,great}-{condor,monkey,bear} | cut -s -f 1- -d'e'
```

#### Changing the output delimiter

As an extension, the GNU implementation of cut allows to use a different field separator for the output using the `--output-delimiter` option:

```
sh$ cut -f 5,6- -d';' --output-delimiter="*" BALANCE.csv | head
ACCDOCLIB*DEBIT*CREDIT
ALNEENRE-4701-LOC*00000001615,00*
ALNEENRE-4701-LOC*00000000323,00*
ALNEENRE-4701-LOC**00000001938,00
ALNEENRE-4771-LOC*00000001333,00*
ALNEENRE-4771-LOC*00000000266,60*
ALNEENRE-4771-LOC**00000001599,60
FACT FA00006253 - BIT QUIROBEN**00000001837,20
FACT FA00006253 - BIT QUIROBEN*00000000306,20*
FACT FA00006253 - BIT QUIROBEN*00000001531,00*
```

Notice, in that case, all occurrences of the field separator are replaced, and not only those at the boundary of the ranges specified on the command line arguments.

### 4\. Non-POSIX GNU extensions

Speaking of non-POSIX GNU extension, a couple of them that can be particularly useful. Worth mentioning the following extensions work equally well with the byte, character (for what that means in the current GNU implementation) or field ranges:

Think of that option like the exclamation mark in a sed address (`!`); instead of keeping the data matching the given range, `cut` will keep data NOT matching the range

```
# Keep only field 5
sh$ cut -f 5 -d';' BALANCE.csv |head -3
ACCDOCLIB
ALNEENRE-4701-LOC
ALNEENRE-4701-LOC

# Keep all but field 5
sh$ cut --complement -f 5 -d';' BALANCE.csv |head -3
ACCDOC;ACCDOCDATE;ACCOUNTNUM;ACCOUNTLIB;DEBIT;CREDIT
4;1012017;623477;TIDE SCHEDULE;00000001615,00;
4;1012017;445452;VAT BS/ENC;00000000323,00;
```

use the [NUL character][6] as the line terminator instead of the [newline character][7]. The `-z`option is particularly useful when your data may contain embedded newline characters, like when working with filenames (since newline is a valid character in a filename, but NUL isn’t).


To show you how the `-z` option works, let’s make a little experiment. First, we will create a file whose name contains embedded new lines:

```
bash$ touch $'EMPTY\nFILE\nWITH FUNKY\nNAME'.txt
bash$ ls -1 *.txt
BALANCE.txt
BALANCE-V2.txt
EMPTY?FILE?WITH FUNKY?NAME.txt
```

Let’s now assume I want to display the first 5 characters of each `*.txt` file name. A naive solution will miserably fail here:

```
sh$ ls -1 *.txt | cut -c 1-5
BALAN
BALAN
EMPTY
FILE
WITH
NAME.
```

You may have already read `[ls][21]` was designed for [human consumption][33], and using it in a command pipeline is an anti-pattern (it is indeed). So let’s use the `[find][22]` command instead:

```
sh$ find . -name '*.txt' -printf "%f\n" | cut -c 1-5
BALAN
EMPTY
FILE
WITH
NAME.
BALAN
```

and … that produced basically the same erroneous result as before (although in a different order because `ls` implicitly sorts the filenames, something the `find` command does not do)

The problem is in both cases, the `cut` command can’t make the distinction between a newline character being part of a data field (the filename), and a newline character used as an end of record marker. But, using the NUL byte (`\0`) as the line terminator clears the confusion so we can finally obtain the expected result:

```
# I was told (?) some old versions of tr require using \000 instead of \0
# to denote the NUL character (let me know if you needed that change!)
sh$ find . -name '*.txt' -printf "%f\0" | cut -z -c 1-5| tr '\0' '\n'
BALAN
EMPTY
BALAN
```

With that latest example, we are moving away from the core of this article that was the `cut`command. So, I will let you try to figure by yourself the meaning of the funky `"%f\0"` after the `-printf` argument of the `find` command or why I used the `[tr][23]` command at the end of the pipeline.

### A lot more can be done with Cut command

I just showed the most common and in my opinion the most essential usage of Cut command. You can apply the command in even more practical ways. It depends on your logical reasoning and imagination.

Don’t hesitate to use the comment section below to post your findings. And, as always, if you like this article, don’t forget to share it on your favorite websites and social media!

--------------------------------------------------------------------------------

via: https://linuxhandbook.com/cut-command/

作者：[Sylvain Leroux ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxhandbook.com/author/sylvain/
[1]:https://linuxhandbook.com/cut-command/#_what_s_a_range
[2]:https://linuxhandbook.com/cut-command/#_working_with_multibyte_characters
[3]:https://linuxhandbook.com/cut-command/#_handling_lines_not_containing_the_delimiter
[4]:https://linuxhandbook.com/cut-command/#_changing_the_output_delimiter
[5]:http://click.linksynergy.com/deeplink?id=IRL8ozn3lq8&type=10&mid=39197&murl=https%3A%2F%2Fwww.udemy.com%2Fyes-i-know-the-bash-linux-command-line-tools%2F
[6]:https://en.wikipedia.org/wiki/Null_character
[7]:https://en.wikipedia.org/wiki/Newline
[8]:https://linuxhandbook.com/cut-command/#_working_with_character_ranges
[9]:https://linuxhandbook.com/cut-command/#_working_with_byte_ranges
[10]:https://linuxhandbook.com/cut-command/#_working_with_fields
[11]:https://linuxhandbook.com/cut-command/#_non_posix_gnu_extensions
[12]:https://linux.die.net/man/1/hexdump
[13]:https://linuxhandbook.com/awk-command-tutorial/
[14]:http://pubs.opengroup.org/onlinepubs/9699919799/utilities/cut.html#tag_20_28_18
[15]:https://en.wikipedia.org/wiki/UTF-8#Codepage_layout
[16]:https://www.fileformat.info/info/unicode/char/00c9/index.htm
[17]:https://en.wikipedia.org/wiki/Shift_JIS#Shift_JIS_byte_map
[18]:http://pubs.opengroup.org/onlinepubs/9699919799/utilities/cut.html#tag_20_28_16
[19]:https://www.gnu.org/software/coreutils/manual/html_node/cut-invocation.html#cut-invocation
[20]:https://www.openbsd.org/
[21]:https://linux.die.net/man/1/ls
[22]:https://linux.die.net/man/1/find
[23]:https://linux.die.net/man/1/tr
[24]:https://linuxhandbook.com/author/sylvain/
[25]:https://linuxhandbook.com/cut-command/#comments
[26]:https://static.yesik.it/EP22/Yes_I_Know_IT-EP22.tar.gz
[27]:https://en.wikipedia.org/wiki/ASCII#Character_set
[28]:https://en.wikipedia.org/wiki/Control_character
[29]:https://en.wikipedia.org/wiki/Comma-separated_values
[30]:https://en.wikipedia.org/wiki/Decimal_separator
[31]:https://en.wikipedia.org/wiki/Tab_key#Tab_characters
[32]:https://en.wikipedia.org/wiki/Tab-separated_values
[33]:http://lists.gnu.org/archive/html/coreutils/2014-02/msg00005.html
