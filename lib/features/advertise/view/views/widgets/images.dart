import 'package:bookly/core/widgets/custom_main_button.dart';
import 'package:bookly/features/advertise/view/view_models/advertise_cubit/advertise_cubit.dart';
import 'package:bookly/features/advertise/view/view_models/advertise_cubit/advertise_state.dart';
import 'package:bookly/features/advertise/view/views/widgets/image_adder.dart';
import 'package:bookly/features/advertise/view/views/widgets/image_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Images extends StatelessWidget {
  const Images({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdvertiseCubit, AdvertiseState>(
      listener: (context, state) => {},
      builder: (context, state) => Column(
        children: [
          ...AdvertiseCubit.get(context).selectedImages.map(
                (image) => ImageDisplay(
                  image: image,
                ),
              ),
          const ImageAdder(),
          const SizedBox(height: 24,),

          CustomMainButton(
            txt: 'Next',
            onTap: () {
              AdvertiseCubit.get(context).nextStep(context);
            },
          )
        ],
      ),
    );
  }
}
