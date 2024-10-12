function signal = apply_reverb(signal, impulse_response)
  % make sure that the impulse response is in mono
  impulse_response = stereo_to_mono(impulse_response);
    
  % compute the convolution between the signal and the impulse response
  signal = fftconv(signal, impulse_response);
    
  % normalize the resulting signal
  signal = signal / max(abs(signal));
endfunction

