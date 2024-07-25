
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

