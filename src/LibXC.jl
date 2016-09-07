#__precompile__(true)
module LibXC

# export ..., ...

using Compat
import Compat: String
import Base: show

if isfile(joinpath(dirname(@__FILE__),"..","deps","deps.jl"))
    include(joinpath(dirname(@__FILE__),"..","deps","deps.jl"))
else
    error("LibXC not properly installed. Please run Pkg.build(\"LibXC\")")
end

include("version.jl")
include("functionals.jl")
include("defines.jl")
include("api.jl")


end # module
