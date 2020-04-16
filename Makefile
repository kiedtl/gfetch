#
# gfe: git fetch script
# https://github.com/lptstr/gfe
#
# (c) Kiëd Llaentenn
# See the COPYING file for more information
#

.POSIX:

CMD       =

PREFIX    = /usr/local
DESTDIR   =

BIN       = gfe
OBJDIR    = bin

CAT       = $(shell which cat)
CHMOD     = $(shell which chmod)
RM        = $(shell which rm)
INSTALL   = $(shell which install)

SRC       = lib/human.sh \
	    src/commits.sh src/created.sh src/head.sh \
	    src/project.sh src/srcsize.sh src/user.sh \
	    src/latest.sh src/authors.sh src/gitver.sh \
	    src/upstream.sh \
	    src/defconfig.sh src/showinfo.sh src/ascii.sh \
	    src/main.sh

all: bin/$(BIN)

clean:
	$(CMD)$(RM) -rf $(OBJDIR)

$(OBJDIR):
	$(CMD)mkdir -p $(OBJDIR)

$(OBJDIR)/$(BIN): $(OBJDIR) $(SRC)
	$(CMD)echo "#!/bin/sh\n# gfe: git fetch\n\n" | \
		$(CAT) - $(SRC) > $(OBJDIR)/$(BIN)
	$(CMD)$(CHMOD) +x $(OBJDIR)/$(BIN)

run:
	@$(OBJDIR)/$(BIN)

install: $(OBJDIR)/$(BIN)
	$(CMD)$(INSTALL) -Dm755 $(OBJDIR)/$(BIN) \
		$(DESTDIR)/$(PREFIX)/bin/$(BIN)

uninstall:
	$(CMD)$(RM) -f $(DESTDIR)/$(PREFIX)/bin/$(BIN)

.PHONY: all clean $(OBJDIR)/$(BIN) run install uninstall
