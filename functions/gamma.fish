function gamma
  if test $argv[1] = '-i'
    brightnessctl s 5%+
  else if test $argv[1] = '-d'
    brightnessctl s 5%-
  end
end
