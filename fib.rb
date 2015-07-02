def fibonacci( n )
  return  n  if n <= 1
  ( fibonacci( n - 1 ) + fibonacci( n - 2 ) )
end

File.foreach(ARGV[0]) do |line|
 puts fibonacci(line.to_i)
end
