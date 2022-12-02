import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'locals_state.dart';

class LocalsCubit extends Cubit<LocalsState> {
  LocalsCubit() : super(LocalsState(documents: const []));
}
