import 'package:book_extchange/core/routing/routes.dart';
import 'package:book_extchange/core/utils/measures.dart';
import 'package:book_extchange/features/chat/data/models/chat_room_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';


class CustomChatCard extends StatelessWidget {
   CustomChatCard({
    super.key, required this.chatRoomModel,
  });

  final ChatRoomModel chatRoomModel;
  DateTime? parseDate;
  DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    try{
      parseDate = DateFormat("dd MMM yyyy HH:mm").parse("${chatRoomModel.dateOfLastMessage}");
      dateTime = DateTime.parse(parseDate.toString());
    }catch(e){

    }
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(Routes.kChatDetailsView,extra: chatRoomModel.roomId);
      },
      child: Container(
        width: double.infinity,
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80,
              child: AspectRatio(
                aspectRatio: 60 / 72,
                child: Image.network(chatRoomModel.imgUrl,fit: BoxFit.fill,),
              ),
            ),
            SizedBox(width: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chatRoomModel.sellerName,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
                SizedBox(height: 5,),
                SizedBox(
                  width: deviceWidth - 230,
                  child: Text(
                    chatRoomModel.lastMessage,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 2,
                  ),
                )
              ],
            ),
            SizedBox(width: 16,),
            dateTime == null ? SizedBox() :  Text("${dateTime!.day} / ${dateTime!.month}  ${dateTime!.hour}:${dateTime!.minute}"),
          ],
        ),
      ),
    );
  }
}