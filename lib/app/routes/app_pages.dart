import 'package:get/get.dart';

import '../modules/buletin/bindings/buletin_binding.dart';
import '../modules/buletin/listBuletin/bindings/list_buletin_binding.dart';
import '../modules/buletin/listBuletin/views/list_buletin_view.dart';
import '../modules/buletin/views/buletin_view.dart';
import '../modules/enp/monitoring/bindings/monitoring_binding.dart';
import '../modules/enp/monitoring/screens/monitoringBarging/bindings/monitoring_barging_binding.dart';
import '../modules/enp/monitoring/screens/monitoringBarging/views/monitoring_barging_view.dart';
import '../modules/enp/monitoring/screens/monitoringCrushing/bindings/monitoring_crushing_binding.dart';
import '../modules/enp/monitoring/screens/monitoringCrushing/views/monitoring_crushing_view.dart';
import '../modules/enp/monitoring/screens/monitoringHauling/bindings/monitoring_hauling_binding.dart';
import '../modules/enp/monitoring/screens/monitoringHauling/views/monitoring_hauling_view.dart';
import '../modules/enp/monitoring/screens/monitoringHaulingDelay/bindings/monitoring_hauling_delay_binding.dart';
import '../modules/enp/monitoring/screens/monitoringHaulingDelay/views/monitoring_hauling_delay_view.dart';
import '../modules/enp/monitoring/screens/monitoringOB/bindings/monitoring_o_b_binding.dart';
import '../modules/enp/monitoring/screens/monitoringOB/views/monitoring_o_b_view.dart';
import '../modules/enp/monitoring/screens/monitoringObDlay/bindings/monitoring_ob_dlay_binding.dart';
import '../modules/enp/monitoring/screens/monitoringObDlay/views/monitoring_ob_dlay_view.dart';
import '../modules/enp/monitoring/screens/monitoringPLN/bindings/monitoring_p_l_n_binding.dart';
import '../modules/enp/monitoring/screens/monitoringPLN/views/monitoring_p_l_n_view.dart';
import '../modules/enp/monitoring/screens/monitoringStockProduct/bindings/monitoring_stock_product_binding.dart';
import '../modules/enp/monitoring/screens/monitoringStockProduct/views/monitoring_stock_product_view.dart';
import '../modules/enp/monitoring/screens/monitoringStockRom/bindings/monitoring_stock_rom_binding.dart';
import '../modules/enp/monitoring/screens/monitoringStockRom/views/monitoring_stock_rom_view.dart';
import '../modules/enp/monitoring/screens/monitoringTugboat/bindings/monitoring_tugboat_binding.dart';
import '../modules/enp/monitoring/screens/monitoringTugboat/views/monitoring_tugboat_view.dart';
import '../modules/enp/monitoring/views/monitoring_view.dart';
import '../modules/hge/cuti/TiketPesawatCuti/bindings/tiket_pesawat_cuti_binding.dart';
import '../modules/hge/cuti/TiketPesawatCuti/views/tiket_pesawat_cuti_view.dart';
import '../modules/hge/cuti/cutiKeAtasan/bindings/cuti_ke_atasan_binding.dart';
import '../modules/hge/cuti/cutiKeAtasan/views/cuti_ke_atasan_view.dart';
import '../modules/hge/cuti/cutiKeDeptHead/bindings/cuti_ke_dept_head_binding.dart';
import '../modules/hge/cuti/cutiKeDeptHead/views/cuti_ke_dept_head_view.dart';
import '../modules/hge/cuti/cutiKeHC/bindings/cuti_ke_h_c_binding.dart';
import '../modules/hge/cuti/cutiKeHC/views/cuti_ke_h_c_view.dart';
import '../modules/hge/cuti/cutiKeKTT/bindings/cuti_ke_k_t_t_binding.dart';
import '../modules/hge/cuti/cutiKeKTT/views/cuti_ke_k_t_t_view.dart';
import '../modules/hge/cuti/cutiPdf/bindings/cuti_pdf_binding.dart';
import '../modules/hge/cuti/cutiPdf/views/cuti_pdf_view.dart';
import '../modules/hge/cuti/detaiCuti/bindings/detai_cuti_binding.dart';
import '../modules/hge/cuti/detaiCuti/views/detai_cuti_view.dart';
import '../modules/hge/cuti/formCuti/bindings/form_cuti_binding.dart';
import '../modules/hge/cuti/formCuti/views/form_cuti_view.dart';
import '../modules/hge/cuti/formMaskapai/bindings/form_maskapai_binding.dart';
import '../modules/hge/cuti/formMaskapai/views/form_maskapai_view.dart';
import '../modules/hge/cuti/jenisCuti/bindings/jenis_cuti_binding.dart';
import '../modules/hge/cuti/jenisCuti/views/jenis_cuti_view.dart';
import '../modules/hge/cuti/listCuti/bindings/list_cuti_binding.dart';
import '../modules/hge/cuti/listCuti/views/list_cuti_view.dart';
import '../modules/hge/cuti/maskapaiList/bindings/maskapai_list_binding.dart';
import '../modules/hge/cuti/maskapaiList/views/maskapai_list_view.dart';
import '../modules/hge/cuti/menuCuti/bindings/menu_cuti_binding.dart';
import '../modules/hge/cuti/menuCuti/views/menu_cuti_view.dart';
import '../modules/hge/cuti/rosterCuti/bindings/roster_cuti_binding.dart';
import '../modules/hge/cuti/rosterCuti/views/roster_cuti_view.dart';
import '../modules/hge/cuti/statusKaryawan/bindings/status_karyawan_binding.dart';
import '../modules/hge/cuti/statusKaryawan/views/status_karyawan_view.dart';
import '../modules/hge/cuti/statusKeluarga/bindings/status_keluarga_binding.dart';
import '../modules/hge/cuti/statusKeluarga/views/status_keluarga_view.dart';
import '../modules/hge/cuti/tanggalCuti/bindings/tanggal_cuti_binding.dart';
import '../modules/hge/cuti/tanggalCuti/views/tanggal_cuti_view.dart';
import '../modules/hge/listKaryawan/bindings/list_karyawan_binding.dart';
import '../modules/hge/listKaryawan/views/list_karyawan_view.dart';
import '../modules/hge/p2h/bindings/p2h_binding.dart';
import '../modules/hge/p2h/daftarPemeriksaanP2H/bindings/daftar_pemeriksaan_p2_h_binding.dart';
import '../modules/hge/p2h/daftarPemeriksaanP2H/views/daftar_pemeriksaan_p2_h_view.dart';
import '../modules/hge/p2h/detailPemeriksaanP2H/bindings/detail_pemeriksaan_p2_h_binding.dart';
import '../modules/hge/p2h/detailPemeriksaanP2H/views/detail_pemeriksaan_p2_h_view.dart';
import '../modules/hge/p2h/fromP2H/bindings/from_p2_h_binding.dart';
import '../modules/hge/p2h/fromP2H/views/from_p2_h_view.dart';
import '../modules/hge/p2h/keteranganKondisiP2h/bindings/keterangan_kondisi_p2h_binding.dart';
import '../modules/hge/p2h/keteranganKondisiP2h/views/keterangan_kondisi_p2h_view.dart';
import '../modules/hge/p2h/lihatTemuanP2h/bindings/lihat_temuan_p2h_binding.dart';
import '../modules/hge/p2h/lihatTemuanP2h/views/lihat_temuan_p2h_view.dart';
import '../modules/hge/p2h/listAllP2H/bindings/list_all_p2_h_binding.dart';
import '../modules/hge/p2h/listAllP2H/views/list_all_p2_h_view.dart';
import '../modules/hge/p2h/listP2H/bindings/list_p2_h_binding.dart';
import '../modules/hge/p2h/listP2H/views/list_p2_h_view.dart';
import '../modules/hge/p2h/listP2hSarpras/bindings/list_p2h_sarpras_binding.dart';
import '../modules/hge/p2h/listP2hSarpras/views/list_p2h_sarpras_view.dart';
import '../modules/hge/p2h/listPemeriksaanP2H/bindings/list_pemeriksaan_p2_h_binding.dart';
import '../modules/hge/p2h/listPemeriksaanP2H/views/list_pemeriksaan_p2_h_view.dart';
import '../modules/hge/p2h/menuP2H/bindings/menu_p2_h_binding.dart';
import '../modules/hge/p2h/menuP2H/views/menu_p2_h_view.dart';
import '../modules/hge/p2h/p2hDetail/bindings/p2h_detail_binding.dart';
import '../modules/hge/p2h/p2hDetail/views/p2h_detail_view.dart';
import '../modules/hge/p2h/p2hListSarana/bindings/p2h_list_sarana_binding.dart';
import '../modules/hge/p2h/p2hListSarana/views/p2h_list_sarana_view.dart';
import '../modules/hge/p2h/p2hListSaranaSarpras/bindings/p2h_list_sarana_sarpras_binding.dart';
import '../modules/hge/p2h/p2hListSaranaSarpras/views/p2h_list_sarana_sarpras_view.dart';
import '../modules/hge/p2h/scanSaranaP2H/bindings/scan_sarana_p2_h_binding.dart';
import '../modules/hge/p2h/scanSaranaP2H/views/scan_sarana_p2_h_view.dart';
import '../modules/hge/p2h/updateHmKmAkhir/bindings/update_hm_km_akhir_binding.dart';
import '../modules/hge/p2h/updateHmKmAkhir/views/update_hm_km_akhir_view.dart';
import '../modules/hge/p2h/views/p2h_option1_view.dart';
import '../modules/hge/p2h/views/p2h_option2_view.dart';
import '../modules/hge/p2h/views/p2h_pdf_view.dart';
import '../modules/hge/p2h/views/p2h_view.dart';
import '../modules/hge/presensi/absenLokal/bindings/absen_lokal_binding.dart';
import '../modules/hge/presensi/absenLokal/views/absen_lokal_view.dart';
import '../modules/hge/presensi/absenMasuk/bindings/absen_masuk_binding.dart';
import '../modules/hge/presensi/absenMasuk/views/absen_masuk_view.dart';
import '../modules/hge/presensi/absenPulang/bindings/absen_pulang_binding.dart';
import '../modules/hge/presensi/absenPulang/views/absen_pulang_view.dart';
import '../modules/hge/presensi/absensi/bindings/absensi_binding.dart';
import '../modules/hge/presensi/absensi/views/absensi_view.dart';
import '../modules/hge/presensi/absensiVPS/bindings/absensi_v_p_s_binding.dart';
import '../modules/hge/presensi/absensiVPS/views/absensi_v_p_s_view.dart';
import '../modules/hge/presensi/detail_absensi/bindings/detail_absensi_binding.dart';
import '../modules/hge/presensi/detail_absensi/views/detail_absensi_view.dart';
import '../modules/hge/presensi/grafikKehadiran/bindings/grafik_kehadiran_binding.dart';
import '../modules/hge/presensi/grafikKehadiran/views/grafik_kehadiran_view.dart';
import '../modules/hge/presensi/izinKamera/bindings/izin_kamera_binding.dart';
import '../modules/hge/presensi/izinKamera/views/izin_kamera_view.dart';
import '../modules/hge/presensi/izinLokasi/bindings/izin_lokasi_binding.dart';
import '../modules/hge/presensi/izinLokasi/views/izin_lokasi_view.dart';
import '../modules/hge/presensi/listAbsen/bindings/list_absen_binding.dart';
import '../modules/hge/presensi/listAbsen/views/list_absen_view.dart';
import '../modules/hge/presensi/loginAbsen/bindings/login_absen_binding.dart';
import '../modules/hge/presensi/loginAbsen/views/login_absen_view.dart';
import '../modules/hge/presensi/lokasi_palsu/bindings/lokasi_palsu_binding.dart';
import '../modules/hge/presensi/lokasi_palsu/views/lokasi_palsu_view.dart';
import '../modules/hge/presensi/mainAbsen/bindings/main_absen_binding.dart';
import '../modules/hge/presensi/mainAbsen/views/main_absen_view.dart';
import '../modules/hge/presensi/profile/bindings/profile_binding.dart';
import '../modules/hge/presensi/profile/views/profile_view.dart';
import '../modules/hge/presensi/rosterKerja/bindings/roster_kerja_binding.dart';
import '../modules/hge/presensi/rosterKerja/views/roster_kerja_view.dart';
import '../modules/hge/presensi/viewImage/bindings/view_image_binding.dart';
import '../modules/hge/presensi/viewImage/views/view_image_view.dart';
import '../modules/hge/rkbsystem/detail_kabag/bindings/detail_kabag_binding.dart';
import '../modules/hge/rkbsystem/detail_kabag/views/detail_kabag_view.dart';
import '../modules/hge/rkbsystem/rkb/bindings/rkb_binding.dart';
import '../modules/hge/rkbsystem/rkb/views/rkb_view.dart';
import '../modules/hge/rkbsystem/rkb_admin/bindings/rkb_admin_binding.dart';
import '../modules/hge/rkbsystem/rkb_admin/views/rkb_admin_view.dart';
import '../modules/hge/rkbsystem/rkb_dept/bindings/rkb_dept_binding.dart';
import '../modules/hge/rkbsystem/rkb_dept/views/rkb_dept_view.dart';
import '../modules/hge/rkbsystem/rkb_detail/bindings/rkb_detail_binding.dart';
import '../modules/hge/rkbsystem/rkb_detail/views/rkb_detail_view.dart';
import '../modules/hge/rkbsystem/rkb_kabag/bindings/rkb_kabag_binding.dart';
import '../modules/hge/rkbsystem/rkb_kabag/views/rkb_kabag_view.dart';
import '../modules/hge/rkbsystem/rkb_ktt/bindings/rkb_ktt_binding.dart';
import '../modules/hge/rkbsystem/rkb_ktt/views/rkb_ktt_view.dart';
import '../modules/hge/rkbsystem/rkb_lampiran/bindings/rkb_lampiran_binding.dart';
import '../modules/hge/rkbsystem/rkb_lampiran/views/rkb_lampiran_view.dart';
import '../modules/hge/rkbsystem/rkb_menu/bindings/rkb_menu_binding.dart';
import '../modules/hge/rkbsystem/rkb_menu/views/rkb_menu_view.dart';
import '../modules/hge/rkbsystem/rkb_pdf/bindings/rkb_pdf_binding.dart';
import '../modules/hge/rkbsystem/rkb_pdf/views/rkb_pdf_view.dart';
import '../modules/hge/rkbsystem/rkb_purchasing/bindings/rkb_purchasing_binding.dart';
import '../modules/hge/rkbsystem/rkb_purchasing/views/rkb_purchasing_view.dart';
import '../modules/hge/rkbsystem/rkb_section/bindings/rkb_section_binding.dart';
import '../modules/hge/rkbsystem/rkb_section/views/rkb_section_view.dart';
import '../modules/hge/sarana/bindings/sarana_binding.dart';
import '../modules/hge/sarana/detailMasterPemeriksaanP2H/bindings/detail_master_pemeriksaan_p2_h_binding.dart';
import '../modules/hge/sarana/detailMasterPemeriksaanP2H/views/detail_master_pemeriksaan_p2_h_view.dart';
import '../modules/hge/sarana/detailSarana/bindings/detail_sarana_binding.dart';
import '../modules/hge/sarana/detailSarana/views/detail_sarana_view.dart';
import '../modules/hge/sarana/listSarana/bindings/list_sarana_binding.dart';
import '../modules/hge/sarana/listSarana/views/list_sarana_view.dart';
import '../modules/hge/sarana/masterPemeriksaanP2H/bindings/master_pemeriksaan_p2_h_binding.dart';
import '../modules/hge/sarana/masterPemeriksaanP2H/views/master_pemeriksaan_p2_h_view.dart';
import '../modules/hge/sarana/rubahFormSarana/bindings/rubah_form_sarana_binding.dart';
import '../modules/hge/sarana/rubahFormSarana/views/rubah_form_sarana_view.dart';
import '../modules/hge/sarana/rubahMasterPemeriksaanP2H/bindings/rubah_master_pemeriksaan_p2_h_binding.dart';
import '../modules/hge/sarana/rubahMasterPemeriksaanP2H/views/rubah_master_pemeriksaan_p2_h_view.dart';
import '../modules/hge/sarana/rubahSarana/bindings/rubah_sarana_binding.dart';
import '../modules/hge/sarana/rubahSarana/views/rubah_sarana_view.dart';
import '../modules/hge/sarana/tambahMasterPemeriksaanP2H/bindings/tambah_master_pemeriksaan_p2_h_binding.dart';
import '../modules/hge/sarana/tambahMasterPemeriksaanP2H/views/tambah_master_pemeriksaan_p2_h_view.dart';
import '../modules/hge/sarana/tambahSarana/bindings/tambah_sarana_binding.dart';
import '../modules/hge/sarana/tambahSarana/views/tambah_sarana_view.dart';
import '../modules/hge/sarana/views/sarana_view.dart';
import '../modules/hge/sarpras/barcode_security/bindings/barcode_security_binding.dart';
import '../modules/hge/sarpras/barcode_security/views/barcode_security_view.dart';
import '../modules/hge/sarpras/bukti_dilokasi/bindings/bukti_dilokasi_binding.dart';
import '../modules/hge/sarpras/bukti_dilokasi/views/bukti_dilokasi_view.dart';
import '../modules/hge/sarpras/form_izin_keluar/bindings/form_izin_keluar_binding.dart';
import '../modules/hge/sarpras/form_izin_keluar/views/form_izin_keluar_view.dart';
import '../modules/hge/sarpras/form_sarana/bindings/form_sarana_binding.dart';
import '../modules/hge/sarpras/form_sarana/views/form_sarana_view.dart';
import '../modules/hge/sarpras/menu_sarpras/bindings/menu_sarpras_binding.dart';
import '../modules/hge/sarpras/menu_sarpras/views/menu_sarpras_view.dart';
import '../modules/hge/sarpras/nomor_lambung/bindings/nomor_lambung_binding.dart';
import '../modules/hge/sarpras/nomor_lambung/views/nomor_lambung_view.dart';
import '../modules/hge/sarpras/penumpang/bindings/penumpang_binding.dart';
import '../modules/hge/sarpras/penumpang/views/penumpang_view.dart';
import '../modules/hge/sarpras/sarpras_admin/bindings/sarpras_admin_binding.dart';
import '../modules/hge/sarpras/sarpras_admin/views/sarpras_admin_view.dart';
import '../modules/hge/sarpras/sarpras_detail/bindings/sarpras_detail_binding.dart';
import '../modules/hge/sarpras/sarpras_detail/views/sarpras_detail_view.dart';
import '../modules/hge/sarpras/sarpras_hc/bindings/sarpras_hc_binding.dart';
import '../modules/hge/sarpras/sarpras_hc/views/sarpras_hc_view.dart';
import '../modules/hge/sarpras/sarpras_it/bindings/sarpras_it_binding.dart';
import '../modules/hge/sarpras/sarpras_it/views/sarpras_it_view.dart';
import '../modules/hge/sarpras/sarpras_kabag/bindings/sarpras_kabag_binding.dart';
import '../modules/hge/sarpras/sarpras_kabag/views/sarpras_kabag_view.dart';
import '../modules/hge/sarpras/sarpras_kordinator/bindings/sarpras_kordinator_binding.dart';
import '../modules/hge/sarpras/sarpras_kordinator/views/sarpras_kordinator_view.dart';
import '../modules/hge/sarpras/sarpras_ktt/bindings/sarpras_ktt_binding.dart';
import '../modules/hge/sarpras/sarpras_ktt/views/sarpras_ktt_view.dart';
import '../modules/hge/sarpras/sarpras_pdf/bindings/sarpras_pdf_binding.dart';
import '../modules/hge/sarpras/sarpras_pdf/views/sarpras_pdf_view.dart';
import '../modules/hge/sarpras/sarpras_section/bindings/sarpras_section_binding.dart';
import '../modules/hge/sarpras/sarpras_section/views/sarpras_section_view.dart';
import '../modules/hge/sarpras/sarpras_security/bindings/sarpras_security_binding.dart';
import '../modules/hge/sarpras/sarpras_security/views/sarpras_security_view.dart';
import '../modules/hge/sarpras/sarpras_user/bindings/sarpras_user_binding.dart';
import '../modules/hge/sarpras/sarpras_user/views/sarpras_user_view.dart';
import '../modules/hge/sarpras/scanQR/bindings/scan_q_r_binding.dart';
import '../modules/hge/sarpras/scanQR/views/scan_q_r_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/hse/correctiveAction/bindings/corrective_action_binding.dart';
import '../modules/hse/correctiveAction/views/corrective_action_view.dart';
import '../modules/hse/detailHazard/bindings/detail_hazard_binding.dart';
import '../modules/hse/detailHazard/views/detail_hazard_view.dart';
import '../modules/hse/formHazard/bindings/form_hazard_binding.dart';
import '../modules/hse/formHazard/views/form_hazard_view.dart';
import '../modules/hse/hazardList/bindings/hazard_list_binding.dart';
import '../modules/hse/hazardList/views/hazard_list_view.dart';
import '../modules/hse/hazardPJ/bindings/hazard_p_j_binding.dart';
import '../modules/hse/hazardPJ/views/hazard_p_j_view.dart';
import '../modules/hse/hazardUser/bindings/hazard_user_binding.dart';
import '../modules/hse/hazardUser/views/hazard_user_view.dart';
import '../modules/hse/imageHazardView/bindings/image_hazard_view_binding.dart';
import '../modules/hse/imageHazardView/views/image_hazard_view_view.dart';
import '../modules/hse/kemungkinan/bindings/kemungkinan_binding.dart';
import '../modules/hse/kemungkinan/views/kemungkinan_view.dart';
import '../modules/hse/keparahan/bindings/keparahan_binding.dart';
import '../modules/hse/keparahan/views/keparahan_view.dart';
import '../modules/hse/listUser/bindings/list_user_binding.dart';
import '../modules/hse/listUser/views/list_user_view.dart';
import '../modules/hse/lokasiHazard/bindings/lokasi_hazard_binding.dart';
import '../modules/hse/lokasiHazard/views/lokasi_hazard_view.dart';
import '../modules/hse/pengendalian/bindings/pengendalian_binding.dart';
import '../modules/hse/pengendalian/views/pengendalian_view.dart';
import '../modules/hse/perusahaan/bindings/perusahaan_binding.dart';
import '../modules/hse/perusahaan/views/perusahaan_view.dart';
import '../modules/hse/profileAbp/bindings/profile_abp_binding.dart';
import '../modules/hse/profileAbp/views/profile_abp_view.dart';
import '../modules/hse/rubahBahaya/bindings/rubah_bahaya_binding.dart';
import '../modules/hse/rubahBahaya/views/rubah_bahaya_view.dart';
import '../modules/hse/rubahHazard/bindings/rubah_hazard_binding.dart';
import '../modules/hse/rubahHazard/views/rubah_hazard_view.dart';
import '../modules/hse/rubahKTA/bindings/rubah_k_t_a_binding.dart';
import '../modules/hse/rubahKTA/views/rubah_k_t_a_view.dart';
import '../modules/hse/rubahStatus/bindings/rubah_status_binding.dart';
import '../modules/hse/rubahStatus/views/rubah_status_view.dart';
import '../modules/master/alarmPlayer/bindings/alarm_player_binding.dart';
import '../modules/master/alarmPlayer/views/alarm_player_view.dart';
import '../modules/master/departemen/bindings/departemen_binding.dart';
import '../modules/master/departemen/views/departemen_view.dart';
import '../modules/master/devisi/bindings/devisi_binding.dart';
import '../modules/master/devisi/views/devisi_view.dart';
import '../modules/master/gantiFoto/bindings/ganti_foto_binding.dart';
import '../modules/master/gantiFoto/views/ganti_foto_view.dart';
import '../modules/master/gantiSandi/bindings/ganti_sandi_binding.dart';
import '../modules/master/gantiSandi/views/ganti_sandi_view.dart';
import '../modules/master/gantiSandiForm/bindings/ganti_sandi_form_binding.dart';
import '../modules/master/gantiSandiForm/views/ganti_sandi_form_view.dart';
import '../modules/master/login/bindings/login_binding.dart';
import '../modules/master/login/views/login_view.dart';
import '../modules/master/lupaSandi/bindings/lupa_sandi_binding.dart';
import '../modules/master/lupaSandi/views/lupa_sandi_view.dart';
import '../modules/master/masterAdmin/bindings/master_admin_binding.dart';
import '../modules/master/masterAdmin/views/master_admin_view.dart';
import '../modules/master/nextRegister/bindings/next_register_binding.dart';
import '../modules/master/nextRegister/views/next_register_view.dart';
import '../modules/master/qrCode/bindings/qr_code_binding.dart';
import '../modules/master/qrCode/views/qr_code_view.dart';
import '../modules/master/qrCodeResult/bindings/qr_code_result_binding.dart';
import '../modules/master/qrCodeResult/views/qr_code_result_view.dart';
import '../modules/master/qrMenu/bindings/qr_menu_binding.dart';
import '../modules/master/qrMenu/views/qr_menu_view.dart';
import '../modules/master/registerAbp/bindings/register_abp_binding.dart';
import '../modules/master/registerAbp/views/register_abp_view.dart';
import '../modules/master/rubahData/bindings/rubah_data_binding.dart';
import '../modules/master/rubahData/views/rubah_data_view.dart';
import '../modules/master/signatureCreate/bindings/signature_create_binding.dart';
import '../modules/master/signatureCreate/views/signature_create_view.dart';
import '../modules/master/signatureView/bindings/signature_view_binding.dart';
import '../modules/master/signatureView/views/signature_view_view.dart';
import '../modules/menuAbp/bindings/menu_abp_binding.dart';
import '../modules/menuAbp/views/menu_abp_view.dart';
import '../modules/permission/galery/bindings/galery_binding.dart';
import '../modules/permission/galery/views/galery_view.dart';
import '../modules/permission/kamera/bindings/kamera_binding.dart';
import '../modules/permission/kamera/views/kamera_view.dart';
import '../modules/permission/lokasi/bindings/lokasi_binding.dart';
import '../modules/permission/lokasi/views/lokasi_view.dart';
import '../modules/permission/notifikasi/bindings/notifikasi_binding.dart';
import '../modules/permission/notifikasi/views/notifikasi_view.dart';
import '../modules/permission/penimpanan/bindings/penimpanan_binding.dart';
import '../modules/permission/penimpanan/views/penimpanan_view.dart';
import '../modules/pesan/bindings/pesan_binding.dart';
import '../modules/pesan/views/pesan_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.LOGIN_ABSEN,
      page: () => LoginAbsenView(),
      binding: LoginAbsenBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.BULETIN,
      page: () => const BuletinView(),
      binding: BuletinBinding(),
      transition: Transition.fadeIn,
      children: [
        GetPage(
          name: _Paths.LIST_BULETIN,
          page: () => const ListBuletinView(),
          binding: ListBuletinBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.ABSENSI,
      page: () => AbsensiView(),
      binding: AbsensiBinding(),
    ),
    GetPage(
      name: _Paths.MENU_ABP,
      page: () => MenuAbpView(),
      binding: MenuAbpBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.KAMERA,
      page: () => KameraView(),
      binding: KameraBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.LOKASI,
      page: () => LokasiView(),
      binding: LokasiBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.PENIMPANAN,
      page: () => PenimpananView(),
      binding: PenimpananBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.NOTIFIKASI,
      page: () => NotifikasiView(),
      binding: NotifikasiBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.GALERY,
      page: () => GaleryView(),
      binding: GaleryBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_ABSEN,
      page: () => MainAbsenView(),
      binding: MainAbsenBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.ABSENSI_V_P_S,
      page: () => const AbsensiVPSView(),
      binding: AbsensiVPSBinding(),
    ),
    GetPage(
      name: _Paths.LIST_ABSEN,
      page: () => const ListAbsenView(),
      binding: ListAbsenBinding(),
    ),
    GetPage(
      name: _Paths.ROSTER_KERJA,
      page: () => RosterKerjaView(),
      binding: RosterKerjaBinding(),
    ),
    GetPage(
      name: _Paths.GRAFIK_KEHADIRAN,
      page: () => GrafikKehadiranView(),
      binding: GrafikKehadiranBinding(),
    ),
    GetPage(
      name: _Paths.ABSEN_MASUK,
      page: () => const AbsenMasukView(),
      binding: AbsenMasukBinding(),
    ),
    GetPage(
      name: _Paths.ABSEN_PULANG,
      page: () => const AbsenPulangView(),
      binding: AbsenPulangBinding(),
    ),
    GetPage(
      name: _Paths.CORRECTIVE_ACTION,
      page: () => const CorrectiveActionView(),
      binding: CorrectiveActionBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_ABP,
      page: () => const ProfileAbpView(),
      binding: ProfileAbpBinding(),
    ),
    GetPage(
      name: _Paths.HAZARD_LIST,
      page: () => const HazardListView(),
      binding: HazardListBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_HAZARD,
      page: () => const DetailHazardView(),
      binding: DetailHazardBinding(),
    ),
    GetPage(
      name: _Paths.RUBAH_HAZARD,
      page: () => const RubahHazardView(),
      binding: RubahHazardBinding(),
    ),
    GetPage(
      name: _Paths.IMAGE_HAZARD_VIEW,
      page: () => const ImageHazardViewView(),
      binding: ImageHazardViewBinding(),
    ),
    GetPage(
      name: _Paths.HAZARD_USER,
      page: () => const HazardUserView(),
      binding: HazardUserBinding(),
    ),
    GetPage(
      name: _Paths.HAZARD_P_J,
      page: () => const HazardPJView(),
      binding: HazardPJBinding(),
    ),
    GetPage(
      name: _Paths.FORM_HAZARD,
      page: () => const FormHazardView(),
      binding: FormHazardBinding(),
    ),
    GetPage(
      name: _Paths.LIST_USER,
      page: () => const ListUserView(),
      binding: ListUserBinding(),
    ),
    GetPage(
      name: _Paths.KEMUNGKINAN,
      page: () => const KemungkinanView(),
      binding: KemungkinanBinding(),
    ),
    GetPage(
      name: _Paths.KEPARAHAN,
      page: () => const KeparahanView(),
      binding: KeparahanBinding(),
    ),
    GetPage(
      name: _Paths.PENGENDALIAN,
      page: () => const PengendalianView(),
      binding: PengendalianBinding(),
    ),
    GetPage(
      name: _Paths.LOKASI_HAZARD,
      page: () => const LokasiHazardView(),
      binding: LokasiHazardBinding(),
    ),
    GetPage(
      name: _Paths.PERUSAHAAN,
      page: () => const PerusahaanView(),
      binding: PerusahaanBinding(),
    ),
    GetPage(
      name: _Paths.RUBAH_STATUS,
      page: () => const RubahStatusView(),
      binding: RubahStatusBinding(),
    ),
    GetPage(
      name: _Paths.RUBAH_BAHAYA,
      page: () => const RubahBahayaView(),
      binding: RubahBahayaBinding(),
    ),
    GetPage(
      name: _Paths.RUBAH_K_T_A,
      page: () => const RubahKTAView(),
      binding: RubahKTABinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ABSENSI,
      page: () => const DetailAbsensiView(),
      binding: DetailAbsensiBinding(),
    ),
    GetPage(
      name: _Paths.RKB,
      page: () => const RkbView(),
      binding: RkbBinding(),
    ),
    GetPage(
      name: _Paths.RKB_DETAIL,
      page: () => const RkbDetailView(),
      binding: RkbDetailBinding(),
    ),
    GetPage(
      name: _Paths.RKB_PURCHASING,
      page: () => const RkbPurchasingView(),
      binding: RkbPurchasingBinding(),
    ),
    GetPage(
      name: _Paths.RKB_ADMIN,
      page: () => const RkbAdminView(),
      binding: RkbAdminBinding(),
    ),
    GetPage(
      name: _Paths.RKB_KABAG,
      page: () => const RkbKabagView(),
      binding: RkbKabagBinding(),
    ),
    GetPage(
      name: _Paths.RKB_SECTION,
      page: () => const RkbSectionView(),
      binding: RkbSectionBinding(),
    ),
    GetPage(
      name: _Paths.RKB_KTT,
      page: () => const RkbKttView(),
      binding: RkbKttBinding(),
    ),
    GetPage(
      name: _Paths.RKB_MENU,
      page: () => const RkbMenuView(),
      binding: RkbMenuBinding(),
    ),
    GetPage(
      name: _Paths.RKB_LAMPIRAN,
      page: () => const RkbLampiranView(),
      binding: RkbLampiranBinding(),
    ),
    GetPage(
      name: _Paths.RKB_DEPT,
      page: () => const RkbDeptView(),
      binding: RkbDeptBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_KABAG,
      page: () => const DetailKabagView(),
      binding: DetailKabagBinding(),
    ),
    GetPage(
      name: _Paths.PESAN,
      page: () => const PesanView(),
      binding: PesanBinding(),
    ),
    GetPage(
      name: _Paths.RKB_PDF,
      page: () => const RkbPdfView(),
      binding: RkbPdfBinding(),
    ),
    GetPage(
      name: _Paths.LOKASI_PALSU,
      page: () => const LokasiPalsuView(),
      binding: LokasiPalsuBinding(),
    ),
    GetPage(
      name: _Paths.MENU_SARPRAS,
      page: () => const MenuSarprasView(),
      binding: MenuSarprasBinding(),
    ),
    GetPage(
      name: _Paths.SARPRAS_USER,
      page: () => const SarprasUserView(),
      binding: SarprasUserBinding(),
    ),
    GetPage(
      name: _Paths.SARPRAS_KABAG,
      page: () => const SarprasKabagView(),
      binding: SarprasKabagBinding(),
    ),
    GetPage(
      name: _Paths.SARPRAS_KTT,
      page: () => const SarprasKttView(),
      binding: SarprasKttBinding(),
    ),
    GetPage(
      name: _Paths.SARPRAS_HC,
      page: () => const SarprasHcView(),
      binding: SarprasHcBinding(),
    ),
    GetPage(
      name: _Paths.SARPRAS_SECTION,
      page: () => const SarprasSectionView(),
      binding: SarprasSectionBinding(),
    ),
    GetPage(
      name: _Paths.SARPRAS_ADMIN,
      page: () => const SarprasAdminView(),
      binding: SarprasAdminBinding(),
    ),
    GetPage(
      name: _Paths.SARPRAS_KORDINATOR,
      page: () => const SarprasKordinatorView(),
      binding: SarprasKordinatorBinding(),
    ),
    GetPage(
      name: _Paths.SARPRAS_SECURITY,
      page: () => const SarprasSecurityView(),
      binding: SarprasSecurityBinding(),
    ),
    GetPage(
      name: _Paths.SARPRAS_IT,
      page: () => const SarprasItView(),
      binding: SarprasItBinding(),
    ),
    GetPage(
      name: _Paths.SARPRAS_DETAIL,
      page: () => const SarprasDetailView(),
      binding: SarprasDetailBinding(),
    ),
    GetPage(
      name: _Paths.SARPRAS_PDF,
      page: () => const SarprasPdfView(),
      binding: SarprasPdfBinding(),
    ),
    GetPage(
      name: _Paths.FORM_SARANA,
      page: () => const FormSaranaView(),
      binding: FormSaranaBinding(),
    ),
    GetPage(
      name: _Paths.FORM_IZIN_KELUAR,
      page: () => const FormIzinKeluarView(),
      binding: FormIzinKeluarBinding(),
    ),
    GetPage(
      name: _Paths.NOMOR_LAMBUNG,
      page: () => const NomorLambungView(),
      binding: NomorLambungBinding(),
    ),
    GetPage(
      name: _Paths.PENUMPANG,
      page: () => PenumpangView(),
      binding: PenumpangBinding(),
    ),
    GetPage(
      name: _Paths.BUKTI_DILOKASI,
      page: () => const BuktiDilokasiView(),
      binding: BuktiDilokasiBinding(),
    ),
    GetPage(
      name: _Paths.BARCODE_SECURITY,
      page: () => const BarcodeSecurityView(),
      binding: BarcodeSecurityBinding(),
    ),
    GetPage(
      name: _Paths.MONITORING,
      page: () => MonitoringView(),
      binding: MonitoringBinding(),
      children: [
        GetPage(
          name: _Paths.MONITORING_OB_DLAY,
          page: () => MonitoringObDlayView(),
          binding: MonitoringObDlayBinding(),
        ),
        GetPage(
          name: _Paths.MONITORING_HAULING_DELAY,
          page: () => MonitoringHaulingDelayView(),
          binding: MonitoringHaulingDelayBinding(),
        ),
        GetPage(
          name: _Paths.MONITORING_TUGBOAT,
          page: () => MonitoringTugboatView(),
          binding: MonitoringTugboatBinding(),
        ),
        GetPage(
          name: _Paths.MONITORING_P_L_N,
          page: () => MonitoringPLNView(),
          binding: MonitoringPLNBinding(),
        ),
      ],
    ),
    GetPage(
        name: _Paths.MONITORING_O_B,
        page: () => MonitoringOBView(),
        binding: MonitoringOBBinding(),
        transition: Transition.fadeIn),
    GetPage(
      name: _Paths.MONITORING_HAULING,
      page: () => MonitoringHaulingView(),
      binding: MonitoringHaulingBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: _Paths.MONITORING_CRUSHING,
        page: () => MonitoringCrushingView(),
        binding: MonitoringCrushingBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.MONITORING_BARGING,
        page: () => MonitoringBargingView(),
        binding: MonitoringBargingBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.MONITORING_STOCK_ROM,
        page: () => MonitoringStockRomView(),
        binding: MonitoringStockRomBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.MONITORING_STOCK_PRODUCT,
        page: () => MonitoringStockProductView(),
        binding: MonitoringStockProductBinding(),
        transition: Transition.fadeIn),
    GetPage(
      name: _Paths.P2H,
      page: () => P2hView(),
      binding: P2hBinding(),
      children: [
        GetPage(
          name: _Paths.LIST_P2_H,
          page: () => const ListP2HView(),
          binding: ListP2HBinding(),
        ),
        GetPage(
          name: _Paths.P2H_DETAIL,
          page: () => const P2hDetailView(),
          binding: P2hDetailBinding(),
        ),
        GetPage(
          name: _Paths.P2H_LIST_SARANA,
          page: () => const P2hListSaranaView(),
          binding: P2hListSaranaBinding(),
        ),
        GetPage(
          name: _Paths.FROM_P2_H,
          page: () => const FromP2HView(),
          binding: FromP2HBinding(),
        ),
        GetPage(
          name: _Paths.SCAN_SARANA_P2_H,
          page: () => const ScanSaranaP2HView(),
          binding: ScanSaranaP2HBinding(),
        ),
        GetPage(
          name: _Paths.MENU_P2_H,
          page: () => const MenuP2HView(),
          binding: MenuP2HBinding(),
        ),
        GetPage(
          name: _Paths.LIST_ALL_P2_H,
          page: () => const ListAllP2HView(),
          binding: ListAllP2HBinding(),
        ),
        GetPage(
          name: _Paths.DETAIL_PEMERIKSAAN_P2_H,
          page: () => const DetailPemeriksaanP2HView(),
          binding: DetailPemeriksaanP2HBinding(),
        ),
        GetPage(
          name: _Paths.LIST_PEMERIKSAAN_P2_H,
          page: () => const ListPemeriksaanP2HView(),
          binding: ListPemeriksaanP2HBinding(),
        ),
        GetPage(
          name: _Paths.DAFTAR_PEMERIKSAAN_P2_H,
          page: () => const DaftarPemeriksaanP2HView(),
          binding: DaftarPemeriksaanP2HBinding(),
        ),
        GetPage(
          name: _Paths.KETERANGAN_KONDISI_P2H,
          page: () => const KeteranganKondisiP2hView(),
          binding: KeteranganKondisiP2hBinding(),
        ),
        GetPage(
          name: _Paths.LIHAT_TEMUAN_P2H,
          page: () => const LihatTemuanP2hView(),
          binding: LihatTemuanP2hBinding(),
        ),
        GetPage(
          name: _Paths.UPDATE_HM_KM_AKHIR,
          page: () => const UpdateHmKmAkhirView(),
          binding: UpdateHmKmAkhirBinding(),
        ),
        GetPage(
          name: _Paths.P2H_LIST_SARANA_SARPRAS,
          page: () => const P2hListSaranaSarprasView(),
          binding: P2hListSaranaSarprasBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.P2H_OPTION_1,
      page: () => P2hOption1View(),
      binding: P2hBinding(),
    ),
    GetPage(
      name: _Paths.P2H_OPTION_2,
      page: () => P2hOption2View(),
      binding: P2hBinding(),
    ),
    GetPage(
      name: _Paths.P2H_PDF,
      page: () => P2hPdfView(),
      binding: P2hBinding(),
    ),
    GetPage(
      name: _Paths.QR_CODE,
      page: () => QrCodeView(),
      binding: QrCodeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.QR_CODE_RESULT,
      page: () => const QrCodeResultView(),
      binding: QrCodeResultBinding(),
    ),
    GetPage(
      name: _Paths.GANTI_FOTO,
      page: () => const GantiFotoView(),
      binding: GantiFotoBinding(),
    ),
    GetPage(
      name: _Paths.RUBAH_DATA,
      page: () => const RubahDataView(),
      binding: RubahDataBinding(),
    ),
    GetPage(
      name: _Paths.LIST_KARYAWAN,
      page: () => const ListKaryawanView(),
      binding: ListKaryawanBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_Q_R,
      page: () => const ScanQRView(),
      binding: ScanQRBinding(),
    ),
    GetPage(
      name: _Paths.LIST_CUTI,
      page: () => const ListCutiView(),
      binding: ListCutiBinding(),
    ),
    GetPage(
      name: _Paths.MENU_CUTI,
      page: () => const MenuCutiView(),
      binding: MenuCutiBinding(),
    ),
    GetPage(
      name: _Paths.DETAI_CUTI,
      page: () => const DetaiCutiView(),
      binding: DetaiCutiBinding(),
    ),
    GetPage(
      name: _Paths.FORM_CUTI,
      page: () => const FormCutiView(),
      binding: FormCutiBinding(),
    ),
    GetPage(
      name: _Paths.STATUS_KELUARGA,
      page: () => const StatusKeluargaView(),
      binding: StatusKeluargaBinding(),
    ),
    GetPage(
      name: _Paths.TANGGAL_CUTI,
      page: () => const TanggalCutiView(),
      binding: TanggalCutiBinding(),
    ),
    GetPage(
      name: _Paths.TIKET_PESAWAT_CUTI,
      page: () => const TiketPesawatCutiView(),
      binding: TiketPesawatCutiBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_IMAGE,
      page: () => const ViewImageView(),
      binding: ViewImageBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_ABP,
      page: () => const RegisterAbpView(),
      binding: RegisterAbpBinding(),
    ),
    GetPage(
      name: _Paths.NEXT_REGISTER,
      page: () => const NextRegisterView(),
      binding: NextRegisterBinding(),
    ),
    GetPage(
      name: _Paths.DEPARTEMEN,
      page: () => const DepartemenView(),
      binding: DepartemenBinding(),
    ),
    GetPage(
      name: _Paths.DEVISI,
      page: () => const DevisiView(),
      binding: DevisiBinding(),
    ),
    GetPage(
      name: _Paths.SARANA,
      page: () => const SaranaView(),
      binding: SaranaBinding(),
      children: [
        GetPage(
          name: _Paths.LIST_SARANA,
          page: () => const ListSaranaView(),
          binding: ListSaranaBinding(),
        ),
        GetPage(
          name: _Paths.TAMBAH_SARANA,
          page: () => const TambahSaranaView(),
          binding: TambahSaranaBinding(),
        ),
        GetPage(
          name: _Paths.DETAIL_SARANA,
          page: () => const DetailSaranaView(),
          binding: DetailSaranaBinding(),
        ),
        GetPage(
          name: _Paths.RUBAH_SARANA,
          page: () => const RubahSaranaView(),
          binding: RubahSaranaBinding(),
          children: [
            GetPage(
              name: _Paths.RUBAH_SARANA,
              page: () => const RubahSaranaView(),
              binding: RubahSaranaBinding(),
            ),
          ],
        ),
        GetPage(
          name: _Paths.RUBAH_FORM_SARANA,
          page: () => const RubahFormSaranaView(),
          binding: RubahFormSaranaBinding(),
        ),
        GetPage(
          name: _Paths.MASTER_PEMERIKSAAN_P2_H,
          page: () => const MasterPemeriksaanP2HView(),
          binding: MasterPemeriksaanP2HBinding(),
        ),
        GetPage(
          name: _Paths.TAMBAH_MASTER_PEMERIKSAAN_P2_H,
          page: () => const TambahMasterPemeriksaanP2HView(),
          binding: TambahMasterPemeriksaanP2HBinding(),
        ),
        GetPage(
          name: _Paths.RUBAH_MASTER_PEMERIKSAAN_P2_H,
          page: () => const RubahMasterPemeriksaanP2HView(),
          binding: RubahMasterPemeriksaanP2HBinding(),
        ),
        GetPage(
          name: _Paths.DETAIL_MASTER_PEMERIKSAAN_P2_H,
          page: () => const DetailMasterPemeriksaanP2HView(),
          binding: DetailMasterPemeriksaanP2HBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.IZIN_LOKASI,
      page: () => const IzinLokasiView(),
      binding: IzinLokasiBinding(),
    ),
    GetPage(
      name: _Paths.IZIN_KAMERA,
      page: () => const IzinKameraView(),
      binding: IzinKameraBinding(),
    ),
    GetPage(
      name: _Paths.ABSEN_LOKAL,
      page: () => const AbsenLokalView(),
      binding: AbsenLokalBinding(),
    ),
    GetPage(
      name: _Paths.LUPA_SANDI,
      page: () => const LupaSandiView(),
      binding: LupaSandiBinding(),
    ),
    GetPage(
      name: _Paths.GANTI_SANDI,
      page: () => const GantiSandiView(),
      binding: GantiSandiBinding(),
    ),
    GetPage(
      name: _Paths.GANTI_SANDI_FORM,
      page: () => const GantiSandiFormView(),
      binding: GantiSandiFormBinding(),
    ),
    GetPage(
      name: _Paths.ALARM_PLAYER,
      page: () => const AlarmPlayerView(),
      binding: AlarmPlayerBinding(),
    ),
    GetPage(
      name: _Paths.LIST_P2H_SARPRAS,
      page: () => const ListP2hSarprasView(),
      binding: ListP2hSarprasBinding(),
    ),
    GetPage(
      name: _Paths.ROSTER_CUTI,
      page: () => const RosterCutiView(),
      binding: RosterCutiBinding(),
    ),
    GetPage(
      name: _Paths.STATUS_KARYAWAN,
      page: () => const StatusKaryawanView(),
      binding: StatusKaryawanBinding(),
    ),
    GetPage(
      name: _Paths.JENIS_CUTI,
      page: () => const JenisCutiView(),
      binding: JenisCutiBinding(),
    ),
    GetPage(
      name: _Paths.MASKAPAI_LIST,
      page: () => const MaskapaiListView(),
      binding: MaskapaiListBinding(),
    ),
    GetPage(
      name: _Paths.FORM_MASKAPAI,
      page: () => const FormMaskapaiView(),
      binding: FormMaskapaiBinding(),
    ),
    GetPage(
      name: _Paths.QR_MENU,
      page: () => const QrMenuView(),
      binding: QrMenuBinding(),
    ),
    GetPage(
      name: _Paths.CUTI_KE_ATASAN,
      page: () => const CutiKeAtasanView(),
      binding: CutiKeAtasanBinding(),
    ),
    GetPage(
      name: _Paths.CUTI_KE_DEPT_HEAD,
      page: () => const CutiKeDeptHeadView(),
      binding: CutiKeDeptHeadBinding(),
    ),
    GetPage(
      name: _Paths.CUTI_KE_K_T_T,
      page: () => const CutiKeKTTView(),
      binding: CutiKeKTTBinding(),
    ),
    GetPage(
      name: _Paths.CUTI_KE_H_C,
      page: () => const CutiKeHCView(),
      binding: CutiKeHCBinding(),
    ),
    GetPage(
      name: _Paths.CUTI_PDF,
      page: () => const CutiPdfView(),
      binding: CutiPdfBinding(),
    ),
    GetPage(
      name: _Paths.MASTER_ADMIN,
      page: () => const MasterAdminView(),
      binding: MasterAdminBinding(),
    ),
    GetPage(
      name: _Paths.SIGNATURE_VIEW,
      page: () => const SignatureViewView(),
      binding: SignatureViewBinding(),
    ),
    GetPage(
      name: _Paths.SIGNATURE_CREATE,
      page: () => const SignatureCreateView(),
      binding: SignatureCreateBinding(),
    ),
  ];
}
