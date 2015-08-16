(("marmalade" . "http://marmalade-repo.org/packages/") ("melpha" . "http://melpha.milkbox.net/packages/") ("org" . "http://orgmode.org/elpa/") ("gnu" . "http://elpa.gnu.org/packages/"))(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))


(setq package-archives '(("melpha" . "http://melpha.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(require 'package)
(package-initialize)
