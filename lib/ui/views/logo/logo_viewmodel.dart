import 'package:cmbt/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_player/video_player.dart';

class LogoViewModel extends FutureViewModel<dynamic> {
  final String _title = 'Asterousia Trails';
  final _dialogService = locator<DialogService>();
  bool _confirmationResult = false;
  final VideoPlayerController _controller = VideoPlayerController.asset("assets/waterfall.mp4");

  String get title => _title;
  bool get result => _confirmationResult;
  VideoPlayerController get controller => _controller;

  Future<dynamic> _initializeController() async {
    //await Future.delayed(const Duration(seconds: 10));
    await _controller.initialize();
    _controller.play();
    _controller.setLooping(true);
    return 'OK';
  }

  @override
  Future<dynamic> futureToRun() => _initializeController();

  @override
  void onError(error) {}

  Future showBasicDialog() async {
    await _dialogService.showDialog(
      title: 'The Basic Dialog',
      description: 'This is the description for the dialog that shows up under the title',
      buttonTitle: 'OK',
      barrierDismissible: false,
      dialogPlatform: DialogPlatform.Cupertino, // DialogPlatform.Material
    );
  }

  Future showConfirmationDialog() async {
    var response = await _dialogService.showConfirmationDialog(
      title: 'The Confirmation Dialog',
      description: 'Do you want to update Confirmation state in the UI?',
      confirmationTitle: 'Yes',
      dialogPlatform: DialogPlatform.Material,
      cancelTitle: 'No',
    );

    _confirmationResult = response?.confirmed;

    notifyListeners();
  }
}
