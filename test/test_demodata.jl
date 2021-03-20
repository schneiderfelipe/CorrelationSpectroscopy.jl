@testset "demodata" begin
    x, data = demodata()

    @plottest begin
        plot(x, data[1, :], label="1")
        for n in 4:3:13
            plot!(x, data[n, :], label="$n")
        end
        xlabel!("Peak position")
        ylabel!("I")
    end "demodata.png"
end