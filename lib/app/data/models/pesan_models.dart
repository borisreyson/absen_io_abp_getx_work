class PesanModels {
  String? username;
  String? usernameTo;
  String? tree;
  String? subject;
  String? message;
  String? noRkb;
  String? partName;
  PesanModels(
      {this.username,
      this.usernameTo,
      this.tree,
      this.subject,
      this.message,
      this.noRkb,
      this.partName});
  factory PesanModels.fromJson(Map<String, dynamic> json) {
    return PesanModels(
      username: json['username'],
      usernameTo: json['username_to'],
      tree: json['tree'],
      subject: json['subject'],
      message: json['message'],
      noRkb: json['no_rkb'],
      partName: json['part_name'],
    );
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['username_to'] = usernameTo;
    data['tree'] = tree;
    data['subject'] = subject;
    data['message'] = message;
    data['no_rkb'] = noRkb;
    data['part_name'] = partName;
    return data;
  }
}
