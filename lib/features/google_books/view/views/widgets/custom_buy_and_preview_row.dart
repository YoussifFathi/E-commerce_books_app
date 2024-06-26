import 'package:bookly/core/widgets/custom_error_dialog.dart';
import 'package:bookly/features/google_books/view/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomBuyAndPreviewRow extends StatelessWidget {
  const CustomBuyAndPreviewRow({super.key,required this.previewLink});
  final String previewLink;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: "0 \$",
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: const  BorderRadius.only(bottomLeft: Radius.circular(16),topLeft: Radius.circular(16)),
            onTap: () {},
          ),
        ),
        Expanded(
          child: CustomButton(
            text: "FreePreview",
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: const  BorderRadius.only(bottomRight: Radius.circular(16),topRight: Radius.circular(16)),
            onTap: () async {
              final Uri url =Uri.parse(previewLink);
               
                if(await canLaunchUrl(url)){
                  launchUrl(url);
                }else{
                  customErrorDialog(context, title: "Error", content: "sorry there is error can't open link now please try again");
                }

            },
          ),
        ),

      ],
    );
  }
}
