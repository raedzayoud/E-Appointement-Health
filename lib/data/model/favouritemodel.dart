class FavouriteModel {
  int? favouriteId;
  int? favouriteDoctorid;
  int? favouriteUsersid;
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

  FavouriteModel(
      {this.favouriteId,
      this.favouriteDoctorid,
      this.favouriteUsersid,
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

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    favouriteId = json['favourite_id'];
    favouriteDoctorid = json['favourite_doctorid'];
    favouriteUsersid = json['favourite_usersid'];
    doctorId = json['doctor_id'];
    doctorUsername = json['doctor_username'];
    doctorDescription = json['doctor_description'];
    doctorType = json['doctor_type'];
    doctorImage = json['doctor_image'];
    doctorReview = json['doctor_review'];
    doctorPatient = json['doctor_patient'];
    doctorExperience = json['doctor_experience'];
    doctorRating = (json['doctor_rating'] != null)
        ? json['doctor_rating'].toDouble()
        : 0.0;
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
    data['favourite_id'] = this.favouriteId;
    data['favourite_doctorid'] = this.favouriteDoctorid;
    data['favourite_usersid'] = this.favouriteUsersid;
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