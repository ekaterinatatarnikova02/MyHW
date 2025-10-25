using MyHW: fibonacci, even_fibonacci, square_numbers, all_numbers
#include("../src/Numbers.jl"); using .Numbers

function ask_choice()
    while true
        print("Enter choice (1–4): "); flush(stdout)
        s = strip(readline())
        try
            c = parse(Int, s)
            return (1 <= c <= 4) ? c : (println("Please enter 1–4!"); nothing)
        catch
            println("That’s not a number, try again.")
        end
    end
end

function ask_n()
    while true
        print("Enter integer n (>= 1): "); flush(stdout)
        s = strip(readline())
        try
            n = parse(Int, s)
            return (n >= 1) ? n : (println("n must be >= 1."); nothing)
        catch
            println("That’s not a number, try again.")
        end
    end
end

function main()
    println("Choose what do you want to summarize:")
    println("1. Fibonacci numbers")
    println("2. Even Fibonacci numbers")
    println("3. Square numbers")
    println("4. All numbers 1..n")

    choice = nothing
    while choice === nothing; choice = ask_choice(); end
    n = nothing
    while n === nothing; n = ask_n(); end

    seq = choice == 1 ? fibonacci(n) :
          choice == 2 ? even_fibonacci(n) :
          choice == 3 ? square_numbers(n) :
                        all_numbers(n)

    println("\n--- RESULT ---")
    println("Numbers: ", seq)
    println("Count: ", length(seq))
    println("Sum: ", sum(seq))
end

main()

