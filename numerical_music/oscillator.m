function x = oscillator(freq, fs, dur, A, D, S, R)
  % create a time vector t
  t = (0:1/fs:dur-1/fs);
  t = t';

  % create the sine wave
  x = sin(2*pi*freq*(t));

  % compute the total number of samples
  total_samples = numel(t);

  % compute the number of attack, decay, release and sustain samples
  attack_samples = floor(A * fs);
  decay_samples = floor(D * fs);
  release_samples = floor(R * fs);
  sustain_samples = total_samples - attack_samples - decay_samples - release_samples;

  % compute the attack, decay, sustain and release envelopes
  attack_env = linspace(0, 1, attack_samples);
  decay_env = linspace(1, S, decay_samples);
  sustain_env = ones(1, sustain_samples) * S;
  release_env = linspace(S, 0, release_samples);

  % concatenate the envelopes to create the final envelope
  envelope = [attack_env decay_env sustain_env release_env]';

  % multiply the sine wave by the envelope to apply the amplitude modulation
  x .*= envelope;
endfunction

