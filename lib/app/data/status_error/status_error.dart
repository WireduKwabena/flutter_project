//import 'dart:convert';

import 'error.dart';

class StatusError {
  Error? error;

  StatusError({this.error});

  factory StatusError.fromMap(Map<String, dynamic> data) => StatusError(
        error: data['error'] == null
            ? null
            : Error.fromMap(data['error'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'error': error?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StatusError].
  // factory StatusError.fromJson(String data) {
  // 	return StatusError.fromMap(json.decode(data) as Map<String, dynamic>);
  // }
  // /// `dart:convert`
  // ///
  // /// Converts [StatusError] to a JSON string.
  // String toJson() => json.encode(toMap());
}
