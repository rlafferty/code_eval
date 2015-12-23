@age_distributions =
  { 0..2 => 'Still in Mama\'s arms',
    3..4 => 'Preschool Maniac',
    5..11 => 'Elementary school',
    12..14 => 'Middle school',
    15..18 => 'High school',
    19..22 => 'College',
    23..65 => 'Working for the man',
    66..100 => 'The Golden Years' }

default = 'This program is for humans'
ARGF.each_line do |line|
  distribution = @age_distributions.select do |age|
    age === line.chomp.to_i
  end.values.first

  puts distribution || default
end
