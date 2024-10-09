import 'package:code_base/common/constant/app_errors/app_error.dart';

class AppOtherError extends AppError {
  late final String message;

  late final Exception? exception;

  AppOtherError({
    required this.message,
    required this.exception,
  });

  @override
  void logErrorToLogger() {
    // TODO: implement logErrorToLogger
  }

  @override
  // TODO: implement props
  List<Object?> get props => [exception];
}
