import 'package:bloc/bloc.dart';
import 'package:bookia/features/home/models/books_model.dart';
import 'package:bookia/features/home/models/slider_model.dart';
import 'package:bookia/features/home/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  SliderModels? sliderModels;
  Future<void> getBestSellerBooks() async {
    print('HOME: Started loading books');

    emit(GetBestSellerLoading());

    try {
      final response = await HomeRepo.getBestSellerBooks();

      print('HOME: Repository response received');
      print('HOME: Response type = ${response.runtimeType}');

      if (response is BooksModel) {
        print('HOME: Products count = ${response.data?.products?.length ?? 0}');

        emit(GetBestSellerSuccess(response.data?.products));
      } else {
        print('HOME: Failed to load BooksModel');
        emit(GetBestSellerError());
      }
    } catch (e, stackTrace) {
      print('HOME ERROR: $e');
      print(stackTrace);

      emit(GetBestSellerError());
    }
  }

  Future<void> search(String text) async {
    emit(SearchLoading());

    try {
      final data = await HomeRepo.search(text);

      if (data != null) {
        emit(SearchSuccess(data.whereType<Products>().toList()));
      } else {
        emit(SearchError());
      }
    } catch (e, stackTrace) {
      print('SEARCH ERROR: $e');
      print(stackTrace);
      emit(SearchError());
    }
  }

  Future<void> getSliders() async {
    emit(GetSlidersLoading());

    try {
      final response = await HomeRepo.getSliders();

      if (response != null && response.data?.sliders != null) {
        sliderModels = response;

        print('SLIDERS COUNT: ${sliderModels!.data!.sliders!.length}');

        emit(GetSlidersSuccess(response));
      } else {
        emit(GetSlidersError());
      }
    } catch (e, stackTrace) {
      print('SLIDERS ERROR: $e');
      print(stackTrace);
      emit(GetSlidersError());
    }
  }
}