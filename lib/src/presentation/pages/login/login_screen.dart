import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxy_boots/src/presentation/managers/login/login_states.dart';
import 'package:oxy_boots/src/presentation/managers/login/login_view_model.dart';
import 'package:oxy_boots/src/presentation/pages/login/login_screen_body.dart';

import '../../../../core/di/di.dart';
import '../../../../core/helpers/common_imports.dart';
import '../../../../gen/assets.gen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final viewModel = getIt.get<LoginViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: (){

            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                Assets.svgLight.arrowBack,
              ),
            ),
          ),
        ),
        body: BlocConsumer<LoginViewModel,LoginStates>(
          builder: (context, state) {
            return LoginScreenBody();
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
