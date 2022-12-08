# Score is:
# 1 for Rock, 2 for Paper, and 3 for Scissors
# plus
# 0 if you lost, 3 if the round was a draw, and 6 if you won
# A for Rock, B for Paper, and C for Scissors
# X for Rock, Y for Paper, and Z for Scissors
rows = File.read('input.txt').split("\n")
throw_to_score = {
  'A' => 1,
  'X' => 1,
  'B' => 2,
  'Y' => 2,
  'C' => 3,
  'Z' => 3
}
answer = rows.sum do |row|
  opponent, me = row.split
  my_throw_score = throw_to_score[me]
  diff = my_throw_score - throw_to_score[opponent]
  game_res =
    case diff
    when 0
      3
    when 1, -2
      6
    else
      0
    end
  game_res + throw_to_score[me]
end
puts answer