;; emacs-vendor.el - general purpose modes to extend emacs
(load-lib-dir "vendor")

;; Interactively Do Things (ido) emacs is more fun with ido fo real
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; Unbound - describe-unbound-keys
(require 'unbound)

;; Mode Compile
(autoload 'mode-compile "mode-compile"
  "Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cc" 'mode-compile)
(autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)

(require 'el-expectations)

;; Magit
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

;; Textile
(require 'textile-mode)
(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))

;; Zen Coding
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes

;; Javascript (espresso)
(autoload 'espresso-mode "espresso" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))
(setq espresso-indent-level 2)

;; Cheat - for using cheat.errtheblog.com for some reference
(require 'cheat)

;; Gist - learn to use this within emacs and it WILL help you
;; it will use your ~/.gitconfig if it finds one
;; see: http://github.com/blog/180-local-github-config
(require 'gist)

;; Scala
(load-lib-dir "vendor/scala-mode")
(require 'scala-mode)
(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
(add-hook 'scala-mode-hook
  '(lambda ()
     (yas/minor-mode-on)))

;; PHP
(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.php" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc" . php-mode))

;; Twitter
(require 'twitter)

;; Clojure
(load-lib-dir "vendor/clojure-mode")
(require 'clojure-mode)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

;; Markdown
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))
