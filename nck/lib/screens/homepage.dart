import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nck/model/product_model.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:nck/screens/details.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<GoogleProducts> myItems = GoogleProducts.productItems();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: Container(
              margin: EdgeInsets.fromLTRB(20, 70, 20, 0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage("assets/user_icon.PNG"),
                        backgroundColor: Colors.indigoAccent[500],
                      ),
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/center_icon.PNG"))),
                      ),
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
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "All",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Product",
                              style: TextStyle(
                                  fontSize: 24, color: Colors.black26),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              'Filter Items',
                              style: TextStyle(fontSize: 19),
                            ),
                            Container(
                              width: 90,
                              height: 2,
                              color: Colors.grey,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
      backgroundColor: Colors.white,
      body: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: new StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: myItems.length,
            itemBuilder: (context, index) => new Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(
                                title: myItems[index].title,
                                items: myItems[index],
                              )));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
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
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        height: 150,
                        width: 140,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(myItems[index].image[0]))),
                      ),
                      Text(myItems[index].title),
                      SizedBox(
                        height: 10,
                      ),
                      Text("\$${myItems[index].price} "),
                    ],
                  ),
                ),
              ),
            ),
            staggeredTileBuilder: (int index) =>
                new StaggeredTile.count(1, index.isEven ? 1.6 : 1.8),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          )),
    );
  }
}
