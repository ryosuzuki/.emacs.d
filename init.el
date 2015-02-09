;;(set-face-foreground 'font-lock-string-face "#75715E")
(set-face-foreground 'font-lock-comment-face "black")

;; Load Files
;; (add-to-list 'load-path "~/.emacs.d/lisp")
(setq load-path (cons "~/.emacs.d/elisp" load-path))

(package-initialize)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)


;;(require 'anything-startup)
;;(require 'popwin)
;;(setq display-buffer-function 'popwin:display-buffer)

;;(require 'auto-complete)
;;(require 'auto-complete-config)
;;(global-auto-complete-mode t)
 
;;(when (eq system-type 'darwin)
;;  (setq ns-command-modifier (quote meta)))



(global-set-key (kbd "C-x C-l") 'linum-mode)
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(when (and (executable-find "cmigemo")
	   (require 'migemo nil t))
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  (migemo-init)
  )
(setq migemo-command "/usr/local/bin/cmigemo")
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")

;; Multiple Cursor
(require 'multiple-cursors)
(require 'smartrep)
(declare-function smartrep-define-key "smartrep")
(global-set-key (kbd "C-M-c") 'mc/edit-lines)
(global-set-key (kbd "C-M-r") 'mc/mark-all-in-region)
(global-unset-key "\C-t")
(smartrep-define-key
 global-map "C-t"
 '(("C-t"      . 'mc/mark-next-like-this)
   ("n"        . 'mc/mark-next-like-this)
   ("p"        . 'mc/mark-previous-like-this)
   ("m"        . 'mc/mark-more-like-this-extended)
   ("u"        . 'mc/unmark-next-like-this)
   ("U"        . 'mc/unmark-previous-like-this)
   ("s"        . 'mc/skip-to-next-like-this)
   ("S"        . 'mc/skip-to-previous-like-this)
   ("*"        . 'mc/mark-all-like-this)
   ("d"        . 'mc/mark-all-like-this-dwim)
   ("i"        . 'mc/insert-numbers)
   ("o"        . 'mc/sort-regions)
   ("O"        . 'mc/reverse-regions)))


;; Line Number
(column-number-mode t)
(line-number-mode t)

;; Encoding
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


;; Backup Files
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq backup-inhibited t)


;; Highlighting
(show-paren-mode t)
(transient-mark-mode t)


;; Auto Complete

;; Other Settings
(setq inhibit-startup-message t)
(global-set-key "\C-h" 'backward-delete-char)

(setq indent-level 2)
(setq tab-width 2)


;; Python Mode
(add-hook 'python-mode-hook
          '(lambda()
             (setq indent-tabs-mode t)
             (setq indent-level 2)
             (setq python-indent 2)
             (setq tab-width 2)))


;; CSS Mode
(setq css-indent-offset 2)


;; JavaScript Mode
(setq js-indent-level 2)

;; CoffeeScript Mode
(add-hook 'coffee-mode-hook
	  '(lambda() 
	     (set (make-local-variable 'tab-width) 2)
	     (setq coffee-tab-width 2)))

;; Haml Mode
(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))


;; Sass Mode
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))


;; Scss Mode
(require 'scss-mode)
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))
(add-hook 'scss-mode-hook
          '(lambda()
             (setq css-indent-offset 2)
             (setq scss-compile-at-save nil)))

;; Yaml Mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))


;; Jade Mode
(require 'sws-mode)
(require 'jade-mode)  
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode)) 
(put 'upcase-region 'disabled nil)


;; Markdown Mode
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.text$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))


;; Web Mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook 'web-mode-hook)


