@testset "synchronous.jl" begin
    x, data = demodata()
    syn = synchronous(data .- mean(data, dims=1))

    @plottest begin
        heatmap(x, x, syn)
        plot!(xflip=true, yflip=true)
        xlabel!("Peak position")
        ylabel!("Peak position")
        title!("Synchronous")
    end "synchronous.png"

    @plottest begin
        plot(x, diag(syn), label=:none)
        xlabel!("x")
        ylabel!("I")
    end "autocorrelation.png"
end