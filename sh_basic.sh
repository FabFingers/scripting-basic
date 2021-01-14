#scripts execution
#!/bin/sh
#!/bin/bash
#!/usr/bin/bash

#-execution permission-#
chmod 555 script.sh	#everyone r/x
chmod +rx script.sh	#everyone r/x
chmod u+rx script.sh	#owner r/x

#-execution-#
./script.sh

#-shell-#
bash script.sh

#-line comments-#
#comment


#-multiline comment-#
:'	#bash only
comment
comment
'

#-variables-#
name=value	#scalar variable

#-valid variables-#
_NAME
name_name
name_NAME_1

#-invalid variable-#
2_NAMES
1_name

#-variable values-#
FRUIT=apple
FRUIT=2apples
FRUIT=apple+orange

#-invalid values-#
FRUIT=apple orange mango

#-valid space use-#
FRUIT="apple orange mango"
FRUIT='apple orange mango'

#-access variable value-#
echo $FRUIT

#-arrays-#
#array initialization
name[index]=value
#name = name of the array
#[index] = number of the value
#value

#or in bash
array=(element1 element2 element3....)

#also...
array=([0]=element0 [1]=element1 [2]=element2..n)

#-access array values-#
#{name[index]}
echo ${array[2]}

#access all items
echo ${array[*]}

#or...
echo ${array[@]}

#-read only variables-#
#setting a read only variable
variable=value
readonly variable

#unsetting a variable
unset variable #read only variables can't be unsetted

#creating an environmental variable
export variable

#-VARIABLE SUBSTITUTION-#

#replaces word with parameter if parameter is null/unset
${parameter:-word}

#if parameter is unset/null replace with word value
${parameter:=word}

#if parameter is null/unset print message to standard error
${parameter:?message}

#if parameter is set word is replaced by parameter
${parameter:+word}

#-replacing $HOST with the output of `uname -a`
PS1=${HOST:=`uname -a`}"$ " ; export PS1 HOST ;

#-showing a message if $HOME is not set
: ${HOME:?"Home not set."}

#COMMAND SUBSTITUTION#
#command substitution is used to assign the output of the command to a variable
DATE=`date`
USER=`who | wc -l`
UP=`date ; uptime`

#-assinging output of a command to grep
grep `id -un` /etc/passwd

#arithmetic substitution
foo=$((((5+3*2)-4)/2))

var=$(((3+3)*3)/3)

x=foo+var

#-quoting
#special characters need quoting
#special characters * ? [] ' " \ $ ; & () | ^ <> [newline] [space] [tab]
echo hey; bye! #error
echo hey\; bye! #correct

echo price is $1000 #error
echo price is \$1000 #error

echo 'price is $100'

echo 'it's friday\'
#special characters lose their effect within single quotes

#double quotes preserve it:
$ - parameter substitution
`` - command substitution
\$ - enable dollar signs
\` - enable backquotes
\" - enable double quotes
\\ - enable backslashes


#double line
echo 'Line 1
> Line 2'

#-
echo "Line 1\nLine 2"

#-
cp file1 file2 file3 \
	> file4 file5 /directory

#avoid globbing
rm 'file*'

#cpio

#standar variable export
#variable=value;export variable
$PATH=/usr/lib:/sbin;export PATH

#exporting multiple variables
export PID UID GID

#ksh & bash supported
export variable=value

#ksh & bash export multiple variable
export HOME=/home/user OTHERHOME=/home/users/user

#-SHELL VARIABLES-#
$PWD		#current working directory
$UID		#expands user ID
$SHLVL		#numbers the time bash is initialized
$REPLY		#expands last input of the 'read' command - not in sh
$RANDOM		#generates integer numbers between 0 & 32,767
$SECONDS	#returns seconds since shell invocation - not in sh
$IFS		#used to split lines - "\t\n "
$PATH		#search path for commands - /bin:/sbin:/usr/bin
$HOME		#home directory of current user

#SHELL SPECIAL VARIABLES
$0	#command being executed
$n	#command arguments ($1,$2,$3...$n)
$#	#number of arguments supplied to scripts
$*	#represents all arguments
$@	#all arguments supplied to script
$?	#exit status of the last command
$$	#script PID
$!	#process number of last background command


#arguments


#basename
#returns file or directory name
echo `basename $0`

#getopts
getopts f:o:v OPTION

#-FILE/FILE ATTRIBUTE MANIPULATION-#

#listing files
ls

#listing files in a specific directory
ls directory/directory/

#see if they are files or directories
ls -F directory/

#see files as a list
ls -l

#see hidden files
ls -a

#combined parameters
ls -aF

#-reading file contents-#
cat filename

#reading multiple files
cat file1 file2

#counting lines#
cat -n file

#eliminate blank lines#
cat -b file

#-counting words-#
#wc [options] file
wc .rhosts

#counting words in more than one file#
wc .rhosts .profile

#wc -l -counts line numbers
#wc -w -counts number of words
#-m & -c counts number of characters - not in linux

#-FILE MANIPULATION-#

#copying a file
cp file destination

#cp interactive mode
cp -i file copy_filename

#copying multiple files
cp file1 file2 file3 destination/

#-renaming files-#
#mv file destination
mv file newfilename

#interactive mode
mv -i file newfilename

#-removing files-#
rm file

#remove multiple files
rm file1 file2

#interactive mode
rm -i file1 file2

#-file globbing-#
command filename*	#matches all occurrences of any character

command filename?	#matches one occurrence of any chacracter

command [character_range]	#matches occurrence of any character

#-match any file with specific name but any extension
ls name*

#-matches files with any name and specific extension
ls *name

#-matches files with specific prefix and extension
ls name*extension

#-matches files with any prefix, character and extension
ls name*name*extension

#-matches files with any prefix, any character and extension
ls name?extension

#-matches files with any prefix, range of numbers and extension
ls name[0-9].extension

#-matches files with any prefix, letter range and extension
ls name[a-z].extension

#-matches files with specific prefix, letter-number range and extension
ls name[a-zA-Z0-9].extension

#-matches files avoiding a character set
ls [!a]*


#-DIRECTORY MANIPULATION-#
#filenames can't contain '/' in their name
#spaces in filenames are avoided

#current directory
pwd

#changing directories
cd directory

#can't change to multiple directories
cd /home /bin /sbin

#listing directory content
ls directory

#listing relative pathnames
ls ../../directory

#listing multiple directories
ls /home /bin /sbin

#creating directories
mkdir directory

#creating multiple directories
mkdir directory1 directory2 directory3

#copying directories
cp -r /home/user/dir /backup/directories

#moving files
mv sourcedirectory destinationdirectory

#moving directories
mv directory1 directory2

#moving multiple items
mv directory1/ file1 file2 directory2 destinationdirectory/

#removing directories
rmdir derectory/
#directories must be empty

#-
rm -r

#determine a file type
ls -l /dir/dir/file

#determine directory type
ls -ld /dir/dir/

#symbols

# '-' regular files
#l - symbolic link
#c - character special
#b - block special
#p - named pipe
#s - socket
#d - directory

#creating a symbolic links
ln -s source destination

#permissions - world read
chmod a=r *

#-
chmod guo=r *

#owner only write permission
chmod go-w file

#owner only file access
cd ; chmod go= *

#-
cd ; chmod go-rwx *

#grouping file permission with ','
chmod go-w,a+x file

#setting SUID & SGID bits to home/
cd ; chmod ug+s .

#changing permissions recursively
chmod -R o+r directory/

#octal permissions method
#world read access to all files in a directory
chmod 0444 *

#owner only write permission
chmod 0600 file

#-CHANGING OWNERS & GROUPS-#
#changing ownership
chown options user:group files

#recursion
chown -R user: /home/dir/dir/

#changing group ownership
chown :group /home/dir/dir/

chgrp group /home/dir/dir/file

#-PROCESSES-#
#move processes to the background
bg

#moving a process to the foreground
fg

#prevent a process from terminating
nohup

#waiting for a process to finish
wait %1

#listing processes
jobs

#-
ps

#additional ps options
ps -a
#all users

ps -x
#list processes without terminal

#killing a process
kill %1

#kill a process using its PID
kill 1111 #1111 is PID

#kill -9 is not regularly ignored
kill -9 1111

#replacing a process
exec bash #replace current shell to bash


#-FLOW CONTROL-#
#if statement
if lst1
then
	lst2
elif	lst3
then
	lst4
else
	lst5
fi

#one line
if lst1;then lst2;elif lst3;then lst4;else lst5;fi;

#-test-#
test option file
#
[ option file ]

#test+if
#testings if a directory exists
if [ -d /home/dir1/dir1_b ]; echo "exists!"
else
	echo "not found!"
fi

#executing commands
if [ -f $HOME/.script ]; then . $HOME/.script; fi

#-
if [ -s $HOME/.script ]; then . $HOME/.script; fi

#TEST OUTOUTS TRUE IF
# -b file exists & block special
# -c file exists & character special
# -d file exists & directory
# -e file exists
# -f file exists & regular file
# -g file exists & has SGID bit set
# -h file exists & symbolic link
# -k file exists & sticky bit set
# -p file exists & named pipe
# -r file exists & readable
# -s file exists & size greater than 0
# -u file exists & has SUID bit set
# -W file exists & writable
# -X file exists & executable
# -O file exists & owned by user ID


#comparing strings
#[ -z string ]
if [ -z "$STRING" ]; then

#-
if [ -n "$STRING" ]; then

#-
if [ "$STRING" = string ]; then

#not equal
if [ "$STRING" != string ]; then

#numerical comparison
#[ int operator int ]
if [ $? -eq 0 ]; then

#-
if [ $? -ne 0 ]; then
	command --
	exit
fi
command

#operators
# -eq true if equal
# -ne true if not equal
# -lt true if less than
# -le true if less or equal
# -gt true if greater than
# -ge true if greater or equal

#compound expression
#- test expr1 operator expr2
#- [ expr1 operator expr2 ]
if [ -z "$DTHOME" ] && [ -d /usr/dt ]; then DTHOME=/usr/dt; fi
#-
if [ -z "$DTHOME" -a -d /usr/dt ]; then DTHOME=/usr/dt; fi

#negating an expression
#test ! expr
#[ ! expr ]
if [ ! -d $HOME/bin ]; then mkdir $HOME/bin; fi

#case stament
#case word in
#patter1)
#	lst1
#	;;
#patter2)
#	lst2
#	;;
#esac

FRUIT=apple
case "$FRUIT" in
	mango) echo "Mango!" ;;
	banana) echo "Banana!" ;;
	kiwi) echo "Kiwi!" ;;
esac

#-
if [ "$FRUIT" = apple ]; then
	echo "Apple!"
elif [ "$FRUIT" = banana ]; then
	echo "Banana!"
elif [ "$FRUIT" = "kiwi!" ]; then
	echo "Kiwi!"
fi
#-----------------#

#case w/pattern
case "$TERM" in
	*term)
		TERM=xterm ;;
	network|dialup|unknown|vt[0-9][0-9][0-9])
		TERM=vt100 ;;
esac


#LOOPS#
#while command
#do
#list
#done
x=0
while [ $x -lt 10 ]
do
	echo $x
	x=`echo "$x + 1" | bc`
done
#nesting
#while command1
#do lst1
#	while command2
#	do
#		lst2
#	done
#	lst3
#done
x=0
while [ "$x" -lt 10 ];
do
	y="$x"
	while [ "$y" -ge 0 ];
	do
		echo "$y \c"
		y=`echo "$y - 1" | bc`
	done
	echo
	x=`echo "$x + 1" | bc`
done


#reading input
ANS=
while [ -z "$ANS" ];
do
	echo "Enter answer: "
	read ANS
	if [ ! -d "$ANS" ]; then
		echo "Error!"
		ANS=
	fi
done
#----------------------#
#until loop
#until command
#do
#	list
#done
x=1;
until [ $x -ge 10 ]
do
	echo $x
	x=`echo "$x + 1" | bc`
done

#for loop
#for name in word1 word2...wordn
#do
#list
#done
for i in 0 1 2 3 4 5
do
	echo $i
done


#-copy files from a directory to another
#and change permissions
for FILE in $HOME/.bash*
do
	cp $FILE ${HOME}/public_html
	chmod a+r ${HOME}/public_html/${FILE}
done

#selection loop
select var in word1 word2 ... wordN
do
	list
done

#-selection loop sample
select COMP in comp1 comp2 all none
do
	case $COMP in
		comp1|comp2) CompConf $COMP;;
		all) CompConf comp1
			CompConf comp2
			;;
		none) break;;
		*) echo "Error! $REPPLY";;
	esac
done

#infinite loops

while :
do 
	lst
done

#---
while :
do
	read CMD
	case $CMD in
		[qQ] | [qQ] [uU] [iI] [tT]) break;;
		*) process $CMD ;;
	esac
done

#breaking nested loops
for i in 1 2 3 4 5
do
	mkdir -p /nmt/backup/docs/ch0${i}
	if [ $? -eq 0 ]; then
		for j in doc c h m pl sh
		do
			cp $HOME/docs/ch0{i}/*.${j} /mnt/backup/docs/ch0${i}
			if [ $? -ne 0 ]; then break 2; fi
		done
	else
			echo "Couldn't make it!"
		fi
	done

#continue command
for FILE in $FILES;
do
	if [ ! -f "$FILE" ]; then
		echo "Error!"
		continue
	fi
done


#-I/O-#
#output - '-en' is needed
\n	#prints newline
\t	#prints tab
\c	#prints string w/o trailing newline

#\n
echo "Expanded var output is:\n$VARIABLE"

#\t
echo "Name\t\tUser Name\nJohn\tJhn\nLouis\tLu"

#echoing vars
echo $VAR

#printf
#printf format arguments
printf "Hi!\n"

#%[-]m.nx
#'%' = formatting sequence
#'-' = left justify
#'x' = formatting sequence type
#'m' & 'n' depend on 'x', must be integers

printf "%32s "		#formatting a string (s) w/ value 32, right justified
printf "%-32s "		#formatting a string (s) w/ value 32, left justified


#format sequences type
#s 	string
#c	char
#d	decimal
#x	hexadecimal
#o 	octal
#e	exponential floating-point number
#f	fixed floating-point number
#g	compact floating-point number


#output redirection
#prepending
command > file
{command; command; command;} > file
#-
who > user.txt
{who; date; uptime;} > info.txt

#appending
command >> file
{command; command; command;} >> file
#-
who >> user.txt
{who; date; uptime;} >> info.txt

#screen-file redirection
command | tee file

#input redirection
command < file

#user input
read variable
#-
ANS=yes
printf "Do you want to play?"
read ANS

#pipelines
command | command2 | command3 | ...

#-
tail -f /var/adm/messages | less
ps -ael | grep "$UID" | less

#file descriptors
#standard input (STDIN) = 0
#standard output (STDOUT) = 1
#standard error (STDERR) = 2

#file descriptor association
exec n>file #n = file descriptor number
exec n>>file

#-
exec 4>fdes4.out

#reading associated file
exec 4<fdes4.out

#command output/file descriptor redirection
command n> file
command n>> file

command 1> file #redirects standard output

#redirecting STDOUT & STDERR
command 1>file1 2>file2

#appending/prepending STDOUT & STDERR
command >>file1 2>file2
#-
command >file1 2>>file2

#-
for FILE in $FILES
do
	ln -s $FILE ./docs >> /tmp/ln.log 2> /dev/null
done

#same file redirection
command > file 2>&1
list > file 2>&1

command >> file 2>&1
list >> file 2>&1

#redirecting STDOUT & STDERR to the same file
n>&m #n & m = integers
# if 'm' is a hyphen file for 'n' is closed = r/w error

#reading files
while read LINE
do
	:
done < file

#preserving '$i' value
exec n<&0 < file
while read LINE
do
	:
done
exec 0<&n n<&-	#'n' = greater than 2 integer


#-FUNCTIONS!-#
#name(){list ;}

#call_ls() { ls -l ; } #valid
#call_ls { ls -l ; } #invalid

#listing directories
lspath() {
	OLDIFS="$IFS"
	IFS=:
	for DIR in $PATH ; do echo $DIR ; done
	IFS="$OLDIFS"
}


#tailoring $PATH
SetPath() {
	for _DIR in "$@"
	do
		if [ -d "$_DIR" ] ; then PATH="$PATH":"$_DIR" ; fi
	done
	export PATH
	unset _DIR
}


#-
dirs() {
	OLDIFS="$IFS"
	IFS=:
	for i in $DIR_STACK
	do
		echo "$i \c"
	done
	echo
	IFS="$OLDIFS"
}

#implementing PUSHD
push() {
	REQ="$1";
	if [ z- "$REQ" ] ; then REQ=. ; fi

	if [ -d "$REQ" ] ; then
		cd "$REQ" > /dev/null 2>&1
		if [ $? -eq 0 ] ; then
			DIR_STACK="`pwd`:$DIR_STACK" ; export DIR_STACK ;
			dirs
		else
			echo "ERROR! $REQ." >&2
		fi
	else
		echo "ERROR! $REQ" >&2
	fi
	unset REQ
}


#wrapper function
popd() {
	OLDIFS="$IFS"
	IFS=:
	popd_hlp $DIR_STACK
	IFS="$OLDIFS"
}


#-TEXT FILTERING-#

#head/tails

#command + head pipe
ls -lut ~/dir/dir/file.txt | head -5

#command + tail pipe
ls -lut ~/dir/dir/file.txt | tail -5

#'tails -f' follows live changes made to files

#grep
#grep word file
#grep displays all lines containing a word
grep word file.txt

#multiple files
grep word file1.txt file2.txt

#differs from capitalized letter -> WORD =/= word
grep WORD file.txt

#
grep word file.txt

#print "word" ignoring capitalization 'grep -i'
grep -i word file.txt

#reading STDIN
#command | grep word
ps -ef | grep word

#print line number with "word"
grep -n word file.txt

#listing filenames only
grep -l word * #'*' all files

#wc
#wc counts words

#tr - replaces words
#replacing words in set1 with words in set2
tr 'set1' 'set2'

#-
tr '!?":;\[\]{}(),.\t\n' ' ' < ~/dir/dir/file.txt | tr 'A-Z' 'a-z'

#replace second occurrence of a given character
echo "ccoommmaanndd" | tr -s 'comand'

#sort
#sorts output
tr '!?":;\[\]{}(),.\t\n' ' ' < ~/dir/file.txt | tr 'A-Z' 'a-z' | tr -s ' ' | tr ' ' '\n' | sort

#uniq
#outputs unique occurrences of words
echo '
pe
pe
pe
ap
ap
ap
or
'
>./words.txt
uniq words.txt
#outputs
pe
ap
or
#------#
#character classes understood by 'tr'
#alnum: letter/digit
#alpha: letters
#blank: horizontal space
#cntrl: control chars
#digit: digits
#graph: printable chars - not spaces
#lower: lowercase letters
#punct: punctuation
#space: horizonta/vertical space
#upper: uppercase letters
#xdigit: hex. digits
#------#
tr '[:classname"]' 'set2'

tr '[:punct:]' ' ' < ~/dir/dir/file.txt | tr '[:space:]' ' ' | tr 'A-Z' 'a-z' | tr -s ' ' | tr ' ' '\n' | sort | uniq -c | sort -rn | head

#text filtering w/ regex
#AWK/SED => basics
command 'script' filenames
#/pattern/ action

#METACHARACTERS used for matching#

. => any single character
* => zero/more occurrences
[chars] => any sting given/range of charcters w/ '-'/if '^' is included one character is matched
$ => end of a line
\ => treats characte that follows literally
##################################

#CHARACTER SETS

[a-z] => single lowercase letter
[A-Z] => single uppercase letter
[a-zA-Z] => single letter
[0-9] => single number
[a-zA-Z0-9] => single letter or number
#################################

/[^T]/ -> all strings except ones with 'T'
/ch[^0-9]/ -> all strings with 'ch' except ones with numbers
/ch0[0-9]*txt/ -> all strings beginning with 'ch0' ending w/txt
/^the / -> all lines with 'the '
/mango$/ -> all lines ending with 'mango'
/^Mango [1-9]*[0-9]$/ -> all lines beginning with 'Mango' ending w/ number ranged 1 to 9

#################################
#####escaping metacharacters#####
#################################

/\$[0-9]*\.[0-9\/[a-zA-Z]*/ -> escapes '$', '.' and '/'
/^$/ -> blank lines
/^.*$/ -> entire line
/ */ -> spaces
/<[^>] [^>]*>/ -> HTML/XML tags
/[a-zA-Z] [a-zA-Z]*:\/\/[a-zA-Z0-9] [a-zA-Z0-9\.]*.*/ -> valid URL
/\$[0-9]*\.[0-9]/ -> dollar sign amounts


#-SED-#

sed 'script' files
#script = /pattern/ action
#action = 'p' -> prints the line/'d' -> deletes the line/'s' -> replace a patter w/ another

#delete mango line
sed '/^[Mm]ando/d' fruits.txt

#substitution
#s/pattern/pattern2/
sed 's/Paech/Peach/' fruits.txt

#global substitution
sed 's/Paech/Peach/g' fruits.txt

#sed w/pipe
#id
#uid=500(user) gid=100(users)
id | sed 's/(.*$//'
#output -> uid=500
id | sed -e 's/(.*$//' -e 's/^uid=//'
#output -> 500

#-AWK-#
awk 'script' files
#files = list of files
#script = /pattern/ { action ; }

#printing specific fields
awk '{ print $1  $3 ; }' fruits.txt	#prints field 1 & 3

awk '{ print $1 , $3 ; }' fruits.txt	#prints space between fields

awk '{ printf "%-15s %s\n" , $1 , $3 ; }' fruits.txt	#formatting output with 'printf'

#comparison operators
#<			less than
#>			greater than
#<=			less than or equal
#>=			greater than or equal
#==			equal to
#!=			not equal
#value ~ / pattern/	true if value/pattern matched
#value !~ / pattern/	true if value/value not matched

#compound expressions
#(express) && (express)		#both expr. true = true
#(express) || (express)		#one expr. true = true

#'next' tells awk to skip patterns & expressions
awk '
	$3 <= 75 { printf "%s\t%s\n",$0,"REORDER" ; next ; }
	$3 > 75 { print $0 ; }
	' fruits.txt ;

#STDIN as input
ls -l | awk '$1 !~ /total/ { printf "%-32s %s\n",$9,$5 ; }'	#prints field '9' & '5'

#-features-#
#variables
var="fruit"	#string value
fruit=100	#numeric value

#assign variable value to variable
fruit=peach
fruity=fruit

#field number as variable value
fruit=$1	#variable value is 'field 1'

#numeric operators
#+		add
#-		substract
#*		multiply
#/		divide
#%		modulo
#^		exponentiation

if [ -f $i ] ; then
	echo $i
	awk ' /^ *$/ { x=x+1 ; print x ; }' $i	#'x' increments 1
else
	echo "ERROR!" >&2
fi

#assignment operators
#+=	add
#-=	subtract
#*=	multiply
#/=	divide
#%=	modulo
#^=	exponentiation

#BEGIN/END patterns
awk '
	BEGIN { actions }
	/pattern/ { actions }
	/pattern/ { actions }
	END { actions }
	' files
#Built-in variables
#FILENAME	current input file
#NR		current input line/record input file number
#NF		current line records number of fields
#OFS		output field separator (default space)
#FS		input field separator (space/tab default)
#ORS		output record separator (default newline)
#RS		input record separator (default newline)

#reset input field separator (FS)
awk 'BEGIN { FS=":" ; }'	#resetting 'FS' to ':'

awk -F: '{ ... }'		#using '-F'

#'-F' allows shell variable use
MYFS=: ; export MYFS ; awk -F${MYFS} '{ ... }'

awk 'BEGIN { FS=":" ; } { print $1,$6 ; }' /etc/passwd
#prints field 1 & 6 from /etc/passwd

awk -F: '{ print $1,$6 ; }' /etc/passwd	#does the same
#------------

#-AWK shell variables
#awk 'script' avar=value bvar=value cvar..... files


#FLOW CONTROL#

#-if-#
#awk '{
#if (express1)	{
#	action1
#} else if (express2) {
#	action2
#} else {
#	action3
#}
#}' file ;

#-while-#
#awk '{
#	while (express) {
#	action
#	}
#}' file
awk 'BEGIN{ x=0 ; while (x < 5) { x+=1 ; print x ; } } '

#-do-#
#awk '{
#	do {
#		action
#	} while (expression)
#}' file
awk 'BEGIN { 'BEGIN{ x=0 ; do { x+=1 ; print x ; } while (x < 5) }' '#

#-for-#
#awk '{
#	for (counter; test_counter; increment_counter) {
#	action
#	}
#}' file
awk '{
	for (x=1;x<=NF;x+=1) {
		printf "%s ",$x ;
	}
}' file.txt
#-------#
##TOOLS##
#-------#

#eval
#expands strings as variables

eval $"mango"

OUTPUT="> out.file"
eval echo hello $OUTPUT						#eval $OUTPUT into '> out.file'

c1="echo"; c2="Hello, "; c3="world!"; eval $c1 $c2 $c3		#evals c1,c2,c3 into 'echo Hello, world!"

#--------
f="> greet.txt"
c1="echo"
c2="Hello, "
c3="world!"

eval $c1 $c2 $c3 $f	#'echo Hello, world! > greet.txt'
#---------

#':'
#NOP/NO-OP/No operation/always returns successful execution
while :
do
	echo "Give input: \c"
	read INPUT
	[ "$INPUT"=stop ] && break
done


#type
#outputs pathname of a command
type vi		#output = vi is /usr/bin/vi

#sleep
#pauses for a number of given seconds
sleep 60	#pauses for a minute

#using sleep to repeat every minute
while :
do
	date
	who
	sleep 60
done >> logfile.txt
#-----

#find
#find dir options actions
find /dir/dir/file -name filename -type f -print -exec lp {} \;
#/dir/dir/	->	starting directories
#-name filename ->	name of the file being searched
#-type f	->	type pf files being searched (f=normal files)
#-print		->	display pathname of files matching criteria
#-exec lp {} \;	->	tells 'find' to execute the command 'lp' on the files

find ./dir/dir -name filename -print	#prints relative pathnames

find / -name '*log*' -print		#using 'wildcards'
#*,?,[chars],[!chars] all wilcards can be used

find / -type d -print			#using -type to specify a file type
#file types available
#f	regular file
#d	directory
#b	block special device
#c	character special device
#l	symbolic link
#p	named pipe

find / -mtime -5 -print			#-mtime enables printing of files modified in a time period
#finding files modified less than five days ago
#-mtime option
#+n		find only files modified more than 'n' days ago
#n		find only files modified exactly 'n' days ago
#-n		find only files modified less than 'n' days ago

find / -mtime +90 -print

#date checking options
#-mtime		modified time
#-atime		access time
#-ctime		inode changes

find / -size +2000 -print
#-size checking:
#+n	more than
#n	exact
#-n	less than

find / -name log -size +50 -mtime -3 -print
#find all files named log bigger than 50 modified less than three days ago

find / \( -size +50 -o -mtime -3 \) -print	#'-o' logical 'or'

#rejecting options
find /dev ! \( -type b -o -type c -o type d \) -print		#'!' is used to reject the effect of the options inside '\( \)'

#-exec action
#'-exec' executes a given command
find / -name filename -exec chmod a+r {} \;			#changes permissions to "a+r"

find / -name filename -exec rm -f {} \;				#removes all files named "filename" by force

#xargs
#gives a list of words as arguments to a command
cat filelist | xargs rm		#giving 'rm' a list of files to remove

cat filelist | xargs -n 10 rm	#limiting the number of aeguments to 10

#bc
#performs arithmetic operations - not limited to integers
AVRG=`echo "weight=4; $PRICE/$UNIT" | bc`


#expr
#performs integer arithmetic operations
expr 9 / 3

expr 5 \* 3

CNT=`expr $CNT + 1`	#incrementing variable value

expr $ABC : '.*'	#counting all characters contained by '$ABC'

expr $ABC : '[0-9]*'	#counting all digits contained in '$ABC'

expr abcdef : '..\(..\)..'	#outputs 'cd', every period represents a character


#OPERANDS#
#+	addition
#-	substraction
#\*	multiplication
#/	division


##############SIGNALS##################

#SIGHUP	[1]	hang up/controlling process death
#SIGINT	[2]	interrupted
#SIGQUIT[3]	quit w/ keyboard
#SIGKILL[9]	kill
#SIGALRM[14]	alarm clock
#SIGTERM[15]	termination

#-KILL-#
#kill + pid[process id]
#kill -s SIGTERM pid
kill -s SIGHUP 1001		#kill process w/ pid 1001

kill -1 1001			#signal numeric value

kill -s SIGQUIT 1001		#sends "quit" signal

kill -9 1001			#sends "kill" signal

#TRAP#
#trap sets/unsets actions when a signal is received
trap "rm -f $TMPF; exit 2" 1 2 3 15	#exits with error if signals '1,2,3 or 15' are received

#"trap" calls 'function' if signal 1,2,3 or 15 are received
function() {
	if [ -f "$OUTFILE" ]; then
		printf "Cleaning!..";
		rm -f "OUTFILE" 2> /dev/null ;
		echo "Done!" ;
	fi
}
trap function 1 2 3 15

#ignoring signals
#trap '' signals
#trap : signals
trap '' 1 2 3 15

#including external scripts
. $HOME/lib/sh/script.sh

#touch
touch -t date filename
touch -at date filename
touch -mt date filename

#show window with height=140 x widht=140 and(+) position '6+8 
xmessage "Hello" -geometry 140x140+6+8

#change background (bg) and goreground (fg) colors
bg blue
fg red

#double line texts using \n
echo -e "Hello,\nThis is\na multiple lines\nmessage" | xmessage -file 

#uuencode/uudecode
uuencode myfile myfile.tar.gz > myuuencoded_file.tar.gz

uuencode myfile.txt > myuuencoded_file.txt

tr #replace text/characters
stat #check general file information [size, GID, name, permissions,...]

#erase file content
cat /dev/null > file.txt
