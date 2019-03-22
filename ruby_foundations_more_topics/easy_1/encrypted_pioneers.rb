def rot13_decoder(phrase)
  letters = ("a".."z").to_a
  decoded = ""
  phrase.chars.each do |char|
    if !letters.include?(char) && !letters.include?(char.downcase)
      decoded << char
    elsif char.ord > 96
      decoded << letters[(letters.index(char) - 13)]
    else
      decoded << letters[(letters.index(char.downcase) - 13)].upcase
    end
  end
  decoded
end

puts rot13_decoder("Nqn Ybirynpr")
puts rot13_decoder("Tenpr Ubccre")
puts rot13_decoder("Nqryr Tbyqfgvar")
puts rot13_decoder("Nyna Ghevat")
puts rot13_decoder("Puneyrf Onoontr")
puts rot13_decoder("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
puts rot13_decoder("Wbua Ngnanfbss")
puts rot13_decoder("Ybvf Unvog")
puts rot13_decoder("Pynhqr Funaaba")
puts rot13_decoder("Fgrir Wbof")
puts rot13_decoder("Ovyy Tngrf")
puts rot13_decoder("Gvz Orearef-Yrr")
puts rot13_decoder("Fgrir Jbmavnx")
puts rot13_decoder("Xbaenq Mhfr")
puts rot13_decoder("Fve Nagbal Ubner")
puts rot13_decoder("Zneiva Zvafxl")
puts rot13_decoder("Lhxvuveb Zngfhzbgb")
puts rot13_decoder("Unllvz Fybavzfxv")
puts rot13_decoder("Tregehqr Oynapu")
