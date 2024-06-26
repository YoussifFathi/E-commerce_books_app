import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_handler.dart';
import 'package:bookly/features/edit_book/data/repos/edit_book_repo.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class EditBookRepoImp extends EditBookRepo {
  final Dio _dio;

  EditBookRepoImp(this._dio);

  @override
  Future<Either<Failures, List<BookModel>>> fetchallBooks(
      String userToken) async {
    try {
      var jsonData = await _dio.get(
        "${ApiHandler.baseUrl}book",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': "Bearer $userToken"
          },
        ),
      );
      List<BookModel> bookModelList = [];
      for (var data in jsonData.data['data']) {
        try {
          bookModelList.add(BookModel.fromJson(data));
        } catch (e) {}
      }
      return right(bookModelList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerSideError.fromDioException(e));
      } else {
        return left(ServerSideError(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, void>> editBook(
    String userToken,
    BookModel bookModel,
    String newTitle,
    String newPrice,
    String newDescription,
  ) async {
    try {

      var jsonData = await _dio.put(
        "${ApiHandler.baseUrl}book/update/${bookModel.id}",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': "Bearer $userToken"
          },
        ),
        data: {
          "title": newTitle,
          "description": newDescription,
          "city": bookModel.govern,
          "town": bookModel.city,
          "price": newPrice,
        }
      );

      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerSideError.fromDioException(e));
      } else {
        return left(ServerSideError(e.toString()));
      }
    }
  }
}
