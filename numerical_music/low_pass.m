function signal = low_pass(signal, fs, cutoff_freq)
  % compute the Fourier Transform of the signal
  X = fft(signal);
  
  % get the length of the signal
  n = length(signal);

  % initialize the vector of frequencies
  freqs = zeros(1, n);

  % compute all possible frequencies of the signal
  for i = 0:n - 1
    freqs(i + 1) = (i) * fs;
  endfor
  freqs /= n;
    
  % get the length of the frequencies vector
  m = length(freqs);

  % initialize the mask vector
  mask = zeros(1, m);

  % create a mask vector that is 1 for frequencies lower than the cutoff
  % frequency and 0 for frequencies higher than the cutoff frequency
  for i = 1:m
    if freqs(i) < cutoff_freq
      mask(i) = 1;
    endif
  endfor
    
  % apply the Hadamard product between the Fourier Transform of the signal
  % and the mask
  X_filtered = X .* mask';
    
  % compute the inverse Fourier Transform to get the filtered signal
  signal = ifft(X_filtered);
    
  % normalize the filtered signal
  signal = signal / max(abs(signal));
endfunction

