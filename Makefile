DIR_PATTERN := (news|talk|tech)
NAME_PATTERN := [0-9]{8} [a-zA-Z0-9_.,() -]*\.md

RULES := rule-source-added \
	 rule-translation-requested \
	 rule-translation-completed \
	 rule-translation-revised \
	 rule-translation-published
.PHONY: check match $(RULES)

CHANGE_FILE := /tmp/changes

check: $(CHANGE_FILE)
	echo 'PR #$(TRAVIS_PULL_REQUEST) Changes:'
	cat $(CHANGE_FILE)
	echo
	echo 'Check for rules...'
	make -k $(RULES) 2>/dev/null | grep '^Rule Matched: '

$(CHANGE_FILE):
	git --no-pager diff $(TRAVIS_BRANCH) FETCH_HEAD --no-renames --name-status > $@

rule-source-added:
	echo 'Unmatched Files:'
	egrep -v '^A\s*"?sources/$(DIR_PATTERN)/$(NAME_PATTERN)"?' $(CHANGE_FILE) || true
	echo '[End of Unmatched Files]'
	[ $(shell egrep    '^A\s*"?sources/$(DIR_PATTERN)/$(NAME_PATTERN)"?' $(CHANGE_FILE) | wc -l) -ge 1 ]
	[ $(shell egrep -v '^A\s*"?sources/$(DIR_PATTERN)/$(NAME_PATTERN)"?' $(CHANGE_FILE) | wc -l) = 0 ]
	echo 'Rule Matched: $(@)'

rule-translation-requested:
	[ $(shell egrep    '^M\s*"?sources/$(DIR_PATTERN)/$(NAME_PATTERN)"?' $(CHANGE_FILE) | wc -l) = 1 ]
	[ $(shell cat $(CHANGE_FILE) | wc -l) = 1 ]
	echo 'Rule Matched: $(@)'

rule-translation-completed:
	[ $(shell egrep    '^D\s*"?sources/$(DIR_PATTERN)/$(NAME_PATTERN)"?' $(CHANGE_FILE) | wc -l) = 1 ]
	[ $(shell egrep '^A\s*"?translated/$(DIR_PATTERN)/$(NAME_PATTERN)"?' $(CHANGE_FILE) | wc -l) = 1 ]
	[ $(shell cat $(CHANGE_FILE) | wc -l) = 2 ]
	echo 'Rule Matched: $(@)'

rule-translation-revised:
	[ $(shell egrep '^M\s*"?translated/$(DIR_PATTERN)/$(NAME_PATTERN)"?' $(CHANGE_FILE) | wc -l) = 1 ]
	[ $(shell cat $(CHANGE_FILE) | wc -l) = 1 ]
	echo 'Rule Matched: $(@)'

rule-translation-published:
	[ $(shell egrep '^D\s*"?translated/$(DIR_PATTERN)/$(NAME_PATTERN)"?' $(CHANGE_FILE) | wc -l) = 1 ]
	[ $(shell egrep '^A\s*"?published/$(NAME_PATTERN)' $(CHANGE_FILE) | wc -l) = 1 ]
	[ $(shell cat $(CHANGE_FILE) | wc -l) = 2 ]
	echo 'Rule Matched: $(@)'
