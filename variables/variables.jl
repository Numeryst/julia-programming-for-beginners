# You can use hash sign to define a one line comment
# For multiline comment we open up the comment with #= and close it with =#, like the following example

#=
    Testing multiline comment
    @Numeryst - Youtube
=#

x = 12

typeof(x) # Get the type of a variable

x = x + 10

x = 12; y = 15; z = 18; # Define variables in one line

y = x^4 + 2*x

x = "Numeryst.com" # Dynamically assign values to a variable, x was Int64

typeof(x)

w = 3.14

typeof(w)

# A variable name cannot start with a number but you can use uppercase, lowercase, or underscore
_xyz = 432

println(_xyz)

# We can use unicode characters for variable or function names in Julia

γ = 45 # \gamma TAB

α = 15 # \alpha TAB (To type alpha)

α

# You can also use subscript or superscript for the variable name
β₀ = 642 # \beta TAB \_0 TAB (to type β₀)

γ¹ = 10 # \gamma TAB \^1 TAB (to type γ¹)

γ¹

# However do not over use unicode characters, they can make your program confusing

# You cannot use the following keywords as variable names

#=
Keywords. This is the list of reserved keywords in Julia: baremodule , begin , break , catch , const , continue , do , else , elseif , end , export , false , finally , for , function , global , if , import , let , local , macro , module , quote , return , struct , true , try , using , while .
=#

# begin = 12 # Throws error
# if = 10 # Throws error

π # \pi TAB 
# π = 12 # Since it is a constant

ℯ # \euler TAB

# Naming style conventions for variable name
first_name = "Numeryst"
last_name = "Youtube"

firstName = "Numeryst"
lastName = "Youtube"

p, q, r = 8, 9, 10 # Assign values to multiple variables in one line

p

q

r

# Swap the values of two variable in one line?
p, q = q, p

p

q

# Till now, we did not define the variable types and Julia would automatically infer the types of the variables
# We can define variable types as easily as specifying the like this: variableName::variableType
# For instance
# u::Int64
# In the above line we have defined variable u with type Int64
# Specifying the types of variables helps us in defining functions and using features like multiple dispatch, catch errors, code readability

function sum_two_numbers(x::Float64, y::Float64)
    return x + y;
end

sum_two_numbers(12, 12) # It throws an error

sum_two_numbers(12.0, 12.0)

# How can we validate if an expression is of a particular type?
# By (expression)::exprType
# We can catch errors this way

((7+8)*2)::Int64

((7+8)*2.0)::Int64 # Because of the multiplication by floating point number 2.0

((7+8)*2.0)::Float64

(π + ℯ)::Float64

# To declare a constant we use the "const" keyword

const MYHANDLE = "Numeryst"

# MYHANDLE = 12

# MYHANDLE = "Numeryst@Youtube" # It changes the value with a warning message

