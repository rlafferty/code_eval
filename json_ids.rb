require 'json'

def iterate(h, acc = [])
  h.each do |k, v|
    if v.is_a?(Hash) || v.is_a?(Array)
      iterate(v, acc)
    else
      acc << k['label'] if k.respond_to? :[]
    end
  end
  acc.flatten.compact
end

File.foreach(ARGV[0]) do |line|
  next if line.chomp.empty?
  json = JSON.parse(line)
  results = iterate(json)
  puts results.map { |e| e[/\d+/].to_i }.inject(0) { |a, e| a + e }
end
