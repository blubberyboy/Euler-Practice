class Integer
  def factorial
    return 1 if self == 0
    (1..self).inject(1,:*)
  end
end

  seed = "0123456789"
  sofar = ""
  nth = 999999
  (0..9).each do |i|
    f=(9-i).factorial
    n=nth/f
    sofar += seed[n]
    nth -= f*n
    seed = seed.delete(seed[n])
  end
  puts sofar
