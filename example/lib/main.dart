import 'package:flutter/material.dart';

import 'package:crypto_font_icons_example/icons.dart';

void main() {
  runApp(new CryptoFontGalleryApp());
}

class CryptoFontGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'CryptoFont Flutter Gallery',
      theme: ThemeData.light().copyWith(
        iconTheme: IconThemeData(size: 36.0, color: Colors.black87),
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 16.0, color: Colors.black87),
        ),
      ),
      home: CryptoFontGalleryHome(),
    );
  }
}

class CryptoFontGalleryHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CryptoFontGalleryHomeState();
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
                  MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          color: Colors.white,
                          child: SizedBox.expand(
                            child: Hero(
                              tag: icon,
                              child: Icon(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(tag: icon, child: Icon(icon.iconData)),
                  Container(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(icon.title),
                  )
                ],
              ),
            );
          }),
    );
  }

  AppBar _titleBar() {
    return AppBar(
      title: Text("CryptoFont Flutter Gallery"),
      actions: [
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              ModalRoute.of(context)?.addLocalHistoryEntry(
                LocalHistoryEntry(
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
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
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
