import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oxy_boots/core/extensions/extensions.dart';
import 'package:oxy_boots/core/helpers/spaces.dart';
import 'package:oxy_boots/core/utilities/app_text_styles.dart';
import 'package:oxy_boots/src/presentation/managers/login/login_view_model.dart';
import 'package:oxy_boots/src/presentation/pages/login/input_form.dart';

import '../../../../core/helpers/common_imports.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<LoginViewModel>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Text(
              context.localization.helloAgain,
              style: AppTextStyles.font28W500,
            ),
            Text(
              context.localization.welcomeBack,
              style: AppTextStyles.font16W400,
            ),
            verticalSpace(50),
            InputForm(),

          ],
        ),
      ),
    );
  }
}
