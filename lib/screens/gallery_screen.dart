import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


final _imageUrls = [
  "https://live.tourofcrete.gr/images/cmbt-gallery/1.jpg",
  "https://live.tourofcrete.gr/images/cmbt-gallery/2.jpg",
  "https://live.tourofcrete.gr/images/cmbt-gallery/3.jpg",
  "https://live.tourofcrete.gr/images/cmbt-gallery/4.jpg",
  "https://live.tourofcrete.gr/images/cmbt-gallery/5.jpg",
  "https://live.tourofcrete.gr/images/cmbt-gallery/6.jpg",
  "https://live.tourofcrete.gr/images/cmbt-gallery/7.jpg",
  "https://live.tourofcrete.gr/images/cmbt-gallery/8.jpg",
  "https://live.tourofcrete.gr/images/cmbt-gallery/10.jpg",
  "https://live.tourofcrete.gr/images/cmbt-gallery/11.jpg",
  "https://live.tourofcrete.gr/images/cmbt-gallery/12.jpg",
  "https://live.tourofcrete.gr/images/cmbt-gallery/13.jpg",
  "https://live.tourofcrete.gr/images/cmbt-gallery/14.jpg",
  "https://live.tourofcrete.gr/images/cmbt-gallery/15.jpg",
  "https://live.tourofcrete.gr/images/cmbt-gallery/16.jpg",
  "https://live.tourofcrete.gr/images/cmbt-gallery/17.jpg",
  "https://live.tourofcrete.gr/images/cmbt-gallery/18.jpg",
  "https://live.tourofcrete.gr/images/cmbt-gallery/19.jpg",
  "https://live.tourofcrete.gr/images/cmbt-gallery/20.jpg",
  "https://live.tourofcrete.gr/images/cmbt-gallery/21.jpg",
  "https://live.tourofcrete.gr/images/cmbt-gallery/22.jpg",
  "https://live.tourofcrete.gr/images/cmbt-gallery/23.jpg",
];

final _imageDescriptions = [
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
];

final _imageDescriptions2 = [
  'Το όνειρο',
  'Η πρόκληση',
  'Δύναμη',
  'Γαλάζιο',
  'Απόκρυφο',
  'Γαλήνη',
  'Μπλε',
  'Άγριο',
  'Ξέγνοιαστο',
  'Ιερό',
  'Δράση',
  'Αδρεναλίνη',
  'Γαλάζιο',
  'Απέραντο',
  'Μπλε',
  'Άγριο',
  'Ξέγνοιαστο',
  'Ιερό',
  'Δράση',
  'Αδρεναλίνη',
  'Γαλάζιο',
  'Απέραντο',
];

class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Scaffold(
          appBar: AppBar(
            title: Text('Gallery'),
            leading: IconButton(
            icon: Image.asset('images/cmbt.png'), 
            onPressed: () { },
          ),
          ),
          body:Container(
      // color: Colors.blueGrey,
      child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  
                  Container(
                      child: CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: true,
                    ),
                    items: imageSliders,
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
          ),
      ),
    );
  }
}

final List<Widget> imageSliders = _imageUrls
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
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
                          _imageDescriptions[_imageUrls.indexOf(item)],
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
