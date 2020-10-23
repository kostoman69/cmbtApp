import 'package:cmbt/app/locator.dart';
import 'package:cmbt/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class LiveViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future navigateToWebView(url, title) async {
    await _navigationService.navigateTo(Routes.webView,
        arguments: WebViewArguments(
          url: url,
          title: title,
        ));
  }

  Future launchExternalBrowser(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
