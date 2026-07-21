PROJECT := WorldPostOfficeHome.xcodeproj
SCHEME := WorldPostOfficeHome

.PHONY: generate open test

generate:
	xcodegen generate

open: generate
	open $(PROJECT)

test: generate
	xcodebuild \
		-project $(PROJECT) \
		-scheme $(SCHEME) \
		-destination 'platform=iOS Simulator,name=iPhone 16 Pro' \
		CODE_SIGNING_ALLOWED=NO \
		test
