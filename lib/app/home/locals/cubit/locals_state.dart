part of 'locals_cubit.dart';

@immutable
class LocalsState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;

  LocalsState({required this.documents});
}
