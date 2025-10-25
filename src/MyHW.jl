module MyHW

include("Crypto.jl")
include("Numbers.jl")

using .Crypto: encrypt, decrypt
using .Numbers: fibonacci, even_fibonacci, square_numbers, all_numbers
export encrypt, decrypt, fibonacci, even_fibonacci, square_numbers, all_numbers

end # module

