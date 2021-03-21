@testset "synchronous.jl" begin
    x, A = demodata()
    Ã = A .- mean(A, dims=1)

    Φ = synchronous(Ã)
    @test Φ ≈ cov(Ã)

    @plottest begin
        heatmap(x, x, Φ)
        plot!(xflip=true, yflip=true)
        xlabel!("Peak position")
        ylabel!("Peak position")
        title!("Synchronous")
    end "synchronous.png"

    @plottest begin
        plot(x, diag(Φ), label=:none)
        xlabel!("x")
        ylabel!("I")
    end "autocorrelation.png"
end