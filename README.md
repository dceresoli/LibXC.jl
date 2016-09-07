# LibXC v0.0.1

A wrapper around the [LibXC](http://www.tddft.org/programs/octopus/wiki/index.php/Libxc) DFT eXchange
and correlation library

## Installation
```julia
julia> Pkg.clone("https://github.com/dceresoli/LibXC.jl")
...
julia> Pkg.build("LibXC")
```

## Usage:

```julia
using LibXC

println("Hello world from Julia!")
println("LibXC version: ", LibXC.xc_version_string())


func = LibXC.xc_func_alloc()
rho = [0.1, 0.2, 0.3, 0.4, 0.5]
sigma = [0.2, 0.3, 0.4, 0.5, 0.6]
exc = zeros(Float64, 5)

func_id = 1

LibXC.xc_func_init(func, func_id, LibXC.XC_UNPOLARIZED) == 0 || (pritntln("functional $func_id not found"); exit())

if unsafe_load(LibXC.xc_func_get_info(func)).family == LibXC.XC_FAMILY_LDA
    LibXC.xc_lda_exc(func, 5, rho, exc)
elseif func.info.family == LibXC.XC_FAMILY_GGA || func.info.family == LibXC.XC_FAMILY_HYB_GGA
    LibXC.xc_gga_exc(func, 5, rho, sigma, exc)
end

for i = 1:5
    @printf "%lf %lf\n" rho[i] exc[i]
end

LibXC.xc_func_end(func)
```
