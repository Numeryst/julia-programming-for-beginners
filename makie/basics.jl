using CairoMakie

set_theme!(theme_black())

f = Figure(backgroundcolor=:black, size=(800, 300))

ax = Axis(f[1, 1], title="Numeryst Plot",
        xlabel="X",
        ylabel="y",
        backgroundcolor = :black)

x = range(0, 10, length=100)
y = sin.(x)

scatter!(ax, x, y, color=:white)

f

colors = repeat([:crimson, :dodgerblue, :slateblue1, :sienna1, :orchid1], 20)