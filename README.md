# zsh-config

My custom zsh config settings to get most of the goodies without the bloat of omzsh or similar. Loosely based off of https://thevaluable.dev/zsh-install-configure-mouseless/ .

## Local setup

### Zsh Config Files

To configure Zsh for your user’s session, you can use the following files:

```zsh
$ZDOTDIR/.zshenv
$ZDOTDIR/.zprofile
$ZDOTDIR/.zshrc
$ZDOTDIR/.zlogin
$ZDOTDIR/.zlogout
```

In case you wonder what $ZDOTDIR stands for, we’ll come back to it soon.

Zsh read these files in the following order:

- _.zshenv_ - Should only contain user’s environment variables.
- _.zprofile_ - Can be used to execute commands just after logging in.
- _.zshrc_ - Should be used for the shell configuration and for executing commands.
- _.zlogin_ - Same purpose than .zprofile, but read just after .zshrc.
- _.zlogout_ - Can be used to execute commands when a shell exit.

We’ll use only .zshenv and .zshrc

### Zsh Config Path

By default, Zsh will try to find the user’s configuration files in the $HOME directory. You can change it by setting the environment variable $ZDOTDIR.

Personally, I like to have all my configuration files in this repo which I locat at `$HOME/zsh-config`. To do so:

I set the variable $XDG_CONFIG_HOME as following: `export XDG_CONFIG_HOME="$HOME/zsh-config"`.
I set the environment variable $ZDOTDIR: `export ZDOTDIR="$XDG_CONFIG_HOME/zsh"`.
I put the file `.zshrc` in the $ZDOTDIR directory.
Most software will use the path in $XDG_CONFIG_HOME to install their own config files. As a result, you’ll have a clean $HOME directory.

Unfortunately, the file `.zshenv` needs to be in your home directory. It’s where you’ll set $ZDOTDIR. Then, every file read after `.zshenv` can go into your $ZDOTDIR directory.

## Zsh Basic Config

Environment Variables
As we saw, you can set the environment variables you need for your user’s session in the file `$HOME/.zshenv`. This file should only define environment variables.

```zsh
# install, run this once
cat ~/.zshrc >> zshrc
cp zshrc ~/.zshrc
```

## Prompt

TODO: doesn't work right now

### Purification

![purification is beautiful](./screenshot.png)

> Purity purified by purification - even more minimal and fast Zsh prompt

### Overview

Most prompts are cluttered, ugly and slow. I'm not sure mine is better, but I like it anyway!

#### Why?

- I needed some `git` infos to remind me where the heck is my code? Oh yeah my stash is full.
- I don't like cluttered Zsh frameworks anymore. I needed something without any dependency I could modify myself easily when I'm bored.
- I included the Greek lambda letter to represent a branch, to remind me that everything can be build from Lambda expressions, and that Half-Life is a great game.

### Install

0. You need [font awesome 4](https://fontawesome.com/v4.7.0/) to display the cool `git` infos signs. I know, I said "without dependencies". You can still change it.

```zsh
brew install --cask font-fontawesome
```

1. Download `prompt_purification_setup` in a folder.
2. Add the folder path in your fpath (in your `zshrc`): `fpath=(/the/folder/where/there/is/the/prompt $fpath)`
3. Autoload it in your `zshrc`: `autoload -Uz prompt_purification_setup && prompt_purification_setup`
