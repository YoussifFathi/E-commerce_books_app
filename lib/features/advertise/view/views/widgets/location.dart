// ignore_for_file: must_be_immutable

import 'package:bookly/core/utils/govern_handler.dart';
import 'package:bookly/core/utils/validator_handler.dart';
import 'package:bookly/core/widgets/custom_drop_down_menu.dart';
import 'package:bookly/core/widgets/custom_main_button.dart';
import 'package:bookly/core/widgets/custom_text_form_field.dart';
import 'package:bookly/features/advertise/view/view_models/advertise_cubit/advertise_cubit.dart';
import 'package:bookly/features/advertise/view/view_models/advertise_cubit/advertise_state.dart';
import 'package:bookly/features/auth/data/models/govern_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Location extends StatelessWidget {
  Location({super.key});

  final TextEditingController locationEditingController =
      TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdvertiseCubit, AdvertiseState>(
      listener: (context, state) => {},
      builder: (context, state) => Form(
        key: formKey,
        child: Column(
          children: [
            CustomDropDownMenu<GovernModel>(
              value: AdvertiseCubit.get(context).selectedGovernorate,
              label: "Governorate",
              items: GovernHandler.allGoverns,
              onSelect: AdvertiseCubit.get(context).onSelectGovernorate,
            ),
            const SizedBox(height: 16,),
            CustomTextFormField(
              textInputType: TextInputType.text,
              validator: ValidatorHandler.cityValidator,
                textEditingController:
                    AdvertiseCubit.get(context).cityController,
                hintTxt: 'City',
                iconData: Icons.location_city),
            const SizedBox(height: 24,),

            CustomMainButton(
              txt: 'Next',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  AdvertiseCubit.get(context).nextStep(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
