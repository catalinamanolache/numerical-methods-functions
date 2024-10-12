function reduced_mat = preprocess(mat, min_reviews)
  % get the size of the matrix
  [m, n] = size(mat);

  % count the number of lines that have at least `min_reviews` reviews
  new_line_num = 0;
  for i = 1:m
    % count the number of reviews for the current user
    num_reviews = 0;
    for j = 1:n
      % if the user has made a review, we increment the counter
      if mat(i, j) > 0
        num_reviews += 1;
      endif
    endfor
    % if the current user has a minimum of min_reviews reviews,
    % we increment the counter of the number of lines of the new matrix
    if num_reviews >= min_reviews
      new_line_num += 1;
    endif
  endfor

  % initialize the new matrix with the new number of lines
  reduced_mat = zeros(new_line_num, n);

  % initialize the index of the new matrix
  idx = 1;

  % fill the new matrix with the lines that have at least min_reviews reviews
  for i = 1:m
    % count the number of reviews for the current user
    num_reviews = 0;
    for j = 1:n
      % if the user has made a review, we increment the counter
      if mat(i, j) > 0
        num_reviews += 1;
      endif
    endfor
    % if the current user has a minimum of min_reviews reviews,
    % it will be added to the new matrix
    if num_reviews >= min_reviews
      reduced_mat(idx, :) = mat(i, :);
      % we go to the next line in the new matrix
      idx += 1;
    endif
  endfor
endfunction
