module Crypto

export encrypt, decrypt

# Convert key letter to numeric shift (0–25)
keyshift(k::Char) = isletter(k) ? Int(lowercase(k)) - Int('a') : nothing

# Shift a character by s, preserving case; non-letters unchanged
function shift_char(c::Char, s::Int)
    if 'A' <= c <= 'Z'
        base = Int('A')
        return Char(mod(Int(c) - base + s, 26) + base)
    elseif 'a' <= c <= 'z'
        base = Int('a')
        return Char(mod(Int(c) - base + s, 26) + base)
    else
        return c
    end
end

# Shared core logic for encrypt/decrypt
function apply_vigenere(msg::AbstractString, key::AbstractString, dir::Int)
    shifts = [s for k in key for s in (keyshift(k),) if s !== nothing]
    isempty(shifts) && throw(ArgumentError("key must contain at least one letter"))
    
    out = IOBuffer()
    ki, klen = 1, length(shifts)
    for c in msg
        if isletter(c)
            write(out, shift_char(c, shifts[ki] * dir))
            ki = (ki == klen) ? 1 : ki + 1
        else
            write(out, c)
        end
    end
    return String(take!(out))
end

encrypt(msg::AbstractString, key::AbstractString) = apply_vigenere(msg, key, +1)
decrypt(msg::AbstractString, key::AbstractString) = apply_vigenere(msg, key, -1)

end # module

