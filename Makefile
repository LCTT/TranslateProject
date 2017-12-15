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
	git --no-pager diff '$(TRAVIS_PULL_REQUEST_BRANCH)' FETCH_HEAD --no-renames --name-status > $@

rule-source-added:
	[[ $(shell grep '^A\s\+sources/' $(CHANGE_FILE) | wc -l) -ge 1 ]]
	echo 'Rule Matched: $(@)'

rule-translation-requested:
	[[ $(shell grep '^M\s\+sources/' $(CHANGE_FILE) | wc -l) = 1 ]]
	echo 'Rule Matched: $(@)'

rule-translation-completed:
	[[ $(shell grep '^D\s\+sources/' $(CHANGE_FILE) | wc -l) = 1 ]]
	[[ $(shell grep '^A\s\+translated/' $(CHANGE_FILE) | wc -l) = 1 ]]
	echo 'Rule Matched: $(@)'

rule-translation-revised:
	[[ $(shell grep '^M\s\+translated/' $(CHANGE_FILE) | wc -l) = 1 ]]
	echo 'Rule Matched: $(@)'

rule-translation-published:
	[[ $(shell grep '^D\s\+translated/' $(CHANGE_FILE) | wc -l) = 1 ]]
	[[ $(shell grep '^A\s\+published/' $(CHANGE_FILE) | wc -l) = 1 ]]
	echo 'Rule Matched: $(@)'
