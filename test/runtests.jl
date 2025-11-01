using Test
using MyHW  


@testset "Crypto" begin
    @test decrypt(encrypt("Hello, World!", "Key"), "Key") == "Hello, World!"

    @test encrypt("Abc XYZ!", "b") == "Bcd YZA!"
    @test decrypt("Bcd YZA!", "b") == "Abc XYZ!"

    # key without letters -> error
    @test_throws ArgumentError encrypt("msg", "12345")

    # longer key (cycling)
    msg = "Attack at dawn"
    key = "VeryLongKey"
    @test decrypt(encrypt(msg, key), key) == msg
end

@testset "Numbers" begin
    @test fibonacci(10) == [0, 1, 1, 2, 3, 5, 8]
    @test even_fibonacci(10) == [0, 2, 8]  
    @test square_numbers(5) == [1, 4, 9, 16, 25]
    @test all_numbers(5) == [1, 2, 3, 4, 5]
end

# Helper: run a script with simulated user input
function run_script(script_relpath::AbstractString, input::AbstractString)
    project_root = normpath(joinpath(@__DIR__, ".."))
    script_path = joinpath(project_root, script_relpath)
    cmd = `$(Base.julia_cmd()) --project=$(project_root) $(script_path)`
    cd(project_root) do
        return read(pipeline(IOBuffer(input), cmd), String)
    end
end

@testset "scripts/seq_cli.jl (happy path)" begin
    # Choose option 2 (Even Fibonacci), then n = 10
    out = run_script(joinpath("scripts", "seq_cli.jl"), "2\n10\n")

    @test occursin("RESULT", out) || occursin("RESULT ---", out)
    @test occursin("Numbers: [0, 2, 8]", out)
    @test occursin("Count: 3", out)
    @test occursin("Sum: 10", out)
end

@testset "scripts/seq_cli.jl (invalid input -> recover)" begin
    # Feed wrong inputs, then valid ones:
    # choice: "x" (not a number), "9" (out of 1..4), then "2"
    # n: "zero" (not a number), "0" (invalid range), then "10"
    input = "x\n9\n2\nzero\n0\n10\n"
    out = run_script(joinpath("scripts", "seq_cli.jl"), input)

    # Script should not crash; it should re-prompt and eventually print a result
    @test occursin("RESULT", out) || occursin("RESULT ---", out)

    # Optional: check that the script actually complained about bad inputs
    @test occursin("not a number", lowercase(out)) || occursin("please enter 1–4", lowercase(out))
    @test occursin("n must be >= 1", out) || occursin("n must be ≥ 1", out)
end

@testset "scripts/vigenere_cli.jl (happy path)" begin
    # Provide message and key
    out = run_script(joinpath("scripts", "vigenere_cli.jl"), "Hello, World!\nKey\n")

    @test occursin("Encrypted message:", out)
    @test occursin("Decrypted message: Hello, World!", out)

    # Ensure ciphertext is not identical to plaintext
    for line in split(out, '\n')
        if startswith(line, "Encrypted message:")
            @test !occursin("Hello, World!", line)
        end
    end
end