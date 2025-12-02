class CaseModel {
  final String id;
  final String childFirstName;
  final String childLastName;
  final String childSex;
  final int childAge;
  final String scholarYear;
  final String parentId;
  final String? doctorId;
  final List<ScreeningAnswer> screeningAnswers;
  final String gravityScore;
  final String? videoUrl;
  final String status;
  final Diagnosis? diagnosis;
  final AdditionalTestRequest? additionalTestRequest;
  final DateTime createdAt;
  final DateTime updatedAt;

  CaseModel({
    required this.id,
    required this.childFirstName,
    required this.childLastName,
    required this.childSex,
    required this.childAge,
    required this.scholarYear,
    required this.parentId,
    this.doctorId,
    required this.screeningAnswers,
    required this.gravityScore,
    this.videoUrl,
    required this.status,
    this.diagnosis,
    this.additionalTestRequest,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CaseModel.fromJson(Map<String, dynamic> json) {
    return CaseModel(
      id: json['_id'] ?? '',
      childFirstName: json['childFirstName'] ?? '',
      childLastName: json['childLastName'] ?? '',
      childSex: json['childSex'] ?? '',
      childAge: json['childAge'] ?? 0,
      scholarYear: json['scholarYear'] ?? '',
      parentId: json['parentId'] is String ? json['parentId'] : json['parentId']['_id'] ?? '',
      doctorId: json['doctorId'],
      screeningAnswers: (json['screeningAnswers'] as List?)
          ?.map((e) => ScreeningAnswer.fromJson(e))
          .toList() ?? [],
      gravityScore: json['gravityScore'] ?? 'low',
      videoUrl: json['videoUrl'],
      status: json['status'] ?? 'waiting_for_doctor',
      diagnosis: json['diagnosis'] != null ? Diagnosis.fromJson(json['diagnosis']) : null,
      additionalTestRequest: json['additionalTestRequest'] != null 
          ? AdditionalTestRequest.fromJson(json['additionalTestRequest']) 
          : null,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  String get childFullName => '$childFirstName $childLastName';
  
  String get statusDisplay {
    switch (status) {
      case 'waiting_for_doctor': return 'Waiting for Doctor';
      case 'additional_test_required': return 'Additional Test Required';
      case 'waiting_for_reply': return 'Waiting for Reply';
      case 'completed': return 'Completed';
      case 'diagnosis_ready': return 'Diagnosis Ready';
      default: return status;
    }
  }
}

class ScreeningAnswer {
  final String question;
  final String answer;

  ScreeningAnswer({required this.question, required this.answer});

  factory ScreeningAnswer.fromJson(Map<String, dynamic> json) {
    return ScreeningAnswer(
      question: json['question'] ?? '',
      answer: json['answer'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answer': answer,
    };
  }
}

class Diagnosis {
  final String summary;
  final String advice;
  final String recommendation;
  final String doctorName;
  final DateTime completedAt;

  Diagnosis({
    required this.summary,
    required this.advice,
    required this.recommendation,
    required this.doctorName,
    required this.completedAt,
  });

  factory Diagnosis.fromJson(Map<String, dynamic> json) {
    return Diagnosis(
      summary: json['summary'] ?? '',
      advice: json['advice'] ?? '',
      recommendation: json['recommendation'] ?? '',
      doctorName: json['doctorName'] ?? '',
      completedAt: DateTime.parse(json['completedAt'] ?? DateTime.now().toIso8601String()),
    );
  }
}

class AdditionalTestRequest {
  final String testType;
  final String instructions;
  final DateTime requestedAt;

  AdditionalTestRequest({
    required this.testType,
    required this.instructions,
    required this.requestedAt,
  });

  factory AdditionalTestRequest.fromJson(Map<String, dynamic> json) {
    return AdditionalTestRequest(
      testType: json['testType'] ?? '',
      instructions: json['instructions'] ?? '',
      requestedAt: DateTime.parse(json['requestedAt'] ?? DateTime.now().toIso8601String()),
    );
  }
}