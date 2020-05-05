# cmbt

Cretan Mountain Bike Trails App

## Getting Started

Έχω χρησιμοποιήσει το flutter_webview_plugin: ^0.3.11
Για Android: Ίσως χρειαστεί να προσθέσω το android:usesCleartextTraffic="true" μέσα στο <application ...> στο C:\Users\kostoman\Documents\flutter\cmbt\cmbt\android\app\src\main\AndroidManifest.xml

Για iOS
In order for plugin to work correctly, you need to add new key to ios/Runner/Info.plist

<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
    <key>NSAllowsArbitraryLoadsInWebContent</key>
    <true/>
</dict>
NSAllowsArbitraryLoadsInWebContent is for iOS 10+ and NSAllowsArbitraryLoads for iOS 9.

Ignoring SSL Errors 
Set the ignoreSSLErrors option to true to display content from servers with certificates usually not trusted by the Webview like self-signed certificates.

Warning: Don't use this in production.
