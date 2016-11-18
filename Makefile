EMACS=emacs

# VERSION=$(shell cat mafia.el | sed -n 's/^;; Version: \(.*\)/\1/p')
# GIT_COMMIT=$(git log --pretty=format:%H -n 1)

SOURCE=mafia.el
COMPILED=mafia.elc

all: $(COMPILED)

$(COMPILED): $(SOURCE)
	$(EMACS) -q -no-site-file -no-init-file -batch -f batch-byte-compile $<

.PHONY: clean

clean:
	rm -f $(COMPILED)
