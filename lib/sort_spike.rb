require 'pry'

# def sort(array)
#   sorted_array = []
#   if array.min < array[1]
#   smallest = array.delete(array.min)
#   sorted_array << smallest
#   end
#
#   sorted_array
# end

def bubble_sort(array)
  n = array.length
  loop do
    swapped = false

    (n-1).times do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
      end
    end

    break if not swapped
  end

  array
end

def sort(array)
    arr_length = array.length





array = [1,4,2,3,5]
p array
p bubble_sort(array)
