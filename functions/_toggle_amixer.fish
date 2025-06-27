function _toggle_amixer
  if test (amixer get PCM | grep -Eo '[0-9]+%' | xargs | cut -d' ' -f1 | cut -d'%' -f1) -ne 0
    amixer set PCM 0
  else
    amixer set PCM 20%
  end
end

