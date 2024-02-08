import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wine_app/models/wine_model.dart';
import 'package:wine_app/resources/api_repository.dart';

part 'wine_event.dart';
part 'wine_state.dart';

class WineBloc extends Bloc<WineEvent, WineState> {
  WineBloc() : super(WineInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
print('--- intial ------');
    on<GetWineList>((event, emit) async {
      try {
        emit(WineLoading());
        final wineList = await _apiRepository.fetchWineList();
        print('*****  api ***');
        emit(WineLoaded(wineModel: wineList));
         print('///*****/ loaded ***/**');
        if (wineList == null) {
          emit(WineError(message: 'message'));
        }
      } on NetworkError {
        emit(
            WineError(message: "Failed to fetch data. is your device online?"));
      }
    });
  }
}
