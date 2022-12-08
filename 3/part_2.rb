require 'Set'

char_to_priority = (('A'..'Z').map { |c| [c, c.ord - 38]} + ('a'..'z').map { |c| [c, c.ord - 96]}).to_h
char_counts = Hash.new(0)
answer = 0
curr_row_chars = Set.new
(File.read(File.join(__dir__, 'input.txt')) + "\n").each_char do |char|
  curr_row_chars.add(char)
  if char == "\n"
    curr_row_chars.each { |c| char_counts[c] += 1}
    curr_row_chars = Set.new
    if char_counts["\n"] == 3
      badge = char_counts.max_by(&:last).first
      answer += char_to_priority[badge]
      char_counts = Hash.new(0)
    end
  end
end
puts answer
