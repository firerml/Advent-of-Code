stack_rows, move_rows = File.read(File.join(__dir__, 'input.txt')).split("\n\n").map { |r| r.split("\n") }
stack_rows = stack_rows[0...-1]

stacks = []
stack_rows.each do |row|
  i = 1
  stack_num = 1
  chars = row.chars
  loop do
    break if chars[i].nil?

    if chars[i] != ' '
      stacks[stack_num] ||= []
      stacks[stack_num] << chars[i]
    end
    i += 4
    stack_num += 1
  end
end

# Start of "move" directions.
move_rows.each do |row|
  _, amount, _, from, _, to = row.split.map(&:to_i)
  amount.times { stacks[to].unshift(stacks[from].shift) }
end
answer = stacks.compact.map(&:first).join
puts answer