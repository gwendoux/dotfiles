# My Development Setup for OS X

## Principles

- Never use `sudo`. Once you run a command with `sudo`, future commands are probably gonna be fucked up as well.
- Automatically start all services. Don't bother keeping track a bunch of terminals running processes.
- Don't shoot yourself in the foot.

## XCode Command Line Tools

First, install XCode's command line tools.

```bash
xcode-select --install
```

If you're actually going to use XCode, just install it from the App Store and do the whole shebang.

## Install Homebrew

[Homebrew](http://brew.sh/) is OS X's package manager.
It makes setting up all your services very easy.

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## Install everything

Install everything with Homebrew.
Here are some packages you might be interested in right now:

```bash
# install everythings in the list
./brewfile
# and some others
```

Once in a while, I run `brew prune` and `brew doctor` to keep my computer in check.

## Install node.js with nvm

once nvm is installed with brewFile
install the version of node.js you use:

```bash
nvm install <%version%>
```

To make sure each terminal uses the version of node you want:

```env
# This loads nvm
[ -s "/Users/userNAME/.nvm/nvm.sh" ] && . "/Users/userNAME/.nvm/nvm.sh" 

# automaticaly right use node version when .nvmrc is detected
nvmautouse() {
    if [ -r .nvmrc ]; then
        nvm use
    fi
}
```

```env
# load nvm whenever a terminal starts
source ~/.nvm/nvm.sh
# load the version of nvm you want
nvm use <%version%>
```

In each project don't forget to add a .nmvrc to specified node version

## thefuck?

[thefuck](https://github.com/nvbn/thefuck) is a nifty tool that allows you to fix your previous CLI typos by just typing `fuck`.

Installing it is easy:

```bash
brew install thefuck
```

Then alias it as `fuck` (or whatever you want) manually by adding this line to your `~/.bash_profile`:

```env
alias fuck='$(thefuck $(fc -ln -1))'
```

## git

`git` by default doesn't have autocompletion on OS X.
Super easy to [install it](https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion):

```bash
brew install bash-completion
```

Then add this line to your `~/.bash_profile`:

```bash
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
```

## Setting up databases

Homebrew makes setting up databases super easy.
First step - install it with Homebrew:

```bash
brew install redis
```

Then you'll see information on your terminal like the following:

```
To reload redis after an upgrade:
    launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
Or, if you don't want/need launchctl, you can just run:
    redis-server /usr/local/etc/redis.conf
```

To read this information again, just type `brew info redis`.
All I do is copy and paste the first 2 commands listed.
Voila!
`redis-server` will always be running!
You won't have to open a bunch of terminals to keep it running!

Rinse and repeat for all your databases.

## brew options

A lot of packages on Homebrew have terrible defaults.
I haven't bothered making a PR to update these defaults,
mostly because I don't have a reason to change the defaults other than, "why not?"

For example, type the following:

```bash
brew options ffmpeg
```

You're probably overloaded with options.
Fun isn't it?
Supposedly, once you install a package with homebrew using specific options,
future updates will use the same options.
I haven't found that to be the case - I have to reinstall `ffmpeg` many times - but I'm not going to try reproducing it.

Have fun reading all the option info and typing commands like:

```bash
brew install ffmpeg --with-faac --with-libssh --with-libvorbis --with-libvpx --with-openssl --with-opus --with-theora --with-webp --with-x265
```

Not only will this install all the dependencies like `webp`, 
it will make sure you can pretty much throw anything at `ffmpeg`.

You'll probably have to do the same with `imagemagick` and/or `graphicsmagick`.

## Other Tools

- [iStat Menus](http://bjango.com/mac/istatmenus/) - help me figure out if something's taking too much CPU, RAM, or network
- [Atom](https://atom.io/) - the best text editor :D
- [Sublime Text](http://www.sublimetext.com/) - the second best text editor
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) - for VMs, which can't be install using Homebrew
