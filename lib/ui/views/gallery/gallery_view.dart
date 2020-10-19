import 'package:carousel_slider/carousel_slider.dart';
import 'package:cmbt/ui/views/gallery/gallery_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class GalleryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GalleryViewModel>.nonReactive(
      builder: (context, model, child) => _buildBody(model),
      viewModelBuilder: () => GalleryViewModel(),
    );
  }

  Widget _buildBody(GalleryViewModel model) {
    final List<Widget> imageSliders = model.imageUrls
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        //
                        // TODO
                        // Since I am loading the image over the network, one possible improvement is to use the FadeInImage widget so that an image placeholder could be presented
                        // until the actual image is loaded from the network.
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              model.imageDescriptions2[model.imageUrls.indexOf(item)],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Gallery'),
          leading: IconButton(
            icon: Image.asset('assets/cmbt.png'),
            onPressed: () {},
          ),
        ),
        body: Container(
          // color: Colors.blueGrey,
          child: Center(
              child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.8,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              autoPlay: true,
            ),
            items: imageSliders,
          )),
        ),
      ),
    );
  }
}
