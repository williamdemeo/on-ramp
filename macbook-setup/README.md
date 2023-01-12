## Macbook Pro Setup

These are notes about how I configured a new Macbook Pro (specs below) 
in preparation for developing RAI code.


Most of the sections below describe software installations, but some configration notes are also included.



**Contents**

- [Python 3](#python-3)
- [Xcode](#xcode)
- [Homebrew](#homebrew)
- [Idea](#idea)
- [Julia](#julia)
- [Anaconda](#anaconda)
- [afdko](#afdko)
- [Source Code Pro](#source-code-pro)
- [Pre-commit](#pre-commit)
- [Spacemacs](#spacemacs)
- [Scala](#scala)
- [VS Code](#vs-code)
- [nvm and raidocs](#nvm-and-raidocs)
- [Agda](#agda)
- [Miscellaneous Apps](#miscellaneous-apps)
- [Appendix](#appendix)

---------------------------

### Python 3

(todo: write something here)

Before proceding, upgrade pip3 to the latest version by invoking the following command
in a terminal window:

```sh
python3 -m pip install --upgrade pip
```

--------------------------

### Xcode

Install some Apple developer tools from [Xcode][].

First register for and login to a free Apple Developer account. (This does NOT require giving Apple your credit card info.)

Then select and install `Xcode 14 beta 2` and `Command Line Tools for Xcode 14 beta 2`.

-------------------------

### Homebrew

Install the [Homebrew][] package manager.  Go to https://brew.sh/ for instructions, but the following 
line is probably all you need.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Now that Brew is installed, use it to install `wget` and `git`.

```sh
brew install wget git
```

---------------------------------------

### Idea

Download [Idea][] from [IntelliJ][] and install it.  (Choose the dmg file for "Silicon" if you have an M1 chip.)

After installation, invoke the following command so that Idea can be started in a terminal window (with the command `idea`):

`sudo ln -s /Applications/IntelliJ\ IDEA\ CE.app/Contents/MacOS/idea /usr/local/bin/idea`


---------------------------------------

### Julia

Download [Julia][] from the [Julia downloads][] page and install it.

After installation, invoke the following command so that the Julia REPL 
can be started in a terminal window (with the command `julia`):

`sudo ln -s /Applications/Julia-1.7.app/Contents/Resources/julia/bin/julia /usr/local/bin/julia`


---------------------------------------


### Anaconda

[Anaconda][] is supposedly "the world's most popular open-source Python distribution platform."

We use it to install some of the required software described below and 
to manage some aspects of our development environment.

To install [Anaconda][], follow these steps:

1.  Download the Anaconda installation file (e.g., `Anaconda3-2022.05-MacOSX-x86_64.pkg`)
    from the [Anaconda distribution][] page and launch it.

2.  Follow the prompts on the installer screens.  Accept the defaults selections.
    One consequence will be new lines in your `~/.bash_profile` file which are
    responsible for setting up `conda`.

3.  To make the changes take effect, either close and then re-open your Terminal window,
    or invoke the command `source ~/.bash_profile`.

4.  Test the installation by invoking `conda list`.  If the install was successful,
    the `conda list` command will output a list of installed packages.

It is wise to update `conda` frequently, e.g., each time you're going to use it,
by invoking the following command in a terminal window:  `conda update -n base -c defaults conda`.

-------------------------------


### afdko

[afdko][] is is the [Adobe Font Development Kit for OpenType](https://pypi.org/project/afdko/)
We will need it to install the "Source code pro" fonts below.

To install `afdko` (first install [Anaconda][], as described above, and then)
invoke the following commands:


```sh
python3 -m venv afdko_env
source afdko_env/bin/activate
```

-------------------------

### Source Code Pro

[Source Code Pro][] is a set of OpenType fonts that have been designed to work well in user interface environments.

(In particular, Spacemacs, which we install below, requires the Source Code Pro fonts.)

Assuming you successfully installed and activated `afdko` as described above,
you can install the [Source Code Pro][] fonts by cloning the [source-code-pro repository][], 
entering the resulting directory, and building the fonts, as follows:

```sh
git clone git@github.com:adobe-fonts/source-code-pro.git
cd source-code-pro
git checkout master
./build.sh
./buildVFs.sh
```

**Refs**

*  [Adobe Font Development Kit for OpenType][]
*  [afdko][]
*  [afdko install][]
*  [Source Code Pro][]
*  [source-code-pro repository][]


----------------------------

### Pre-commit

[Pre-commit][] is a framework for managing and maintaining multi-language pre-commit hooks.
It is required if you will be developing RAI code and submitting pull requests to RAI GitHub repositories.

I installed [pre-commit][] using homebrew, as follows:

```sh
brew install pre-commit
```

(Although, since we just installed it above, `conda` could be used
instead of homebrew by invoking the following command:

```sh
conda install -c conda-forge pre-commit
```

After installation of pre-commit, run the command `pre-commit install`
inside the main directory of the cloned repository you want to use
pre-commit with (only needed once). This will make git call pre-commit 
every time you run commit. 

You can also trigger [pre-commit][] manually before committing for 
the changed files, or for all:

```sh
pre-commit run   # (just check the changed files)
```

OR

```sh
pre-commit run --all   # (check all files)
```


**Refs**

*  [pre-commit][]
*  [pre-commit installation][]


----------------------------


### Spacemacs

[Emacs][] is a powerful, "kitchen sink" text editor, and [Spacemacs][] is 
a powerful version of Emacs that runs nicely on both MacOS and Linux.

Here are the steps I followed to install Spacemacs on the Mac.


1.  Install [Emacs][].

    Spacemacs depends on standard emacs, so we install that first using 
    following the official [emacs install][] instructions at [wikiemacs.org][].

    (I chose to use the `brew` installation option.)

    ```sh
    brew update
    brew install --cask emacs
    ```


2.  Install [Spacemacs][] by invoking the following commands in the terminal.
    
    ```
    mkdir -p ~/.emacs.d   # (in case you don't already have a .emacs.d directory)
    mv ~/.emacs.d{,-backup}
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
    ```
    
    This clones the spacemacs github repository into the `~/.emacs.d`, moving aside
    any such directory already residing on your machine.

    After installing spacemacs, you may wish to replace the default `~/.spacemacs` 
    configuration with your favorite.  If you want to try mine, do the following:

    ```sh
    mv ~/.spacemacs{,-2022Jul18}  #  save original file
    wget https://github.com/wjd-rai/on-ramp/macbook-setup/.spacemacs
    ```
    
3.  Install add-on [Spacemacs][] packages.  Starting Spacemacs by typing
    `emacs` in the cli and then, in Spacemacs, do `M-x package-list-packages` 
    to see a list of available packages.
    
    Navigate to the name of the package(s) you want to install, hit the `i` key
    to mark it for installation, and then hit the `x` key to proceed.

    Here is a list of [Spacemacs][] packages I find useful.
    
    `ag`, `magit`, `zenburn-theme`, `flycheck-julia`, `julia-mode`, `julia-repl`, `julia-shell`,
    `latex-preview-pane`, `latex-unicode-math-mode`, `lean-mode`, `org-mode`, `org-journal`,
    `math-symbol-lists`, `math-symbols`, `matlab-mode`, `proof-general`, `pytest`, 
    `python-docstring`, `python-mode`, `rust-mode`, `scala-mode`, `swiper`, `unicode-fonts`, 
    `unicode-math-input`, `vscdark-theme`, `vscode-dark-plus-theme`, `vscode-icon`, `all-the-icons`



#### Troubleshooting Spacemacs Install

*  **Assign Meta to Command Key**. I couldn't get used to having Meta (`M-`) 
   assigned to the `Option` key, so I placed the following in my .spacemacs file 
   to have Meta assigned to the `Command` key instead.

   ```sh
   (setq mac-command-modifier 'meta)
   ```

   **Refs**

   *  https://rarelyneeded.com/2021/01/09/setting-up-spacemacs-on-macos-big-sur/

*  **source-code-pro fonts**. Even though I successfully installed the source-code-pro 
   as described in on of the previous steps, [Spacemacs][] couldn't find them.  Probably 
   I just need to set some variable that tells [Spacemacs][] where to find fonts or figure
   out where it searches for fonts by default and move the source-code-pro fonts there.
   However, for expediency, I resolved this by invoking the following commands in the 
   terminal.

   ```sh
   brew install svn
   brew tap homebrew/cask-fonts
   brew install --cask font-source-code-pro
   ```

---------------------------

### Scala

Following the instructions on the [Scala download][] webpage.

Enter the following command and answer `Y` to the questions. In particular, this
will locate and install a JVM if you don't already have one (fine, since
we can upgrade the JVM later if we want).

`brew install coursier/formulas/coursier && cs setup`

------------------------

### VS Code

Go to the [VS Code installation][] page and download VSCode for Mac.

Then go to [VS Code Mac setup][] page and follow the
instructions for setting it up so you can launch VSCode from the dock or 
by clicking the icon or from the command line by typing `code`.

-------------------------

### nvm and raidocs

If working on the Documentation Team, you should clone the `raidocs` repo and
build the documentation by following these steps.


1.  Install the node version manager by invoking the following command (in the terminal cli).

    ```sh
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    ```

2.  Add the following to the bottom of the `~/.zprofile` file:

    ```sh
    # Setting PATH for node
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
    ```

    Then invoke `source ~/.zprofile`.

3.  Clone the raidocs repository.

    ```sh
    git clone git@github.com:RelationalAI/raidocs.git
    ```

4.  Following the instructions in the README.md file of the raidocs repository.
    Here's a summary of the commands to run.
    
    ```sh
    nvm install 14.19.0
    nvm alias default 14.19.0
    npm install -g pnpm@6.32.4
    pnpm scrub-build
    ```

-----------------------------------------

### Agda

Ref. [Agda install][]

#### The happy path

The simplest way to install Agda on a Mac is to following the directions at
https://agda.readthedocs.io/en/latest/getting-started/installation.html#os-x
and do the following:

```sh
brew install agda
agda-mode setup
mkdir -p ~/.agda
echo $(brew --prefix)/lib/agda/standard-library.agda-lib >>~/.agda/libraries
echo standard-library >>~/.agda/defaults
```

The last three command lines are because, by default, the standard library 
is installed in the folder `/usr/local/lib/agda/`. To use the standard library, 
it is convenient to add the location of the agda-lib file 
`/usr/local/lib/agda/standard-library.agda-lib` to the `~/.agda/libraries` 
file, and write the line `standard-library` in the `~/.agda/defaults` file. 

#### The less happy path

There are, of course, harder ways to install Agda.  In particular, one can install
it from source by cloning the GitHub agda/agda repository and building it.

Somewhere in between the simple Brew installation mentioned previously and the
"building from source" method is the Cabal method.

(This path I chose because it's how I typically setup Agda on a Linux box;
though I also occasionally build it from source.)

I'm not sure if all of these steps are necessary, but they do the job.

1.  Use Brew to install a couple of developer libraries and the Haskell package
    manager, `cabal`.

    ```sh
    brew install zlib ncurses
    brew install cabal-install
    ```

2.  Update `cabal` and then use it to install Agda.

    ```sh
    update cabal
    cabal install Agda
    ```

    (This takes quite a long time.)


Finally, even if not installing Agda from source, it may be helpful to have the
full source code repository on hand.  We can obtain the Agda source code very
simply with the command:

`git clone git@github.com:agda/agda.git`


-------------------------------------

### Miscellaneous

These don't deserve their own sections because their installations were trivial.

*  [cmake][]. Install it with the command `brew install cmake`.

*  **LaTeX**  
   Install MacTeX from https://tug.org/mactex/mactex-download.html  
   Download the appropriate package installer file. When the download is
   complete, launch the installer and follow the directions.

*  [Slack][]. Go to [the slack website][] and login to your slack account.
   You will have the option of launching the desktop slack client.  Do it!
   
*  [Enpass][]. Install from the [Enpass website][] or the app store;
   also, install the Chrome browser extension.

*  [Telegram][]. Go to the [Telegram website][] and following the instructions.


------------------------------------

## Appendix

### Hardware Specs

|                               |               |
|-------------------------------|---------------|
|  **Model Name**.              |  MacBook Pro  |
|  **Model Identifier**.        |  MacBookPro18,2  |
|  **Chip**.                    |  Apple M1 Max  |
|  **Total Number of Cores**.   |  10 (8 performance and 2 efficiency)  |
|  **Memory**.                  |  64 GB  |
|  **System Firmware Version**. |  7459.121.3  |
|  **OS Loader Version**.       |  7459.121.3  |
|  **Serial Number (system)**.  |  H3C2W1W2RL  |
|  **Hardware UUID**.           |  BC36D6D2-BFCA-5109-A5FA-D8D18A53B0B5  |
|  **Provisioning UDID**.       |  00006001-000868C01A85801E  |
|  **Activation Lock Status**.  |  Disabled  |


### Links mentioned above


*  [Adobe Font Development Kit for OpenType][] | https://pypi.org/project/afdko/
*  [afdko][] | https://pypi.org/project/afdko/
*  [afdko install][] | https://pypi.org/project/afdko/Install
*  [Agda install][] | https://agda.readthedocs.io/en/latest/getting-started/installation.html
*  [Anaconda][] | https://www.anaconda.com/
*  [Anaconda distribution][] | https://www.anaconda.com/products/distribution
*  [Conda][] | https://docs.conda.io/
*  [Conda installation][] | https://docs.conda.io/projects/conda/en/4.6.1/user-guide/install/macos.html
*  [Emacs][] | https://www.gnu.org/software/emacs/
*  [emacs install][] | https://wikemacs.org/wiki/Installing_Emacs_on_OS_X
*  [Enpass][] | https://www.enpass.io/
*  [Homebrew][] | https://brew.sh/
*  [Idea][] | https://www.jetbrains.com/idea/download/
*  [Julia][] | https://julialang.org/
*  [Pre-commit][] | https://pre-commit.com/
*  [Slack][] | https://slack.com/
*  [source-code-pro repository][] | https://github.com/adobe-fonts/source-code-pro/tree/master
*  [Spacemacs][] | https://www.spacemacs.org/
*  [Telegram][] | https://macos.telegram.org/
*  [VS Code][] | https://code.visualstudio.com/
*  [wikiemacs.org][] | https://wikemacs.org
*  [Xcode][] | https://developer.apple.com/xcode/



[Adobe Font Development Kit for OpenType]: https://pypi.org/project/afdko/
[afdko]: https://pypi.org/project/afdko/
[afdko install]: https://pypi.org/project/afdko/Install
[Anaconda]: https://www.anaconda.com/
[Anaconda distribution]: https://www.anaconda.com/products/distribution
[Conda]: https://docs.conda.io/
[Conda installation]: https://docs.conda.io/projects/conda/en/4.6.1/user-guide/install/macos.html
[Homebrew]: https://brew.sh/
[Idea]: https://www.jetbrains.com/idea/download/
[IntelliJ]: https://www.jetbrains.com/idea/
[Julia]: https://julialang.org/
[Julia downloads]: https://julialang.org/downloads/
[source-code-pro repository]: https://github.com/adobe-fonts/source-code-pro/
[Xcode]: https://developer.apple.com/xcode/
[Xcode download]: https://developer.apple.com/download/all/?q=Xcode
[Slack]: https://slack.com/
[the slack website]: https://slack.com/
[Enpass]: https://www.enpass.io/
[Enpass website]: https://www.enpass.io/
[Telegram]: https://macos.telegram.org/
[Telegram website]: https://macos.telegram.org/
[VS Code installation]: https://code.visualstudio.com/Install
[Pre-commit]: https://pre-commit.com/
[pre-commit]: https://pre-commit.com/
[pre-commit installation]: https://pre-commit.com/#install
[Emacs]: https://www.gnu.org/software/emacs/
[emacs install]: https://wikemacs.org/wiki/Installing_Emacs_on_OS_X
[wikiemacs.org]: https://wikemacs.org
[Agda install]: https://agda.readthedocs.io/en/latest/getting-started/installation.html
[Spacemacs]: https://www.spacemacs.org/
[Scala download]: https://www.scala-lang.org/download/
[VS Code Mac setup]: https://code.visualstudio.com/docs/setup/mac
[Source Code Pro]: https://fonts.adobe.com/fonts/source-code-pro
