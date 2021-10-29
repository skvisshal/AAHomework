def sluggish_octopus(fish_arr)
    (0...fish_arr.length).each do |i|
        return fish_arr[i] if fish_arr.all? {|ele| ele.length <= fish_arr[i].length}
    end
end

def dominant_octopus(fish_arr)
    arr = merge_sort(fish_arr)
    arr.last
end

def clever_octopus(fish_arr)
    max = ""
    fish_arr.each do |fish|
        max = fish if max.length < fish.length
    end
    max
end

def merge_sort(fish_arr)
    return fish_arr if fish_arr.length <= 1

    mid = fish_arr.length/2
    left = merge_sort(fish_arr.take(mid))
    right = merge_sort(fish_arr.drop(mid))
    merge(left,right)
end

def merge(left, right)
    sorted = []

    until left.empty? || right.empty?
        if left.first.length > right.first.length
            sorted << right.shift
        else
            sorted << left.shift
        end
    end
    sorted += left
    sorted += right
end

def slow_dance(targ, arr)
    (0...arr.length).each do |i|
        return i if arr[i] == targ
    end
    nil
end

def fast_dance(targ, hash)
    return hash[targ.to_sym]
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
new_tiles_data_structure = {
    "up":0,
    "right-up":1,
    "right":2,
    "right-down":3,
    "down":4,
    "left-down":5,
    "left":6,
    "left-up":7
}
fish_arr_test = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p sluggish_octopus(fish_arr_test)
p dominant_octopus(fish_arr_test)
p clever_octopus(fish_arr_test)
p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)
p fast_dance("up", new_tiles_data_structure)
p fast_dance("right-down", new_tiles_data_structure)
