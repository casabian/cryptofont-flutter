import 'package:flutter/material.dart';

import 'package:crypto_font_icons_example/icons.dart';

void main() {
  runApp(new CryptoFontGalleryApp());
}

class CryptoFontGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Font Awesome Flutter Gallery',
      theme: new ThemeData.light().copyWith(
        iconTheme: new IconThemeData(size: 36.0, color: Colors.black87),
        textTheme: new TextTheme(
          body1: new TextStyle(fontSize: 16.0, color: Colors.black87),
        ),
      ),
      home: new CryptoFontGalleryHome(),
    );
  }
}

class CryptoFontGalleryHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new CryptoFontGalleryHomeState();
}

class CryptoFontGalleryHomeState extends State<CryptoFontGalleryHome> {
  var _searchTerm = "";
  var _isSearching = false;

  @override
  Widget build(BuildContext context) {
    final filteredIcons = icons
        .where((icon) => _searchTerm.isEmpty || icon.title.toLowerCase().contains(_searchTerm.toLowerCase()))
        .toList();
    final orientation = MediaQuery.of(context).orientation;

    return new Scaffold(
      appBar: _isSearching ? _searchBar(context) : _titleBar(),
      body: new GridView.builder(
          itemCount: filteredIcons.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          ),
          itemBuilder: (context, index) {
            final icon = filteredIcons[index];

            return new InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      return new GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: new Container(
                          color: Colors.white,
                          child: new SizedBox.expand(
                            child: new Hero(
                              tag: icon,
                              child: new Icon(
                                icon.iconData,
                                size: 100.0,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Hero(tag: icon, child: new Icon(icon.iconData)),
                  new Container(
                    padding: new EdgeInsets.only(top: 16.0),
                    child: new Text(icon.title),
                  )
                ],
              ),
            );
          }),
    );
  }

  AppBar _titleBar() {
    return new AppBar(
      title: new Text("CryptoFont Flutter Gallery"),
      actions: [
        new IconButton(
            icon: new Icon(Icons.search),
            onPressed: () {
              ModalRoute.of(context).addLocalHistoryEntry(
                new LocalHistoryEntry(
                  onRemove: () {
                    setState(() {
                      _searchTerm = "";
                      _isSearching = false;
                    });
                  },
                ),
              );

              setState(() {
                _isSearching = true;
              });
            })
      ],
    );
  }

  AppBar _searchBar(BuildContext context) {
    return new AppBar(
      leading: new IconButton(
        icon: new Icon(Icons.arrow_back),
        onPressed: () {
          setState(
            () {
              Navigator.pop(context);
              _isSearching = false;
              _searchTerm = "";
            },
          );
        },
      ),
      title: new TextField(
        onChanged: (text) => setState(() => _searchTerm = text),
        autofocus: true,
        style: new TextStyle(fontSize: 18.0),
        decoration: new InputDecoration(border: InputBorder.none),
      ),
    );
  }
}
