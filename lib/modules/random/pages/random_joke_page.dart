import 'package:chuck_norris_jokes/modules/random/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../models/randon_joke_model.dart';

class RandomJokePage extends StatefulWidget {
  const RandomJokePage({Key? key}) : super(key: key);

  @override
  State<RandomJokePage> createState() => _RandomJokePageState();
}

class _RandomJokePageState extends State<RandomJokePage> {
  final PagingController<int, RandomJoke> _pagingController = PagingController(firstPageKey: 0);
  List<RandomJoke> _listRandomJoke = [];

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) => _loadJokes());
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  _loadJokes() async {
    try {
      _listRandomJoke = await ApiProvider().getRandomJoke(listSize: 10);
      _pagingController.appendPage(_listRandomJoke, 0);
    } catch (e) {
      _pagingController.error = e;
    }
  }

  Widget _infinityJokes() {
    return PagedListView<int, RandomJoke>(
      physics: const BouncingScrollPhysics(),
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate(
        firstPageProgressIndicatorBuilder: (context) => _customProgressIndicator(),
        itemBuilder: (BuildContext context, item, int index) => _cardJoke(item),
      ),
    );
  }

  Widget _customProgressIndicator() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/chuck_dancing.gif"),
        const CircularProgressIndicator(),
      ],
    );
  }

  Widget _cardJoke(RandomJoke joke) {
    return InkWell(
      onTap: () {
        Clipboard.setData(ClipboardData(text: joke.value)).then(
          (value) => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Copied to clipboard!"),
              behavior: SnackBarBehavior.floating,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(joke.value),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Jokes from ChuckNorris API"),
      ),
      body: _infinityJokes(),
    );
  }
}
