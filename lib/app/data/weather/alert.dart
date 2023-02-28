class Alert {
  String? headline;
  String? msgtype;
  String? severity;
  String? urgency;
  String? areas;
  String? category;
  String? certainty;
  String? event;
  String? note;
  String? effective;
  String? expires;
  String? desc;
  String? instruction;

  Alert({
    this.headline,
    this.msgtype,
    this.severity,
    this.urgency,
    this.areas,
    this.category,
    this.certainty,
    this.event,
    this.note,
    this.effective,
    this.expires,
    this.desc,
    this.instruction,
  });

  factory Alert.fromJson(Map<String, dynamic> json) => Alert(
        headline: json['headline'] != null ? json['headline'] as String : null,
        msgtype: json['msgtype'] != null ? json['msgtype'] as String : null,
        severity: json['severity'] != null ? json['severity'] as String : null,
        urgency: json['urgency'] != null ? json['urgency'] as String : null,
        areas: json['areas'] != null ? json['areas'] as String : null,
        category: json['category'] != null ? json['category'] as String : null,
        certainty:
            json['certainty'] != null ? json['certainty'] as String : null,
        event: json['event'] != null ? json['event'] as String : null,
        note: json['note'] != null ? json['note'] as String : null,
        effective:
            json['effective'] != null ? json['effective'] as String : null,
        expires: json['expires'] != null ? json['expires'] as String : null,
        desc: json['desc'] != null ? json['desc'] as String : null,
        instruction:
            json['instruction'] != null ? json['instruction'] as String : null,
      );

  Map<String, dynamic> toJson() => {
        'headline': headline,
        'msgtype': msgtype,
        'severity': severity,
        'urgency': urgency,
        'areas': areas,
        'category': category,
        'certainty': certainty,
        'event': event,
        'note': note,
        'effective': effective,
        'expires': expires,
        'desc': desc,
        'instruction': instruction,
      };
}



/*"alerts": {
        "alert": [
            {
               // "": "Dense Fog Advisory issued December 31 at 5:36AM EST until December 31 at 10:00AM EST by NWS",
               // "": "Alert",
               // "": "Minor",
               // "": "Expected",
               // "": "Atlantic; Atlantic Coastal Cape May; Camden; Cape May; Coastal Atlantic; Coastal Ocean; Cumberland; Eastern Monmouth; Gloucester; Mercer; Middlesex; Northwestern Burlington; Ocean; Salem; Southeastern Burlington; Western Monmouth",
               // "": "Met",
               // "": "Likely",
               // "": "Dense Fog Advisory",
                //"": "Alert for Atlantic; Atlantic Coastal Cape May; Camden; Cape May; Coastal Atlantic; Coastal Ocean; Cumberland; Eastern Monmouth; Gloucester; Mercer; Middlesex; Northwestern Burlington; Ocean; Salem; Southeastern Burlington; Western Monmouth (New Jersey) Issued by the National Weather Service",
                //"": "2022-12-31T05:36:00-05:00",
               // "": "2022-12-31T10:00:00-05:00",
               // "": "...DENSE FOG ADVISORY IN EFFECT UNTIL 10 AM EST THIS MORNING...\n* WHAT...Visibility one quarter to one half mile in dense fog.\n* WHERE...Portions of Delaware, the eastern shores of Maryland,\nNew Jersey, and southeast Pennsylvania.\n* WHEN...Until 10 AM EST this morning.\n* IMPACTS...Hazardous driving conditions due to low visibility.",
                //"": "If driving, slow down, use your headlights, and leave plenty of\ndistance ahead of you."
            }
        ]
    }*/