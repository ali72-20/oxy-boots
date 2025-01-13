import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxy_boots/core/di/di.dart';
import 'package:oxy_boots/core/extensions/extensions.dart';
import 'package:oxy_boots/core/helpers/spaces.dart';
import 'package:oxy_boots/core/navigation/app_routes_name.dart';
import 'package:oxy_boots/core/utilities/app_colors.dart';
import 'package:oxy_boots/core/utilities/app_text_styles.dart';
import 'package:oxy_boots/gen/assets.gen.dart';
import 'package:oxy_boots/main.dart';
import 'package:oxy_boots/src/domain/entities/on_boardig_entity.dart';
import 'package:oxy_boots/src/presentation/managers/on_boarding/on_boarding_actions.dart';
import 'package:oxy_boots/src/presentation/managers/on_boarding/on_boarding_states.dart';
import 'package:oxy_boots/src/presentation/managers/on_boarding/on_boarding_view_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/helpers/common_imports.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final viewModel = getIt.get<OnBoardingViewModel>();

  @override
  Widget build(BuildContext context) {
    List<OnBoardingEntity> _pages = [
      OnBoardingEntity(
          title: context.localization.onBoarding1_title,
          description: context.localization.onBoarding1_description,
          image: Assets.images.onBoarding1.path),
      OnBoardingEntity(
        title: context.localization.onBoarding2_title,
        description: context.localization.onBoarding2_description,
        image: Assets.images.onBoarding2.path,
      ),
      OnBoardingEntity(
        title: context.localization.onBoarding3_title,
        description: context.localization.onBoarding3_description,
        image: Assets.images.onBoarding3.path,
      ),
    ];

    String _buttonText = context.localization.next;
    return BlocProvider(
      create: (_) => viewModel,
      child: Scaffold(
        body: BlocConsumer<OnBoardingViewModel, OnBoardingStates>(
            builder: (context, state) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                child: Column(
                  children: [
                    SizedBox(
                      height: context.height * 0.7,
                      child: PageView.builder(
                        itemCount: 3,
                        controller: viewModel.onBoardingController,
                        dragStartBehavior: DragStartBehavior.start,
                        itemBuilder: (context, index) {
                          viewModel.doAction(LastPageAction(index: index));
                          return _page(context, _pages[index]);
                        },
                      ),
                    ),
                    verticalSpace(32),
                    FadeInUp(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _slideIndicator(viewModel.onBoardingController),
                          ElevatedButton(
                            onPressed: () {
                              if (state is LastPageState) {
                                viewModel.doAction(NavigateToLoginAction());
                              } else {
                                viewModel.onBoardingController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              child: Text(_buttonText,
                                  style: AppTextStyles.font18W500),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            listener: (context, state) {
              if (state is NavigateToLoginState){
                navKey.currentState!.pushNamed(AppRoutsName.login);
              }
            },),
      ),
    );
  }

  Widget _slideIndicator(PageController controller) {
    return Container(
      child: SmoothPageIndicator(
        controller: controller,
        count: 3,
        effect: ExpandingDotsEffect(
          dotHeight: 8.h,
          dotColor: AppColors.lightBlue,
          activeDotColor: AppColors.primary,
        ),
      ),
    );
  }

  Widget _page(BuildContext context, OnBoardingEntity page) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Stack(
            children: [
              SvgPicture.asset(
                Assets.svgLight.nike,
                width: context.width,
                height: context.height * 0.3,
              ),
              verticalSpace(8),
              Positioned(
                width: context.width,
                bottom: 0,
                top: 0,
                right: 0,
                child: ZoomIn(
                  child: Image.asset(
                    page.image!,
                    width: context.width,
                  ),
                ),
              ),
            ],
          ),
        ),
        verticalSpace(100),
        SlideInRight(
          child: Text(
            page.title ?? "OXy Boots",
            style: AppTextStyles.font40W500,
          ),
        ),
        SlideInLeft(
          child: Text(
            page.description ?? "OXy Boots",
            style: AppTextStyles.font20W400,
          ),
        ),
      ],
    );
  }
}
