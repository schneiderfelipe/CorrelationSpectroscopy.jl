@testset "asynchronous.jl" begin
    x, A = demodata()
    Ã = A .- mean(A, dims=1)

    Ψ = asynchronous(Ã)
    @plottest begin
        heatmap(x, x, Ψ)
        plot!(xflip=true, yflip=true)
        xlabel!("Peak position")
        ylabel!("Peak position")
        title!("Asynchronous")
    end "asynchronous.png"

    # Can this be prettier?
    @test .≈(diag(Ψ), 0, atol=2e-19) |> all
end