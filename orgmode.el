;; org mode
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Set to the location of your Org files on your local system
(setq org-directory "~/Dropbox/org")
(setq org-agenda-files (list "~/Dropbox/org/"))
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Dropbox/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

;; Collect all .org from my Org directory and subdirs
(setq org-agenda-file-regexp "\\`[^.].*\\.org\\'") ; default value
(defun load-org-agenda-files-recursively (dir) "Find all directories in DIR."
    (unless (file-directory-p dir) (error "Not a directory `%s'" dir))
    (unless (equal (directory-files dir nil org-agenda-file-regexp t) nil)
      (add-to-list 'org-agenda-files dir)
    )
    (dolist (file (directory-files dir nil nil t))
        (unless (member file '("." ".."))
            (let ((file (concat dir file "/")))
                (when (file-directory-p file)
		  (load-org-agenda-files-recursively file))))))
;; Call this to update agenda files recursively
(load-org-agenda-files-recursively "~/Dropbox/org/" ) ; trailing slash required
