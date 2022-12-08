answer = File.read('input.txt').split("\n\n").map do |r|
  r.split("\n").map(&:to_i).sum
end.max(3).sum
puts answer