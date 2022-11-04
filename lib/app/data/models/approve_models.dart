class ApproveModels {
  bool? approve;
  ApproveModels({this.approve});
  factory ApproveModels.fromJson(Map<String, dynamic> json) {
    return ApproveModels(approve: json['approve']);
  }
}

class ApprovePost {
  String? username;
  String? noRkb;
  ApprovePost({this.username, this.noRkb});
  factory ApprovePost.fromJson(Map<String, dynamic> json) {
    return ApprovePost(username: json['username'], noRkb: json['no_rkb']);
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['username'] = username;
    data['no_rkb'] = noRkb;
    return data;
  }
}



class CancelRKB {
  String? username;
  String? noRkb;
  String? remarks;
  String? section;
  CancelRKB({this.username,this.section, this.noRkb,this.remarks});
  factory CancelRKB.fromJson(Map<String, dynamic> json) {
    return CancelRKB(username: json['username'],section: json['section'], noRkb: json['no_rkb'],remarks: json['remarks']);
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['username'] = username;
    data['section'] = section;
    data['no_rkb'] = noRkb;
    data['remarks'] = remarks;
    return data;
  }
}