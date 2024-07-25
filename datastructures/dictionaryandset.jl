# Creating dictionaries

dict = Dict("a" => 1, "b" => 2, "c" => 3)

dict = Dict{String, Integer}("a" => 1, "b" =>2)

dict = Dict(string(i) => sind(i) for i = 0:5:360)

dict = Dict{String, Int64}()

dict = Dict()

files = ["a.txt", "b.txt", "c.txt"]
fvars = Dict()
for (n, f) in enumerate(files)
    fvars["x_$(n)"] = f
end

fvars

# Looking things up

dict = Dict("a" => 1, "b" => 2, "c" => 3, "d" => 4, "e" => 5)

dict["a"]

symdict = Dict(:x => 1, :y =>3, :z =>6)

symdict[:x]

intdict = Dict(1 => "one", 2 => "two", 3 => "three")

intdict[2]

dict = Dict("a" => 1, "b" => 2, "c" => 3, "d" => 4, "e" => 5)

get(dict, "a", 0)

get(dict, "Z", 0)

try
    dict["Z"]
catch error
    if isa(error, KeyError)
        println("Sorry, I could not find anything")
    end
end

dict["a"] = 10

# Keys

haskey(dict, "Z")

in(("b" => 2), dict)

dict["d"] = 4

dict

delete!(dict, "d")

keys(dict)

collect(keys(dict))

[uppercase(key) for key in keys(dict)]

# List comprehension form
# [ new-element for loop-variable in iterator ]

map(uppercase, collect(keys(dict)))

# Values

values(dict)

for kv in dict
    println(kv)
end

for k in keys(dict)
    println(k, " ===> ", dict[k])
end

for (key, value) in dict
    println(key, " ===> ", value)
end

for tuple in Dict("1" => "Hydrogen", "2" => "Helium", "3" => "Lithium")
    println("Element $(tuple[1]) is $(tuple[2])")
end

# Sorting a dictionary

dict = Dict("a" => 1, "b" => 2, "c" => 3, "d" => 4, "e" => 5, "f" => 6)

for key in sort(collect(keys(dict)))
    println("$key => $(dict[key])")
end

# Sets

colors = Set()

primes = Set{Int64}()

colors = Set{String}(["red", "green", "blue", "yellow", "orange"])

colors = Set(["red", "green", "blue", "yellow", "orange"])

push!(colors, "black")

in("green", colors)

rainbow = Set(["red", "orange", "yellow", "green", "blue", "indigo", "violet"])

union(colors, rainbow)

intersect(colors, rainbow)

setdiff(colors, rainbow)

# Other Functions

d1 = Dict(1=>"a", 2=>"b")

d2 = Dict(2=>"b", 3=>"c", 4=>"d")

union(d1, d2)

intersect(d1, d2)

setdiff(d1, d2)

merge(d1, d2)

d1 = Dict(:a => 1, :b => 2, :c => 0)

findmin(d1)

