(require "asdf")

(defvar *titles*
  '(:begin ""
    :c02 "Arithmetical Functions and Dirichlet Multiplication"
    :c02-s15 "Formal Power Series"
    :c02-s16 "The Bell Series of an Arithmetical Function"
    :c02-s17 "Bell Series and Dirichlet Multiplication"
    :c02-s18 "Derivatives of Arithmetical Functions"
    :c03 "Averages of Arithmetical Functions"
    :c03-s03 "Euler's Summation Formula"
    :c03-s04 "Some Elementary Asymptotic Formulas"
    :c03-s05 "The Average Order of $ d(n) $"
    :c03-s11 "Applications to $ \\mu(n) $ and $ \\Lambda(n) $"
    :c03-s12 "Another Identity for the Partial Sums of a Dirichlet Product"
    :c04 "Some Elementary Theorems on the Distribution of Prime Numbers"
    :c04-s02 "Chebyshev's Functions $ \\psi(x) $ and $ \\vartheta(x) $"
    :c04-s03 "Relations Connecting $ \\vartheta(x) $ and $ \\pi(x) $"
    :c04-s04 "Some Equivalent Forms of the Prime Number Theorem"
    :c04-s05 "Inequalities for $ \\pi(n) $ and $ p_n $"
    :c04-s06 "Shapiro's Tauberian Theorem"
    :c04-s08 "An Asymptotic Formula for the Partial Sums $ \\sum_{p \le x} (1/p) $"
    :c04-s09 "The Partial Sums of the Möbius Function"
    :c05 "Congruences"
    :c05-s01 "Definition and Basic Properties of Congruences"
    :c05-s02 "Residue Classes and Complete Residue Systems"
    :c05-s03 "Linear Congruences"
    :c05-s04 "Reduced Residue Systems and the Euler-Fermat Theorem"
    :c05-s05 "Polynomial Congruences Modulo \( p \). Lagrange's Theorem"
    :c05-s06 "Applications of Lagrange's Theorem"
    :c05-s07 "Simultaneous Linear Congruences. The Chinese Remainder Theorem"
    :c05-s08 "Applications of the Chinese Remainder Theorem"
    :c05-s09 "Polynomial Congruences With Prime Power Moduli"
    :c05-s10 "The Principle of Cross-Classification"
    :c05-s11 "A Decomposition Property of Reduced Residue Systems"
    :end ""))

(defun extract-string (string start-token end-token)
  "Extract string between start-token and end-token."
  (let* ((start-index (+ (search start-token string) (length start-token)))
         (end-index (search end-token string :start2 start-index)))
    (subseq string start-index end-index)))

(defun replace-string (string start-token end-token replacement-string)
  "Replace text between start-token and end-token with replacement-string."
  (let* ((start-index (+ (search start-token string) (length start-token)))
         (end-index (search end-token string :start2 start-index)))
    (concatenate 'string
                 (subseq string 0 start-index)
                 replacement-string
                 (subseq string end-index (length string)))))

(defun get-title (key)
  "Read title for the specified key as a string."
  (getf *titles* (intern (string-upcase key) :keyword)))

(defun read-page-title (path)
  "Read content of <title> element from the given HTML page."
  (extract-string (uiop:read-file-string path) "<title>" "</title>"))

(defun board-file-list ()
  "Return the list of board HTML files in the current directory."
  (sort (directory "c*.html") #'string-lessp :key #'namestring))

(defun chapter-num (chapter-key)
  "Given a chapter or section key, return the chapter number as a string."
  (string-trim "0" (subseq chapter-key 1 3)))

(defun section-num (section-key)
  "Given a section key, return section number as string."
  (format nil "~a.~a"
          (chapter-num section-key)
          (string-trim "0" (subseq section-key 5 7))))

(defun spaces (num)
  "Return a string consisting of num spaces."
  (make-string num :initial-element #\space))

(defun add-chapter-html (chapters-html new-chapter-key new-sections-html)
  "Add HTML for a new chapter to chapters-html."
  (format nil "~a~a<li><strong>Chapter ~a: ~a~%~a</strong><ul>~%~a~a</ul>~%~a</li>~%"
          chapters-html
          (spaces 6)
          (chapter-num new-chapter-key)
          (get-title new-chapter-key)
          (spaces 8)
          new-sections-html
          (spaces 8)
          (spaces 6)))

(defun add-section-html (sections-html new-section-key new-boards-html)
  "Add HTML for a new section to sections-html."
  (format nil "~a~a<li>&sect; ~a: ~a~%~a<ul>~%~a~a</ul>~%~a</li>~%"
          sections-html
          (spaces 10)
          (section-num new-section-key)
          (get-title new-section-key)
          (spaces 12)
          new-boards-html
          (spaces 12)
          (spaces 10)))

(defun add-board-html (boards-html filename)
  "Add HTML for a new board to boards-html."
  (format nil "~a~a<li><a href=\"~a\">~a</a></li>~%"
          boards-html
          (spaces 14)
          filename
          (read-page-title filename)))

(defun make-chapter-list-html ()
  "Create HTML for a list of chapters that can be inserted into index.html."
  (let (previous-chapter-key
        previous-section-key
        filename
        chapter-key
        section-key
        (chapters-html "")
        (sections-html "")
        (boards-html ""))

    ;; For each board file path, create HTML.
    (dolist (path (board-file-list))
      (format t "Found ~a ...~%" path)

      ;; Extract filename, chapter key, and section key from board file path.
      (setq filename (file-namestring path))
      (setq chapter-key (subseq filename 0 3))
      (setq section-key (subseq filename 0 7))

      ;; Set chapter and section keys to that of first chapter and section.
      (unless previous-chapter-key
        (setq previous-chapter-key chapter-key)
        (setq previous-section-key section-key))

      ;; Accumulate HTML for previous section when a new section is found.
      (when (string/= previous-section-key section-key)
        (setq sections-html
              (add-section-html sections-html previous-section-key boards-html))
        (setq boards-html ""))

      ;; Accumulate HTML for previous section when a new chapter is found.
      (when (string/= previous-chapter-key chapter-key)
        (setq chapters-html
              (add-chapter-html chapters-html previous-chapter-key sections-html))
        (setq sections-html ""))

      ;; Accmulate HTML for current board.
      (setq boards-html (add-board-html boards-html filename))

      (setq previous-chapter-key chapter-key)
      (setq previous-section-key section-key))

    ;; Accumulate HTML for last section.
    (setq sections-html
          (add-section-html sections-html section-key boards-html))

    ;; Accumulate HTML for last chapter.
    (setq chapters-html
          (add-chapter-html chapters-html chapter-key sections-html))

    ;; Complete HTML list markup for chapter list.
    (format nil "~%    <ul>~%~a    </ul>~%" chapters-html)))

(defun write-file-string (pathname content)
  "Write given content to a file."
  (with-open-file (f pathname :direction :output :if-exists :supersede)
    (format f "~a" content)))

(defun main ()
  "Update index.html."
  (let* ((chapter-list-html (make-chapter-list-html))
         (current-index-html (uiop:read-file-string "index.html"))
         (updated-index-html (replace-string current-index-html
                                             "    <!-- begin chapters -->"
                                             "    <!-- end chapters -->"
                                             chapter-list-html)))
    (write-file-string "index.html" updated-index-html)))


(main)
