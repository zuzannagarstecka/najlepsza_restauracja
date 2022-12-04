part of 'locals_cubit.dart';

@immutable
class LocalsState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const LocalsState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
