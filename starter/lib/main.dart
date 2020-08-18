//Copyright 2018 The Flutter team. All rights reserved.
//Use of this source code is governed by a BSD-style license that can be
//found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp()); // app execute // https://software-creator.tistory.com/10


class MyApp extends StatelessWidget { // default stable widget
  @override
  Widget build(BuildContext context) { // draw UI
    //final wordPair = WordPair.random(); // wordPair from english_words
    return MaterialApp( // make app using MaterialApp what google's default design
      title: '001261 app',
      home: RandomWords()/*
      home: Scaffold( // default material layout
        appBar: AppBar( // for make app layout
          title: Text('Welcome to Flutter'), // app title
        ),
        body: Center( // align widget
          child: RandomWords(), // call RandomWords class
          //child: Text(findQuotient())
          //child: Text(wordPair.asPascalCase), // asPascalCase like UpperCamelCase
        ),
      ),*/
    );
  }
}
/*
String findQuotient() {
  int value = 5~/3;
  return value.toString();
}*/

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState(); // create RandomWordsState class
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[]; // array, WordPair data type
  // final can't modify, delete, but can add element
  // const can't modify, delete, add
  final _biggerFont = const TextStyle(fontSize: 18.0);
  //final wordPair = WordPair.random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) { // itemBuilder called when scrolled // https://agoalofglory.github.io/2019/07/20/2019/20190720_01_Flutter_First_App/
          if (i.isOdd) return Divider(); // if i is odd, return line

          final index = i ~/ 2; // for sync with suggestion
          if(index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); // take WordPairs 10 each every times
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }
  Widget _buildRow(WordPair pair) {
    return ListTile( // https://medium.com/@suragch/a-complete-guide-to-flutters-listtile-597a20a3d449
      title: Text(
        pair.asPascalCase, // string, get WordPair and UpperCamel
        style: _biggerFont, // set style
      ),
    );
  }
  //return Text(wordPair.asPascalCase);
}
