x = (1..12)
y = (1..12)
 
y.each do |j| 
    x.each do |i| 
    		print((i*j).to_s.rjust(4)) unless i == 1
    		print((i*j)) if i == 1
    end
    print "\n"
end