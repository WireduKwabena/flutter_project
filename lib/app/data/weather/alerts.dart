import 'alert.dart';

class Alerts {
	List<Alert>? alert;

	Alerts({this.alert});

	factory Alerts.fromJson(Map<String, dynamic> json) => Alerts(
				alert: json['alert'] == null ? null :
        (json['alert'] as List<dynamic>?)?.map((e) => Alert.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => 
  {
				'alert': alert?.map((e) => e.toJson()).toList(),
			};
}
