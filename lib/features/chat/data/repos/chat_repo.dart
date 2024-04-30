import 'package:book_extchange/core/errors/failures.dart';
import 'package:book_extchange/features/chat/data/models/chat_room_details_model.dart';
import 'package:book_extchange/features/chat/data/models/chat_room_model.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';

import 'package:dartz/dartz.dart';

abstract class ChatRepo {
  Future<Either<Failures,ChatRoomModel>> createChatRoom(String userToken, String bookId);
  Future<Either<Failures,List<ChatRoomModel>>> fetchAllChatRooms(String userToken);
  Future<Either<Failures,ChatRoomDetailsModel>> fetchChatRoomDetails(String userToken , String roomId);
  Future<Either<Failures,void>> sendMessage(String userToken , String roomId , String content);



}