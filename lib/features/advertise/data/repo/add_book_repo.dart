import 'dart:io';

import 'package:book_extchange/core/errors/failures.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class AddBookRepo {
  Future<Either<Failures,void>> addNewBook(String userToken , BookModel bookModel,List<File> imgs);
}