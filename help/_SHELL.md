#### Alias: <a name="aliasSHELL"> `«container»\_SHELL` </a>

This opens a shell within the container. For example:

```bash
$ ADGUARD_SHELL
```

expands to:

```bash
$ docker exec -it adguard bash
```

Opening a shell within a container means that the next thing you see is a prompt from the shell running inside the container, and with the **container's** view of the file system. `ADGUARD_SHELL` will result in a prompt like this:

```bash
root@95b20550cb8a:/#
```

where the "#" indicates "you are running as root" (which is another way of saying "you don't need to use `sudo` for anything"). To get out of a container shell, either press <kbd>control</kbd>+<kbd>d</kbd> or type `exit` and press <kbd>return</kbd>.

Another benefit of using an alias scheme for common tasks is that you don't have to remember things like "most containers use `bash` but some, like Mosquitto, don't have `bash` so you need to use `ash` or `sh`, while others, like Portainer and Portainer-CE don't have any shell at all.

**Notes:**

* If you are trying to develop a "«container»\_SHELL" alias of your own and find that `bash` doesn't work, try replacing `bash` with `ash`, and then `sh`.

* If you're wondering about the `-it` option on «container»\_SHELL aliases, think of it as "interactive terminal". It's really `-i` (keep STDIN connected) and `-t` (allocate a pseudo-TTY for output). It is how `docker exec` knows to wait for human interaction, and why you have to type `exit` or press <kbd>control</kbd>+<kbd>d</kbd> to get out of a container.

