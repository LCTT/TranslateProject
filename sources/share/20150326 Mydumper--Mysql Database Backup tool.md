Mydumper – Mysql Database Backup tool
================================================================================
Mydumper is a tool used for backing up MySQL database servers much faster than the mysqldump tool distributed with MySQL. It also has the capability to retrieve the binary logs from the remote server at the same time as the dump itself.

### Mydumper advantages ###

o Parallelism (hence, speed) and performance (avoids expensive character set conversion routines, efficient code overall)

o Easier to manage output (separate files for tables, dump metadata,etc, easy to view/parse data)

o Consistency -- maintains snapshot across all threads, provides accurate master and slave log positions, etc

o Manageability -- supports PCRE for specifying database and tables inclusions and exclusions

### Install mydumper on ubuntu ###

Open the terminal and run the following command

    sudo apt-get install mydumper

### Using Mydumper ###

#### Syntax ####

    mydumper [options]

Application Options:

- -B, --database Database to dump
- -T, --tables-list Comma delimited table list to dump (does not exclude regex option)
- -o, --outputdir Directory to output files to
- -s, --statement-size Attempted size of INSERT statement in bytes, default 1000000
- -r, --rows Try to split tables into chunks of this many rows
- -c, --compress Compress output files
- -e, --build-empty-files Build dump files even if no data available from table
- -x, --regex Regular expression for ‘db.table' matching
- -i, --ignore-engines Comma delimited list of storage engines to ignore
- -m, --no-schemas Do not dump table schemas with the data
- -k, --no-locks Do not execute the temporary shared read lock. WARNING: This will cause inconsistent backups
- -l, --long-query-guard Set long query timer in seconds, default 60
- --kill-long-queries Kill long running queries (instead of aborting)
- -b, --binlogs Get a snapshot of the binary logs as well as dump data
- -D, --daemon Enable daemon mode
- -I, --snapshot-interval Interval between each dump snapshot (in minutes), requires --daemon, default 60
- -L, --logfile Log file name to use, by default stdout is used
- -h, --host The host to connect to
- -u, --user Username with privileges to run the dump
- -p, --password User password
- -P, --port TCP/IP port to connect to
- -S, --socket UNIX domain socket file to use for connection
- -t, --threads Number of threads to use, default 4
- -C, --compress-protocol Use compression on the MySQL connection
- -V, --version Show the program version and exit
- -v, --verbose Verbosity of output, 0 = silent, 1 = errors, 2 = warnings, 3 = info, default 2

#### Mydumper Example ####

    mydumper \
    --database=$DB_NAME \
    --host=$DB_HOST \
    --user=$DB_USER \
    --password=$DB_PASS \
    --outputdir=$DB_DUMP \
    --rows=500000 \
    --compress \
    --build-empty-files \
    --threads=2 \
    --compress-protocol

Description of Mydumper's output data

Mydumper does not output to files, but rather to files in a directory. The --outputdir option specifies the name of the directory to use.

The output is two parts

Schema

For each table in the database, a file containing the CREATE TABLE statement will be created. It will be named:

dbname.tablename-schema.sql.gz

Data

For each table with number of rows above the --rows parameter, you will have a file called:

dbname.tablename.0000n.sql.gz

Where "n" starts with 0 up to the number of.

If you want to restore these backup you can use Myloader

    myloader \
    --database=$DB_NAME \
    --directory=$DB_DUMP \
    --queries-per-transaction=50000 \
    --threads=10 \
    --compress-protocol \
    --verbose=3

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/mydumper-mysql-database-backup-tool.html

作者：[ruchi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix