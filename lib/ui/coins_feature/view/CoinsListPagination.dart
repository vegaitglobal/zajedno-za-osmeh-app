import 'package:flutter/cupertino.dart';
import 'package:gu_mobile/domain/coins_feature/model/coin_model.dart';

import 'coin_list_item.dart';

class CoinsListPagination extends StatefulWidget {
  final List<CoinModel> coins;
  final VoidCallback fetchMore;

  const CoinsListPagination(
      {super.key, required this.coins, required this.fetchMore});

  @override
  State<CoinsListPagination> createState() => _CoinsListPaginationState();
}

class _CoinsListPaginationState extends State<CoinsListPagination> {
  get coins => widget.coins;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        widget.fetchMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _scrollController,
        itemCount: widget.coins.length,
        itemBuilder: (context, index) {
          return CoinListItemWithBorder(coin: coins[index]);
        });
  }
}
