OUTPUT=component/TestFairy.Xamarin-iOS-1.2.0.xam

all: $(OUTPUT)

lib/ios-unified/TestFairy.iOS.dll:
	mkdir -p lib/ios-unified
	curl -s -o TestFairySDK-1.2-Xamarin-Unified.zip https://app.testfairy.com/ios-sdk/TestFairySDK-1.2-Xamarin-Unified.zip
	unzip -q -d lib/ios-unified TestFairySDK-1.2-Xamarin-Unified.zip TestFairy.iOS.dll
	-rm -f TestFairySDK-1.2-Xamarin-Unified.zip

bin/xamarin-component.exe:
	# Fetch latest xamarin-component executable
	wget https://components.xamarin.com/submit/xpkg
	-mkdir bin
	unzip -d bin xpkg xamarin-component.exe

$(OUTPUT): bin/xamarin-component.exe lib/ios-unified/TestFairy.iOS.dll
	mono bin/xamarin-component.exe package component

	# Make sure the .dll made it into the .xam package
	unzip -v $(OUTPUT) | grep TestFairy.iOS.dll > /dev/null

clean:
	-rm -f lib/ios-unified/TestFairy.iOS.dll $(OUTPUT)
