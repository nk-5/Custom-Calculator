XBUILD?=$(shell which xcodebuild)
BUNDLE?=$(shell which bundle)
PROJECT_NAME?=CustomCalculator
DESTINATION?='platform=iOS Simulator,OS=10.2,name=iPhone 7 Plus'

install:
	$(BUNDLE) install

test:
	set -o pipefail \
	&& $(XBUILD) -workspace ${PROJECT_NAME}.xcworkspace \
	-scheme FluctSDKTestApp \
	-configuration Release \
	-destination $(DESTINATION) \
	clean test | $(BUNDLE) exec xcpretty
