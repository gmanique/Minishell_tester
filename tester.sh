#!/bin/bash

declare -a TESTS_PWD=(
	'pwd'
	'pwd asd'
	'               pwd'
)

declare -a TESTS_ENV=(
	'env'
	'export TEST=Salut && env'
	'envvvvv'
)


declare -a TESTS_ECHO=(
	'echo "Salut"'
	"echo \$USER"
	"echo \"'aaa'\""
	"echo '\"aaa\"'"
	"echo '\$USER'"
	"echo \"'\$USER'\""
	"echo '\"\$USER\"'"
	"echo -n -nnnnnn \$USER"
	'echo "-n" Hola'
	'echo           Hola'
	'echo "         "'
	"\"\"''echo hola\"\"'''' que\"\"'' tal\"\"''"
	'echo-nHola'
	'echo -n -nnnnnnn -n-'
	'echo -n -nnnnnn hola -n'
	'echo'
	'echo -n'
	'echoHola'
	'EechoO aaa'
	'echo        Hola -n'
	'echo        '
	"echo \$?"
	"echo \$?$"
	'echo $:$= '
	'echo a > /dev/null'
	"echo The terminal is \$TERM"
	"echo The terminal is [\$TERM]"
	"echo The terminal is [\$TERM4"
	"echo \$? | echo \$? | echo \$?"
	"echo ' $ '"
	'echo " $ "'
	"echo \$HOME"
	"echo \$HOME9"
	"echo \$9HOME"
	"echo \$HOME%"
	"echo \$USER\$HOME"
	"echo HOME=\$HOME"
	"echo \$USER\$var\$USER\$USER\$USERtest\$USER"
	"echo \$hola*"
	"echo -nnnnn \$hola"
	'echo > <'
	'echo | |'
	'>echo>'
	'<echo<'
	'>>echo>>'
	'|echo|'
	'|echo -n hola'
	"echo '\$'''"
	"echo \"\$\"\"\""
	"echo \"\$HO\"me"
	"echo \"'\$HO''ME'\""
	"echo \$\"HO\"\"ME\""
	"echo '' \$HOME"
	"echo \$DONTEXIST hola"
	"echo \"hola\""
	"echo ''hola''"
	"echo hola\"\"\"\"\"\"\"\"\"\"\"\""
	"echo hola\"''''''''''\""
	'echo ""          hola'
	'echo ""hola'
	'echo "" hola'
	"\"e\"'c'ho 'b'\"o\"nj\"o\"'u'r"
)

declare -a TESTS_CD=(
	'cd && pwd'
	"cd \$OLDPWD && pwd"
	'cd not_exist_file'
	"cd ''"
	'cd .. && ls -l'
)

declare -a TESTS_EXPORT=(
	'export TEST=a && export'
	'export            TEST=a && export'
	'export          TEST=a         TEST2=Yooooooo && export'
	'export'
	'export abc && export'
	'export 1=1 && export'
	'export TEST= && export'
	'export TEST=*.c && cd src/ && echo *.c'
	'export "" && export'
	'export Hola && export'
	'export "" && export'
	'export $? && export'
	'export ?=2 && export'
	'export ___HOLA=Bonjour && export'
	'export ABC@=a && export'
	'export HOLA-=Bonjour && export'
	'export HOL}A=Bonjour && export'
	'export HOL.A=Bonjour && export'
	'export | grep HOME'
	# "export HOLA=\"bonjour      \" && echo \$HOLA | cat -e"
	# "export HOLA=\"   -n bonjour\" && echo \$HOLA"
	# "export HOLA=\"cat Makefile | grep NAME\" && echo \$HOLA"
)

declare -a TESTS_EXIT=(
	'exit | ls'
	'exit 10'
	'exit 500'
	'exit abc'
)

declare -a TESTS_UNSET=(
	'unset'
	'unset PATH && ls'
	'unset HOME && pwd'
	'unset DOES_NOT_EXIST'
)

declare -a TESTS_BUILTINS=("${TESTS_PWD[@]}" "${TESTS_ENV[@]}" "${TESTS_ECHO[@]}" "${TESTS_CD[@]}" "${TESTS_EXPORT[@]}" "${TESTS_EXIT[@]}" "${TESTS_UNSET[@]}")

declare -a TESTS_JOIN=(
	':'
	'!'
	'>'
	'<'
	'>>'
	'<<'
	'<>'
	'&&'
	'||'
	'|'
	'|&'
	'&|'
	'&&&&&&'
	'||||||||'
	'>>>>>'
	'>>>>>>>>>>>>>'
	'<<<<<'
	'> > > >'
	'>> >> >> >>'
	'>>>> >> >> >>'
	'/'
	'//'
	'/.'
	'/./../../../../..'
	'///////'
	"\\\\"
	"\\\\\\\\\\"
	"\\\\\\\\\\\\\\\\"
	'-'
	'|'
	'| hola'
	'| | |'
	'||'
	'|||||'
	'|||||||||||||'
	'>>|><'
	'&&'
	'&&&&&'
	'&&&&&&&&&&&&&&'
	';;'
	';;;;;'
	';;;;;;;;;;;;;;;'
	'()'
	'('
	')'
	'( ( ) )'
	"\$?"
	"\$?\$?"
	"?\$HOME"
	"\$"
	"\$HOME"
	"\$HOMEdskjhfkdshfsd"
	"\"\$HOMEdskjhfkdshfsd\""
	"'\$HOMEdskjhfkdshfsd'"
	"\$DONTEXIST"
	"\$LESS\$VAR"
)

declare -a TESTS_WILDCARD=(
	'*'
	'cat *.c'
	'echo *'
	"echo '*'"
	"export TEST=* && echo \$TEST"
	'ls *'
	'ls -U *'
	'touch New_file_that_didnt_exist && echo New_fi*dn*st'
	'echo hola*hola *'
	'mkdir test/ && cd test/ && echo *'
	'mkdir test/ && cd test/ && *'
)

declare -a TESTS_OTHER=(
	'ls'
	'ls | sjdkof'
	'ls||pwd'
	'ls | pwd'
	'ls -kjasdf'
	'ls|grep a'
	'ls | pwd | jkdfs'
	'jkdfs | sleep 1'
	'sleep 1 | jkdfs'
	''
	'       '
	'hola'
	'hola que tal'
	'dsf && echo No'
	'true && echo Yes'
	'Makefile'
	'make'
	'((ls | grep a) | (grep h | grep j)) | ls'
	'((echo "salut"&& jksla )&& (klsdf || jksldff))'
	'((echo "salut" && jksla ) && (klsdf || jksldff))'
	'((echo Salut || ls && pwd) && echo "Reussite") || echo "Echec"'
	'false && (echo "A" || echo "B")'
	'(false && echo "A") || echo "B"'
	'echo abc > test.txt && cat test.txt'
	'echo abc > test.txt && cat < test.txt'
	'echo aaa > test.txt && echo abcdef >> test.txt && cat test.txt'
)

reset_files()
{
	rm -rf .test1/ .test2/ .test3/
	mkdir .test1/ .test2/ .test3/
	cp -rf save/* .test1/
	cp -rf save/* .test2/
	cp -rf save/* .test3/
}

valgrind_flags=(valgrind --leak-check=full --track-fds=yes --trace-children=yes --show-leak-kinds=all --errors-for-leak-kinds=all --suppressions=../../readline.supp)



valgrind_test()
{
	out=$(cd .test2 && echo "$1" | "${valgrind_flags[@]}" ./minishell 2>&1)
	output=$(echo "$out" | grep -c "ERROR SUMMARY: ")
	output2=$(echo "$out" | grep -c "ERROR SUMMARY: 0 errors")
	#echo "output : $output, output2 : $output2"
	if [[ "$output" == "$output2" ]]; then
		echo -en "\e[32m[VOK] \e[0m"
	else
		echo -en "\e[31m[VKO] \e[0m"
	fi
	# if echo "$output" | grep -q "ERROR SUMMARY: 0 errors";then
	# 	echo -en "\e[32m[VOK] \e[0m"
	# else
	# 	echo -en "\e[31m[VKO] \e[0m"
	# 	echo -e "$1\n\n" >> logs/log_valgrind.txt
	# 	echo -e "$output\n\n\n" >> logs/log_valgrind.txt
	# fi
}

normalize_output()
{
	if [[ "$1" == *"export"* || "$1" == *"env"* ]]; then
		sed -E 's/^bash: //; s/^bash: -c: line [0-9]+: //; s/^minishell: //; s/^Minishell: //' | sed 's/test1/test2/g' | grep -Ev "PWD|SHLVL|SHELL|SECONDS|_=|DBUS_SESSION_BUS_ADDRESS|LS_COLORS|XMODIFIERS" | sort | grep -v '^bash-5\.1\$' | sed 's/bash-5\.1\$.*//'
	else
		sed -E 's/^bash: //; s/^bash: -c: line [0-9]+: //; s/^minishell: //; s/^Minishell: //' | sed 's/test1/test2/g' | grep -v '^bash-5\.1\$' | sed 's/bash-5\.1\$.*//'
	fi
}

# launch_test()
# {
# 	cd .test3 || exit
# 	timeout 5s echo "$1" | ./minishell "$1" 2>&1 | normalize_output > /dev/null
# 	ret_timeout=${PIPESTATUS[0]}
# 	cd .. || exit
# 	if [ "$ret_timeout" -eq 124 ]; then
# 	    echo -e "\e[33m[TIMEOUT]\e[0m  $1"
# 	    return 124 # Sort de la fonction, donc passe au test suivant si dans une boucle
# 	fi
# 	# if diff <(bash --posix -c "$1" 2>&1 | normalize_output) <(./minishell "$1" 2>&1 | normalize_output) > /dev/null; then
# 	# if diff <(cd .test1 && bash --posix -c "$1" 2>&1 | normalize_output "$1") <(cd .test2 && timeout 5s ./minishell "$1" 2>&1 | normalize_output "$1") > /dev/null; then
# 	if diff <(cd .test1 && echo "$1" | bash --posix 2>&1 | normalize_output "$1") <(cd .test2 && timeout 5s echo "$1" | ./minishell 2>&1 | normalize_output "$1") > /dev/null; then
# 		echo -en "\e[32m[OK] \e[0m"
# 	else
# 		echo -en "\e[31m[KO] \e[0m"
# 		reset_files
# 		{
# 			echo "===== TEST : [$1] =====";
# 			echo "";
# 			echo "-----";
# 			(cd .test2 && echo "$1" | ./minishell 2>&1 | normalize_output "$1") 2>&1 | cat -e; 
# 			echo "-----";
# 			echo "";
# 			echo "";
# 		} >> logs/log_minishell.txt

# 		{
# 			echo "===== TEST : [$1] =====";
# 			echo "";
# 			echo "-----";
# 			(cd .test1 && echo "$1" | bash --posix 2>&1 | normalize_output "$1") | cat -e;
# 			echo "-----";
# 			echo "";
# 			echo "";
# 		} >> logs/log_bash.txt
# 	fi
# 	reset_files
# }

launch_test()
{
	cd .test3 || exit
	timeout 5s echo "$1" | ./minishell "$1" 2>&1 | normalize_output > /dev/null
	ret_timeout=${PIPESTATUS[0]}
	cd .. || exit
	if [ "$ret_timeout" -eq 124 ]; then
	    echo -e "\e[33m[TIMEOUT]\e[0m  $1"
	    return 124 # Sort de la fonction, donc passe au test suivant si dans une boucle
	fi

	# BASH_OUTPUT=$(cd .test1 && echo "$1" | bash --posix 2>&1 | normalize_output "$1")
	# BASH_OUTPUT=$(cd .test1 && echo "$1" | bash --posix -i 2>&1 </dev/null | normalize_output "$1")\
	BASH_OUTPUT=$(cd .test1 && bash --posix -i <<< "$1" 2>&1 | normalize_output "$1")
	MINISHELL_OUTPUT=$(cd .test2 && timeout 5s echo "$1" | ./minishell 2>&1 | normalize_output "$1")

	if diff <(echo "$BASH_OUTPUT") <(echo "$MINISHELL_OUTPUT") >/dev/null;then
		echo -en "\e[32m[OK] \e[0m"
	else
		echo -en "\e[31m[KO] \e[0m"
		reset_files
		{
			echo "===== TEST : [$1] =====";
			echo "";
			echo "-----";
			echo "$MINISHELL_OUTPUT" | cat -e;
			echo "-----";
			echo "";
			echo "";
		} >> logs/log_minishell.txt
		{
			echo "===== TEST : [$1] =====";
			echo "";
			echo "-----";
			echo "$BASH_OUTPUT" | cat -e;
			echo "-----";
			echo "";
			echo "";
		} >> logs/log_bash.txt
	fi
	reset_files
}


check_exit()
{
	(cd .test1 && echo "$1" | bash --posix) > /dev/null 2>&1
	BASH_STATUS=$?

	(cd .test2 && echo "$1" | ./minishell > /dev/null 2>&1 ) > /dev/null 2>&1
	MINISHELL_STATUS=$?


	if [ "$BASH_STATUS" -eq "$MINISHELL_STATUS" ]; then
		echo -en "\e[32m[EOK] \e[0m"
	else
		echo -en "\e[31m[EKO] \e[0m"
		{
			echo 'Command :';
			echo "[ $1 ]";
			echo "Exit Status :";
			echo "Bash : $BASH_STATUS";
			echo "Minishell : $MINISHELL_STATUS";
			echo "";
			echo "";
			echo "";
		} >> logs/log_exit_status.txt
	fi
}

do_other_tests()
{
	echo -e "\n\n\e[1;33m===== TESTS OTHER =====\n\n\e[0m "
	for test in "${TESTS_OTHER[@]}";
	do
		launch_test "$test"
		ret=$?
		if [[ $ret -ne 124 ]]; then
			if [[ "$1" == "--hide-fatal-error=yes" || "$2" == "--hide-fatal-error=yes" || "$3" == "--hide-fatal-error=yes" ]]; then
				check_exit "$test" 2> /dev/null
			else
				check_exit "$test"
			fi
			if [[ "$1" == "valgrind" || "$2" == "valgrind" || "$3" == "valgrind" ]]; then
				valgrind_test "$test"
			else
				sleep 0.15
			fi
			echo -e "$test"
		fi
		
	done
}

do_builtins_tests()
{
	echo -e "\n\n\e[1;33m===== TESTS BUILTINS =====\n\n\e[0m "
	for test in "${TESTS_BUILTINS[@]}";
	do
		launch_test "$test"
		ret=$?
		if [[ $ret -ne 124 ]]; then
			if [[ "$1" == "--hide-fatal-error=yes" || "$2" == "--hide-fatal-error=yes" || "$3" == "--hide-fatal-error=yes" ]]; then
				check_exit "$test" 2> /dev/null
			else
				check_exit "$test"
			fi
			if [[ "$1" == "valgrind" || "$2" == "valgrind" || "$3" == "valgrind" ]]; then
				valgrind_test "$test"
			else
				sleep 0.15
			fi
			echo -e "$test"
		fi
	done
}

do_wildcard_tests()
{
	echo -e "\n\n\e[1;33m===== TESTS WILDCARD =====\n\n\e[0m "
	for test in "${TESTS_WILDCARD[@]}";
	do
		launch_test "$test"
		ret=$?
		if [[ $ret -ne 124 ]]; then
			if [[ "$1" == "--hide-fatal-error=yes" || "$2" == "--hide-fatal-error=yes" || "$3" == "--hide-fatal-error=yes" ]]; then
				check_exit "$test" 2> /dev/null
			else
				check_exit "$test"
			fi
			if [[ "$1" == "valgrind" || "$2" == "valgrind" || "$3" == "valgrind" ]]; then
				valgrind_test "$test"
			else
				sleep 0.15
			fi
			echo -e "$test"
		fi
	done
}

do_join_tests()
{
	echo -e "\n\n\e[1;33m===== TESTS TOKENS =====\n\n\e[0m "
	for test in "${TESTS_JOIN[@]}";
	do
		launch_test "$test"
		ret=$?
		if [[ $ret -ne 124 ]]; then
			if [[ "$1" == "--hide-fatal-error=yes" || "$2" == "--hide-fatal-error=yes" || "$3" == "--hide-fatal-error=yes" ]]; then
				check_exit "$test" 2> /dev/null
			else
				check_exit "$test"
			fi
			if [[ "$1" == "valgrind" || "$2" == "valgrind" || "$3" == "valgrind" ]]; then
				valgrind_test "$test"
			else
				sleep 0.15
			fi
			echo -e "$test"
		fi
	done
}

do_norminette()
{
	echo ""
	if norminette ./**/./*.c | grep -i "error" > /dev/null;
	then
		echo -e "\t\t\e[31mNorminette [KO]\n\e[0m"
	else
		echo -e "\t\t\e[32mNorminette [OK]\n\e[0m"
	fi
}

test_make()
{
	MAKE_OUTPUT=$(make 2>&1)
    MAKE_STATUS=$?

    if [[ $MAKE_STATUS -ne 0 ]] || echo "$MAKE_OUTPUT" | grep -qi "error"; then
        echo "Makefile failed."
        return 1
    fi
	return 0
}

setup_test_environment()
{
	rm -rf logs
	cd .. || exit
	# make > /dev/null 2>&1 
	if ! test_make; then
		echo "Aborting."
		exit 1
	fi
	do_norminette
	cp minishell my_tester/
	cd my_tester/ || exit
	rm -rf save .test1 .test2 .test3
	mkdir -p logs
	: > logs/log_minishell.txt
	: > logs/log_bash.txt
	: > logs/log_exit_status.txt
	: > logs/log_valgrind.txt
	mkdir -p .test1
	rm -rf .test1/*
	mkdir -p .test2
	mkdir -p .test3
	touch .test1/abc
	mv minishell .test1/
	cp -rf .test1/* .test3/
	cp -rf .test1/* .test2/
	mkdir save
	cp -rf .test1/* save/
}

do_the_tests()
{
	setup_test_environment
	if [[ "$1" == "builtins" || "$2" == "builtins" ]]; then
		do_builtins_tests "$1" "$2" "$3"
	fi
	if [[ "$1" == "join" || "$2" == "join" ]]; then
		do_join_tests "$1" "$2" "$3"
	fi
	if [[ "$1" == "wildcard" || "$2" == "wildcard" ]]; then
		do_wildcard_tests "$1" "$2" "$3"
	fi
	if [[ "$1" == "other" || "$2" == "other" ]]; then
		do_other_tests "$1" "$2" "$3"
	fi
	if [[ "$1" != "join" && "$2" != "join" && "$1" != "builtins" && "$2" != "builtins" && "$1" != "other" && "$2" != "other" && "$1" != "wildcard" && "$2" != "wildcard" ]]; then
		do_join_tests "$1" "$2" "$3"
		do_builtins_tests "$1" "$2" "$3"
		do_wildcard_tests "$1" "$2" "$3"
		do_other_tests "$1" "$2" "$3"
	fi
	rm -rf .test1
	rm -rf .test2
	rm -rf .test3
	rm -rf save
}

do_the_tests "$1" "$2" "$3"

echo -e "\nI can't test signals, here_doc or unexpected leave myself, please don't consider my tester as the absolute truth of minishell.\n"
echo -e "Les tests ci dessous sont a faire egalement, mais pour une raison que j'ignore ils font crash le tester. :\n"
echo -e "export HOLA=\"bonjour      \" && echo \$HOLA | cat -e"
echo -e "export HOLA=\"   -n bonjour\" && echo \$HOLA"
echo -e "export HOLA=\"cat Makefile | grep NAME\" && echo \$HOLA"