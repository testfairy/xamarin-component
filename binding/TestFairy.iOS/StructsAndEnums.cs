using System;
using System.Runtime.InteropServices;
using Foundation;

// Generated by Objective Sharpie (https://download.xamarin.com/objective-sharpie/ObjectiveSharpie.pkg)
// > sharpie bind -output TestFairy -namespace TestFairyLib -sdk iphoneos10.1 TestFairy.h
namespace TestFairyLib
{
	public static class CFunctions
	{
		// extern void TFLog (NSString *format, ...) __attribute__((format(NSString, 1, 2)));
		[DllImport ("__Internal")]
		public static extern void TFLog (NSString format, IntPtr varArgs);

		// extern void TFLogv (NSString *format, va_list arg_list);
		[DllImport ("__Internal")]
		public static extern unsafe void TFLogv (NSString format, sbyte* arg_list);
	}
}
