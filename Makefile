all: iant boards

iant:
	curl -sS https://offbeatcc.github.io/css/main.css -o css/main.css

boards: FORCE
	sbcl --script boards.lisp
	cat boards/index.html

FORCE:
