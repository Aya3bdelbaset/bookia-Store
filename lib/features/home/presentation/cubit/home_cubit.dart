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
    if (isClosed) return;

    print('HOME: Started loading books');

    emit(GetBestSellerLoading());

    try {
      final response = await HomeRepo.getBestSellerBooks();

      if (isClosed) return;

      print('HOME: Repository response received');
      print('HOME: Response type = ${response.runtimeType}');

      if (response is BooksModel) {
        print('HOME: Products count = ${response.data?.products?.length ?? 0}');

        emit(GetBestSellerSuccess(response.data?.products));
      } else {
        emit(GetBestSellerError('No books found.'));
      }
    } catch (e, stackTrace) {
      if (isClosed) return;

      print('HOME ERROR: $e');
      print(stackTrace);

      emit(GetBestSellerError(e.toString()));
    }
  }

  Future<void> search(String text) async {
    if (isClosed) return;

    emit(SearchLoading());

    try {
      final data = await HomeRepo.search(text);

      if (isClosed) return;

      if (data != null) {
        emit(SearchSuccess(data.whereType<Products>().toList()));
      } else {
        emit(SearchError('No products found.'));
      }
    } catch (e, stackTrace) {
      if (isClosed) return;

      print('SEARCH ERROR: $e');
      print(stackTrace);

      emit(SearchError(e.toString()));
    }
  }

  Future<void> getSliders() async {
    if (isClosed) return;

    emit(GetSlidersLoading());

    try {
      final response = await HomeRepo.getSliders();

      if (isClosed) return;

      if (response != null && response.data?.sliders != null) {
        sliderModels = response;

        print('SLIDERS COUNT: ${sliderModels!.data!.sliders!.length}');

        emit(GetSlidersSuccess(response));
      } else {
        emit(GetSlidersError('Failed to load sliders.'));
      }
    } catch (e, stackTrace) {
      if (isClosed) return;

      print('SLIDERS ERROR: $e');
      print(stackTrace);

      emit(GetSlidersError(e.toString()));
    }
  }
}
