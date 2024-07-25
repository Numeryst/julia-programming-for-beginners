# This function gets a number, and returns the same number plus one
function plus_one(n::Number)
    return n + 1
end

plus_one(1)
# plus_one("String example")
plus_one(12)
plus_one(12.0)
plus_one(12/2+1)
plus_one(12÷2+1)

subtypes(Integer)

supertype(Float64)

sizeof(BigFloat)

sizeof(Char)

typemax(Int64)

typemin(Int32)

function showtypetree(T, level=0)
    println("\t" ^ level, T)
    for t in subtypes(T)
        showtypetree(t, level+1)
    end
end

showtypetree(Number)

collect(1:10)

collect(1.0:10)

abstract type MyAbstractType end

supertype(MyAbstractType)

abstract type MyAbstractType2 <: Number end

mutable struct MyType <: MyAbstractType
    foo
    bar::Int
end

x = MyType("Hello", 10)

x.foo

x.bar

x.foo = 3.0

x.bar = 32

x.bar = "Hello"