# Useful aliases for working with IOTstack

## Purpose

This will install aliases for some common task when working with [IOTstack](https://github.com/SensorsIot/IOTstack).

## Alias overview

[help/ALIAS_HELP.md](help/ALIAS_HELP.md)

## The features is

* Navigating to a container's "services" directory (eg to edit its environment file);
* Launching a shell **inside** a container (for general nosing around);
* Launching a specific process **inside** a container (eg the InfluxDB command line interface);
* Executing common tasks (like "up" and "down") without having to first change your working directory to `~/IOTstack`;
* Extending commands to fill gaps. For example, terminating a single container instead of taking down your entire stack;
* and so on…

Although you could create a scheme of shell scripts to accomplish most of these goals, aliases and shell functions are usually simpler and, often, the only way to accomplish some goals.

## Installation

### Step 1

Login to your Raspberry Pi and clone this repository. The recommended commands are:

```bash
$ mkdir -p "$HOME/.local"
$ git clone https://github.com/Paraphraser/IOTstackAliases.git "$HOME/.local/IOTstackAliases"
```

### <a name="step2"> Step 2 </a>

Test the result like this:

```bash
$ . "$HOME/.local/IOTstackAliases/dot_iotstack_aliases"
```

Notes:

* The `.` followed by a space at the start of the command is called a *source* statement. It tells the shell to process the file in-line, like an `#include` statement in a programming language.

	*Sourcing* a file is different to *executing* a file. If you check, you will see that `dot_iotstack_aliases` does not have execute permission. Neither does the file start with `#!/bin/bash`. This is intentional. Although you *can* add execute permission and then execute the file as a command, it will not produce the correct result. It **must** be sourced.
	
* The "dot\_" prefix on the filename is intended to remind you that the file should be *sourced*.  

If you have done the first two steps correctly, you should get output like this:

```bash
Useful Docker aliases:
       Grafana: GRAFANA_SHELL
        Influx: influx, INFLUX_SHELL
     Mosquitto: MOSQUITTO_SHELL
       NodeRed: NODERED_SHELL, NODERED_DATA
        Docker: BUILD     | DPS       | DNET      {<container> …}
                PULL      | REBUILD   | RECREATE  {<container> …}
                RESTART   | TERMINATE | UP        {<container> …}
                DOWN, I, S, T, V
```

If you get any error messages, go back and check your work. 

### Step 3

To apply `dot_iotstack_aliases` each time you login, add this *source* statement:

```bash
. "$HOME/.local/IOTstackAliases/dot_iotstack_aliases"
```

to one of the following files:

* ~/.bashrc
* ~/.profile

What's the difference? I'm glad you asked:

* `.profile` is called when you `ssh` into your Raspberry Pi but not when you open a terminal session in VNC.
* `.bashrc` is called when you open a terminal session in VNCbut not when you `ssh`.

You might be thinking, "I access my Raspberry Pi using both `ssh` and VNC so that means I should add the *source* statement to both files." Well, yes and no. There is a wrinkle. The `.profile` that you get by default already sources `.bashrc`, like this:

```bash
# if running bash
if [ -n "$BASH_VERSION" ]; then
   # include .bashrc if it exists
   if [ -f "$HOME/.bashrc" ]; then
      . "$HOME/.bashrc"
   fi
fi
```

If you have **not** removed those lines from `.profile` then `.bashrc` is the correct place to add the source statement to apply `dot_iotstack_aliases`. If you **have** removed those lines from `.profile` then you may need to add the source statement to both files.

Here's an example of editing `.bashrc` using `vi`:

```bash
$ vi ~/.bashrc
G
o
. "$HOME/.local/IOTstackAliases/dot_iotstack_aliases"
[ESC]
:wq
$
```

In words:

1. Launch "vi" with the target file.
2. Press <kbd>G</kbd> to jump to the end of the file.
3. Press <kbd>o</kbd> to open a new line after the last line in the file, and go into insert mode.
4. Type the source statement as-is and press <kbd>return</kbd> at the end of the line. Make sure you pay attention to these key points:

	- The line starts with a period (`.`) followed by a space;
	- There are **no** other spaces on the line; and
	- Make sure you match the spelling **exactly**.Unix is case-sensitive.

5. Press <kbd>esc</kbd> to exit insert mode.
6. Press <kbd>:</kbd> to move to command mode, <kbd>w</kbd> to write the in-memory buffer to the target file, and <kbd>q</kbd> followed by <kbd>return</kbd> to leave "vi".

Use the `tail` command to confirm your editing:

```bash
$ tail -1 ~/.bashrc 
```

### Step 4

Test your work. Do **NOT** log-out of your existing terminal session. Instead, open a new terminal session.

> How you do this will depend on how you connect to your RPi. If you are using `ssh` then start a new `ssh` session from your host computer. If you are using VNC then launch a new terminal session from the GUI. Ditto if you have gone "all the way" and have connected a keyboard, mouse and screen to your RPi.

Worst case is that you will be unable to login to the new terminal session. This is why you should never log-out of an existing terminal session until you are 100% certain that changes made to either `.bashrc` or `.profile` are working. If you can't launch a new session, you just use the existing session to track down and nail any bugs. Rinse, repeat.

> This advice goes double if you ever need to edit `/etc/profile` !!

In the **new** terminal session, you should expect to see the same list of aliases shown in [Step 2](#step2).
