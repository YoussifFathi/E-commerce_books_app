import 'package:bookly/core/widgets/custom_center_loading_widget.dart';
import 'package:bookly/features/home/view/view_models/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:bookly/features/home/view/view_models/home_cubit/home_cubit.dart';
import 'package:bookly/features/home/view/views/widgets/custom_books_list_view_home.dart';
import 'package:bookly/features/home/view/views/widgets/custom_search_and_filter_bar.dart';
import 'package:bookly/features/home/view/views/widgets/home_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeFetchDataFailure) {

        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                HomeAppBar(
                  onTap: () {
                    BlocProvider.of<BottomNavCubit>(context)
                        .scaffoldKey
                        .currentState!
                        .openDrawer();
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustomSearchAndFilterBar(),
                const SizedBox(
                  height: 24,
                ),

                // start display books
                state is HomeFetchDataLoading
                    ? const CustomCenterLoadingWidget()
                    : const SizedBox(),
                state is HomeFetchDataSuccessful
                    ?  CustomBooksListViewHome(
                        allBooks: state.allBooks,
                      )
                    : const SizedBox(),

              ],
            ),
          ),
        );
      },
    );
  }
}
