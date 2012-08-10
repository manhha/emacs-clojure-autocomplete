(add-to-list 'load-path "C:/emacs/.emacs.d/")
(require 'clojure-mode) 

(require 'package)
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
;; Add the user-contributed repository
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;; START: AUTO COMPLETE CLOJURE   
;; auto complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(setq ac-delay 0.5) ;; eclipse uses 500ms
 
;; configure auto complete to work in slime
(add-to-list 'load-path "~/.emacs.d/ac-slime")
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
;; END: AUTO COMPLETE CLOJURE   

;; START: CHANGE AUTOSAVE DIRECTORY
;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/temp/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/temp/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/temp/backups/"))))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/temp/autosaves/" t)
;; END: CHANGE AUTOSAVE DIRECTORY