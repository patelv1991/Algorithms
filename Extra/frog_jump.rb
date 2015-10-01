# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(arr, pond_width, max_jump_d)
    # returns 0 if frog can jump directly across the pond
    return 0 if pond_width <= max_jump_d
    # returns 0 if frog can jump to first leaf and then from first leaf
    # to the other side of the pond
    return 0 if arr[0] <= max_jump_d && (pond_width - arr[0]) <= max_jump_d

    prev_pos = 0
    arr.each_with_index do |pos, time|
        if (pos - prev_pos) <= max_jump_d && pos > prev_pos
            prev_pos = pos
            return time if pond_width - prev_pos <= max_jump_d
        end
    end

    # frog is unable to reach the other side and returns -1
    return -1
end
