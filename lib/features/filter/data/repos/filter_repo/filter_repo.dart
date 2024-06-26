import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class FilterRepo {
  Future<Either<Failures, List<BookModel>>> filterAndFetchResults(
    String userToken,
    String govern,
    bool searchByPrice,
    List<String> price,
    bool isEducational,
    String subCategoryID,
  );
}
