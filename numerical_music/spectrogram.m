function [S f t] = spectrogram(signal, fs, window_size)
  % get the length of the signal
	signal_length = length(signal);

  % compute the number of windows
  num_windows = floor(signal_length / window_size);

  % initialize the spectrogram matrix
  S = zeros(window_size, num_windows);

  % go over each window
  for i = 1:num_windows
    % get the current window
    window = signal((i - 1) * window_size + 1:i * window_size);

    % apply the hann function to the window
    windowed_signal = window .* hanning(window_size);

    % compute the Fourier Transform of the window
    % with a resolution of 2 * window_size
    fft_result = fft(windowed_signal, 2 * window_size);

    % store the absolute value of the real part of the result
    S(:, i) = abs(fft_result(1:window_size));
  endfor

  % compute the frequency vector
  for i = 1:window_size 
    f(i) = (i - 1) * (fs / (2 * window_size));
  endfor

  % compute the time vector
  for i = 1:num_windows
    t(i) = (i - 1) * window_size / fs;
  endfor

  f = f';
  t = t';
endfunction
