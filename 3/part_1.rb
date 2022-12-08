require 'Set'

def find_repeat(row)
  midpoint = row.length / 2
  found_letters = Set.new
  row.each_char.with_index do |char, i|
    if i < midpoint
      found_letters.add(char)
    elsif found_letters.include?(char)
      return char
    end
  end
end

rows = File.read(File.join(__dir__, 'input.txt')).split("\n")
char_to_priority = (('A'..'Z').map { |c| [c, c.ord - 38]} + ('a'..'z').map { |c| [c, c.ord - 96]}).to_h
answer = rows.sum do |row|
  char_to_priority[find_repeat(row)]
end
puts answer