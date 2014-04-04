require 'pp'

class DefiantAttitudeNumber
    def initialize()
        @power = []
        @using_number = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

        for i in 0..9
            k = 1

            for j in 0..i - 1
                k *= i
            end
            
            if i != 0
                @power[i] = k
            else
                @power[i] = 0
            end
        end
    end

    def num_of_digit(number, digit)
        ret = 0

        if number == 0
            return 0
        end

        if number % 10 == digit
            ret = 1
        end

        ret += num_of_digit(number / 10, digit)

        return ret
    end

    def check_number()
        result = 0

        for i in 0..9
            result += @power[i] * @using_number[i]
        end

        for ii in 0..9

            if num_of_digit(result, ii) != @using_number[ii]
                return
            end
        end

        pp "result is " + result.to_s

        return
    end

    def make_numbers(start, count)
        i = 0

        if count > 10
            return
        end

        for i in start..9
            @using_number[i] += 1
            check_number()
            make_numbers(i, count + 1)
            @using_number[i] -= 1
        end
    end

    def main()
        make_numbers(0, 1)
    end
end

defiant_attitude_number = DefiantAttitudeNumber.new()
defiant_attitude_number.main()
