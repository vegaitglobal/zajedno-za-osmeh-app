import 'package:bloc/bloc.dart';
import 'package:gu_mobile/domain/coins_feature/model/coin_model.dart';
import 'package:equatable/equatable.dart';
import 'package:gu_mobile/domain/coins_feature/use_case/observe_coins_use_case.dart';
import 'package:gu_mobile/domain/coins_feature/use_case/fetch_coins_use_case.dart';

part 'coins_event.dart';

part 'coins_state.dart';

class CoinsBloc extends Bloc<CoinsEvent, CoinsState> {
  static const _pageSize = 15;
  var _page = 1;
  var _isFinalPage = false;

  CoinsBloc(
      {required FetchCoinsUseCase fetchCoinsUC,
      required ObserveCoinsUseCase observeCoinsUC})
      : super(CoinsInitialState()) {
    observeCoinsUC.execute().listen((coins) {}).onData((data) {
      if (data.isEmpty) {
        return;
      }
      add(CoinsObserveData(data));
    });

    on<CoinsFetchData>((event, emit) async {
      try {
        await _fetchPagination(fetchCoinsUC);
      } catch (e) {
        _onErrorCatch(emit);
      }
    });
    on<CoinsObserveData>(
        (event, emit) async => emit(CoinsSuccessState(List.of(event.items))));
  }

  _fetchPagination(FetchCoinsUseCase coinsUseCase) async {
    if (_isFinalPage) {
      return;
    }
    _isFinalPage = await coinsUseCase.execute(_pageSize, _page);
    _page++;
  }

  _onErrorCatch(Emitter<CoinsState> emit) {
    if (state is CoinsSuccessState) {
      return;
    } // Skip throw error if some data already loaded
    emit(const CoinsFailState());
  }
}
