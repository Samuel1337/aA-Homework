# Big O-ctopus and Biggest Fish
# A Very Hungry Octopus wants to eat the longest fish in an array of fish.

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

# Sluggish Octopus
# Find the longest fish in O(n^2) time.
# Do this by comparing all fish lengths to all other fish lengths

def sluggish_octopus(array)
    array.each do |el|
        return el if array.all? { |el2| el.length >= el2.length }
    end
end

p sluggish_octopus(fish)

# Dominant Octopus
# Find the longest fish in O(n log n) time.
# Hint: You saw a sorting algorithm that runs in O(n log n) in the
# sorting complexity demo from the Sorting Complexity reading.
# Remember that Big O is classified by the dominant term.

def dominant_octopus(array)
    sorted = merge_sort(array)
    sorted.last
end

def merge_sort(array)
    return [array.first] if array.length == 1
    mid = array.length / 2
    left = array.take(mid)
    right = array.drop(mid)
    merge(left, right)
end

def merge(left, right)
    result = []
    until left.empty? || right.empty?
        if left.first.length < right.first.length
            result << left.shift
        else
            result << right.shift
        end
    end
    result + left + right
end

p dominant_octopus(fish)

# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the
# longest fish that you have found so far while stepping through the
# array only once.

def clever_octopus(array)
    largest = array.first
    array.each { |el| largest = el if el.length > largest.length }
    largest
end

p clever_octopus(fish)

# Dancing Octopus
# Full of fish, the Octopus attempts Dance Dance Revolution.
# The game has tiles in the following directions:

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", 
    "left",  "left-up" ]

# To play the game, the octopus must step on a tile with her corresponding
# tentacle. We can assume that the octopus's eight tentacles are numbered and
# correspond to the tile direction indices.

# Slow Dance
# Given a tile direction, iterate through a tiles array to return the
# tentacle number (tile index) the octopus must move.
# This should take O(n) time.

def slow_dance(dir, arr)
    arr.index(dir)
end

p slow_dance("up", tiles_array)
# > 0

p slow_dance("right-down", tiles_array)
# > 3

# Constant Dance!
# Now that the octopus is warmed up, let's help her dance faster.
# Use a different data structure and write a new function so that you
# can access the tentacle number in O(1) time.

new_tiles_data_structure = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, 
    "left" => 6,  "left-up" => 7 }

def fast_dance(dir, hash)
    hash[dir]
end

p fast_dance("up", new_tiles_data_structure)
# > 0

p fast_dance("right-down", new_tiles_data_structure)
# > 3