# Single expression functions
f(x) = x*x

f(2)

g(x, y) = sqrt(x^2 + y^2)

g(3, 4)

#=
function functionname(args) 
    expression
    expression
    expression
    ...
    expression
 end
=#
function breakfast()
    maketoast()
    brewcoffee()
end

function canPayBills(bankbalance)
    if bankbalance < 0
        return false
    else
        return true
    end
end

canPayBills(30)

canPayBills(-5)

# Returning more than one value from a function

function doublefour()
    return (4, 4)
end

doublefour()

# Optional arguments and variable number of arguments
function xyzpos(x, y, z=0)
    println("$x, $y, $z")
end

xyzpos(1, 2)

xyzpos(1, 2, 3)

# Keyword and positional arguments
#=
function f(p, q, r, s, t, u)
    ...
end

f("42", -3.143, atan2, "x_axis", 42, 'x')
or
f(-3.143, 42, 'x', "42", "x_axis", atan2)
=#

function f(p, q ; r = 4, s = "hello")
    println("p is $p")
    println("q is $q")
    return "r => $r, s => $s"
end

f(1, 2)

f("a", "b", r=pi, s=22//5)

f(r=999, 3, 2)

f(s="What", r=2000, 1, 2)

isapprox(4.0, 4.01, rtol=0.1)

isapprox(rtol=0.1, 4.0, 4.01)

isapprox(4.0, 4.00001)

function f(a1, opta2=2; key="foo")
    println("normal argument: $a1")
    println("optional argument: $opta2")
    println("keyword argument: $key")
end

f(1)

f(key=4, 1)

f(key=4, 2, 1)

# Functions with variable number of arguments

function fvar(args...)
    println("You supplied $(length(args)) arguments")
    for arg in args
        println(" argument ", arg)
    end
end

fvar()

fvar(32)

fvar(32, 25)

fvar(32, 25, 34)

function test(x, y)
    print("x $x y $y")
end

test(13, 45)

test((13, 31)...)

test([4, 6]...)

map(test, [4, 6]...)

# Local variables and changing the values of arguments

function test(a, b, c)
    subtotal = a + b + c
end

test(1, 2, 3)

subtotal

function set_to_5(x)
    x = 5
end

x = 3

set_to_5(x)

x

function fill_with_5(x)
    x[:] .= 5
end

x = collect(1:10)

x 

fill_with_5(x)

x

# Anonymous functions

x -> x^2 + 2x - 1

map(x -> x^2 + 2x -1, [1, 3, -1])

x

map((x, y, z) -> x + y + z, [1, 2, 3], [4, 5, 6], [7, 8, 9])

random = () -> rand(0:10)

random()

random()

# Map
a = 1:10;

map(sin, a)

@time map(sin, 1:10000);

@time sin.(1:10000);

foreach(println, 1:10)

ans === nothing # Nothing is returned


# Map with multiple arrays

map(//, 5:24, fill(32, 20))

# Reduce and folding

reduce(+, 1:10)

# ((((((((1 + 2) + 3) + 4) + 6) + 7) + 8) + 9) + 10)

l(a, b) = length(a) > length(b) ? a : b

reduce(l, split("This is a sample sentence to test the idea"))

# Folding

reduce(-, 1:10)

foldl(-, 1:10)

foldr(-, 1:10)

reduce((x, y) -> sqrt(x), 1:4, init=256)

sqrt(sqrt(sqrt(sqrt(256))))

# Functions that return functions

function create_exponent_function(x)
    newfunction = function (y) return y^x end
    return newfunction
end

squarer = create_exponent_function(2)

cuber = create_exponent_function(3)

quader = create_exponent_function(4)

squarer(4)

cuber(5)

quader(6)

function create_exponent_function(x)
    y -> y^x
end

# Function chaining and composition
# \circ TAB -> ∘
(sqrt ∘ +)(3, 5)

map(first ∘ reverse ∘ uppercase, split("You can compose functions like this"))

1:10 |> sum |> sqrt

(sqrt ∘ sum)(1:10)

collect(1:9) |> n -> filter(isodd, n)

# Methods

function check_longitude_1(loc)
    if -180 < loc < 180
        println("longitude $loc is a valid longitude")
    else
        println("longitude $loc should be between -180 and 180 degrees")
    end
end

check_longitude_1(-182)

check_longitude_1(22)

check_longitude_1("1°24'54.6\"W")

function check_longitude(loc::Real)
    if -180 < loc < 180
        println("longitude $loc is a valid longitude")
    else
        println("longitude $loc should be between -180 and 180 degrees")
    end
end

applicable(check_longitude, -30)

applicable(check_longitude, pi)

applicable(check_longitude, 22/7)

applicable(check_longitude, 22//7)

applicable(check_longitude, "1°24'54.6\"W")

check_longitude("1°24'54.6\"W")

function check_longitude(loc::String)
    # not real code, obviously!
      if endswith(loc, "W")
         println("longitude $loc is West of Greenwich")
      else
         println("longitude $loc is East of Greenwich")
      end
end

methods(check_longitude)

methods(+)

function check_longitude(loc::Any)
    println("longitude $loc should be a string or a number")
end

# Type parameters in method definitions

function test(a::T) where T <: Real
    println("$a is a $T")
end

test(2.3)

test(2)

test(.02)

test(pi)

test(22//7)

test(0xff)

test("str")

test(1:3)

function findodds(a::Array{T, 1}) where T <: Integer
    filter(isodd, a)
end

findodds(collect(1:20))

findodds([1, 2, 3, 4, 5, 6, 7, 8, 9, 10.0])

function findodds(a::Array{Int64, 1})
    findall(isodd, a)
end

