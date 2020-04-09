#
# gfe: git fetch script
# https://github.com/lptstr/gfe
#
# (c) Kiëd Llaentenn
# See the COPYING file for more information
#

.POSIX:

CMD    =

BIN    = gfe
OBJDIR = bin

CHMOD  = $(shell which chmod)
M4     = $(shell which m4)
RM     = $(shell which rm)

all: bin/$(BIN)

clean:
	$(CMD)$(RM) -rf $(OBJDIR)

$(OBJDIR):
	$(CMD)mkdir -p $(OBJDIR)

$(OBJDIR)/$(BIN): $(OBJDIR) src/$(BIN).m4
	cd src && \
		$(CMD)$(M4) $(BIN).m4 > ../$(OBJDIR)/$(BIN)
	$(CMD)$(CHMOD) +x $(OBJDIR)/$(BIN)

run:
	@$(OBJDIR)/$(BIN)

.PHONY: all clean run
