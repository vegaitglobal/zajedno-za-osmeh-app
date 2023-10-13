import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gu_mobile/domain/coins_feature/model/coin_model.dart';
import 'package:gu_mobile/ui/coins_feature/bloc/coins_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:gu_mobile/ui/coins_feature/view/CoinsListPagination.dart';

import 'coin_list_item.dart';

class CoinsView extends StatefulWidget {
  const CoinsView({super.key});

  @override
  State<CoinsView> createState() => _CoinsViewState();
}

class _CoinsViewState extends State<CoinsView> {
  @override
  void initState() {
    _fetchCoins(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coins Feature')),
      body: Center(
        child: BlocBuilder<CoinsBloc, CoinsState>(
          builder: (context, state) {
            return switch (state) {
              CoinsInitialState() =>
                const Text('Initial State, press the button to start'),
              CoinsSuccessState() => CoinsListPagination(
                  coins: state.items, fetchMore: () => _fetchCoins(context)),
              CoinsFailState() => const Text('Some error catch !')
            };
          },
        ),
      ),
    );
  }

  _fetchCoins(BuildContext context) {
    context.read<CoinsBloc>().add(const CoinsFetchData());
  }

  // TODO: for test purpose
  Widget _coinsView(List<CoinModel> coins) {
    if (kIsWeb) {
      return CoinWebList(coins: coins);
    } else {
      return CoinListScreen(coins: coins);
    }
  }
}

class CoinListScreen extends StatelessWidget {
  final List<CoinModel> coins; // List of CoinModel instances

  const CoinListScreen({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: coins.length,
        itemBuilder: (context, index) {
          return CoinListItemWithBorder(coin: coins[index]);
        });
  }
}

class CoinWebList extends StatelessWidget {
  final List<CoinModel> coins; // List of CoinModel instances

  const CoinWebList({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: coins.length,
        itemBuilder: (context, index) {
          return CoinListItem(coin: coins[index]);
        });
  }
}
