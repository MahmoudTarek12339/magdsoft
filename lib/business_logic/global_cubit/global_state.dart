part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class GetProductsLoadingState extends GlobalState {}

class GetProductsSuccessState extends GlobalState {}

class GetProductsErrorState extends GlobalState {
  final String error;

  GetProductsErrorState(this.error);
}

class GetHelperLoadingState extends GlobalState {}

class GetHelperSuccessState extends GlobalState {}

class GetHelperErrorState extends GlobalState {
  final String error;

  GetHelperErrorState(this.error);
}

class GetLogInLoadingState extends GlobalState {}

class GetLogInSuccessState extends GlobalState {}

class GetLogInErrorState extends GlobalState {
  final String error;

  GetLogInErrorState(this.error);
}

class GetVerificationLoadingState extends GlobalState {}

class GetVerificationSuccessState extends GlobalState {}

class GetVerificationErrorState extends GlobalState {
  final String error;

  GetVerificationErrorState(this.error);
}

class UpdateState extends GlobalState {}
class ChangeChoiceState extends GlobalState {}
