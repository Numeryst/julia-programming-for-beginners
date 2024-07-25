x = 1

x > 3 ? "yes" : "no"

x = 5

x > 3 ? "yes" : "no"

x = 0.3

x < 0.5 ? sin(x) : cos(x)

isodd(103) && @warn("That's odd!")

isodd(104) && @warn("That's odd!")

isodd(103) || @warn("That's odd!")

isodd(104) || @warn("That's odd!")

name = "Julia"
if name == "Julia"
    println("I like Julia")
elseif name == "Python"
    println("I like Python")
    println("But i prefer Julia")
else
    println("I don't know what I like")
end

name = "Julia"
if name == "Julia"
    println("I like Julia")
end

s = ifelse(false, "Hello", "Goodbye") * " World"

x = 10

if x > 0
    "positive"
else
    "negative or zero"
end

r = if x > 0
    "positive"
else
    "negative or zero"
end

r


for i in 0:10:100
    println(i)
end

for color in ["red", "green", "blue"]
    print(color, " ")
end

for letter in "julia"
    print(letter, " ")
end

for element in (1, 2, 4, 6, 7, 12)
    print(element, " ")
end

for i in Dict("A" => 1, "B" => 2)
    println(i)
end

for i in Set(["a", "e", "a", "e", "i", "o", "i", "o", "u"])
    println(i)
end

a = reshape(1:100, (10, 10))

for n in a
    print(n, " ")
end

for n = a # You can use "=" instead of "in"
    print(n, " ")
end

for i in 1:10
    @show i
end

i

for i in 1:10
    global howfar
    if i % 4 == 0
        howfar = i
    end
end

howfar

function f()
    howfar = 0
    for i in 1:10
        if i % 4 == 0
            howfar = i
        end
    end
    return howfar
end

@show f()

for i in 1:5
    k = i^2
    println("$(i) squared is $(k)")
end

k

for i in 1:10
    z = i
    println("z is $z")
end

counter = 0

for i in 1:10
    global counter
    counter += i
end

counter

for i in 1:10
    if ! @isdefined z
        println("z is not defined")
    end
    z = i
    println("z is $z")
end

for i in 1:10
    global z
    if ! @isdefined z
        println("z is not defined")
    else
        println("z was $z")
    end
    z = i
    println("z is $z")
end

for i in 1:10
    if i%3 == 0
        continue
    end
    println(i)
end

x = 0

while x < 4
    println(x)
    global x += 1
end

while true
    println(x)
    x += 1
    x >= 4 && break
end