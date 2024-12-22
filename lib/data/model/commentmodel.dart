class CommentModel {
  int? commentId;
  int? commentUserid;
  int? commentDoctorid;
  String? commentComment;
  double? commentRating; // Changed to double
  int? usersId;
  String? usersUsername;
  String? usersEmail;
  String? usersPhone;
  String? usersAge;
  String? usersPassword;
  String? usersImage;
  int? doctorId;
  String? doctorUsername;
  String? doctorDescription;
  String? doctorType;
  String? doctorImage;
  int? doctorReview;
  int? doctorPatient;
  int? doctorExperience;
  double? doctorRating; // Changed to double

  CommentModel({
    this.commentId,
    this.commentUserid,
    this.commentDoctorid,
    this.commentComment,
    this.commentRating,
    this.usersId,
    this.usersUsername,
    this.usersEmail,
    this.usersPhone,
    this.usersAge,
    this.usersPassword,
    this.usersImage,
    this.doctorId,
    this.doctorUsername,
    this.doctorDescription,
    this.doctorType,
    this.doctorImage,
    this.doctorReview,
    this.doctorPatient,
    this.doctorExperience,
    this.doctorRating,
  });

  CommentModel.fromJson(Map<String, dynamic> json) {
    commentId = json['comment_id'];
    commentUserid = json['comment_userid'];
    commentDoctorid = json['comment_doctorid'];
    commentComment = json['comment_comment'];
    commentRating = (json['comment_rating'] as num?)?.toDouble(); // Safely convert to double
    usersId = json['users_id'];
    usersUsername = json['users_username'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    usersAge = json['users_age'];
    usersPassword = json['users_password'];
    usersImage = json['users_image'];
    doctorId = json['doctor_id'];
    doctorUsername = json['doctor_username'];
    doctorDescription = json['doctor_description'];
    doctorType = json['doctor_type'];
    doctorImage = json['doctor_image'];
    doctorReview = json['doctor_review'];
    doctorPatient = json['doctor_patient'];
    doctorExperience = json['doctor_experience'];
    doctorRating = (json['doctor_rating'] as num?)?.toDouble(); // Safely convert to double
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['comment_id'] = commentId;
    data['comment_userid'] = commentUserid;
    data['comment_doctorid'] = commentDoctorid;
    data['comment_comment'] = commentComment;
    data['comment_rating'] = commentRating;
    data['users_id'] = usersId;
    data['users_username'] = usersUsername;
    data['users_email'] = usersEmail;
    data['users_phone'] = usersPhone;
    data['users_age'] = usersAge;
    data['users_password'] = usersPassword;
    data['users_image'] = usersImage;
    data['doctor_id'] = doctorId;
    data['doctor_username'] = doctorUsername;
    data['doctor_description'] = doctorDescription;
    data['doctor_type'] = doctorType;
    data['doctor_image'] = doctorImage;
    data['doctor_review'] = doctorReview;
    data['doctor_patient'] = doctorPatient;
    data['doctor_experience'] = doctorExperience;
    data['doctor_rating'] = doctorRating;
    return data;
  }
}
