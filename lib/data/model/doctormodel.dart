
class Doctormodel {
  int? doctorId;
  String? doctorUsername;
  String? doctorDescription;
  String? doctorType;
  String? doctorImage;
  int? doctorReview;
  int? doctorPatient;
  int? doctorExperience;
  double? doctorRating;

  Doctormodel(
      {this.doctorId,
      this.doctorUsername,
      this.doctorDescription,
      this.doctorType,
      this.doctorImage,
      this.doctorReview,
      this.doctorPatient,
      this.doctorExperience,
      this.doctorRating});

  Doctormodel.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    doctorUsername = json['doctor_username'];
    doctorDescription = json['doctor_description'];
    doctorType = json['doctor_type'];
    doctorImage = json['doctor_image'];
    doctorReview = json['doctor_review'];
    doctorPatient = json['doctor_patient'];
    doctorExperience = json['doctor_experience'];
    // Safely convert doctor_rating to double
    doctorRating = (json['doctor_rating'] != null)
        ? json['doctor_rating'].toDouble()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_id'] = this.doctorId;
    data['doctor_username'] = this.doctorUsername;
    data['doctor_description'] = this.doctorDescription;
    data['doctor_type'] = this.doctorType;
    data['doctor_image'] = this.doctorImage;
    data['doctor_review'] = this.doctorReview;
    data['doctor_patient'] = this.doctorPatient;
    data['doctor_experience'] = this.doctorExperience;
    data['doctor_rating'] = this.doctorRating;
    return data;
  }
}
