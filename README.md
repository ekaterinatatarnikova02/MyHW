# MyHW Julia Homework Project
This repository contains a small Julia project developed for coursework.  
It includes modules for encryption (Vigenere cipher) and number sequence generation,  
as well as command-line scripts and automated tests.


## How to Run
Clone the repository and open the project folder:

```bash git clone <repo-link>

cd MyHW

#Start Julia in project mode:
julia 
#Then install dependencies and run the tests:

]
pkg> instantiate
pkg> test

#Usage Examples

Encryption (Vigenère cipher)
using MyHW

msg = Hello, World!
key = "Key"

enc = encrypt(msg, key)
dec = decrypt(enc, key)
println("Encrypted: ", enc)
println("Decrypted: ", dec)

Output:
Encrypted: Rijvs, Uyvjn!
Decrypted: Hello, World!

Number Sequences
using MyHW

fibonacci(10)        # [0, 1, 1, 2, 3, 5, 8]
even_fibonacci(10)   # [0, 2, 8]
square_numbers(5)    # [1, 4, 9, 16, 25]
all_numbers(5)       # [1, 2, 3, 4, 5]

##Command-Line Scripts
This project includes two interactive command-line tools located in the scripts/ folder.
They can be executed directly from the terminal.
#Sequence Generator
julia --project=. scripts/seq_cli.jl
Description: prompts the user to select one of four types of sequences:
Fibonacci numbers
Even Fibonacci numbers
Square numbers
All numbers from 1 to n
Then asks for the integer n, prints the resulting sequence, its count, and its sum.
#Vigenère Cipher Tool
julia --project=. scripts/vigenere_cli.jl

Description: prompts the user to enter a message and a key, then prints the encrypted and decrypted messages.
Example run:
Enter message: Hello, World!
Enter key: Key

Encrypted message: Rijvs, Uyvjn!
Decrypted message: Hello, World!



## Testing
Tests are located in test/runtests.jl and include:

Unit tests for all functions in Crypto.jl and Numbers.jl
Validation of incorrect user input handling

To run all tests directly from the terminal:
​​cd /MyHW
julia 
]
activate .
instantiate
test

##Author
Ekaterina Tatarnikova
University of Innsbruck
Ekaterina.Tatarnikova@student.uibk.ac.at

