grep������������ƥ����������ַ����򵥴ʸ�ʽ���ļ����ļ���ͨ����˵��grep ��ʾƥ�䵽���У�ʹ��grep����������һ������������ʽƥ�䵽���У�ֻ��ʾ���ʵ��У�grep����Ϊ����Linux������Unixϵͳ�������õ�����
### ��֪���� ###
grep������֣���Դ�ڱ�������ʾһ�����Ƶ���Ϊ�����grep��Unix����Linux���ı��༭�����ǣ�

    g/re/p

### grep������﷨ ###

�﷨������ʾ:

    grep 'word' filename
    grep 'word' file1 file2 file3
    grep 'string1 string2'  filename
    cat otherfile | grep 'something'
    command | grep 'something'
    command option1 | grep 'data'
    grep --color 'data' fileName

###��ô��ʹ��grep������һ���ļ�###

���� /etc/passwd �ļ��µ�boo�û�,����:

    $ grep boo /etc/passwd

�������:

    foo:x:1000:1000:foo,,,:/home/foo:/bin/ksh

����ʹ��grepȥǿ�ƺ��Դ�Сд i.e ʹ��-iƥ�� boo, Boo, BOO ������ѡ��:

    $ grep -i "boo" /etc/passwd

### �ݹ�ʹ��grep ###

�����ʹ��grep�ݹ������ i.e. ���ļ�Ŀ¼�����������а����ַ���192.168.1.5���ļ�

    $ grep -r "192.168.1.5" /etc/

�����ǣ�

    $ grep -R "192.168.1.5" /etc/

ʾ�����:

    /etc/ppp/options:# ms-wins 192.168.1.50
    /etc/ppp/options:# ms-wins 192.168.1.51
    /etc/NetworkManager/system-connections/Wired connection 1:addresses1=192.168.1.5;24;192.168.1.2;

��ῴ�����ҵ��� 192.168.1.5 �Ľ�����ļ�����Ϊ������ʾ�ڵ����������棬���֮�а������ļ������Լ�-hѡ������ֹ�������
    $ grep -h -R "192.168.1.5" /etc/

����

    $ grep -hR "192.168.1.5" /etc/

ʾ�����:

    # ms-wins 192.168.1.50
    # ms-wins 192.168.1.51
    addresses1=192.168.1.5;24;192.168.1.2;

### ʹ��grepȥ�����ı� ###

��������boo��grep�����ƥ��fooboo��boo123, barfoo35 ����������boo���ַ����������ʹ��-wѡ��ȥǿ��ѡ�������Щ���������Ǹ��������ʵ��С�

    $ grep -w "boo" file

### ʹ��egrep����ȥ�Ƚϲ�ͬ ###

ʹ��egrep��������:

    $ egrep -w 'word1|word2' /path/to/file

### ���ı���ƥ��ʱͳ������ ###

grep�������ͨ����-c������ʾÿ���ļ�����ƥ�䵽�Ĵ�����

    $ grep -c 'word' /path/to/file

����-nѡ��ȥ��ʾ�������ǰ����ƥ�䵽�����������ļ����������

    $ grep -n 'root' /etc/passwd

ʾ�����:

    1:root:x:0:0:root:/root:/bin/bash
    1042:rootdoor:x:0:0:rootdoor:/home/rootdoor:/bin/csh
    3319:initrootapp:x:0:0:initrootapp:/home/initroot:/bin/ksh

### ��תƥ�� ###

����ʹ��-vѡ��ȥ��ӡ������ƥ��������ݣ�������ݽ���������Щ�����������ʵ��У�����ɾ��������bar���ʵ������У�

    $ grep -v bar /path/to/file

### UNIX / Linux �ܵ��� grep ���� ###

grep ������ܵ�һ��ʹ�ã�����������У���ʾӲ�����֣�

    # dmesg | egrep '(s|h)d[a-z]'

��ʾCPUģ������

    # cat /proc/cpuinfo | grep -i 'Model'

Ȼ��������������԰������·���ʹ�õ�ͬʱ����ʹ�ùܵ�:

    # grep -i 'Model' /proc/cpuinfo

ʾ�����:

    model		: 30
    model name	: Intel(R) Core(TM) i7 CPU       Q 820  @ 1.73GHz
    model		: 30
    model name	: Intel(R) Core(TM) i7 CPU       Q 820  @ 1.73GHz

### ��ν�����ʾƥ�䵽���ݵ��ļ�����? ###

ʹ��-lѡ��ȥ��ʾ��Щ�ļ������а���main�������ļ���:

    $ grep -l 'main' *.c

����������ʹgrep��ɫ�ʵ���ʾ���:

    $ grep --color vivek /etc/passwd

ʾ�����:

![Grep command in action](http://files.cyberciti.biz/uploads/faq/2007/08/grep_command_examples.png)


--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/howto-use-grep-command-in-linux-unix/

���ߣ�Vivek Gite 
���ߣ�[zky001](https://github.com/zky001)
У�ԣ�[У����ID](https://github.com/У����ID)

������ [LCTT](https://github.com/LCTT/TranslateProject) ԭ�����룬[Linux�й�](https://linux.cn/) �����Ƴ�

У����ID��
[1]:http://bash.cyberciti.biz/guide/Pipes