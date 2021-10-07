all: css boards

css:
	curl -sS https://offbeatcc.github.io/css/main.css -o main.css

boards: FORCE
	sbcl --script boards.lisp
	cat boards/index.html

code: FORCE
	for f in code/*.py; do python3 "$$f" > "$${f%.py}.out.txt"; done

pub: all
	git diff --exit-code
	git push
	cd ../offbeat && make pub

FORCE:
