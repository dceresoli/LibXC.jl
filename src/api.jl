function xc_version()
    a = Ref{Cint}(0)
    b = Ref{Cint}(0)
    c = Ref{Cint}(0)
    ccall( (:xc_version, LIBXC), Void, (Ref{Cint}, Ref{Cint}, Ref{Cint}), a, b, c)
    return a[], b[], c[]
end

function xc_version_string()
    s = ccall( (:xc_version_string, LIBXC), Ptr{Cchar}, () )
    return bytestring(s)
end

type func_reference_type
    ref::Ptr{Cchar}
    doi::Ptr{Cchar}
    bibtex::Ptr{Cchar}
end


immutable xc_func_info_type
    number::Cint
    kind::Cint
    name::Ptr{Cchar}
    family::Cint
    refs1::Ptr{func_reference_type}
    refs2::Ptr{func_reference_type}
    refs3::Ptr{func_reference_type}
    refs4::Ptr{func_reference_type}
    refs5::Ptr{func_reference_type}
    flags::Cint

    min_dens::Float64
    min_grad::Float64
    min_tau::Float64
    min_zeta::Float64

    init::Ptr{Void}
    end_::Ptr{Void}
    lda::Ptr{Void}
    gga::Ptr{Void}
    mgga::Ptr{Void}
end

xc_func_info_get_number(info::Ptr{xc_func_info_type}) = 
    ccall( (:xc_func_info_get_number, LIBXC), Cint, (Ptr{xc_func_info_type},), info)

xc_func_info_get_kind(info::Ptr{xc_func_info_type}) =
    ccall( (:xc_func_info_get_kind, LIBXC), Cint, (Ptr{xc_func_info_type},), info)

xc_func_info_get_family(info::Ptr{xc_func_info_type}) =
    ccall( (:xc_func_info_get_family, LIBXC), Cint, (Ptr{xc_func_info_type},), info)

xc_func_info_get_flags(info::Ptr{xc_func_info_type}) =
    ccall( (:xc_func_info_get_flags, LIBXC), Cint, (Ptr{xc_func_info_type},), info)

xc_func_info_get_name(info::Ptr{xc_func_info_type}) = bytestring(
    ccall( (:xc_func_info_get_flags, LIBXC), Cint, (Ptr{xc_func_info_type},), info) )

xc_func_info_get_ref(info::Ptr{xc_func_info_type}, number::Int) = bytestring(
    ccall( (:xc_func_info_get_ref, LIBXC), Cint, (Ptr{xc_func_info_type},Cint), info, Cint(number)) )



type xc_func_type
    info::Ptr{xc_func_info_type}
    nspin::Cint
    n_func_aux::Cint
    func_aux::Ptr{Ptr{xc_func_type}}

    mix_coef::Float64
    cam_omega::Float64
    cam_alpha::Float64
    cam_beta::Float64

    nlc_b::Float64
    nlc_C::Float64

    func::Cint
    n_rho::Cint
    n_sigma::Cint
    n_tau::Cint
    n_lapl::Cint

    n_v2rho2::Cint
    n_v2sigma2::Cint
    n_v2tau2::Cint
    n_v2lapl2::Cint
    n_v2rhosigma::Cint
    n_v2rhotau::Cint
    n_v2rholapl::Cint
    n_v2sigmatau::Cint
    n_v2sigmalapl::Cint
    n_v2lapltau::Cint
  
    n_v3rho3::Cint
    n_v3rho2sigma::Cint
    n_v3rhosigma2::Cint
    n_v3sigma3::Cint

    params::Ptr{Void}
end


xc_functional_get_number(name::ASCIIString) = ccall( (:xc_functional_get_number, LIBXC), Cint, (Ptr{Cchar},), name*"\0")

xc_functional_get_name(number::Int) = bytestring( ccall( (:xc_functional_get_name, LIBXC), Ptr{Cchar}, (Cint,), Cint(number)) )

function xc_family_from_id(id::Int)
     family = Ref{Cint}
     number = Ref{Cint}
     ret = ccall( (:xc_family_from_id, LIBXC), Cint, (Cint, Ref{Cint}, Ref{Cint}), id, family, number)
     return ret, family[], number[]
end

xc_func_alloc() = ccall( (:xc_func_alloc, LIBXC), Ptr{xc_func_type}, () )

xc_func_init(p::Ptr{xc_func_type}, functional::Int, nspin::Int) = 
    ccall( (:xc_func_init, LIBXC), Cint, (Ptr{xc_func_type}, Cint, Cint), p, functional, nspin)

xc_func_end(p::Ptr{xc_func_type}) = ccall( (:xc_func_end, LIBXC), Void, (Ptr{xc_func_type},), p) 

xc_func_free(p::Ptr{xc_func_type}) = ccall( (:xc_func_free, LIBXC), Void, (Ptr{xc_func_type},), p)

xc_func_get_info(p::Ptr{xc_func_type}) = ccall( (:xc_func_get_info, LIBXC), Ptr{xc_func_info_type}, () )


####################################################################################################
##                                               LDA                                              ##
####################################################################################################
xc_lda_init(p::Ptr{xc_func_type}, info::Ptr{xc_func_info_type}, nspin::Int) =
    ccall( (:xc_lda_init, LIBXC), Cint, (Ptr{xc_func_type}, Ptr{xc_func_info_type}, Cint), p, info, npsin)

xc_lda_end(p::Ptr{xc_func_type}) = ccall( (:xc_lda_end, LIBXC), Void, (Ptr{xc_func_type},), p) 

xc_lda(p::Ptr{xc_func_type}, np::Int, rho::Vector{Float64}, zk::Vector{Float64}, vrho::Vector{Float64}, 
    v2rho2::Vector{Float64}, v3rho3::Vector{Float64}) = 
    ccall( (:xc_lda, LIBXC), Void, (Ptr{xc_func_type}, Cint, Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, 
    Ptr{Float64}), p, np, rho, zk, vrho, v2rho2, v3rho3)

xc_lda_exc(p::Ptr{xc_func_type}, np::Int, rho::Vector{Float64}, zk::Vector{Float64}) =
    ccall( (:xc_lda_exc, LIBXC), Void, (Ptr{xc_func_type}, Cint, Ptr{Float64}, Ptr{Float64}), p, np, rho, zk)

xc_lda_exc_vxc(p::Ptr{xc_func_type}, np::Int, rho::Vector{Float64}, zk::Vector{Float64}, vrho::Vector{Float64}) =
    ccall( (:xc_lda_exc, LIBXC), Void, (Ptr{xc_func_type}, Cint, Ptr{Float64}, Ptr{Float64}, Ptr{Float64}), p, np, rho, zk, vrho)

xc_lda_vxc(p::Ptr{xc_func_type}, np::Int, rho::Vector{Float64}, vhro::Vector{Float64}) =
    ccall( (:xc_lda_vxc, LIBXC), Void, (Ptr{xc_func_type}, Cint, Ptr{Float64}, Ptr{Float64}), p, np, rho, vrho)

xc_lda_fxc(p::Ptr{xc_func_type}, np::Int, rho::Vector{Float64}, v2rho2::Vector{Float64}) =
    ccall( (:xc_lda_fxc, LIBXC), Void, (Ptr{xc_func_type}, Cint, Ptr{Float64}, Ptr{Float64}), p, np, rho, v2rho2)

xc_lda_kxc(p::Ptr{xc_func_type}, np::Int, rho::Vector{Float64}, v3rho3::Vector{Float64}) =
    ccall( (:xc_lda_kxc, LIBXC), Void, (Ptr{xc_func_type}, Cint, Ptr{Float64}, Ptr{Float64}), p, np, rho, v3rho3)

xc_lda_x_set_params(p::Ptr{xc_func_type}, alpha::Float64, relativistic::Int, omega::Float64) =
    ccall( (:xc_lda_x_set_params, LIBXC), Void, (Ptr{xc_func_type}, Float64, Cint, Float64), p, alpha, relativistic, omega)

#== TODO:
void XC(lda_x_1d_set_params)     (XC(func_type) *p, int interaction, FLOAT bb);
void XC(lda_c_1d_csc_set_params) (XC(func_type) *p, int interaction, FLOAT bb);
void XC(lda_c_xalpha_set_params) (XC(func_type) *p, FLOAT alpha);
void XC(lda_c_2d_prm_set_params) (XC(func_type) *p, FLOAT N);
void XC(lda_c_vwn_set_params)    (XC(func_type) *p, int spin_interpolation);
void XC(lda_xc_ksdt_set_params)  (XC(func_type) *p, FLOAT T);
==#


####################################################################################################
##                                               GGA                                              ##
####################################################################################################
xc_gga_init(p::Ptr{xc_func_type}, info::Ptr{xc_func_info_type}, nspin::Int) =
    ccall( (:xc_gga_init, LIBXC), Cint, (Ptr{xc_func_type}, Ptr{xc_func_info_type}, Cint), p, info, npsin)

xc_gga_end(p::Ptr{xc_func_type}) = ccall( (:xc_gga_end, LIBXC), Void, (Ptr{xc_func_type},), p) 

xc_gga_exc(p::Ptr{xc_func_type}, np::Int, rho::Vector{Float64}, sigma::Vector{Float64}, zk::Vector{Float64}) =
    ccall( (:xc_gga_exc, LIBXC), Void, (Ptr{xc_func_type}, Cint, Ptr{Float64}, Ptr{Float64}, Ptr{Float64}), p, np, rho, sigma, zk)

xc_gga_exc_vxc(p::Ptr{xc_func_type}, np::Int, rho::Vector{Float64}, sigma::Vector{Float64}, zk::Vector{Float64},
    vrho::Vector{Float64}, vsigma::Vector{Float64}) =
    ccall( (:xc_gga_exc, LIBXC), Void, (Ptr{xc_func_type}, Cint, Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64},
    Ptr{Float64}), p, np, rho, sigma, zk, vrho, vsigma)

xc_gga_vxc(p::Ptr{xc_func_type}, np::Int, rho::Vector{Float64}, sigma::Vector{Float64}, vhro::Vector{Float64},
    vsigma::Vector{Float64}) =
    ccall( (:xc_gga_vxc, LIBXC), Void, (Ptr{xc_func_type}, Cint, Ptr{Float64}, Ptr{Float64}, Ptr{Float64}, Ptr{Float64}),
    p, np, rho, sigma, vrho, vsigma)


#== TODO:
void XC(gga)     (const XC(func_type) *p, int np, const FLOAT *rho, const FLOAT *sigma, 
		  FLOAT *zk, FLOAT *vrho, FLOAT *vsigma,
		  FLOAT *v2rho2, FLOAT *v2rhosigma, FLOAT *v2sigma2,
		  FLOAT *v3rho3, FLOAT *v3rho2sigma, FLOAT *v3rhosigma2, FLOAT *v3sigma3);

void XC(gga_fxc)(const XC(func_type) *p, int np, const FLOAT *rho, const FLOAT *sigma,
		 FLOAT *v2rho2, FLOAT *v2rhosigma, FLOAT *v2sigma2);
void XC(gga_kxc)(const XC(func_type) *p, int np, const FLOAT *rho, const FLOAT *sigma,
		 FLOAT *v3rho3, FLOAT *v3rho2sigma, FLOAT *v3rhosigma2, FLOAT *v3sigma3);

void XC(gga_lb_modified)  (const XC(func_type) *p, int np, const FLOAT *rho, const FLOAT *sigma, 
			   FLOAT r, FLOAT *vrho);

void XC(gga_x_b86_set_params)     (XC(func_type) *p, FLOAT beta, FLOAT gamma, FLOAT omega);
void XC(gga_x_b88_set_params)     (XC(func_type) *p, FLOAT beta, FLOAT gamma);
void XC(gga_x_pbe_set_params)     (XC(func_type) *p, FLOAT kappa, FLOAT mu);
void XC(gga_c_pbe_set_params)     (XC(func_type) *p, FLOAT beta);
void XC(gga_x_pw91_set_params)    (XC(func_type) *p, FLOAT a, FLOAT b, FLOAT c, FLOAT d, FLOAT f, FLOAT alpha, FLOAT expo);
void XC(gga_x_pw91_set_params2)   (XC(func_type) *p, FLOAT bt, FLOAT alpha, FLOAT expo);
void XC(gga_x_rpbe_set_params)    (XC(func_type) *p, FLOAT kappa, FLOAT mu);
void XC(gga_x_optx_set_params)    (XC(func_type) *p, FLOAT a, FLOAT b, FLOAT gamma);
void XC(gga_c_lyp_set_params)     (XC(func_type) *p, FLOAT A, FLOAT B, FLOAT c, FLOAT d);
void XC(gga_lb_set_params)        (XC(func_type) *p, int modified, FLOAT threshold, FLOAT ip, FLOAT qtot);
void XC(gga_k_tflw_set_params)    (XC(func_type) *p, FLOAT gamma, FLOAT lambda, FLOAT N);
void XC(gga_x_2d_b88_set_params)  (XC(func_type) *p, FLOAT beta);
void XC(gga_x_wpbeh_set_params)   (XC(func_type) *p, FLOAT omega);
void XC(gga_x_hjs_set_params)     (XC(func_type) *p, FLOAT omega);
void XC(gga_x_ityh_set_params)    (XC(func_type) *p, int func_id, FLOAT omega);
void XC(gga_x_sfat_set_params)    (XC(func_type) *p, int func_id, FLOAT omega);
void XC(gga_x_ssb_sw_set_params)  (XC(func_type) *p, FLOAT A, FLOAT B, FLOAT C, FLOAT D, FLOAT E);
void XC(gga_x_kt_set_params)      (XC(func_type) *p, FLOAT gamma, FLOAT delta);
void XC(gga_x_lambda_set_params)  (XC(func_type) *p, FLOAT N);

FLOAT XC(gga_ak13_get_asymptotic) (FLOAT homo);

FLOAT XC(hyb_exx_coef)(const XC(func_type) *p);
void  XC(hyb_cam_coef)(const XC(func_type) *p, FLOAT *omega, FLOAT *alpha, FLOAT *beta);
void  XC(nlc_coef)(const XC(func_type) *p, FLOAT *nlc_b, FLOAT *nlc_C);

void XC(hyb_gga_xc_hse_set_params) (XC(func_type) *p, FLOAT alpha, FLOAT omega);
void XC(hyb_gga_xc_pbeh_set_params)(XC(func_type) *p, FLOAT alpha);

/* the meta-GGAs */
int  XC(mgga_init)(XC(func_type) *p, const XC(func_info_type) *info, int nspin);
void XC(mgga_end) (XC(func_type) *p);
void XC(mgga)        (const XC(func_type) *p, int np,
		      const FLOAT *rho, const FLOAT *sigma, const FLOAT *lapl, const FLOAT *tau,
		      FLOAT *zk, FLOAT *vrho, FLOAT *vsigma, FLOAT *vlapl, FLOAT *vtau,
		      FLOAT *v2rho2, FLOAT *v2sigma2, FLOAT *v2lapl2, FLOAT *v2tau2,
		      FLOAT *v2rhosigma, FLOAT *v2rholapl, FLOAT *v2rhotau, 
		      FLOAT *v2sigmalapl, FLOAT *v2sigmatau, FLOAT *v2lapltau);
void XC(mgga_exc)    (const XC(func_type) *p, int np,  
		      const FLOAT *rho, const FLOAT *sigma, const FLOAT *lapl, const FLOAT *tau, 
		      FLOAT *zk);
void XC(mgga_exc_vxc)(const XC(func_type) *p, int np, 
		      const FLOAT *rho, const FLOAT *sigma, const FLOAT *lapl, const FLOAT *tau,
		      FLOAT *zk, FLOAT *vrho, FLOAT *vsigma, FLOAT *vlapl, FLOAT *vtau);
void XC(mgga_vxc)    (const XC(func_type) *p, int np,
		      const FLOAT *rho, const FLOAT *sigma, const FLOAT *lapl, const FLOAT *tau,
		      FLOAT *vrho, FLOAT *vsigma, FLOAT *vlapl, FLOAT *vtau);
void XC(mgga_fxc)    (const XC(func_type) *p, int np, 
		      const FLOAT *rho, const FLOAT *sigma, const FLOAT *lapl, const FLOAT *tau,
		      FLOAT *v2rho2, FLOAT *v2sigma2, FLOAT *v2lapl2, FLOAT *v2tau2,
		      FLOAT *v2rhosigma, FLOAT *v2rholapl, FLOAT *v2rhotau, 
		      FLOAT *v2sigmalapl, FLOAT *v2sigmatau, FLOAT *v2lapltau);

void XC(mgga_x_tb09_set_params)(XC(func_type) *p, FLOAT c);
void XC(mgga_x_tpss_set_params)(XC(func_type) *p, FLOAT b, FLOAT c, FLOAT e, FLOAT kappa, FLOAT mu);
void XC(mgga_c_bc95_set_params)(XC(func_type) *p, FLOAT css, FLOAT copp);
void XC(mgga_c_pkzb_set_params)(XC(func_type) *p, FLOAT beta, FLOAT d, FLOAT C0_0, FLOAT C0_1, FLOAT C0_2, FLOAT C0_3);

/* Functionals that are defined as mixtures of others */
void XC(mix_func)
  (const XC(func_type) *func, int np,
   const FLOAT *rho, const FLOAT *sigma, const FLOAT *lapl, const FLOAT *tau,
   FLOAT *zk, FLOAT *vrho, FLOAT *vsigma, FLOAT *vlapl, FLOAT *vtau,
   FLOAT *v2rho2, FLOAT *v2sigma2, FLOAT *v2lapl2, FLOAT *v2tau2,
   FLOAT *v2rhosigma, FLOAT *v2rholapl, FLOAT *v2rhotau, 
   FLOAT *v2sigmalapl, FLOAT *v2sigmatau, FLOAT *v2lapltau);
  
==#
