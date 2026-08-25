;;; export-ox-hugo.el --- Export comparison.org to Markdown with ox-hugo  -*- lexical-binding: t; -*-

(require 'ox-hugo)

(defvar export-dir
  (expand-file-name "published/" (file-name-directory (or load-file-name buffer-file-name)))
  "Output directory for the exported Markdown file.")

(defun export-comparison-to-md ()
  "Export scripts/comparison.org to Markdown using ox-hugo."
  (let* ((script-dir (file-name-directory (or load-file-name buffer-file-name)))
         (org-file (expand-file-name "comparison.org" script-dir))
         (out-dir (expand-file-name "published/" script-dir)))
    (unless (file-directory-p out-dir)
      (make-directory out-dir t))
    (with-current-buffer (find-file-noselect org-file)
      (let ((org-hugo-base-dir (expand-file-name "../exampleSite" script-dir))
            (org-hugo-section "posts")
            (org-hugo-export-with-toc t)
            (org-hugo-export-with-section-numbers nil))
        (org-hugo-export-wim-to-md nil nil nil))
      (kill-buffer))))

(when noninteractive
  (export-comparison-to-md))
