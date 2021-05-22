import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:nck/model/product_model.dart';
import 'package:hexcolor/hexcolor.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  final GoogleProducts items;

  DetailsPage({Key key, this.title, this.items}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var _currentIndex = 0;
  final CarouselController _controller = CarouselController();

  _imageCarousel() {
    final List<String> listImages = widget.items.image;
    return Column(
      children: <Widget>[
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            height: 300,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: listImages
              .map(
                (item) => Container(
                  child: Center(
                    child: Image.asset(
                      item,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width / 1.6,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listImages.map((urlOfItem) {
            int index = listImages.indexOf(urlOfItem);
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.black : Colors.grey),
            );
          }).toList(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(85.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: HexColor("#E7E5E3"),
            elevation: 0,
            flexibleSpace: Container(
              margin: EdgeInsets.fromLTRB(20, 70, 20, 0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back_sharp),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text('Overview', style: TextStyle(fontSize: 20)),
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/cart_icon.PNG"))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 2.2,
              color: HexColor("#E7E5E3"),
              child: _imageCarousel(),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 30, 15, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget.items.title,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.black45),
                      ),
                      Text(
                        "\$${widget.items.price}",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.black45),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Hands-free help from the Google Assistance.',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      'Get answers, play songs, tackle your day, enjoy your entertainment and control your smart...',
                      style: TextStyle(
                          color: Colors.black38, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            Expanded(child: Container()),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 4.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[200],
                      ),
                      child: Center(
                        child: FavoriteButton(
                          iconColor: Colors.black,
                          iconSize: 28,
                          isFavorite: false,
                          iconDisabledColor: Colors.black26,
                          valueChanged: (_isFavorite) {
                            print('Is Favorite : $_isFavorite');
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: HexColor("#18CCD8"),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text("ADD TO CART",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
