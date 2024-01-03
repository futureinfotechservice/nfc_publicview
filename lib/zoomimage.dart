import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';

class zoomimage extends StatefulWidget {
  String photo;

  zoomimage(this.photo);

  @override
  State<zoomimage> createState() => zoomimage1(photo.toString());
}

class zoomimage1 extends State<zoomimage> {
  String photo;

  zoomimage1(this.photo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade900,
          centerTitle: true,
          title: Text(
            'IMAGE',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          actions: <Widget>[
            // IconButton(
            //   icon: Icon(
            //     Icons.edit,
            //     color: Colors.white,
            //   ),
            //   onPressed: () {
            //     // do something
            //   },
            // )
          ],
        ),
        backgroundColor: Colors.black12,
        body: Center(
            child: Zoom(
                initTotalZoomOut: true,
                maxZoomWidth: 1800,
                maxZoomHeight: 1800,
                opacityScrollBars: 0.9,
                scrollWeight: 10.0,
                centerOnScale: true,
                enableScroll: true,
                doubleTapZoom: true,
                zoomSensibility: 2.3,
                child: Container(
                    //color: Colors.black26,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    child: FittedBox(
                        child: (photo.toString() == '')
                            ? CircularProgressIndicator()
                            : Image.network(
                                photo.toString(),
                                fit: BoxFit.fill,
                              ))))));
  }
}
