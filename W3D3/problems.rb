def sum_to(num)
    return nil if num < 0
    return 0 if num == 0
    num + sum_to(num - 1)
end

def add_numbers(nums_array)
    return nil if nums_array.empty?
    return nums_array[0] if nums_array.length == 1
    nums_array[0] + add_numbers(nums_array[1..nums_array.length])
end

def gamma_fnc(n)
    return nil if n < 1
    return 1 if n == 1
    (n-1) * gamma_fnc(n-1)
end

def ice_cream_shop(flavors, favorite)
    return false if flavors.empty?
    return true if flavors[0] == favorite
    ice_cream_shop(flavors[1..flavors.length], favorite)
end

def reverse(string)
    return "" if string.empty?
    reverse(string[1, string.length]) + string[0]
end

p reverse("house") # => "esuoh"
p reverse("dog") # => "god"
p reverse("atom") # => "mota"
p reverse("q") # => "q"
p reverse("id") # => "di"
p reverse("") # => ""

