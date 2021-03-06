import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';
import 'package:startup_name_generator/src/CupertinoListTile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return CupertinoApp(
            title: 'Startup Name Generator',
            home: RandomWords(),
        );
    }
}

class RandomWords extends StatefulWidget {
    @override
    _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
    final _suggestions = <WordPair>[];
    final _biggerFont = const TextStyle(fontSize: 18.0);

    @override
    Widget build(BuildContext context) {
        return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
                middle: Text('Startup Name Generator'),
            ),
            child: _buildSuggestions(),
        );
    }

    Widget _buildSuggestions() {
        return SafeArea(
            child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, i) {
                    if (i.isOdd) return SizedBox(
                        width: 1.0,
                        height: 0.1,
                        child: Container(
                            color: CupertinoColors.black,
                        ),
                    );

                    final index = i ~/ 2;
                    if (index >= _suggestions.length) {
                        _suggestions.addAll(generateWordPairs().take(10));
                    }
                    return _buildRow(_suggestions[index]);
                }
            )
        );
    }

    Widget _buildRow(WordPair pair) {
        return CupertinoListTile(
            leading: Text('Lead'),
            title: pair.asPascalCase,
            subtitle: 'SubTitle',
            trailing: Text('Trail'),
        );
    }
}
