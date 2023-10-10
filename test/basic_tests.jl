@testset "Unit Tests" begin
    @test rse_sum([2, 2, 2]) == 6
    @test rse_mean([2, 3, 4]) == 3
    @test rse_std([2, 3, 4]) == 1
    @test rse_tstat(2:3) == 5

    @test_throws AssertionError rse_sum([1, 2, 3, NaN])
end

@testset "Integration Tests" begin
    data1 = [5, 2, 3, 5, 2]
    data2 = [3, 2, 4, 5, 7]

    # Expected result
    expected_sum_of_mean = 7.6

    # Actual result
    mean_1 = rse_mean(data1)
    mean_2 = rse_mean(data2)

    actual_sum_of_means = rse_sum([mean_1, mean_2])

    # Test
    @test expected_sum_of_mean == actual_sum_of_means
end