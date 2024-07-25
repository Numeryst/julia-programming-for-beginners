@time sqrt.(rand(Float64, 1000));

@time sqrt.(rand(Float32, 1000));

@time for i in 1:1000
    x = sin.(rand(1000))
end

@timev "Square root of the vector" sqrt.(rand(1000));

sum(@time sqrt.(rand(1000)))

@elapsed sqrt.(rand(1000))

using Test

@test@elapsed(sqrt.(rand(1000))) <= 10e-5

using Statistics

function randmsq()
    x = rand(10000, 1000)
    y = mean(x.^2, dims=1)
    return y
end 

using Pkg

Pkg.add("TimerOutputs")

using TimerOutputs

const to = TimerOutput();

function randmsq_timed()
    @timeit to "randmsq" begin
        x = @timeit to "rand" rand(10000, 1000)
        y = @timeit to "mean" mean(x.^2, dims=1)
        return y
    end
end

randmsq_timed();

print_timer(to)

using Pkg

Pkg.add("BenchmarkTools")

using BenchmarkTools

@benchmark sqrt.(rand(1000))

@btime mean(rand(1000));