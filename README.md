# Shell Scripting

_This repo is created to learn the shell script and contains shell script practice files. below you can find the documentation._

## what is shell script ?

Shell Script is a file, It is used to run multiple shell commands at once as a file. It is best to use if you are working with linux internal automation.

> [!Note]
> you must have knowledge on the linux commands before you start shell scripting.

### Extension of shell script file

shell script file should be saved with .sh extenstion for example `scriptname.sh`

### How to run the script file

use command `bash scriptpath` or `sh scriptpath` or `./scriptpath`
to use `./scriptpath` command the file should have executable permission.

### Basic shell script file

```
#!/bin/bash

## all linux commands below
```

`#!/bin/bash` is the first line that should be included in shell script file. It is called shebang this used to interpret and check the syntax of the script file it is similar to a interpreter.

use `echo` to print any statement

### helloworld shell script

`helloworld.sh`

```
#!/bin/bash

echo "Hello World"
```

### Creating a variable

`variable.sh`

```
#!/bin/bash

Varname=value
```

### Accessing a variable

`accessvariable.sh`

```
#!/bin/bash

Varname=value

echo $Varname
```

> [!IMPORTANT]
> there should not be any space before after `=` <br/>
> :white_check_mark: Var=value <br/>
> :x: var =value
