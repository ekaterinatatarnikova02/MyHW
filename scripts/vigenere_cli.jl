using MyHW: encrypt, decrypt

function main()
    print("Enter message: ")
    msg = strip(readline())
    print("Enter key: ")
    key = strip(readline())

    enc = encrypt(msg, key)   
    dec = decrypt(enc, key)

    println("\nEncrypted message: ", enc)
    println("Decrypted message: ", dec)
end

main()


