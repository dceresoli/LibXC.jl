#include "util.h"

extern XC(func_info_type) XC(func_info_mgga_c_dldf);
extern XC(func_info_type) XC(func_info_mgga_xc_zlp);
extern XC(func_info_type) XC(func_info_mgga_xc_otpss_d);
extern XC(func_info_type) XC(func_info_mgga_c_cs);
extern XC(func_info_type) XC(func_info_mgga_c_mn12_sx);
extern XC(func_info_type) XC(func_info_mgga_c_mn12_l);
extern XC(func_info_type) XC(func_info_mgga_c_m11_l);
extern XC(func_info_type) XC(func_info_mgga_c_m11);
extern XC(func_info_type) XC(func_info_mgga_c_m08_so);
extern XC(func_info_type) XC(func_info_mgga_c_m08_hx);
extern XC(func_info_type) XC(func_info_mgga_x_lta);
extern XC(func_info_type) XC(func_info_mgga_x_tpss);
extern XC(func_info_type) XC(func_info_mgga_x_m06_l);
extern XC(func_info_type) XC(func_info_mgga_x_gvt4);
extern XC(func_info_type) XC(func_info_mgga_x_tau_hcth);
extern XC(func_info_type) XC(func_info_mgga_x_br89);
extern XC(func_info_type) XC(func_info_mgga_x_bj06);
extern XC(func_info_type) XC(func_info_mgga_x_tb09);
extern XC(func_info_type) XC(func_info_mgga_x_rpp09);
extern XC(func_info_type) XC(func_info_mgga_x_2d_prhg07);
extern XC(func_info_type) XC(func_info_mgga_x_2d_prhg07_prp10);
extern XC(func_info_type) XC(func_info_mgga_x_revtpss);
extern XC(func_info_type) XC(func_info_mgga_x_pkzb);
extern XC(func_info_type) XC(func_info_mgga_x_m05);
extern XC(func_info_type) XC(func_info_mgga_x_m05_2x);
extern XC(func_info_type) XC(func_info_mgga_x_m06_hf);
extern XC(func_info_type) XC(func_info_mgga_x_m06);
extern XC(func_info_type) XC(func_info_mgga_x_m06_2x);
extern XC(func_info_type) XC(func_info_mgga_x_m08_hx);
extern XC(func_info_type) XC(func_info_mgga_x_m08_so);
extern XC(func_info_type) XC(func_info_mgga_x_ms0);
extern XC(func_info_type) XC(func_info_mgga_x_ms1);
extern XC(func_info_type) XC(func_info_mgga_x_ms2);
extern XC(func_info_type) XC(func_info_mgga_x_m11);
extern XC(func_info_type) XC(func_info_mgga_x_m11_l);
extern XC(func_info_type) XC(func_info_mgga_x_mn12_l);
extern XC(func_info_type) XC(func_info_mgga_c_cc06);
extern XC(func_info_type) XC(func_info_mgga_x_mk00);
extern XC(func_info_type) XC(func_info_mgga_c_tpss);
extern XC(func_info_type) XC(func_info_mgga_c_vsxc);
extern XC(func_info_type) XC(func_info_mgga_c_m06_l);
extern XC(func_info_type) XC(func_info_mgga_c_m06_hf);
extern XC(func_info_type) XC(func_info_mgga_c_m06);
extern XC(func_info_type) XC(func_info_mgga_c_m06_2x);
extern XC(func_info_type) XC(func_info_mgga_c_m05);
extern XC(func_info_type) XC(func_info_mgga_c_m05_2x);
extern XC(func_info_type) XC(func_info_mgga_c_pkzb);
extern XC(func_info_type) XC(func_info_mgga_c_bc95);
extern XC(func_info_type) XC(func_info_mgga_c_revtpss);
extern XC(func_info_type) XC(func_info_mgga_xc_tpsslyp1w);
extern XC(func_info_type) XC(func_info_mgga_x_mk00b);
extern XC(func_info_type) XC(func_info_mgga_x_bloc);
extern XC(func_info_type) XC(func_info_mgga_x_modtpss);
extern XC(func_info_type) XC(func_info_mgga_c_tpssloc);
extern XC(func_info_type) XC(func_info_mgga_x_mbeef);
extern XC(func_info_type) XC(func_info_mgga_x_mbeefvdw);
extern XC(func_info_type) XC(func_info_mgga_xc_b97m_v);
extern XC(func_info_type) XC(func_info_mgga_x_mvs);
extern XC(func_info_type) XC(func_info_mgga_x_mn15_l);
extern XC(func_info_type) XC(func_info_mgga_c_mn15_l);
extern XC(func_info_type) XC(func_info_mgga_x_scan);
extern XC(func_info_type) XC(func_info_mgga_c_scan);
extern XC(func_info_type) XC(func_info_mgga_c_mn15);


const XC(func_info_type) *XC(mgga_known_funct)[] = {
  &XC(func_info_mgga_c_dldf),
  &XC(func_info_mgga_xc_zlp),
  &XC(func_info_mgga_xc_otpss_d),
  &XC(func_info_mgga_c_cs),
  &XC(func_info_mgga_c_mn12_sx),
  &XC(func_info_mgga_c_mn12_l),
  &XC(func_info_mgga_c_m11_l),
  &XC(func_info_mgga_c_m11),
  &XC(func_info_mgga_c_m08_so),
  &XC(func_info_mgga_c_m08_hx),
  &XC(func_info_mgga_x_lta),
  &XC(func_info_mgga_x_tpss),
  &XC(func_info_mgga_x_m06_l),
  &XC(func_info_mgga_x_gvt4),
  &XC(func_info_mgga_x_tau_hcth),
  &XC(func_info_mgga_x_br89),
  &XC(func_info_mgga_x_bj06),
  &XC(func_info_mgga_x_tb09),
  &XC(func_info_mgga_x_rpp09),
  &XC(func_info_mgga_x_2d_prhg07),
  &XC(func_info_mgga_x_2d_prhg07_prp10),
  &XC(func_info_mgga_x_revtpss),
  &XC(func_info_mgga_x_pkzb),
  &XC(func_info_mgga_x_m05),
  &XC(func_info_mgga_x_m05_2x),
  &XC(func_info_mgga_x_m06_hf),
  &XC(func_info_mgga_x_m06),
  &XC(func_info_mgga_x_m06_2x),
  &XC(func_info_mgga_x_m08_hx),
  &XC(func_info_mgga_x_m08_so),
  &XC(func_info_mgga_x_ms0),
  &XC(func_info_mgga_x_ms1),
  &XC(func_info_mgga_x_ms2),
  &XC(func_info_mgga_x_m11),
  &XC(func_info_mgga_x_m11_l),
  &XC(func_info_mgga_x_mn12_l),
  &XC(func_info_mgga_c_cc06),
  &XC(func_info_mgga_x_mk00),
  &XC(func_info_mgga_c_tpss),
  &XC(func_info_mgga_c_vsxc),
  &XC(func_info_mgga_c_m06_l),
  &XC(func_info_mgga_c_m06_hf),
  &XC(func_info_mgga_c_m06),
  &XC(func_info_mgga_c_m06_2x),
  &XC(func_info_mgga_c_m05),
  &XC(func_info_mgga_c_m05_2x),
  &XC(func_info_mgga_c_pkzb),
  &XC(func_info_mgga_c_bc95),
  &XC(func_info_mgga_c_revtpss),
  &XC(func_info_mgga_xc_tpsslyp1w),
  &XC(func_info_mgga_x_mk00b),
  &XC(func_info_mgga_x_bloc),
  &XC(func_info_mgga_x_modtpss),
  &XC(func_info_mgga_c_tpssloc),
  &XC(func_info_mgga_x_mbeef),
  &XC(func_info_mgga_x_mbeefvdw),
  &XC(func_info_mgga_xc_b97m_v),
  &XC(func_info_mgga_x_mvs),
  &XC(func_info_mgga_x_mn15_l),
  &XC(func_info_mgga_c_mn15_l),
  &XC(func_info_mgga_x_scan),
  &XC(func_info_mgga_c_scan),
  &XC(func_info_mgga_c_mn15),
  NULL
};
