import 'package:collection/collection.dart';

enum LikeStatus {
  Like,
  Dislike,
  None,
}

enum DocumentUploadStatus {
  InProgress,
  Uploaded,
  Neutral,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (LikeStatus):
      return LikeStatus.values.deserialize(value) as T?;
    case (DocumentUploadStatus):
      return DocumentUploadStatus.values.deserialize(value) as T?;
    default:
      return null;
  }
}
