# Given a matrix of integers and coordinates of a rectangular region within the
# matrix, find the sum of numbers falling inside the rectangle.

def matrix_region_sum(matrix, top_left_coords, bottom_right_coords)
  min_row = top_left_coords[0]
  max_row = bottom_right_coords[0]
  min_col = top_left_coords[1]
  max_col = bottom_right_coords[1]

  sum = 0
  while min_row <= max_row
    while min_col <= max_col
      sum += matrix[min_row][min_col]
      min_col += 1
    end
    min_row += 1
  end
  sum
end
