part of './basic_cubit.dart';

class BasicState extends Equatable {
  final ScreenDetails details;
  final Color squareColor;
  final bool screenIsLoading;

  const BasicState({
    required this.details,
    required this.squareColor,
    required this.screenIsLoading,
  });

  BasicState copyWith({
    ScreenDetails? details,
    Color? squareColor,
    bool? screenIsLoading,
  }) {
    return BasicState(
      details: details ?? this.details,
      squareColor: squareColor ?? this.squareColor,
      screenIsLoading: screenIsLoading ?? this.screenIsLoading,
    );
  }

  @override
  List<Object?> get props => [details, squareColor, screenIsLoading];
}
