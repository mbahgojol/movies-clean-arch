import 'package:core/domain/interactors/request_login.dart';
import 'package:dartz/dartz.dart';
import 'package:dependencies/dependencies.dart';
import 'package:shared/common/network/result.dart';

part 'login_bloc.freezed.dart';

part 'login_event.dart';

part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RequestLogin requestLogin;

  LoginBloc(this.requestLogin) : super(LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      await event.map(
        phoneNumberChanged: (e) async {
          emit(state.copyWith.call(
            phoneNumber: e.value,
          ));
        },
        proceed: (e) async {
          emit(state.copyWith.call(
            processing: true,
            result: none(),
          ));

          // final result = await requestLogin(Params(
          //   emailAddress: state.emailAddress,
          //   password: state.password,
          // ));
          await Future.delayed(Duration(seconds: 3));

          emit(state.copyWith.call(
            processing: false,
            result: none(),
          ));
        },
      );
    });
  }
}
