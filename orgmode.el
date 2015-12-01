;; org mode
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Set to the location of your Org files on your local system
(setq org-directory "~/Dropbox/org")
(setq org-agenda-files (list "~/Dropbox/org/"))
;; Eval to update org-agenda-files
(add-to-list 'org-agenda-files (expand-file-name "~/Dropbox/org"))
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Dropbox/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
