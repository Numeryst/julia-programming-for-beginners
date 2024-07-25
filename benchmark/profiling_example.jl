using Profile

using Statistics

function randmsq()
    x = rand(10000, 1000)
    y = mean(x.^2, dims=1)
    return y
end

# Since we do not want to profile JIT-compiler
randmsq(); # run once to force compilation

@profile randmsq();

Profile.print()

Profile.print(format=:flat)

Profile.clear()