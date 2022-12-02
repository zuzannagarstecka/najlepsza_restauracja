import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'locals_state.dart';

class LocalsCubit extends Cubit<LocalsState> {
  LocalsCubit() : super(LocalsState());
}
