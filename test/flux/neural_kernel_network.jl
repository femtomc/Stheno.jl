@timedtestset "neural_kernel_network" begin

    rng, N, N′, D = MersenneTwister(123456), 5, 6, 2
    x0 = collect(range(-2.0, 2.0; length=N)) .+ 1e-3 .* randn(rng, N)
    x1 = collect(range(-1.7, 2.3; length=N)) .+ 1e-3 .* randn(rng, N)
    x2 = collect(range(-1.7, 3.3; length=N′)) .+ 1e-3 .* randn(rng, N′)

    X0 = ColVecs(randn(rng, D, N))
    X1 = ColVecs(randn(rng, D, N))
    X2 = ColVecs(randn(rng, D, N′))

    ȳ, Ȳ, Ȳ_sq = randn(rng, N), randn(rng, N, N′), randn(rng, N, N)

    # Most of the NeuralKernelNetwork tests are currently broken.
    @test_broken 0
    # @timedtestset "general test" begin

    #     # Specify primitives.
    #     k1 = 0.6 * transform(SqExponentialKernel(), 0.5)
    #     k2 = 0.4 * transform(SqExponentialKernel(), PeriodicTransform(0.1))
    #     primitives = Primitive(k1, k2)

    #     # Build NKN Kernel.
    #     nkn = NeuralKernelNetwork(primitives, Chain(LinearLayer(2, 2), product))

    #     # Run consistency checks + differentiability tests.
    #     differentiable_kernel_tests(nkn, ȳ, Ȳ, Ȳ_sq, x0, x1, x2; atol=1e-7, rtol=1e-7)
    #     differentiable_kernel_tests(nkn, ȳ, Ȳ, Ȳ_sq, X0, X1, X2; atol=1e-7, rtol=1e-7)
    # end
    # @timedtestset "kernel composition test" begin
    #     rng = MersenneTwister(123456)

    #     # Specify primitives.
    #     k1 = rand(rng) * transform(SqExponentialKernel(), randn(rng))
    #     k2 = rand(rng) * transform(PeriodicKernel(1), randn(rng))
    #     primitives = Primitive(k1, k2)

    #     @timedtestset "LinearLayer" begin

    #         # Specify linear NKN and equivalent composite kernel.
    #         weights = rand(rng, 1, 2)
    #         nkn_add_kernel = NeuralKernelNetwork(primitives, LinearLayer(weights))
    #         sum_k = Stheno.softplus(weights[1]) * k1 + Stheno.softplus(weights[2]) * k2

    #         # Vector input.
    #         @test kerneldiagmatrix(nkn_add_kernel, x0) ≈ kerneldiagmatrix(sum_k, x0)
    #         @test kerneldiagmatrix(nkn_add_kernel, x0, x1) ≈ kerneldiagmatrix(sum_k, x0, x1)

    #         # ColVecs input.
    #         @test kerneldiagmatrix(nkn_add_kernel, X0) ≈ kerneldiagmatrix(sum_k, X0)
    #         @test kerneldiagmatrix(nkn_add_kernel, X0, X1) ≈ kerneldiagmatrix(sum_k, X0, X1)
    #     end
    #     @timedtestset "product" begin
    #         nkn_prod_kernel = NeuralKernelNetwork(primitives, product)
    #         prod_k = k1 * k2

    #         # Vector input.
    #         @test kernelmatrix(nkn_prod_kernel, x0) ≈ kernelmatrix(prod_k, x0)
    #         @test kernelmatrix(nkn_prod_kernel, x0, x1) ≈ kernelmatrix(prod_k, x0, x1)

    #         # ColVecs input.
    #         @test kernelmatrix(nkn_prod_kernel, X0) ≈ kernelmatrix(prod_k, X0)
    #         @test kernelmatrix(nkn_prod_kernel, X0, X1) ≈ kernelmatrix(prod_k, X0, X1)
    #     end
    # end
end