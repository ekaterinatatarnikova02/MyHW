module Numbers

export fibonacci, even_fibonacci, square_numbers, all_numbers

function fibonacci(n::Integer)
    fib = [0, 1]
    while fib[end] + fib[end-1] <= n
        push!(fib, fib[end] + fib[end-1])
    end
    fib
end

even_fibonacci(n::Integer) = filter(x -> x % 2 == 0, fibonacci(n))
square_numbers(n::Integer) = [i^2 for i in 1:n]
all_numbers(n::Integer)    = collect(1:n)

end # module
