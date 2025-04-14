import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxy_boots/core/extensions/extensions.dart';
import 'package:oxy_boots/core/helpers/spaces.dart';
import 'package:oxy_boots/core/utilities/app_colors.dart';
import 'package:oxy_boots/gen/assets.gen.dart';
import 'package:oxy_boots/src/presentation/managers/login/login_actions.dart';
import 'package:oxy_boots/src/presentation/managers/login/login_states.dart';
import 'package:oxy_boots/src/presentation/managers/login/login_view_model.dart';

import '../../../../core/helpers/common_imports.dart';
import '../../../../core/utilities/app_text_styles.dart';

class InputForm extends StatelessWidget {
   InputForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<LoginViewModel>();
    Color _passwordIconColor = viewModel.isObscure? AppColors.gray: AppColors.primary;
    return BlocConsumer<LoginViewModel, LoginStates>(
      builder: (context, state) {
        return Form(
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.localization.emailAddress,
                style: AppTextStyles.font16W500,
              ),
              verticalSpace(12),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: AppColors.white,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.05),
                        spreadRadius: 4,
                        blurRadius: 1,
                      ),
                    ]),
                child: TextFormField(
                  controller: viewModel.emailController,
                  validator: (value) => viewModel.validateEmail(),
                ),
              ),
              verticalSpace(30),
              Text(
                context.localization.password,
                style: AppTextStyles.font16W500,
              ),
              verticalSpace(12),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: AppColors.white,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.05),
                        spreadRadius: 4,
                        blurRadius: 1,
                      ),
                    ]),
                child: TextFormField(
                  controller: viewModel.passwordController,
                  obscureText: viewModel.isObscure,
                  validator: (value) => viewModel.validatePassword(),
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () {
                        viewModel.doAction(ChangePasswordVisibilityAction());
                      },
                      child: SizedBox(
                        height: 1,
                        width: 1,
                        child: FittedBox(
                          child: SvgPicture.asset(
                            Assets.svgLight.eye,
                            fit: BoxFit.contain,
                            color: _passwordIconColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
      listener: (context, state) {
      },
    );
  }
}
