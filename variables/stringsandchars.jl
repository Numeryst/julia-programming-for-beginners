# Introducing Julia Strings and Characters

"This is a sample string"

demand = "You owe me \$50"

println(demand)

demandquote = "She said, \"You owe me \$50!\""

println(demandquote)


"""This is "a" string"""

#=
    r" " indicates a regular expression
    v" " indicates a version string
    b" " indicates a byte literal
    raw" " indicates a raw string that doesn't do interpolation
=#

# String interpolation

"The value of x is n."

# $(variable_name)

x = 42

"The value of x is $(x)"

"The value of x is $x"

"The value of 2+2 is $(2+2)"


# Substrings

s = "a load of characters"

s[1:end]

s[3:6]

s[3:end-6]

# Which is equivalent to

s[begin+2:end-6]

for char in s
    print(char, "_")
end

s[1:1]

s[1]

# Unicode Strings

su = "AéB𐅍CD"

su[1]

su[2]

su[3]

length(su)

lastindex(su)

isascii(su)

su
# the 'second' character, é, has 2 bytes, the 'fourth' character, 𐅍, has 4 bytes.

for i in eachindex(su)
    println(i, " -> ", su[i])
end

for pair in pairs(su)
    println(pair)
end

for charindex in eachindex(su)
    @show su[charindex]
end

collect(su)

for i in 1:10
    print(thisind(su, i), " ")
end

# Other functions, nextind(), prevind(), ...


# Splitting and joining strings

"s" * "t"

"This is a simple " * "example"

"s" + "t"

"s" ^ 18

string("s", "t")

s = "You know I am numeryst"

split(s)

split(s, "a")

split(s, "m")

split(s, "")

split(s, r"a|e|i|o|u")

join(split(s, r"a|e|i|o|u"), "aiou")


# Splitting using a function

split(join(Char.(65:90)), c -> Int(c) % 8 == 0)

# Character objects

s = "You know I am numeryst"

s[1:1]

s[1]

string('s') * string('d')

string('s', 'd')

('\U1014d', '\u2640', '\u26')



# Converting between numbers and strings

string(11, base=2)

string(11, base=8)

string(11, base=16)

string(11)

a = BigInt(2)^200

string(a)

string(a, base=16)

parse(Int, "100")

parse(Int, "100", base=2)

parse(Int, "100", base=16)

parse(Float64, "100.32")

parse(Complex{Float64},"0+1im")



# Converting characters to integers and back again

Char(8253)

Char(0x203d)

Int('‽')

string(Int('‽'), base=16)

Int("S"[1])

string.(Char.("A"[1]:"Z"[1])) |> collect


# printf formatting

using Printf

@printf("pi = %0.20f", float(pi))

@sprintf("pi = %0.20f", float(pi))



# Convert a string to an array

data = "1 2 3 4
5 6 7 8
9 0 1 2"

using DelimitedFiles

readdlm(IOBuffer(data))

readdlm(IOBuffer(data), Int)

s = "/Users/numeryst/Music/iTunes/Media/Mobile Apps"

collect(s)

split(s, "")

count(c -> c == '/', collect(s))

count(c -> c == '/', s)


# Finding and replacing things inside strings

s = "Elementary, my dear Numeryst"

in('m', s)

occursin("Num", s)

occursin("m", s)

occursin("ery", s)

occursin("qrt", s)

findfirst("mer", s)

findfirst(isequal('e'), s)

# Replacing

replace("Sherlock Holmes", "e" => "ee")

replace("Sherlock Holmes", "e" => uppercase)

# Replacing using functions

t = "You can never foretell what any one man will do, 
    but you can say with precision what an average number will be up to. 
    Individuals vary, but percentages remain constant.";

replace(t, r"a|e|i|o|u" => (c) -> rand(Bool) ? "0" : "1")
replace(t, r"a|e|i|o|u" => (c) -> rand(Bool) ? "0" : "1")


# Regular expressions
