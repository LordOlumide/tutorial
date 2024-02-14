import 'package:equatable/equatable.dart';

class ScreenDetails extends Equatable {
  final String screenTitle;
  final List<String> displayList;

  const ScreenDetails({
    required this.screenTitle,
    required this.displayList,
  });

  ScreenDetails copyWith({
    String? screenTitle,
    List<String>? displayList,
  }) {
    return ScreenDetails(
      screenTitle: screenTitle ?? this.screenTitle,
      displayList: displayList ?? this.displayList,
    );
  }

  @override
  List<Object?> get props => [screenTitle, displayList];
}
