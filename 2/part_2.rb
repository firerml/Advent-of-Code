# Score is:
# 1 for Rock, 2 for Paper, and 3 for Scissors
# plus
# 0 if you lost, 3 if the round was a draw, and 6 if you won
# A for Rock, B for Paper, and C for Scissors
# X for lose, Y for draw, and Z for win
rows = File.read('input.txt').split("\n")
throws = %w[A B C]
answer = rows.sum do |row|
  opponent, game_res = row.split
  opponent_throw_score = (throws.index(opponent) + 1)
  case game_res
  when 'Y'
    3 + opponent_throw_score
  when 'Z'
    6 + (opponent == 'C' ? 1 : opponent_throw_score + 1)
  else
    opponent == 'A' ? 3 : opponent_throw_score - 1
  end
end
puts answer
