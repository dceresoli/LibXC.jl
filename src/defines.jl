const XC_UNPOLARIZED          = 1
const XC_POLARIZED            = 2

const XC_NON_RELATIVISTIC     = 0
const XC_RELATIVISTIC         = 1

const XC_EXCHANGE             = 0
const XC_CORRELATION          = 1
const XC_EXCHANGE_CORRELATION = 2
const XC_KINETIC              = 3

const XC_FAMILY_UNKNOWN      = -1
const XC_FAMILY_LDA          =  1
const XC_FAMILY_GGA          =  2
const XC_FAMILY_MGGA         =  4
const XC_FAMILY_LCA          =  8
const XC_FAMILY_OEP          = 16
const XC_FAMILY_HYB_GGA      = 32
const XC_FAMILY_HYB_MGGA     = 64

# Flags that can be used in info.flags. Don't reorder these since it will break the ABI of the library
const XC_FLAGS_HAVE_EXC        = (1 <<  0) 
const XC_FLAGS_HAVE_VXC        = (1 <<  1) 
const XC_FLAGS_HAVE_FXC        = (1 <<  2) 
const XC_FLAGS_HAVE_KXC        = (1 <<  3) 
const XC_FLAGS_HAVE_LXC        = (1 <<  4) 
const XC_FLAGS_1D              = (1 <<  5) 
const XC_FLAGS_2D              = (1 <<  6) 
const XC_FLAGS_3D              = (1 <<  7) 
const XC_FLAGS_HYB_CAM         = (1 <<  8) 
const XC_FLAGS_HYB_CAMY        = (1 <<  9) 
const XC_FLAGS_VV10            = (1 << 10) 
const XC_FLAGS_HYB_LC          = (1 << 11) 
const XC_FLAGS_HYB_LCY         = (1 << 12) 
const XC_FLAGS_STABLE          = (1 << 13)  
const XC_FLAGS_DEVELOPMENT     = (1 << 14) 

const XC_TAU_EXPLICIT         = 0
const XC_TAU_EXPANSION        = 1

# These are old names kept for compatibility, and that should disappear soon
const XC_GGA_C_VPBE        =  83
const XC_GGA_XC_LB         = 160
const XC_GGA_K_ABSR1       = 506
const XC_GGA_K_ABSR2       = 507
const XC_MGGA_X_MN12_SX    = 248
