import 'package:flutter/material.dart';

class SearchResults extends StatefulWidget{
  final String query;

  @override
  _SearchResultsState createState() => _SearchResultsState();
  SearchResults({Key key, this.query}) : super(key: key);

}

class _SearchResultsState extends State<SearchResults>{

  var _results = ['hi','Hello', 'How are you?', 'Fine'];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.query),
      ),
      body: _buildList(),
    );
  }

  Widget _buildList (){
    return ListView.builder(
      itemBuilder: (context, i){
        if (i.isOdd)
          return Divider();

        final index = i ~/ 2;
        if (index >= _results.length)
          {
            _results = _results + _results;
          }
        return _buildRow(_results[index]);
      },
    );
  }
  Widget _buildRow(String result){
    return new ListTile(
      title: new Text(result)
    );
  }

}