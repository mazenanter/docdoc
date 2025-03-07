part of 'signup_cubit.dart';

@freezed
class SignupState<T> with _$SignupState<T> {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.signupLoading() = Loading;
  const factory SignupState.signupSuccess(T data) = Success;
  const factory SignupState.signupError(ApiErrorModel apiErrorModel) = Error;
}
