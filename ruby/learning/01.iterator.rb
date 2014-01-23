puts "this is iterator study"

arr = [1,2,3,4]
arr.each {|c| puts c}
arr.each do |c|
	puts "going with " + c.to_s
end

for i in 1..10 do
	puts "for" +i.to_s
end

(1..10).each do |i| puts "iterator"+i.to_s end

1.upto(10) do |i| puts "upto"+i.to_s end

File.new("01.iterator.rb").each_line do|s|
	puts s
end

Dir.foreach("c:/") do |d| puts d end

arr.each_index { |i| puts i}

s="hello"
s.each_byte do |w| puts w.chr end

x={"a"=>1,"b"=>2, "c"=>3}
x.each do |k,v| puts"#{k} #{v}" end

x.each_key do |k| puts k end
x.each_value do |v| puts v end


x=[3,2,4,5,0,1]
puts x.to_s

class Array
  def myeach
  	for i in self do  		
  		yield i
  	end
  end
end

x.myeach {|s| puts "this is my each! #{s}"}


hash=[:xxx=>1,:xx=>3,:xxxx=>123]
hash.each do|k,v| puts"#{k} #{v}" end

