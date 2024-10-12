function mono = stereo_to_mono(stereo)
  % calculate the mean of the stereo signal to convert it to mono
  mono = mean(stereo, 2);

  % normalize the mono signal
  max_val = max(abs(mono));
  if max_val != 0
    mono = mono / max_val;
  endif
endfunction
