import 'package:core/router/app_router.dart';
import 'package:core/ui/login/bloc/login_bloc.dart';
import 'package:core/ui/login/widgets/or_divider.dart';
import 'package:core/ui/login/widgets/register_text.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: BlocConsumer<LoginBloc, LoginState>(
              listenWhen: (previous, current) =>
                  previous.result != current.result,
              buildWhen: (previous, current) =>
                  previous.processing != current.processing,
              listener: (context, state) {
                state.result.fold(
                  () {},
                  (r) => r.fold(
                    (error) {
                      String message;
                      switch (error.runtimeType) {
                        case ServerError:
                          message = LocaleKeys.error_server;
                          break;
                        default:
                          message = LocaleKeys.error_unexpected;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(message).tr(),
                        duration: const Duration(seconds: 3),
                      ));
                    },
                    (_) {
                      AutoRouter.of(context).push(const HomeRoute());
                    },
                  ),
                );
              },
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        LocaleKeys.login_title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                        textAlign: TextAlign.center,
                      ).tr(),
                      const SizedBox(height: 2),
                      const Text(
                        LocaleKeys.login_subtitle,
                        textAlign: TextAlign.center,
                      ).tr(),
                      const SizedBox(height: 45),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixText: "+62 ",
                          labelText: LocaleKeys.label_phone_number_input.tr(),
                        ),
                        keyboardType: TextInputType.phone,
                        onChanged: (value) => context
                            .read<LoginBloc>()
                            .add(LoginEvent.phoneNumberChanged(value)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return LocaleKeys.error_input_phone_number_empty
                                .tr();
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      FilledButton(
                        onPressed: state.processing
                            ? null
                            : () {
                                if (_formKey.currentState?.validate() == true) {
                                  context
                                      .read<LoginBloc>()
                                      .add(const LoginEvent.proceed());
                                }
                              },
                        child:
                            const Text(LocaleKeys.login_button_continue).tr(),
                      ),
                      if (state.processing) ...[
                        const SizedBox(height: 5),
                        const LinearProgressIndicator()
                      ],
                      const SizedBox(height: 27),
                      const OrDivider(),
                      const SizedBox(height: 29),
                      OutlinedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/google.svg',
                              width: 20,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 8),
                            const Text(LocaleKeys.login_button_login_google)
                                .tr(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      const RegisterText(),
                      const Spacer(),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
