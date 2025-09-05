class Welcome {
  String? id;
  String? email;
  String? password;
  String? role;
  ProfileDetails? profileDetails;

  Welcome({
    this.id,
    this.email,
    this.password,
    this.role,
    this.profileDetails,
  });

}

class ProfileDetails {
  String? hospitalName;
  HospitalAddress? hospitalAddress;
  String? hospitalProfilePicture;
  String? hospitalLicenseImage;

  ProfileDetails({
    this.hospitalName,
    this.hospitalAddress,
    this.hospitalProfilePicture,
    this.hospitalLicenseImage,
  });

}

class HospitalAddress {
  double? lat;
  double? long;
  String? fullAddress;

  HospitalAddress({
    this.lat,
    this.long,
    this.fullAddress,
  });

}
