using Test
using MyHW

@testset "Crypto (Vigenère)" begin
    using MyHW.Crypto
    @test decrypt(encrypt("Mama", "pap"), "pap") == "Mama"
    @test encrypt("a-b", "b") == "b-c"
    @test decrypt("Bap!", "b") == "Azo!"  # ещё один быстрый sanity-check
end

@testset "Numbers" begin
    using MyHW.Numbers
    @test fibonacci(20) == [0,1,1,2,3,5,8,13]
    @test sum(even_fibonacci(50)) == 44  # 0,2,8,34
    @test square_numbers(4) == [1,4,9,16]
    @test all_numbers(5) == [1,2,3,4,5]
end

