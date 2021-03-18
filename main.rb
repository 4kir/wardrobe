require_relative 'lib/wardrobe'

wardrobe = Wardrobe.from_dir(File.join(__dir__, 'data'))

puts 'Сколько градусов за окном? (можно с минусом)'

user_temp = STDIN.gets.to_i

suitable_wardrobe = wardrobe.for_weather(user_temp)

wardobe_for_user =
  Wardrobe.new(
    suitable_wardrobe.types.map { |type| suitable_wardrobe.for_type(type).sample }
  )

puts 'Предлагаем сегодня надеть'
puts wardobe_for_user
