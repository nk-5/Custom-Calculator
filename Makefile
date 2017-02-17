XBUILD?=$(shell which xcodebuild)
BUNDLE?=$(shell which bundle)
SWIFT_FORMAT?=$(shell which swiftformat)
PROJECT_NAME?=CustomCalculator
DESTINATION?='platform=iOS Simulator,OS=10.2,name=iPhone 7 Plus'

install:
	$(BUNDLE) install
	${BUNDLE} exec pod install

test:
	set -o pipefail \
	&& $(XBUILD) -workspace ${PROJECT_NAME}.xcworkspace \
	-scheme FluctSDKTestApp \
	-configuration Release \
	-destination $(DESTINATION) \
	clean test | $(BUNDLE) exec xcpretty

format:
	$(SWIFT_FORMAT) . --indent 4
