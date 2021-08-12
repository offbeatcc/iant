(require "asdf")

(defvar *titles*
  '(:begin t
    :c02 "Arithmetical Functions and Dirichlet Multiplication"
    :c02-s11 "The Inverse of a Completely Multiplicative Function"
    :c02-s12 "Liouville's Function $ \\lambda(n) $"
    :c02-s13 "The Divisor Functions $ \\sigma_{\\alpha}(n) $"
    :c02-s14 "Generalized Convolutions"
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
    :c05-s05 "Polynomial Congruences Modulo $ p $. Lagrange's Theorem"
    :c05-s06 "Applications of Lagrange's Theorem"
    :c05-s07 "Simultaneous Linear Congruences. The Chinese Remainder Theorem"
    :c05-s08 "Applications of the Chinese Remainder Theorem"
    :c05-s09 "Polynomial Congruences With Prime Power Moduli"
    :c05-s10 "The Principle of Cross-Classification"
    :c05-s11 "A Decomposition Property of Reduced Residue Systems"
    :c06 "Finite Abelian Groups and Their Characters"
    :c06-s01 "Definitions"
    :c06-s02 "Examples of Groups and Subgroups"
    :c06-s03 "Elementary Properties of Groups"
    :c06-s04 "Construction of Subgroups"
    :c06-s05 "Characters of Finite Abelian Groups"
    :c06-s06 "The Character Group"
    :c06-s07 "The Orthogonality Relations for Characters"
    :c06-s08 "Dirichlet Characters"
    :c06-s09 "Sums Involving Dirichlet Characters"
    :c06-s10 "The Nonvanishing of $ L(1, \\chi) $ for Real Nonprincipal $ \\chi $"
    :c07 "Dirichlet's Theorem on Primes in Arithmetical Progressions"
    :c07-s01 "Introduction"
    :c07-s02 "Dirichlet's Theorem for Primes of the Form $ 4n - 1 $ and $ 4n + 1"
    :c07-s03 "The Plan of the Proof of Dirichlet's Theorem"
    :c07-s04 "Proof of Lemma 7.4"
    :c07-s05 "Proof of Lemma 7.5"
    :c07-s06 "Proof of Lemma 7.6"
    :c07-s07 "Proof of Lemma 7.8"
    :c07-s08 "Proof of Lemma 7.7"
    :c07-s09 "Distribution of Primes in Arithmetic Progressions"
    :c08 "Periodic Arithmetical Functions and Gauss Sums"
    :c08-s01 "Functions Periodic Modulo $ k $"
    :c08-s02 "Existence of Finite Fourier Series for Periodic Arithmetical Functions"
    :c08-s03 "Ramanujan's Sum and Generalizations"
    :c08-s04 "Multiplicative Properties of the Sums $ s_k(n) $"
    :c08-s05 "Gauss Sums Associated with Dirichlet Characters"
    :c08-s06 "Dirichlet Characters with Nonvanishing Gauss Sums"
    :c08-s07 "Induced Modulii and Primitive Characters"
    :c08-s08 "Further Properties of Induced Moduli"
    :c08-s09 "The Conductor of a Character"
    :c08-s10 "Primitive Characters and Separable Gauss Sums"
    :c08-s11 "The Finite Fourier Series of the Dirichlet Characters"
    :c08-s12 "Polya's Inequality for the Partial Sums of Primitive Characters"
    :c09 "Quadratic Residues and the Quadratic Reciprocity Law"
    :c09-s01 "Quadratic Residues"
    :c09-s02 "Legendre's Symbol and its Properties"
    :c09-s03 "Evaluation of $ (-1 \\mid p) $ and $ (2 \\mid p) $"
    :c09-s04 "Gauss' Lemma"
    :c09-s05 "The Quadratic Reciprocity Law"
    :c09-s06 "Applications of the Reciprocity Law"
    :c09-s07 "The Jacobi Symbol"
    :c09-s08 "Applications to Diophantine Equations"
    :c09-s09 "Gauss Sums and the Quadratic Reciprocity Law"
    :c09-s10 "The Reciprocity Law for Quadratic Gauss Sums"
    :c09-s11 "Another Proof of the Quadratic Reciprocity Law"
    :c10 "Primitive Roots"
    :c10-s01 "The Exponent of a Number $ \\bmod m $"
    :c10-s02 "Primitive Roots and Reduced Residue Systems"
    :c10-s03 "The Nonexistence of Primitive Roots $ \\bmod 2^{\\alpha} $ for $ \\alpha ge 3 $"
    :c10-s04 "The Existence of Primitive Roots $ \\bmod p $ for Odd Primes $ p $"
    :c10-s05 "Primitive Roots and Quadratic Residues"
    :c10-s06 "The Existence of Primitive Roots $ \\bmod p^{\alpha} $"
    :c10-s07 "The Existence of Primitive Roots $ \\bmod 2p^{\alpha} $"
    :c10-s08 "The Nonexistence of Primitive Roots in the Remaining Cases"
    :c10-s09 "The Number of Primitive Roots $ \bmod m $"
    :c10-s10 "The Index Calculus"
    :c10-s11 "Primitive Roots and Dirichlet Characters"
    :c10-s12 "Real-Valued Dirichlet Characters $ \\bmod p^{\alpha} $"
    :c10-s13 "Primitive Dirichlet Characters $ \\bmod p^{\alpha} $"
    :c11 "Dirichlet Series and Euler Products"
    :c11-s01 "Introduction"
    :c11-s02 "The Half-Plane of Absolute Convergence of a Dirichlet Series"
    :c11-s03 "The Function Defined by a Dirichlet Series"
    :c11-s04 "Multiplication of Dirichlet Series"
    :c11-s05 "Euler Products"
    :c11-s06 "The Half-Plane of Convergence of a Dirichlet Series"
    :c11-s07 "Analytic Properties of Dirichlet Series"
    :c11-s08 "Dirichlet Series with Nonnegative Coefficients"
    :c11-s09 "Dirichlet Series Expressed as Exponentials of Dirichlet Series"
    :c11-s10 "Mean Value Formulas for Dirichlet Series"
    :c11-s11 "An Integral Formula for the Coefficients of a Dirichlet Series"
    :c11-s12 "An Integral Formula for the Partial Sums of a Dirichlet Series"
    :c12 "The Functions $ \\zeta(s) $ and $ L(s, \\chi) $"
    :c12-s01 "Introduction"
    :c12-s02 "Properties of the Gamma Function"
    :c12-s03 "Integral Representation for the Hurwitz Zeta Function"
    :c12-s04 "A Contour Integral Representation for the Hurwitz Zeta Function"
    :c12-s05 "The Analytic Continuation of the Hurwitz Zeta Function"
    :c12-s06 "Analytic Continuation of $ \\zeta(s) $ and $ L(s, \\chi) $"
    :c12-s07 "Hurwitz's Formula for $ \\zeta(s, a) $"
    :c12-s08 "The Functional Equation for the Riemann Zeta Function"
    :c12-s09 "A Functional Equation for the Hurwitz Zeta Function"
    :c12-s10 "The Functional Equation for L-Functions"
    :c12-s11 "Evaluation of $ \\zeta(-n, a) $$"
    :c12-s12 "Properties of Bernoulli Numbers and Bernoulli Polynomials"
    :c12-s13 "Formulas for $ L(0, \\chi) $"
    :c12-s14 "Approximation of $ \\zeta(s, a) $ by Finite Sums"
    :c12-s15 "Inequalities for $ \\lvert \\zeta(s, a) \\rvert $"
    :c12-s16 "Inequalities for $ \\lvert \\zeta(s) \\rvert $ and $ \\lvert L(s, \\chi) \\rvert $"
    :end t))

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
  (sort (directory "boards/c*.html") #'string-lessp :key #'namestring))

(defun chapter-num (chapter-key)
  "Given a chapter or section key, return the chapter number as a string."
  (string-left-trim "0" (subseq chapter-key 1 3)))

(defun section-num (section-key)
  "Given a section key, return section number as string."
  (format nil "~a.~a"
          (chapter-num section-key)
          (string-left-trim "0" (subseq section-key 5 7))))

(defun spaces (num)
  "Return a string consisting of num spaces."
  (make-string num :initial-element #\space))

(defun add-chapter-html (chapters-html new-chapter-key new-sections-html)
  "Add HTML for a new chapter to chapters-html."
  (format nil "~a~a<li id=\"~a\"><strong>Chapter ~a: ~a</strong><a href=\"#~a\"></a>~%~a<ul>~%~a~a</ul>~%~a</li>~%"
          chapters-html
          (spaces 6)
          new-chapter-key
          (chapter-num new-chapter-key)
          (get-title new-chapter-key)
          new-chapter-key
          (spaces 8)
          new-sections-html
          (spaces 8)
          (spaces 6)))

(defun add-section-html (sections-html new-section-key new-boards-html)
  "Add HTML for a new section to sections-html."
  (format nil "~a~a<li id=\"~a\">&sect; ~a: ~a<a href=\"#~a\"></a>~%~a<ul>~%~a~a</ul>~%~a</li>~%"
          sections-html
          (spaces 10)
          new-section-key
          (section-num new-section-key)
          (get-title new-section-key)
          new-section-key
          (spaces 12)
          new-boards-html
          (spaces 12)
          (spaces 10)))

(defun add-board-html (boards-html board-key filename filepath)
  "Add HTML for a new board to boards-html."
  (format nil "~a~a<li id=\"~a\"><a href=\"~a\">~a</a></li>~%"
          boards-html
          (spaces 14)
          board-key
          filename
          (read-page-title filepath)))

(defun make-chapter-list-html ()
  "Create HTML for a list of chapters that can be inserted into index.html."
  (let (previous-chapter-key
        (previous-section-key)
        (filename)
        (filepath)
        (chapter-key)
        (section-key)
        (board-key)
        (chapters-html "")
        (sections-html "")
        (boards-html ""))

    ;; For each board file path, create HTML.
    (dolist (path (board-file-list))
      (format t "Found ~a ...~%" path)

      ;; Extract filename, chapter key, and section key from board file path.
      (setf filename (file-namestring path))
      (setf filepath (format nil "boards/~a" filename))
      (setf chapter-key (subseq filename 0 3))
      (setf section-key (subseq filename 0 7))
      (setf board-key (subseq filename 0 11))

      ;; Set chapter and section keys to that of first chapter and section.
      (unless previous-chapter-key
        (setf previous-chapter-key chapter-key)
        (setf previous-section-key section-key))

      ;; Accumulate HTML for previous section when a new section is found.
      (when (string/= previous-section-key section-key)
        (setf sections-html
              (add-section-html sections-html previous-section-key boards-html))
        (setf boards-html ""))

      ;; Accumulate HTML for previous section when a new chapter is found.
      (when (string/= previous-chapter-key chapter-key)
        (setf chapters-html
              (add-chapter-html chapters-html previous-chapter-key sections-html))
        (setf sections-html ""))

      ;; Accmulate HTML for current board.
      (setf boards-html (add-board-html boards-html board-key filename filepath))

      (setf previous-chapter-key chapter-key)
      (setf previous-section-key section-key))

    ;; Accumulate HTML for last section.
    (setf sections-html
          (add-section-html sections-html section-key boards-html))

    ;; Accumulate HTML for last chapter.
    (setf chapters-html
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
         (current-index-html (uiop:read-file-string "boards/index.html"))
         (updated-index-html (replace-string current-index-html
                                             "    <!-- begin chapters -->"
                                             "    <!-- end chapters -->"
                                             chapter-list-html)))
    (write-file-string "boards/index.html" updated-index-html)))


(main)
