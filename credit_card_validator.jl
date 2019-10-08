function new_number(account_number)
    checksum = 0
    exponent = 1
    while account_number > 0
        digit_value = (account_number % (10^exponent))
        account_number -= digit_value
        if exponent % 2 == 0
            digit_value *= 2
            if digit_value >= 10^exponent
                digit_value -= 9 * (10^(exponent-1))
            end
            checksum += digit_value
        elseif exponent % 2 == 1
            checksum += digit_value
        end
        exponent += 1
    end
    return checksum
end

function find_sum_digits(new_number)
    checksum = 0
    exponent = 1
    while new_number > 0
        digit_value = (new_number % (10^exponent))
        new_number -= digit_value
        checksum += digit_value / (10^(exponent-1))
        exponent += 1
    end
    return checksum % 10 == 0
end

function number_check(card_number)
    edited_number = new_number(card_number)
    if find_sum_digits(edited_number)
        println("This is a valid number.")
    else
        println("This is not a valid number.")
    end
end

number_check(parse(Int, readline()))