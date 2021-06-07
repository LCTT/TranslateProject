[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manage your SSL certificates with the ssl-on-demand script)
[#]: via: (https://opensource.com/article/20/2/ssl-demand)
[#]: author: (Abhishek Tamrakar https://opensource.com/users/tamrakar)

Manage your SSL certificates with the ssl-on-demand script
======
Keep track of certificate expirations to prevent problems with the
ssl-on-demand script.
![Lock][1]

It happens all the time, to the largest of companies. An important certificate doesn't get renewed, and services become inaccessible. It happened to Microsoft Teams in early February 2020, awkwardly timed just after the launch of a major television campaign promoting it as a [Slack competitor][2]. Embarrassing as that may be, it's sure to happen to someone else in the future.

On the modern web, expired [certificates][3] can create major problems for websites, ranging from unhappy users who can't connect to a site to security threats from bad actors who take advantage of the failure to renew a certificate.

[Ssl-on-demand][4] is a set of SSL scripts to help site owners manage certificates. It is used for on-demand certificate generation and validation and it can create certificate signing requests ([CSRs][5]) and predict the expiration of existing certificates.

### Automate SSL expiry checks


```
 USAGE: SSLexpiryPredictions.sh -[cdewh]

  DESCRIPTION: This script predicts the expiring SSL certificates based on the end date.

  OPTIONS:

  -c|   sets the value for configuration file which has server:port or host:port details.
       
  -d|   sets the value of directory containing the certificate files in crt or pem format.

  -e|   sets the value of certificate extention, e.g crt, pem, cert.
        crt: default [to be used with -d, if certificate file extention is other than .crt]

  -w|   sets the value for writing the script output to a file.

  -h|   prints this help and exit.
```

**Examples:**

To create a file with a list of all servers and their port numbers to make an SSL handshake, use:


```
cat &gt; servers.list
         server1:port1
         server2:port2
         server3:port3
        (ctrl+d)
       
$ ./SSLexpiryPredictions.sh -c server.list
```

Run the script by providing the certificate location and extension (in case it is not .crt):


```
`$ ./SSLexpiryPredictions.sh -d /path/to/certificates/dir -e pem`
```

### Automate CSR and private key creation


```
Usage:  genSSLcsr.sh [options] -[cdmshx]
  [-c (common name)]
  [-d (domain name)]
  [-s (SSL certificate subject)]
  [-p (password)]
  [-m (email address)] *(Experimental)
  [-r (remove pasphrase) default:true]
  [-h (help)]
  [-x (optional)]

[OPTIONS]
  -c|   Sets the value for common name.
        A valid common name is something that ends with 'xyz.com'

  -d|   Sets the domain name.

  -s|   Sets the subject to be applied to the certificates.
        '/C=country/ST=state/L=locality/O=organization/OU=organizationalunit/emailAddress=email'

  -p|   Sets the password for private key.

  -r|   Sets the value of remove passphrase.
        true:[default] passphrase will be removed from key.
        false: passphrase will not be removed and key wont get printed.

  -m|   Sets the mailing capability to the script.
        (Experimental at this time and requires a lot of work)

  -x|   Creates the certificate request and key but do not print on screen.
        To be used when script is used just to create the key and CSR with no need
        + to generate the certficate on the go.

  -h|   Displays the usage. No further functions are performed.

  Example: genSSLcsr.sh -c mywebsite.xyz.com -m [myemail@mydomain.com][6]
```

### The scripts

#### 1. SSLexpiryPredictions.sh


```
#!/bin/bash
##############################################
#
#       PURPOSE: The script to predict expiring SSL certificates.
#
#       AUTHOR: 'Abhishek.Tamrakar'
#
#       VERSION: 0.0.1
#
#       COMPANY: Self
#
#       EMAIL: [abhishek.tamrakar08@gmail.com][7]
#
#       GENERATED: on 2018-05-20
#
#       LICENSE: Copyright (C) 2018 Abhishek Tamrakar
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       <http://www.apache.org/licenses/LICENSE-2.0>
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
##############################################

#your Variables go here
script=${0##/}
exitcode=''
WRITEFILE=0
CONFIG=0
DIR=0
# functions here
usage()
{
cat &lt;&lt;EOF

  USAGE: $script -[cdewh]"

  DESCRIPTION: This script predicts the expiring SSL certificates based on the end date.

  OPTIONS:

  -c|   sets the value for configuration file which has server:port or host:port details.

  -d|   sets the value of directory containing the certificate files in crt or pem format.

  -e|   sets the value of certificate extention, e.g crt, pem, cert.
        crt: default

  -w|   sets the value for writing the script output to a file.

  -h|   prints this help and exit.

EOF
exit 1
}
# print info messages
info()
{
  printf '\n%s: %6s\n' "INFO" "$@"
}
# print error messages
error()
{
  printf '\n%s: %6s\n' "ERROR" "$@"
  exit 1
}
# print warning messages
warn()
{
  printf '\n%s: %6s\n' "WARN" "$@"
}
# get expiry for the certificates
getExpiry()
{
  local expdate=$1
  local certname=$2
  today=$(date +%s)
  timetoexpire=$(( ($expdate - $today)/(60*60*24) ))

  expcerts=( ${expcerts[@]} "${certname}:$timetoexpire" )
}

# print all expiry that was found, typically if there is any.
printExpiry()
{
  local args=$#
  i=0
  if [[ $args -ne 0 ]]; then
    #statements
    printf '%s\n' "---------------------------------------------"
    printf '%s\n' "List of expiring SSL certificates"
    printf '%s\n' "---------------------------------------------"
    printf '%s\n' "$@"  | \
      sort -t':' -g -k2 | \
      column -s: -t     | \
      awk '{printf "%d.\t%s\n", NR, $0}'
    printf '%s\n' "---------------------------------------------"
  fi
}

# calculate the end date for the certificates first, finally to compare and predict when they are going to expire.
calcEndDate()
{
  sslcmd=$(which openssl)
  if [[ x$sslcmd = x ]]; then
    #statements
    error "$sslcmd command not found!"
  fi
  # when cert dir is given
  if [[ $DIR -eq 1 ]]; then
    #statements
    checkcertexists=$(ls -A $TARGETDIR| egrep "*.$EXT$")
    if [[ -z ${checkcertexists} ]]; then
      #statements
      error "no certificate files at $TARGETDIR with extention $EXT"
    fi
    for file in $TARGETDIR/*.${EXT:-crt}
    do
      expdate=$($sslcmd x509 -in $file -noout -enddate)
      expepoch=$(date -d "${expdate##*=}" +%s)
      certificatename=${file##*/}
      getExpiry $expepoch ${certificatename%.*}
    done
  elif [[ $CONFIG -eq 1 ]]; then
    #statements
    while read line
    do
      if echo "$line" | \
      egrep -q '^[a-zA-Z0-9.]+:[0-9]+|^[a-zA-Z0-9]+_.*:[0-9]+';
      then
        expdate=$(echo | \
        openssl s_client -connect $line 2&gt;/dev/null | \
        openssl x509 -noout -enddate 2&gt;/dev/null);
        if [[ $expdate = '' ]]; then
          #statements
          warn "[error:0906D06C] Cannot fetch certificates for $line"
        else
          expepoch=$(date -d "${expdate##*=}" +%s);
          certificatename=${line%:*};
          getExpiry $expepoch ${certificatename};
        fi
      else
        warn "[format error] $line is not in required format!"
      fi
    done &lt; $CONFIGFILE
  fi
}
# your script goes here
while getopts ":c:d:w:e:h" options
do
case $options in
c )
  CONFIG=1
  CONFIGFILE="$OPTARG"
  if [[ ! -e $CONFIGFILE ]] || [[ ! -s $CONFIGFILE ]]; then
    #statements
    error "$CONFIGFILE does not exist or empty!"
  fi
        ;;
e )
  EXT="$OPTARG"
  case $EXT in
    crt|pem|cert )
    info "Extention check complete."
    ;;
    * )
    error "invalid certificate extention $EXT!"
    ;;
  esac
  ;;
d )
  DIR=1
  TARGETDIR="$OPTARG"
  [ $TARGETDIR = '' ] &amp;&amp; error "$TARGETDIR empty variable!"
  ;;
w )
  WRITEFILE=1
  OUTFILE="$OPTARG"
  ;;
h )
        usage
        ;;
\? )
        usage
        ;;
: )
        fatal "Argument required !!! see \'-h\' for help"
        ;;
esac
done
shift $(($OPTIND - 1))
#
calcEndDate
#finally print the list
if [[ $WRITEFILE -eq 0 ]]; then
  #statements
  printExpiry ${expcerts[@]}
else
  printExpiry ${expcerts[@]} &gt; $OUTFILE
fi
```

#### 2. genSSLcsr.sh


```
#!/bin/bash -
#===============================================================================
#
#          FILE: genSSLcsr.sh
#
#         USAGE: ./genSSLcsr.sh [options]
#
#   DESCRIPTION: ++++version 1.0.2
#               Fixed few bugs from previous script
#               +Removing passphrase after CSR generation
#               Extended use of functions
#               Checks for valid common name
#               ++++1.0.3
#               Fixed line breaks
#               Work directory to be created at the start
#               Used getopts for better code arrangements
#   ++++1.0.4
#     Added mail feature (experimental at this time and needs
#     a mail server running locally.)
#     Added domain input and certificate subject inputs
#
#       OPTIONS: ---
#  REQUIREMENTS: openssl, mailx
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Abhishek Tamrakar (), [abhishek.tamrakar08@gmail.com][7]
#  ORGANIZATION: Self
#       CREATED: 6/24/2016
#      REVISION: 4
# COPYRIGHT AND
#       LICENSE: Copyright (C) 2016 Abhishek Tamrakar
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       <http://www.apache.org/licenses/LICENSE-2.0>
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#===============================================================================

#variables ges here
#set basename to scriptname
SCRIPT=${0##*/}

#set flags
TFOUND=0
CFOUND=0
MFOUND=0
XFOUND=0
SFOUND=0
logdir=/var/log
# edit these below values to replace with yours
homedir=''
yourdomain=''
country=IN
state=Maharashtra
locality=Pune
organization="your_organization"
organizationalunit="your_organizational_unit"
email=your_email@your_domain
password=your_ssl_password
# OS is declared and will be used in its next version
OS=$(egrep -io 'Redhat|centos|fedora|ubuntu' /etc/issue)

### function declarations ###

info()
{
  printf '\n%s\t%s\t' "INFO" "$@"
}

#exit on error with a custom error message
#the extra function was removed and replaced withonly one.
#using FAILED\n\e&lt;message&gt; is a way but not necessarily required.
#

fatal()
{
 printf '\n%s\t%s\n' "ERROR" "$@"
 exit 1
}

checkperms()
{
if [[ -z ${homedir} ]]; then
homedir=$(pwd)
fi
if [[ -w ${homedir} ]]; then
info "Permissions acquired for ${SCRIPT} on ${homedir}."
else
fatal "InSufficient permissions to run the ${SCRIPT}."
fi
}

checkDomain()
{
info "Initializing Domain ${cn} check ? "
if [[ ! -z ${yourdomain} ]]; then
workdir=${homedir}/${yourdomain}
echo -e "${cn}"|grep -E -i -q "${yourdomain}$" &amp;&amp; echo -n "[OK]" || fatal "InValid domain in ${cn}"
else
workdir=${homedir}/${cn#*.}
echo -n "[NULL]"
info "WARNING: No domain declared to check."
confirmUserAction
fi
}       # end function checkDomain

usage()
{
cat &lt;&lt; EOF

Usage:  $SCRIPT [options] -[cdmshx]
  [-c (common name)]
  [-d (domain name)]
  [-s (SSL certificate subject)]
  [-p (password)]
  [-m (email address)] *(Experimental)
  [-r (remove pasphrase) default:true]
  [-h (help)]
  [-x (optional)]

[OPTIONS]
  -c|   Sets the value for common name.
        A valid common name is something that ends with 'xyz.com'

  -d|   Sets the domain name.

  -s|   Sets the subject to be applied to the certificates.
        '/C=country/ST=state/L=locality/O=organization/OU=organizationalunit/emailAddress=email'

  -p|   Sets the password for private key.

  -r|   Sets the value of remove passphrase.
        true:[default] passphrase will be removed from key.
        false: passphrase will not be removed and key wont get printed.

  -m|   Sets the mailing capability to the script.
        (Experimental at this time and requires a lot of work)

  -x|   Creates the certificate request and key but do not print on screen.
        To be used when script is used just to create the key and CSR with no need
        + to generate the certficate on the go.

  -h|   Displays the usage. No further functions are performed.

  Example: $SCRIPT -c mywebsite.xyz.com -m [myemail@mydomain.com][6]

EOF
exit 1
}       # end usage

confirmUserAction() {
while true; do
read -p "Do you wish to continue? ans: " yn
case $yn in
[Yy]* ) info "Initiating the process";
break;;
[Nn]* ) exit 1;;
* ) info "Please answer yes or no.";;
esac
done
}       # end function confirmUserAction

parseSubject()
{
  local subject="$1"
  parsedsubject=$(echo $subject|sed 's/\// /g;s/^ //g')
  for i in ${parsedsubject}; do
      case ${i%=*} in
        'C' )
        country=${i##*=}
        ;;
        'ST' )
        state=${i##*=}
        ;;
        'L' )
        locality=${i##*=}
        ;;
        'O' )
        organization=${i##*=}
        ;;
        'OU' )
        organizationalunit=${i##*=}
        ;;
        'emailAddress' )
        email=${i##*=}
      ;;
    esac
  done
}

sendMail()
{
 mailcmd=$(which mailx)
 if [[ x"$mailcmd" = "x" ]]; then
   fatal "Cannot send email! please install mailutils for linux"
 else
   echo "SSL CSR attached." | $mailcmd -s "SSL certificate request" \
   -t $email $ccemail -A ${workdir}/${cn}.csr \
   &amp;&amp; info "mail sent" \
   || fatal "error in sending mail."
 fi
}

genCSRfile()
{
info "Creating signed key request for ${cn}"
#Generate a key
openssl genrsa -des3 -passout pass:$password -out ${workdir}/${cn}.key 4096 -noout 2&gt;/dev/null &amp;&amp; echo -n "[DONE]" || fatal "unable to generate key"

#Create the request
info "Creating Certificate request for ${cn}"
openssl req -new -key ${workdir}/${cn}.key -passin pass:$password -sha1 -nodes \
        -subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$cn/emailAddress=$email" \
        -out ${workdir}/${cn}.csr &amp;&amp; echo -n "[DONE]" || fatal "unable to create request"

if [[ "${REMOVEPASSPHRASE:-true}" = 'true' ]]; then
  #statements
  #Remove passphrase from the key. Comment the line out to keep the passphrase
  info "Removing passphrase from ${cn}.key"
  openssl rsa -in ${workdir}/${cn}.key \
  -passin pass:$password \
  -out ${workdir}/${cn}.insecure 2&gt;/dev/null \
  &amp;&amp; echo -n "[DONE]" || fatal "unable to remove passphrase"
  #swap the filenames
  info "Swapping the ${cn}.key to secure"
  mv ${workdir}/${cn}.key ${workdir}/${cn}.secure \
  &amp;&amp; echo -n "[DONE]" || fatal "unable to perfom move"
  info "Swapping insecure key to ${cn}.key"
  mv ${workdir}/${cn}.insecure ${workdir}/${cn}.key \
  &amp;&amp; echo -n "[DONE]" || fatal "unable to perform move"
else
  info "Flag '-r' is set, passphrase will not be removed."
fi
}

printCSR()
{
if [[ -e ${workdir}/${cn}.csr ]] &amp;&amp; [[ -e ${workdir}/${cn}.key ]]
then
echo -e "\n\n----------------------------CSR-----------------------------"
cat ${workdir}/${cn}.csr
echo -e "\n----------------------------KEY-----------------------------"
cat ${workdir}/${cn}.key
echo -e "------------------------------------------------------------\n"
else
fatal "CSR or KEY generation failed !!"
fi
}

### END Functions ###

#Check the number of arguments. If none are passed, print help and exit.
NUMARGS=$#
if [ $NUMARGS -eq 0 ]; then
fatal "$NUMARGS Arguments provided !!!! See usage with '-h'"
fi

#Organisational details

while getopts ":c:d:sⓂ️p:rhx" atype
do
case $atype in
c )
        CFOUND=1
        cn="$OPTARG"
        ;;
d )
  yourdomain="$OPTARG"
  ;;
s )
  SFOUND=1
  subj="$OPTARG"
  ;;
p )
  password="$OPTARG"
  ;;
r )
  REMOVEPASSPHRASE='false'
  ;;
m )
  MFOUND=1
  ccemail="$OPTARG"
  ;;
x )
        XFOUND=1
  ;;
h )
        usage
        ;;
\? )
        usage
        ;;
: )
        fatal "Argument required !!! see \'-h\' for help"
        ;;
esac
done
shift $(($OPTIND - 1))

#### END CASE #### START MAIN ####

if [ $CFOUND -eq 1 ]
then
# take current dir as homedir by default.
checkperms ${homedir}
checkDomain

  if [[ ! -d ${workdir} ]]
  then
    mkdir ${workdir:-${cn#*.}} 2&gt;/dev/null &amp;&amp; info "${workdir} created."
  else
    info "${workdir} exists."
  fi # end workdir check
  parseSubject "$subj"
  genCSRfile
  if [ $XFOUND -eq 0 ]
  then
    sleep 2
    printCSR
  fi    # end x check
  if [[ $MFOUND -eq 1 ]]; then
    sendMail
  fi
else
        fatal "Nothing to do!"
fi      # end common name check

##### END MAIN #####
```

* * *

_This was originally published as the README in [ssl-on-demand's GitHub repository][4] and is reused with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/ssl-demand

作者：[Abhishek Tamrakar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tamrakar
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-password.jpg?itok=KJMdkKum (Lock)
[2]: https://opensource.com/alternatives/slack
[3]: https://opensource.com/article/19/1/what-certificate
[4]: https://github.com/abhiTamrakar/ssl-on-demand
[5]: https://en.wikipedia.org/wiki/Certificate_signing_request
[6]: mailto:myemail@mydomain.com
[7]: mailto:abhishek.tamrakar08@gmail.com
