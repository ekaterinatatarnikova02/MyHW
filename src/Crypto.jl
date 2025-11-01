module Crypto

export encrypt, decrypt


"""
    encrypt(msg::AbstractString, key::AbstractString) -> String

Encrypts the given message using the Vigenere cipher.

Only alphabetic characters are shifted; all other characters (spaces, punctuation, numbers) remain unchanged.  
Letter case is preserved.  
The key can include non-letter characters — they are ignored.  
Throws `ArgumentError` if the key contains no letters.

# Examples
```jldoctest
julia> encrypt("Hello, World!", "Key")
"Rijvs, Uyvjn!" 

    decrypt(msg::AbstractString, key::AbstractString) -> String

Decrypts a message that was encrypted with the Vigenère cipher.
The same key must be used for both encryption and decryption.

# Examples
```jldoctest
julia> decrypt("Rijvs, Uyvjn!", "Key")
"Hello, World!"

"""
# --- Internal helper functions ---
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

end 

