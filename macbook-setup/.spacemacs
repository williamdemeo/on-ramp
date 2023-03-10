;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
  You should not put any user code in this function besides modifying the variable values."
  (setq-default

   ;; Base distribution to use. This is a layer contained in the directory `+distribution'.
   ;; For now available distributions are `spacemacs-base' or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers not
   ;; listed in variable `dotspacemacs-configuration-layers'), `all' will lazy
   ;; install any layer that support lazy installation even the layers listed in
   ;; `dotspacemacs-configuration-layers'. `nil' disable the lazy installation
   ;; feature and you have to explicitly list a layer in the variable
   ;; `dotspacemacs-configuration-layers' to install it. 
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing a
   ;; layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; --------------------------------------------------------------------------------------------------------
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or <M-m f e R> (Emacs style) to install them.
     ;; ---------------------------------------------------------------------------------------------------------
     javascript
     ruby
     html
     yaml
     rust
     haskell
     python
     ivy
     auto-completion
     better-defaults
     emacs-lisp
     git
     markdown
     unicode-fonts
     ;; org
     ;; (shell :variables  shell-default-height 30   shell-default-position 'bottom)
     spell-checking
     ;; syntax-checking
     version-control
     )

   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer. If you need some configuration for these packages, then consider
   ;; creating a layer. You can also put the configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     ag
     julia-mode
     )

   dotspacemacs-frozen-packages '()  ;; A list of packages that cannot be updated.

   dotspacemacs-excluded-packages '()  ;; A list of packages that will not be installed and loaded.

   ;; Defines the behaviour of Spacemacs when installing packages. Possible
   ;; values are `used-only', `used-but-keep-unused' and `all'.
   ;;   `used-only' installs only explicitly used packages and uninstall any
   ;;   unused packages as well as their unused dependencies.
   ;;   `used-but-keep-unused' installs only the used packages but won't
   ;;   uninstall them if they become unused.
   ;;   `all' installs *all* packages supported by Spacemacs and never uninstall them. 
   dotspacemacs-install-packages 'used-but-keep-unused)  ; (default is `used-only') 
)

(defun dotspacemacs/init ()
  "Initialization function. This function is called at the very startup of Spacemacs initialization before layers configuration.
   You should not put any user code in there besides modifying the variable values."
  ;; This setq-default sexp is an exhaustive list of all the supported spacemacs settings.
  (setq-default

   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t. This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil. (default t)
   dotspacemacs-elpa-https t
   
   dotspacemacs-elpa-timeout 5 ;; Maximum allowed time in seconds to contact an ELPA repository.

   ;; If non nil then spacemacs will check for updates at startup when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t

   ;; If non-nil, a form that evaluates to a package directory. For example, to use different package directories for different Emacs versions,
   ;; set this to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil

   ;; One of `vim', `emacs' or `hybrid'. The latter is like `vim' except that `insert state' is replaced by the `hybrid state' with `emacs' key bindings.
   ;; The value can also be a list with `:variables' keyword (similar to layers). Check the editing styles section of the documentation for details on available variables.
   dotspacemacs-editing-style 'emacs  ;; (default 'vim)

   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading t

   ;; Specify the startup banner. Default value is `official', it displays the official spacemacs logo. An integer value is the index of text banner,
   ;; `random' chooses a random text banner in `core/banners' directory. A string value must be a path to an image format supported by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are: `recents' `bookmarks' `projects' `agenda' `todos'." List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; List of themes, the first of the list is loaded when spacemacs starts. Press <SPC> T n to cycle to the next theme in the list
   dotspacemacs-themes '(zenburn  ample-flat apropospriate-dark spacegray hc-zenburn material-light)
                         ;; alect-dark-alt
                         ;; spacemacs-light
                         ;; whiteboard
                         ;; ample
                         ;; adwaita
                         ;; dakrone
                         ;; darkburn
                         ;; default
                         ;; misterioso
                         ;; soft-morning
                         ;; leuven
                         ;; heroku
                         ;; spacemacs-dark
                         ;; tango
                         ;; material)

   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro" ; "Neucha"   ;"NanumGothicCoding"    
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)

   ;; The leader key
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands
   ;; (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET. Setting it to a non-nil value, allows
   ;; for separate commands under <C-i> and TAB or <C-m> and RET. In the
   ;; terminal, these pairs are generally indistinguishable, so this only works
   ;; in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil

   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used there.
   ;; (default t)
   dotspacemacs-retain-visual-state-on-shift t

   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil) 
   dotspacemacs-visual-line-move-text nil

   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t

   ;; If non nil then the last auto saved layouts are resume automatically upon start.
   ;; (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 3

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   dotspacemacs-max-rollback-slots 5   ;; Maximum number of rollback slots to keep in the cache. (default 5)

   dotspacemacs-helm-resize nil  ;; If non nil, `helm' will try to minimize the space it uses. (default nil)

   dotspacemacs-helm-no-header nil  ;; if non nil, the helm header is hidden when there is only one source. (default nil)

   dotspacemacs-helm-position 'bottom  ;; define the position to display `helm', options are `bottom', `top', `left', or `right'. (default 'bottom)

   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching in all non-asynchronous sources. If set to `source', preserve individual
   dotspacemacs-helm-use-fuzzy 'always    ;; source settings. Else, disable fuzzy matching in all sources. (default 'always)

   ;; If non nil the paste micro-state is enabled. When enabled pressing `p` several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state t

   ;; Which-key delay in seconds. The which-key buffer is the popup listing the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and `right-then-bottom'. right-then-bottom tries to display the frame to the
   dotspacemacs-which-key-position 'bottom                       ;; right; if there is insufficient space it displays it at the bottom. (default 'bottom)

   ;; If non nil a progress bar is displayed when spacemacs is loading. This may increase the boot time on some systems and emacs builds, set it to
   dotspacemacs-loading-progress-bar t                 ;; nil to boost the loading time. (default t)

   dotspacemacs-fullscreen-at-startup nil  ;; If non nil the frame is fullscreen when Emacs starts up. (default nil) (Emacs 24.4+ only)

   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen. Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non nil the frame is maximized when Emacs starts up. Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   dotspacemacs-maximized-at-startup t  ;; (default nil) (Emacs 24.4+ only)

   ;; A value from the range (0..100), in increasing opacity, which describes the transparency level of a frame when it's active or selected.
   dotspacemacs-active-transparency 90             ;; Transparency can be toggled through `toggle-transparency'. (default 90)

   ;; A value from the range (0..100), in increasing opacity, which describes the transparency level of a frame when it's inactive or deselected.
   dotspacemacs-inactive-transparency 90              ;; Transparency can be toggled through `toggle-transparency'. (default 90)

   dotspacemacs-show-transient-state-title t         ;; If non nil show the titles of transient states. (default t)

   dotspacemacs-show-transient-state-color-guide t      ;; If non nil show the color guide hint for transient state keys. (default t)

   dotspacemacs-mode-line-unicode-symbols t            ;; If non nil unicode symbols are displayed in the mode line. (default t)

   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth scrolling overrides the default behavior of Emacs which recenters point
   dotspacemacs-smooth-scrolling t            ;; when it reaches the top or bottom of the screen. (default t)

   ;; Control line numbers activation. If set to `t' or `relative' line numbers are turned on in all `prog-mode' and `text-mode' derivatives.
   ;; If set to `relative', line numbers are relative. This variable can also be set to a property list for finer control:
   ;; '(:relative nil    :disabled-for-modes dired-mode doc-view-mode   markdown-mode org-mode pdf-view-mode text-mode  :size-limit-kb 1000)
   dotspacemacs-line-numbers nil     ;; (default nil)

   dotspacemacs-folding-method 'evil    ;; Code folding method. Possible values are `evil' and `origami'. ;; (default 'evil)

   dotspacemacs-smartparens-strict-mode nil   ;; If non-nil smartparens-strict-mode will be enabled in programming modes. (default nil)

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes over any automatically added closing parenthesis, bracket, quote, etc???
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any', `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   dotspacemacs-persistent-server nil   ;; If non nil, advise quit functions to keep server open when quitting. (default nil)

   ;; List of search tool executable names. Spacemacs uses the first installed tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")   ;; (default '("ag" "pt" "ack" "grep"))

   ;; The default package repository used if no explicit repository has been specified with an installed package. Not used for now. (default nil)
   dotspacemacs-default-package-repository nil

   ;; Delete whitespace while saving buffer. Possible values are `all' to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to delete only whitespace for changed lines or `nil' to disable cleanup.
   dotspacemacs-whitespace-cleanup nil      ;; (default nil)

   )
  )

(defun dotspacemacs/user-init ()
;  (add-to-list 'custom-theme-directory '("~/git/lab/wjd/utils/dotfiles-setup/emacs.d/lisp/"))
;  (add-to-list 'custom-theme-load-path '("~/git/lab/wjd/utils/dotfiles-setup/emacs.d/lisp/"))
 ;; in dotspacemacs/user-init
 '(package-selected-packages
  (quote
    (unfill mwim git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+
     git-gutter flyspell-correct-ivy flyspell-correct diff-hl
     auto-dictionary latex-pretty-symbols zenburn-theme zenburn
     unicode-math-input unicode-input unicode-fonts unicode-escape
     org-journal markdown-mode magit latex-unicode-math-mode intero
     heroku-theme hc-zenburn-theme flatland-theme company-math ag
     julia-mode livid-mode skewer-mode json-mode js2-refactor web-beautify
     simple-httpd json-snatcher json-reformat multiple-cursors js2-mode js-doc
     coffee-mode sass-mode robe racer pos-tip company-web cargo bundler rvm
     ruby-tools ruby-test-mode rubocop rspec-mode rbenv rake minitest chruby
     inf-ruby web-mode tagedit slim-mode scss-mode pug-mode haml-mode emmet-mode
     web-completion-data rust-mode scala-mode latex-pretty-symbols zenburn-theme
     zenburn unicode-math-input unicode-input unicode-fonts unicode-escape
     org-journal markdown-mode magit latex-unicode-math-mode intero heroku-theme
     hc-zenburn-theme flatland-theme company-math)
    )
  )
 (setq custom-file "~/.emacs.d/.cache/.custom-settings")
 (load custom-file)
)
(defun dotspacemacs/user-config ()
;;   "Configuration function for user code. This function is called at the very end of Spacemacs initialization after layers configuration. This is the place where most
;;   of your configurations should be done. Unless it is explicitly specified that a variable should be set before a package is loaded, you should place your code here."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 (setq mac-command-modifier 'meta)

 '(agda2-highlight-coinductive-constructor-face ((t (:foreground "#aaffcc"))))
 '(agda2-highlight-datatype-face ((t (:foreground "light blue"))))
 '(agda2-highlight-field-face ((t (:foreground "#ff99cc"))))
 '(agda2-highlight-function-face ((t (:foreground "#66ccff"))))
 '(agda2-highlight-inductive-constructor-face ((t (:foreground "#ccffaa"))))
 '(agda2-highlight-keyword-face ((t (:foreground "#ffaa00"))))
 '(agda2-highlight-module-face ((t (:foreground "#ffaaff"))))
 '(agda2-highlight-number-face ((t (:foreground "light green"))))
 '(agda2-highlight-postulate-face ((t (:foreground "#ff7766"))))
 '(agda2-highlight-primitive-face ((t (:foreground "#66ccff"))))
 '(agda2-highlight-primitive-type-face ((t (:foreground "light blue"))))
 '(agda2-highlight-record-face ((t (:foreground "light blue"))))
 '(agda2-highlight-string-face ((t (:foreground "#aaffff"))))
 '(package-selected-packages
   '(zenburn-theme yasnippet-snippets yapfify yaml-mode ws-butler writeroom-mode winum which-key wgrep web-mode web-beautify volatile-highlights vim-powerline vim-empty-lines-mode uuidgen use-package unicode-fonts unfill undo-tree treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired toml-mode toc-org tagedit symon symbol-overlay string-inflection string-edit sphinx-doc spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline-all-the-icons spacegray-theme space-doc smex smeargle slim-mode seeing-is-believing scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocopfmt rubocop rspec-mode ron-mode robe restart-emacs request rbenv rake rainbow-delimiters racer quickrun pytest pylookup pyenv-mode pydoc py-isort pug-mode prettier-js popwin poetry pippel pipenv pip-requirements password-generator paradox overseer org-superstar open-junk-file npm-mode nose nodejs-repl nameless mwim multi-line mmm-mode minitest material-theme markdown-toc macrostep lsp-haskell lorem-ipsum livid-mode live-py-mode link-hint json-reformat json-navigator json-mode js2-refactor js-doc ivy-yasnippet ivy-xref ivy-purpose ivy-hydra ivy-avy inspector info+ indent-guide importmagic impatient-mode hybrid-mode hungry-delete holy-mode hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-make hc-zenburn-theme haskell-snippets google-translate golden-ratio gitignore-templates git-timemachine git-modes git-messenger git-link git-gutter-fringe gh-md fuzzy forge font-lock+ flyspell-correct-ivy flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-terminal-cursor-changer evil-surround evil-numbers evil-nerd-commenter evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-evilified-state evil-escape evil-ediff evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu emr emmet-mode elisp-slime-nav elisp-def editorconfig dumb-jump drag-stuff dotenv-mode dired-quick-sort diminish devdocs define-word dante cython-mode counsel-projectile counsel-css company-web company-cabal company-anaconda column-enforce-mode code-cells cmm-mode clean-aindent-mode chruby centered-cursor-mode cargo bundler browse-at-remote blacken auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile attrap async apropospriate-theme ample-theme aggressive-indent ace-link ac-ispell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t))
)

