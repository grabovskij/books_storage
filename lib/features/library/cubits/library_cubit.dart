import 'package:books_storage/features/library/states/library_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LibraryCubit extends Cubit<LibraryState> {
  LibraryCubit() : super(LibraryLoadingState());
}
