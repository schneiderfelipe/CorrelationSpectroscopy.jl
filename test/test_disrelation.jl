@testset "disrelation.jl" begin
    x, A = demodata()
    Ã = A .- mean(A, dims=1)

    Λ = disrelation(Ã)
    @plottest begin
        heatmap(x, x, Λ)
        plot!(xflip=true, yflip=true)
        xlabel!("Peak position")
        ylabel!("Peak position")
        title!("Disrelation")
    end "disrelation.png"

    # Can this be prettier?
    @test .≈(diag(Λ), 0) |> all

    Ψ = asynchronous(Ã)
    @test maximum(sqrt.((Λ .- Ψ).^2)) ≈ 0 atol=2e-3
end