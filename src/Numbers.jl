module Numbers

export fibonacci, even_fibonacci, square_numbers, all_numbers

"""
    fibonacci(n::Integer) -> Vector{Int}

Generates all Fibonacci numbers less than or equal to n.

# Examples
```jldoctest
julia> fibonacci(20)
[0, 1, 1, 2, 3, 5, 8, 13]


    even_fibonacci(n::Integer) -> Vector{Int}

Returns all even Fibonacci numbers less than or equal to n.

# Examples
```jldoctest
julia> even_fibonacci(20)
[0, 2, 8]


    square_numbers(n::Integer) -> Vector{Int}
Generates a list of the first n square numbers (from 1^2 to n^2).

# Examples
```jldoctest
julia>  square_numbers(5)
[1, 4, 9, 16, 25]


    all_numbers(n::Integer) -> Vector{Int}
Returns a vector of all integers from 1 to n.

# Examples
```jldoctest
julia>  all_numbers(5)
[1, 2, 3, 4, 5]

"""

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
