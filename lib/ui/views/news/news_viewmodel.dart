import 'package:cmbt/app/locator.dart';
import 'package:cmbt/datamodels/post.dart';
import 'package:cmbt/services/fb_posts_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NewsViewModel extends FutureViewModel<List<Post>> {
  final _dialogService = locator<DialogService>();

  @override
  Future<List<Post>> futureToRun() => locator<FbPostsService>().fetchPosts();

  @override
  void onError(error) async {
    await _dialogService.showDialog(
      title: 'Comunication Problem',
      description: 'There is a problem in communication with Facebook server. No way to get news feed!',
      buttonTitle: 'OK',
      barrierDismissible: true,
      dialogPlatform: DialogPlatform.Cupertino, // DialogPlatform.Material
    );
  }
}
