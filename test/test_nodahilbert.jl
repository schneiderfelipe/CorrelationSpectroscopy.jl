@testset "nodahilbert.jl" begin
    @test N(3) ≈ [0.0                  0.3183098861837907 0.15915494309189535;
                 -0.3183098861837907   0.0                0.3183098861837907 ;
                 -0.15915494309189535 -0.3183098861837907 0.0                ]

    @test N * [1, 2] ≈ [0.6366197723675814, -0.3183098861837907]
    @test N * [1, 2, 3] ≈ [1.1140846016432673, 0.6366197723675813, -0.7957747154594768]
end