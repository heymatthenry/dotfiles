;;; Custom configurations
(global-set-key [(meta spc)] 'set-mark)

;; Use command as meta
(setq ns-command-modifier 'meta) ;carbon
(setq mac-command-modifier 'meta) ;Aquamacs

;; Define fullscreen command
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                           'fullboth)))
(global-set-key [M-ret] 'fullscreen)

;; Theme
(color-theme-merbivore)

;; unindent
(defun unindent-block()
  (shift-region (- my-tab-width))
  (setq deactivate-mark nil))

(global-set-key [C-M-tab] 'unindent-block)
;; init.el end

;; Twitter
(autoload 'twitter-get-friends-timeline "twitter" nil t)
(autoload 'twitter-status-edit "twitter" nil t)
(global-set-key "\C-xt" 'twitter-get-friends-timeline)
(add-hook 'twitter-status-edit-mode-hook 'longlines-mode)

;; Sync kill ring with OSX clipboard
(global-set-key (kbd "C-w") 'clipboard-kill-region)
(global-set-key (kbd "M-w") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-y") 'clipboard-yank)

;; Autosave files in their own directory
(defvar user-temporary-file-directory
  (concat temporary-file-directory user-login-name "/"))
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (,tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))