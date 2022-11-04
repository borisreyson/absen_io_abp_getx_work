class RkbDetailModels {
  List<RkbDetail>? rkbDetail;

  RkbDetailModels({this.rkbDetail});

  RkbDetailModels.fromJson(Map<String, dynamic> json) {
    if (json['rkbDetail'] != null) {
      rkbDetail = <RkbDetail>[];
      json['rkbDetail'].forEach((v) {
        rkbDetail!.add(RkbDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rkbDetail != null) {
      data['rkbDetail'] = rkbDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RkbDetail {
  int? idHeaderRKB;
  String? noRkb;
  String? dept;
  String? section;
  String? tglOrder;
  String? userClose;
  int? status;
  String? timeStatus;
  String? noPo;
  int? id;
  String? item;
  String? partName;
  String? partNumber;
  int? quantity;
  String? satuan;
  String? userEntry;
  String? timelog;
  String? remarks;
  String? dueDate;
  String? poItem;
  String? keterangan;
  int? inc;
  String? disetujui;
  String? tglDisetujui;
  String? diketahui;
  String? tglDiketahui;
  String? cancelUser;
  String? tglCancelUser;
  String? cancelSection;
  String? remarkCancel;
  String? userExpired;
  String? tglExpired;
  String? expiredRemarks;
  int? idUser;
  String? username;
  String? password;
  String? namaLengkap;
  String? email;
  String? department;
  String? level;
  String? idSession;
  String? ttd;
  String? rule;
  String? tglentry;
  String? nik;
  int? perusahaan;
  String? photoProfile;
  String? userUpdate;
  String? tokenPassword;
  String? idDept;
  int? company;

  RkbDetail(
      {this.idHeaderRKB,
      this.noRkb,
      this.dept,
      this.section,
      this.tglOrder,
      this.userClose,
      this.status,
      this.timeStatus,
      this.noPo,
      this.id,
      this.item,
      this.partName,
      this.partNumber,
      this.quantity,
      this.satuan,
      this.userEntry,
      this.timelog,
      this.remarks,
      this.dueDate,
      this.poItem,
      this.keterangan,
      this.inc,
      this.disetujui,
      this.tglDisetujui,
      this.diketahui,
      this.tglDiketahui,
      this.cancelUser,
      this.tglCancelUser,
      this.cancelSection,
      this.remarkCancel,
      this.userExpired,
      this.tglExpired,
      this.expiredRemarks,
      this.idUser,
      this.username,
      this.password,
      this.namaLengkap,
      this.email,
      this.department,
      this.level,
      this.idSession,
      this.ttd,
      this.rule,
      this.tglentry,
      this.nik,
      this.perusahaan,
      this.photoProfile,
      this.userUpdate,
      this.tokenPassword,
      this.idDept,
      this.company});

  RkbDetail.fromJson(Map<String, dynamic> json) {
    idHeaderRKB = json['idHeaderRKB'];
    noRkb = json['no_rkb'];
    dept = json['dept'];
    section = json['section'];
    tglOrder = json['tgl_order'];
    userClose = json['user_close'];
    status = json['status'];
    timeStatus = json['time_status'];
    noPo = json['no_po'];
    id = json['id'];
    item = json['item'];
    partName = json['part_name'];
    partNumber = json['part_number'];
    quantity = json['quantity'];
    satuan = json['satuan'];
    userEntry = json['user_entry'];
    timelog = json['timelog'];
    remarks = json['remarks'];
    dueDate = json['due_date'];
    poItem = json['po_item'];
    keterangan = json['keterangan'];
    inc = json['inc'];
    disetujui = json['disetujui'];
    tglDisetujui = json['tgl_disetujui'];
    diketahui = json['diketahui'];
    tglDiketahui = json['tgl_diketahui'];
    cancelUser = json['cancel_user'];
    tglCancelUser = json['tgl_cancel_user'];
    cancelSection = json['cancel_section'];
    remarkCancel = json['remark_cancel'];
    userExpired = json['user_expired'];
    tglExpired = json['tgl_expired'];
    expiredRemarks = json['expired_remarks'];
    idUser = json['id_user'];
    username = json['username'];
    password = json['password'];
    namaLengkap = json['nama_lengkap'];
    email = json['email'];
    department = json['department'];
    level = json['level'];
    idSession = json['id_session'];
    ttd = json['ttd'];
    rule = json['rule'];
    tglentry = json['tglentry'];
    nik = json['nik'];
    perusahaan = json['perusahaan'];
    photoProfile = json['photo_profile'];
    userUpdate = json['user_update'];
    tokenPassword = json['token_password'];
    idDept = json['id_dept'];
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idHeaderRKB'] = idHeaderRKB;
    data['no_rkb'] = noRkb;
    data['dept'] = dept;
    data['section'] = section;
    data['tgl_order'] = tglOrder;
    data['user_close'] = userClose;
    data['status'] = status;
    data['time_status'] = timeStatus;
    data['no_po'] = noPo;
    data['id'] = id;
    data['item'] = item;
    data['part_name'] = partName;
    data['part_number'] = partNumber;
    data['quantity'] = quantity;
    data['satuan'] = satuan;
    data['user_entry'] = userEntry;
    data['timelog'] = timelog;
    data['remarks'] = remarks;
    data['due_date'] = dueDate;
    data['po_item'] = poItem;
    data['keterangan'] = keterangan;
    data['inc'] = inc;
    data['disetujui'] = disetujui;
    data['tgl_disetujui'] = tglDisetujui;
    data['diketahui'] = diketahui;
    data['tgl_diketahui'] = tglDiketahui;
    data['cancel_user'] = cancelUser;
    data['tgl_cancel_user'] = tglCancelUser;
    data['cancel_section'] = cancelSection;
    data['remark_cancel'] = remarkCancel;
    data['user_expired'] = userExpired;
    data['tgl_expired'] = tglExpired;
    data['expired_remarks'] = expiredRemarks;
    data['id_user'] = idUser;
    data['username'] = username;
    data['password'] = password;
    data['nama_lengkap'] = namaLengkap;
    data['email'] = email;
    data['department'] = department;
    data['level'] = level;
    data['id_session'] = idSession;
    data['ttd'] = ttd;
    data['rule'] = rule;
    data['tglentry'] = tglentry;
    data['nik'] = nik;
    data['perusahaan'] = perusahaan;
    data['photo_profile'] = photoProfile;
    data['user_update'] = userUpdate;
    data['token_password'] = tokenPassword;
    data['id_dept'] = idDept;
    data['company'] = company;
    return data;
  }
}
