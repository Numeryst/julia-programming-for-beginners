
@time [cos(sin(i)) for i in 1:100000];

@which 2 + 2

# Quoted expressions

x = 3

:x

:(2 + 2)

quote
    2 + 2
end

expression = quote
    for j = 1:5
        println(j)
    end
end


typeof(expression)

# Evaluating expressions

eval(:x)

eval(:(2 + 2))

eval(expression)

e = :(
    for i in 1:10
        println(i)
    end
)

eval(e)

# Inside Expressions

P = quote
    a = 2
    b = 3
    c = 4
    d = 5
    e = sum([a,b,c,d])
end

fieldnames(typeof(P))

P.args[2]

for (n, expr) in enumerate(P.args)
    println(n, ": ", expr)
end

eval(P)

P.args[end] = quote prod([a,b,c,d]) end

eval(P)

P.args[end].args[end].args[1]

P.args[end].args[end].args[1] = :prod

eval(P)

dump(:(3 * sin(pi/2)))

# Expression interpolation

"the sine of 1 is $(sin(1))"

quote s = $(sin(1) + cos(1)); end

macro p(n)
    if typeof(n) == Expr 
       println(n.args)
    end
    return n
end

@p 3

@p 3 + 4 - 5 * 6 / 7 % 8

macro time(ex)
    quote
        local t0 = time()
        local val = $(esc(ex))
        local t1 = time()
        println("elapsed time: ", t1-t0, " seconds")
        val
    end
end

@p begin
    2 + 2 - 3
end

@p(2 + 3 + 4 - 5)

# eval() and @eval

ex = :(2 + 4)

eval(ex)

@eval ex

@eval $(ex)

# In other words

@eval $(ex) == eval(ex)

for i in 1:10
    symbolname = Symbol("var_squares_$(i)")
    eval(quote $symbolname = $(i^2) end)
end

for i in 1:10
    symbolname = Symbol("var_cubes_$(i)")
    @eval $symbolname = $(i^3)
end

var_cubes_5

[@eval $(Symbol("var_squares_$(i)")) = ($i^2) for i in 1:10]

# Scope and context

macro f(x)
    quote
        s = 4
        (s, $(esc(s)))
    end
end

s = 0

@f 2

# Expanding macros

macroexpand(Main, quote @p 3 + 4 - 5 * 6 / 7 % 8 end)

macro dotimes(n, body)
    quote
        for i = 1:$(esc(n))
            $(esc(body))
        end
    end
end

@dotimes 3 println("Do not forget to like and subscribe")

@dotimes 3 begin    
    for i in 4:6            
        println("i is $i")  
    end                     
 end                        

 macroexpand(Main, # we're working in the Main module
    quote  
        @dotimes 3 begin
            for i in 4:6
                println("i is $i")
            end
        end
    end 
)

