//import 'dart:convert';

class Error {
	int? code;
	String? message;

	Error({this.code, this.message});

	factory Error.fromMap(Map<String, dynamic> data) => Error(
				code: data['code'] as int?,
				message: data['message'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'code': code,
				'message': message,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Error].
	// factory Error.fromJson(String data) {
	// 	return Error.fromMap(json.decode(data) as Map<String, dynamic>);
	// }
  // /// `dart:convert`
  // ///
  // /// Converts [Error] to a JSON string.
	// String toJson() => json.encode(toMap());
}
