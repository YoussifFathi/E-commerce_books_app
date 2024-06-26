import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/google_books/data/models/google_book_model.dart';
import 'package:dartz/dartz.dart';

abstract class GoogleRepo {
  Future<Either<Failures,List<GoogleBookModel>>> fetchBooksByTitle(String title);

}