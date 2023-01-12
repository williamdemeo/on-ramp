# on-ramp

Notes, etc. on getting up to speed with Julia, Rel, and other RelationalAI stuff

-------------------------------------

## Warnings, disclaimers

The steps described in these notes have only been tested on Ubuntu Linux 20.04.4 and 
MacOS 12.4.  They may or may not work on other operating systems.


**Contents**

- [Initial Setup](#initial-setup)
- [Workflow](#workflow)
- [Miscellany](#miscellany)
- [What to read next](#what-to-read-next)
- [Appendix](#appendix)



-----------------------------

## Initial Setup

Install [Julia][] and [VSCode][]. Install the `julialang` and `Rel` VSCode extensions.

### Join the RelationalAI Github team

This requires an invite which you should receive by email, and requires enabling
[2FA][] for GitHub login.

Generate an ssh key and upload the public key to your GitHub account.
See the [Section on ssh keygen][] below.


-----------------------------------

## Workflow

(Based on notes provided by Thiago.)

1.  Install the [Revise.jl][] Julia package.

    Start Julia at command line, enter the package manager by typing `]`, and
    type `add Revise` at `pkg>` prompt (hit `Backspace` to exit package
    manager).
    
    ```sh
    julia
                   _
       _       _ _(_)_     |  Documentation: https://docs.julialang.org
      (_)     | (_) (_)    |
       _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
      | | | | | | |/ _` |  |
      | | |_| | | | (_| |  |  Version 1.7.3 (2022-05-06)
     _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
    |__/                   |

    julia>        # (hit "]" key at julia prompt)

    (@v1.7) pkg> add Revise
        Updating registry at `~/.julia/registries/General.toml`
       Resolving package versions...
      No Changes to `~/.julia/environments/v1.7/Project.toml`
      No Changes to `~/.julia/environments/v1.7/Manifest.toml`

    (@v1.7) pkg>  # (hit Backspace key to exit package manager)
    
    julia>
    ```

2.  Make sure [Revise][] is available on launch of Julia by putting "using Revise"
    (without the quotes) in the file `~/.julia/config/startup.jl`, as follows:

    ```
    mkdir -p ~/.julia/config && echo "using Revise" >> ~/.julia/config/startup.jl
    ```

    **Ref**. [Revise configuration][] official documenation.

3.  Clone the [raicode GitHub repo][].

    ```sh
    git clone git@github.com:RelationalAI/raicode.git
    ```
    
    (This won't work if you have not received and accepted an invitation to join the
    RelationalAI GitHub organization and/or you haven't set up ssh keys.
    See [ssh keygen][] instructions below.)

4.  Change to the `raicode` directory (the one just cloned) and start the Julia
    [REPL][] (type `julia` at the terminal [cli][]).

5.  Enter the Julia package manager (`]` key), "activate" the project
    (`activate .`) and build it (`build`).

    ```sh
    julia
                   _
       _       _ _(_)_     |  Documentation: https://docs.julialang.org
      (_)     | (_) (_)    |
       _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
      | | | | | | |/ _` |  |
      | | |_| | | | (_| |  |  Version 1.7.3 (2022-05-06)
     _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
    |__/                   |

    julia>        # (hit "]" key at julia prompt)

    (@v1.7) pkg> activate .
    (@v1.7) pkg> build
    (@v1.7) pkg>  # (hit Backspace key to exit package manager)
    
    julia>
    ```

6.  Leave the package manager (`Backspace` or `Ctrl-c`) and load the server
    by entering `using RAI.Server` at the `julia>` prompt.

    ```sh
    using RAI.Server
    ```

7.  Start the local server with default configuration by entering the command
    `start!(RAIServer(Configuration()))` at the `julia>` prompt.

    ```sh
    start!(RAIServer(Configuration()))
    ```


8.  Open the [console][] by pointing a web browser to
    https://console.relationalai.com/login and point to the local server.

If you change local Julia code, Revise will pick it up, but you need to restart
the server (`Ctrl-c` twice) and run `start!(RAIServer(Configuration()))` again.


-----------------------------------

## Miscellany


### ssh keygen

To use the private RelationalAi GitHub repositories, you will need to set up ssh
keys.  To generate new ssh keys and upload them to GitHub,

1.  Invoke the command `ssh-keygen` at the command line.  (You can simply hit
    enter when asked for a passphrase if you don't want to use a passphrase.)

2.  Copy the contents of the file `cat ~/.ssh/id_rsa.pub` to the clipboard
    (e.g., invoke `cat ~/.ssh/id_rsa.pub` and select/copy the output).

3.  Click on your GitHub avatar on the top right of the GitHub website and
    select "Settings" then choose "SSH Keys" from the list on the left-hand 
    side of the Settings web page.
    
4.  Click the `Add` button on the SSH keys web page and paste the contents
    of the clipboard into the box.

**Notes**.  Surprisingly, I couldn't figure out how to get this working smoothly
for two GitHub accounts.  I have a new GitHub account (@wjd-rai) that I will use for
RelationalAI work.  When I try to upload my old ssh key, GitHub refuses to
accept it, noting that it's being used by another account (which is my original
@williamdemeo GitHub account).  So I generated new a ssh key with a different
name (`id_rsa-wjd-rai`) and uploaded that instead.  However, it doesn't work
unless I rename the key files `id_rsa` and `id_rsa.pub` (but then I can't use my
old ssh keys which I need for access rights to my old GitHub account).


### Julia REPL

*  `]` enter package mode  (`Backspace` to exit)
*  `;` to go into shell mode  (`Backspace` to exit)
*  Some Unix commands with `()` appended to them work in the Julia [REPL][],
   like  like `pwd()`

In Package mode, `st` or `status` summarizes the contents of, and changes to,
the current environment.  To see other commands available in package mode, enter
package mode, type `?` and hit `Enter`.

Add and load the `OhMyREPL` to add syntax highlighting to the REPL.

--------------------


## What to read next

You should read or review the three introductory slide presentations residing in the 
[shared google docs account](https://docs.google.com/presentation/u/0/?tgif=d)
(and mirrored in this repository just to be sure they're always readily available).

1.  [R&D Onboarding and Reference][]
2.  [RelationalAI Service Infrastructure][]
3.  [RelationalAI Everything You Need to Know][]


*  [General (external) documentation](https://docs.relational.ai/)
   -  In particular, the tutorials in the [Intro to the Rel Language](https://docs.relational.ai/rel/intro/overview)
*  [Developer (internal) documentation](https://docs.dev.relational.ai/index.html)
*  Relational AI style recommendations
   -  [RAIStyle](https://github.com/RelationalAI/RAIStyle). (style guide for Julia)
   -  [RelStyle](https://github.com/RelationalAI/RAIStyle/blob/master/Rel.md). (s)tyle guide for Rel)

------------------------------

## Appendix

### Acronyms

*  <a id="cli">cli</a> = command line interface
*  <a id="2fa">2FA</a> = two-factor authentication
*  <a id="repl">REPL</a> = Read Evaluate Print Loop


-----------------------------

## Links

Here's a list of links that were mentioned above.

- **Julia Links**
   - [Julia][] (official homepage) | https://julialang.org/
   - [Revise][] | https://timholy.github.io/Revise.jl/stable/
   - [Revise.jl][] | https://timholy.github.io/Revise.jl/stable/
   - [Revise configuration][] | https://timholy.github.io/Revise.jl/stable/config/#Configuration-1
- **RelationalAI Links**
   - [raicode GitHub repo][] | https://github.com/RelationalAI/raicode
   - [Rel Console][] | https://console.relationalai.com/login
   - [RelationalAI Wiki][] | https://wiki.internal.relational.ai/doku.php?id=start
   - **presentation slides**
      - [R&D Onboarding and Reference][]
      - [RelationalAI Service Infrastructure][]
      - [RelationalAI Everything You Need to Know][]
- **Other Links**
   - [create a new issue][] (for this "on-ramp" repo) | https://github.com/wjd-rai/on-ramp/issues/new/choose
   - [VSCode][] | https://code.visualstudio.com/


-------------------------

## Contributions Welcomed!

Please help improve this page!  You can [create a new issue][] or fork this repo and submit a pull request.


[2FA]: #2fa
[cli]: #cli
[Rel Console]: https://console.relationalai.com/login
[console]: https://console.relationalai.com/login
[create a new issue]: https://github.com/wjd-rai/on-ramp/issues/new/choose
[Julia]: https://julialang.org/
[raicode GitHub repo]: https://github.com/RelationalAI/raicode
[R&D Onboarding and Reference]: https://docs.google.com/presentation/d/1TiV6xHHRzo4pU_5rT3tR1aj4ZEzMZtL22-E_wK0dcFo/edit?usp=sharing
[RelationalAI Service Infrastructure]: https://docs.google.com/presentation/d/1-fQ3j8cirJS_kRsuhzfXbcty6McIUPmpHkDgbmcHTbQ/edit?usp=sharing
[RelationalAI Everything You Need to Know]: https://docs.google.com/presentation/d/1jG66JBdmDtdHRUhXEF9qcHwXFCYXiqw0ZDx8kJfud6s/edit?usp=sharing
[RelationalAI Wiki]: https://wiki.internal.relational.ai/doku.php?id=start
[REPL]: #repl
[Revise]: https://timholy.github.io/Revise.jl/stable/
[Revise.jl]: https://timholy.github.io/Revise.jl/stable/
[Revise configuration]: https://timholy.github.io/Revise.jl/stable/config/#Configuration-1
[Section on ssh keygen]: #ssh-keygen
[ssh keygen]: #ssh-keygen
[VSCode]: https://code.visualstudio.com/




