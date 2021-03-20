@testset "asynchronous.jl" begin
    x, data = demodata()
    asyn = asynchronous(data .- mean(data, dims=1))

    @plottest begin
        heatmap(x, x, asyn)
        plot!(xflip=true, yflip=true)
        xlabel!("Peak position")
        ylabel!("Peak position")
        title!("Asynchronous")
    end "asynchronous.png"

    # Can this be prettier?
    @test .≈(diag(asyn), 0, atol=2e-19) |> all
end