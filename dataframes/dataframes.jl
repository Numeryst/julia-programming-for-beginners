using DataFrames

# Loading data into DataFrames

anscombe = DataFrame(                 
 [10  10  10  8   8.04   9.14  7.46   6.58;    
  8   8   8   8   6.95   8.14  6.77   5.76;   
  13  13  13  8   7.58   8.74  12.74  7.71;   
  9   9   9   8   8.81   8.77  7.11   8.84;   
  11  11  11  8   8.33   9.26  7.81   8.47;   
  14  14  14  8   9.96   8.1   8.84   7.04;   
  6   6   6   8   7.24   6.13  6.08   5.25;   
  4   4   4   19  4.26   3.1   5.39   12.5;   
  12  12  12  8   10.84  9.13  8.15   5.56;   
  7   7   7   8   4.82   7.26  6.42   7.91;  
  5   5   5   8   5.68   4.74  5.73   6.89], :auto);

rename!(anscombe, [Symbol.(:X, 1:4); Symbol.(:Y, 1:4)])

# Empty DataFrames

df = DataFrame(A = 1:6, B = 100:105)

df = DataFrame(Name=String[], 
    Width=Float64[], 
    Height=Float64[], 
    Mass=Float64[], 
    Volume=Float64[])

df = vcat(df, DataFrame(Name="Test", Width=1.0, Height=10.0, Mass=3.0, Volume=5.0))

# Basics

typeof(anscombe)

names(anscombe)

size(anscombe) # number of rows, number of columns

describe(anscombe)

# Referring to specific columns

anscombe.Y2

anscombe[:, 6]

anscombe[:, [1, 2, 3, 5, 8]]

anscombe[:, [:X1, :Y1]]

anscombe[:, r".2"]

anscombe[:, [:X3, :Y1]] 

anscombe[:, [3, 5]]

anscombe[:, ["X3", "Y1"]]

a = "X3"
b = "Y1"

anscombe[:, [a, b]]

# Taking rectangular "slices"

anscombe[4:6, [:X2,:X4]]

anscombe[[4, 6, 9], [:X2,:X4]]

anscombe[[4, 6, 8], [2, 6, 8]]

anscombe[4:6, 3:5]

anscombe[[4,6,8,11], :]

anscombe[:, [:X1, :Y1]]

# Selecting rows with conditions

anscombe[anscombe.Y1 .> 7.0, :]

anscombe[[true, false, true, true, true, true, true, false, true, false, false], :]

anscombe[anscombe.Y1 .> anscombe.Y2, :]

filter(row -> row.Y1 > 7.0, anscombe)

anscombe[(anscombe.Y1 .> 5.0) .& (anscombe.Y2 .< 7.0), :]

filter(row -> row.Y1 > 5 &&  row.Y2 < 7.0, anscombe)

# Applying functions to columns and rows

using Statistics

mean(anscombe.X2)

[mean(col) for col in eachcol(anscombe)]

mean.(eachcol(anscombe))

for col in eachcol(anscombe)
  println(mean(col)) 
end

for r in eachrow(anscombe)
  println(r) 
end

for row in eachrow(anscombe)
  println(mean(row)) 
end 

# Plotting Anscombe's Quartet

describe(anscombe, :mean, :std, :min, :median)

[describe(anscombe[:, xy], :mean, :std, :median) for xy in [[:X1, :Y1], [:X2, :Y2], [:X3, :Y3], [:X4, :Y4]]]

[cor(anscombe[:, first(xy)], anscombe[:, last(xy)]) for xy in [[:X1, :Y1], [:X2, :Y2], [:X3, :Y3], [:X4, :Y4]]]

import Pkg
Pkg.add("StatsPlots")

using StatsPlots # add this package if necessary

@df anscombe scatter([:X1 :X2 :X3 :X4], [:Y1 :Y2 :Y3 :Y4],
           smooth=true,
           line = :red,
           linewidth = 2,
           title= ["X$i vs Y$i" for i in (1:4)'],
           legend = false,
           layout = 4,
           xlimits = (2, 20),
           ylimits = (2, 14))

# Regression and Models
import Pkg

Pkg.add("GLM")

Pkg.add("StatsModels")

using GLM, StatsModels # add these packages if necessary

linearmodel = fit(LinearModel, @formula(Y1 ~ X1), anscombe)

summary(linearmodel)

coef(linearmodel)

f(x) = coef(linearmodel)[2] * x + coef(linearmodel)[1]

p1 = plot(anscombe[!, :X1], anscombe[!, :Y1], 
    smooth=true, 
    seriestype=:scatter, 
    title = "X1 vs Y1", 
    linewidth=8,
    linealpha=0.5,
    label="data")

plot!(f, 2, 20, label="correlation")

# Working with DataFrames

ptable = DataFrame(  Number = [1, 2, 6, 8, 26],
                     Name = ["Hydrogen", "Helium", "Carbon", "Oxygen", "Iron"],
                     AtomicWeight = [1.0079, 4.0026, 12.0107, 15.9994, 55.845],
                     Symbol = ["H", "He", "C", "O", "Fe"],
                     Discovered = [1776, 1895, 0, 1774, 
                     missing])

describe(ptable)

# Modifying DataFrames

## Adding, deleting, and renaming columns

hcat(ptable, axes(ptable, 1))

ptable[!, :MP] = [-259, -272, 3500, -218, 1535] # notice the !

ptable[!, :BP] = [-253, -269, 4827, -183, 2750]

ptable

ptable[!, :Liquid] = map((x, y) -> y - x, ptable[:, :MP], ptable[:, :BP])

ptable[!, :Liquid] = ptable[:, :BP] - ptable[:, :MP]

ptable[!, :Temp] = axes(ptable, 1)

ptable[!, :Temp] = map((x, y) -> y * x, ptable[:, :Liquid], ptable[:, :AtomicWeight])

ptable[!, :MP_in_F] = map(deg -> 32 + (deg * 1.8), ptable[:, :MP])

rename!(ptable, :Temp => :Junk)

rename!(ptable, [f => t for (f, t) = zip([:MP, :BP], [:Melt, :Boil])])

select!(ptable, Not(:Junk))

# Adding and deleting rows

push!(ptable, [29, "Copper", 63.546, "Cu", missing, 1083, 2567, 2567-1083, map(deg -> 32 + (deg * 1.8), 1083)])

ptable

ptable[[occursin(r"Copper", elementname) for elementname in ptable[:, :Name]], :][:, :Liquid] .= 2567 - 1083

ptable[ptable[!, :Number] .== 6, :][:, :Liquid] .= 4827 - 3500

temp = select(ptable, r".") # make a copy

delete!(temp, 3:5)

ptable1 = ptable[ptable[:, :Boil] .>= 100, :] 

# Finding values in DataFrames

ptable[:, :Melt] .< 100

ptable[ptable[:, :Melt] .< 100, :]

ptable[[occursin(r"Co", elementname) for elementname in ptable[:, :Name]], :]

ptable[[occursin(r"Copper", elementname) for elementname in ptable.Name], :][:, :Liquid] .= Ref(2567 - 1083)

ptable[occursin.("Copper", ptable.Name), :]

ptable[occursin.(r"C.*", ptable.Name), :]

ptable[occursin.(r"Co", ptable.Name), :]

# Subsets and groups

ptable = DataFrame(
          Number       = [1,  2,  6,  8,  26,     29,     ],
          Name         = ["Hydrogen",     "Helium",   "Carbon",   "Oxygen",   "Iron",     "Copper",  ],
          AtomicWeight = [1.0079,     4.0026,     12.0107,    15.9994,    55.845,     63.546,     ],
          Symbol       = ["H",    "He",   "C",    "O",    "Fe",   "Cu",  ],
          Discovered   = [1776,   1895,   0,  1774,   0,  missing,    ],
          Melt         = [-259,   -272,   3500,   -218,   1535,   1083,   ],
          Boil         = [-253,   -269,   4827,   -183,   2750,   2567,   ],
          Liquid       = [6,  3,  1327,   35,     1215,   1484,   ],
      )

ptable[!, :Room] = [:Gas, :Gas, :Solid, :Gas, :Solid, :Solid]

gd = groupby(ptable, [:Room])

combine(gd, [:Melt] => mean)

# Sorting

sort!(ptable, [order(:Room), order(:AtomicWeight)])

