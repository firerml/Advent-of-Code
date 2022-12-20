rows = File.read(File.join(__dir__, 'input.txt')).split("\n")
answer = rows.count do |row|
  pair1, pair2 = row.split(',').map { |pair| pair.split('-').map(&:to_i) }
  (pair1[1] >= pair2[0] && pair1[0] <= pair2[1]) || (pair2[1] >= pair1[0] && pair2[0] <= pair1[1])
end
puts answer
