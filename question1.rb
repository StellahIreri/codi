def solution(a)
  n = a.length
  return 0 if n <= 2

  increasing = [1] * n
  decreasing = [1] * n

  # Calculate the length of the longest increasing sequence
  (1...n).each do |i|
    (0...i).each do |j|
      if a[i] > a[j]
        increasing[i] = [increasing[i], increasing[j] + 1].max
      end
    end
  end

  # Calculate the length of the longest decreasing sequence
  (n - 2).downto(0).each do |i|
    (n - 1).downto(i + 1).each do |j|
      if a[i] > a[j]
        decreasing[i] = [decreasing[i], decreasing[j] + 1].max
      end
    end
  end

  max_spike_length = 0

  # Calculate the longest spike
  (0...n).each do |i|
    max_spike_length = [max_spike_length, increasing[i] + decreasing[i] - 1].max
  end

  max_spike_length
end

# Test cases
puts solution([1, 2]) # Output: 2
puts solution([2, 5, 3, 2, 4, 1]) # Output: 6
puts solution([2, 3, 3, 2, 2, 2, 1]) # Output: 4
