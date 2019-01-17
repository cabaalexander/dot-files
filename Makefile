# vim: ts=8:sw=8

#############
#           #
# Constants #
#           #
#############

SYM_OUT		:= "${HOME}/.dots/symlink-dst-paths.out"

# `Main Paths`
# ============
HOME_DIST	:= ${HOME}
DOTS_PATH	:= ${PWD}/dots
SECRETS_PATH	:= ${PWD}/secrets

# `secrets`
# =========
SECRETS_IGNORE	:= ! -name ".git" ! -name "Session.vim"
SECRETS_SRC	:= $(shell find $(SECRETS_PATH) -type f $(SECRETS_IGNORE))
SECRETS_OUT	:= $(patsubst $(SECRETS_PATH)/%,$(HOME_DIST)/%,$(SECRETS_SRC))

# `SHs`
# =====
SH_FILES	:= $(shell ${PWD}/config/utils/find-sh-files.sh)

# `dots`
# ======
DOTS_IGNORE	:= ! -path "*plugged/*" ! -name "Session.vim"
DOTS_SRC	:= $(shell find $(DOTS_PATH) -type f $(DOTS_IGNORE))
DOTS_OUT	:= $(patsubst $(DOTS_PATH)/%,$(HOME_DIST)/%,$(DOTS_SRC))

# `clean`
# =======
CLEAN_SRC	:= $(shell cat $(SYM_OUT) 2> /dev/null)

#############
#           #
# Functions #
#           #
#############

define do_symlink
	@mkdir -p $(dir $(1))
	@ln -sf $(2) $(1)
	@#Last symlinks (For cleaning porpuse) ¯\_(ツ)_/¯
	@[ -f $(SYM_OUT) ] || touch $(SYM_OUT)
	@echo $(1).clean >> $(SYM_OUT)
endef

#########
#       #
# RuleZ #
#       #
#########

.PHONY: all
all: bootstrap

.PHONY: install
install: symlink
	@./install.sh

.PHONY: bootstrap
bootstrap:
	@git submodule update --init
	@${PWD}/config/utils/change-git-protocol.sh \
		.git/modules/dots/.config/nvim/config \
		.git/modules/dots/.secrets/config

.PHONY: make-dots
make-dots:
	@mkdir -p ${HOME}/.dots

.PHONY: symlink
symlink: symlink-dots symlink-secrets

.PHONY: symlink-secrets
symlink-secrets: make-dots $(SECRETS_OUT)
	@echo "secrets linked..."
$(HOME_DIST)/%: $(SECRETS_PATH)/%
	$(call do_symlink,$@,$<)

.PHONY: symlink-dots
symlink-dots: make-dots $(DOTS_OUT)
	@echo "dots linked..."
$(HOME_DIST)/%: $(DOTS_PATH)/%
	$(call do_symlink,$@,$<)

.PHONY: symlink-update
symlink-update: clean symlink

.PHONY: clean
clean: $(CLEAN_SRC) post-clean
	@echo "Links deleted..."
$(HOME_DIST)/%.clean:
	@sed 's/.clean//' <<<"$@" \
		| xargs rm -rf

.PHONY: post-clean
post-clean:
	@rm -f $(SYM_OUT)

.PHONY: test
test:
	@shellcheck $(SH_FILES)

.PHONY: test-fix
test-fix:
	@shellcheck $(SH_FILES) \
		| grep "^In" \
		| cut -d' ' -f2 \
		| xargs nvim

.PHONY: log
log:
	@less ~/.dots/install-status.log

