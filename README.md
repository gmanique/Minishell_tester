### Before starting the tester, move the readline.supp in your minishell folder
### For the tester to work properly, we need your minishell to be able to handle inputs like
- echo 'any command' | ./minishell
### The same way bash does

#### You can do ./tester.sh without arguments,
- ./tester.sh builtins
- ./tester.sh other
- ./tester.sh wildcard
- ./tester.sh tokens

#### and you can add valgrind to it :

- ./tester.sh valgrind
- ./tester.sh other valgrind
