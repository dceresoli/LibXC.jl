#include "util.h"

extern XC(func_info_type) XC(func_info_hyb_mgga_x_dldf);
extern XC(func_info_type) XC(func_info_hyb_mgga_x_ms2h);
extern XC(func_info_type) XC(func_info_hyb_mgga_x_mn12_sx);
extern XC(func_info_type) XC(func_info_hyb_mgga_x_scan0);
extern XC(func_info_type) XC(func_info_hyb_mgga_x_mn15);
extern XC(func_info_type) XC(func_info_hyb_mgga_xc_m05);
extern XC(func_info_type) XC(func_info_hyb_mgga_xc_m05_2x);
extern XC(func_info_type) XC(func_info_hyb_mgga_xc_b88b95);
extern XC(func_info_type) XC(func_info_hyb_mgga_xc_b86b95);
extern XC(func_info_type) XC(func_info_hyb_mgga_xc_pw86b95);
extern XC(func_info_type) XC(func_info_hyb_mgga_xc_bb1k);
extern XC(func_info_type) XC(func_info_hyb_mgga_xc_m06_hf);
extern XC(func_info_type) XC(func_info_hyb_mgga_xc_mpw1b95);
extern XC(func_info_type) XC(func_info_hyb_mgga_xc_mpwb1k);
extern XC(func_info_type) XC(func_info_hyb_mgga_xc_x1b95);
extern XC(func_info_type) XC(func_info_hyb_mgga_xc_xb1k);
extern XC(func_info_type) XC(func_info_hyb_mgga_xc_m06);
extern XC(func_info_type) XC(func_info_hyb_mgga_xc_m06_2x);
extern XC(func_info_type) XC(func_info_hyb_mgga_xc_pw6b95);
extern XC(func_info_type) XC(func_info_hyb_mgga_xc_pwb6k);
extern XC(func_info_type) XC(func_info_hyb_mgga_xc_tpssh);
extern XC(func_info_type) XC(func_info_hyb_mgga_xc_revtpssh);
extern XC(func_info_type) XC(func_info_hyb_mgga_xc_m08_hx);
extern XC(func_info_type) XC(func_info_hyb_mgga_xc_m08_so);
extern XC(func_info_type) XC(func_info_hyb_mgga_xc_m11);
extern XC(func_info_type) XC(func_info_hyb_mgga_x_mvsh);
extern XC(func_info_type) XC(func_info_hyb_mgga_xc_wb97m_v);


const XC(func_info_type) *XC(hyb_mgga_known_funct)[] = {
  &XC(func_info_hyb_mgga_x_dldf),
  &XC(func_info_hyb_mgga_x_ms2h),
  &XC(func_info_hyb_mgga_x_mn12_sx),
  &XC(func_info_hyb_mgga_x_scan0),
  &XC(func_info_hyb_mgga_x_mn15),
  &XC(func_info_hyb_mgga_xc_m05),
  &XC(func_info_hyb_mgga_xc_m05_2x),
  &XC(func_info_hyb_mgga_xc_b88b95),
  &XC(func_info_hyb_mgga_xc_b86b95),
  &XC(func_info_hyb_mgga_xc_pw86b95),
  &XC(func_info_hyb_mgga_xc_bb1k),
  &XC(func_info_hyb_mgga_xc_m06_hf),
  &XC(func_info_hyb_mgga_xc_mpw1b95),
  &XC(func_info_hyb_mgga_xc_mpwb1k),
  &XC(func_info_hyb_mgga_xc_x1b95),
  &XC(func_info_hyb_mgga_xc_xb1k),
  &XC(func_info_hyb_mgga_xc_m06),
  &XC(func_info_hyb_mgga_xc_m06_2x),
  &XC(func_info_hyb_mgga_xc_pw6b95),
  &XC(func_info_hyb_mgga_xc_pwb6k),
  &XC(func_info_hyb_mgga_xc_tpssh),
  &XC(func_info_hyb_mgga_xc_revtpssh),
  &XC(func_info_hyb_mgga_xc_m08_hx),
  &XC(func_info_hyb_mgga_xc_m08_so),
  &XC(func_info_hyb_mgga_xc_m11),
  &XC(func_info_hyb_mgga_x_mvsh),
  &XC(func_info_hyb_mgga_xc_wb97m_v),
  NULL
};
