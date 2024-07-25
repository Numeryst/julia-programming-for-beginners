# Reading from files

pwd()

cd("F:/numeryst/io/")

touch("numeryst.txt")

f = open("numeryst.txt")

close(f)

open("numeryst.txt") do file
    # do stuff with open file

end

totaltime, totallines = open("numeryst.txt") do f
    linecounter = 0
    timetaken = @elapsed for l in eachline(f)
        linecounter += 1
    end
    (timetaken, linecounter)
end

# Reading a file all at once

s = read(f, String)

s = open("numeryst.txt") do file
    read(file, String)
end

f = open("numeryst.txt")

lines = readlines(f)

lines[1]

lines[2]

counter = 1

for l in lines
    println("$counter $l")
    counter += 1
end

# Line by line

open("numeryst.txt") do file
    for ln in eachline(file)
        println("$(length(ln)), $(ln)")
    end
end

open("numeryst.txt") do f
    for i in enumerate(eachline(f))
        println(i[1], ": ", i[2])
    end
end

open("numeryst.txt") do f
    line = 1
    while !eof(f)
        x = readline(f)
        println("$line $x")
        line += 1
    end
end

function shout(f::IOStream)
    return uppercase(read(f, String))
end

shoutversion = open(shout, "numeryst.txt")

# Writing to files

open("subscribe.txt", "w") do f
    write(f, "Please subscribe to my channel.\nIt helps me improve the quality of my content.")
end

function fourrandom()
    return rand(1:10, 4)
end

open("fourrandomnumbers.txt", "w") do f
    for i in 1:20
        n1, n2, n3, n4 = fourrandom()
        write(f, "$n1, $n2, $n3, $n4\n")
    end
end

using DelimitedFiles

writedlm("fourdlmrandom.txt", rand(1:10, 20, 4), ", ")