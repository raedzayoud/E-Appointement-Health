class appointementmodel {
  int? appointementId;
  int? appointementDoctorid;
  int? appointementUserid;
  int? appointementStatus;
  String? appointementDate;
  String? appointementHeure;
  int? doctorId;
  String? doctorUsername;
  String? doctorDescription;
  String? doctorType;
  String? doctorImage;
  int? doctorReview;
  int? doctorPatient;
  int? doctorExperience;
  double? doctorRating;
  int? usersId;
  String? usersUsername;
  String? usersEmail;
  String? usersPhone;
  String? usersAge;
  String? usersPassword;
  String? usersImage;

  appointementmodel(
      {this.appointementId,
      this.appointementDoctorid,
      this.appointementUserid,
      this.appointementStatus,
      this.appointementDate,
      this.appointementHeure,
      this.doctorId,
      this.doctorUsername,
      this.doctorDescription,
      this.doctorType,
      this.doctorImage,
      this.doctorReview,
      this.doctorPatient,
      this.doctorExperience,
      this.doctorRating,
      this.usersId,
      this.usersUsername,
      this.usersEmail,
      this.usersPhone,
      this.usersAge,
      this.usersPassword,
      this.usersImage});
appointementmodel.fromJson(Map<String, dynamic> json) {
    appointementId = json['appointement_id'];
    appointementDoctorid = json['appointement_doctorid'];
    appointementUserid = json['appointement_userid'];
    appointementStatus = json['appointement_status'];
    appointementDate = json['appointement_date'];
    appointementHeure = json['appointement_heure'];
    doctorId = json['doctor_id'];
    doctorUsername = json['doctor_username'];
    doctorDescription = json['doctor_description'];
    doctorType = json['doctor_type'];
    doctorImage = json['doctor_image'];
    doctorReview = json['doctor_review'];
    doctorPatient = json['doctor_patient'];
    doctorExperience = json['doctor_experience'];
    doctorRating = json['doctor_rating'] is int
        ? (json['doctor_rating'] as int).toDouble()
        : json['doctor_rating']?.toDouble();
    usersId = json['users_id'];
    usersUsername = json['users_username'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    usersAge = json['users_age'];
    usersPassword = json['users_password'];
    usersImage = json['users_image'];
}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appointement_id'] = this.appointementId;
    data['appointement_doctorid'] = this.appointementDoctorid;
    data['appointement_userid'] = this.appointementUserid;
    data['appointement_status'] = this.appointementStatus;
    data['appointement_date'] = this.appointementDate;
    data['appointement_heure'] = this.appointementHeure;
    data['doctor_id'] = this.doctorId;
    data['doctor_username'] = this.doctorUsername;
    data['doctor_description'] = this.doctorDescription;
    data['doctor_type'] = this.doctorType;
    data['doctor_image'] = this.doctorImage;
    data['doctor_review'] = this.doctorReview;
    data['doctor_patient'] = this.doctorPatient;
    data['doctor_experience'] = this.doctorExperience;
    data['doctor_rating'] = this.doctorRating;
    data['users_id'] = this.usersId;
    data['users_username'] = this.usersUsername;
    data['users_email'] = this.usersEmail;
    data['users_phone'] = this.usersPhone;
    data['users_age'] = this.usersAge;
    data['users_password'] = this.usersPassword;
    data['users_image'] = this.usersImage;
    return data;
  }
}