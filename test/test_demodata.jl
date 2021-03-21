@testset "demodata" begin
    x, A = demodata()

    @plottest begin
        plot(x, A[1, :], label="1")
        for n in 4:3:13
            plot!(x, A[n, :], label="$n")
        end
        xlabel!("Peak position")
        ylabel!("I")
    end "demodata.png"
end