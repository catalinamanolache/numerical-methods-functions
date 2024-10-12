function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  % load the matrix from the .csv file
  mat = read_mat(path);

  % preprocess the matrix to remove rows with less than min_reviews reviews
  reduced_mat = preprocess(mat, min_reviews);

  % compute the reduced SVD of the matrix
  [U, S, V] = svds(reduced_mat, num_features);

  % initialize the similarities vector
  similarities = zeros(1, size(V, 1));

  % get the length of the V matrix
  [m n] = size(V);

  % compute the cosine similarity between the liked theme and all other themes
  for i = 1:m
    similarities(i) = cosine_similarity(V(liked_theme, :), V(i, :));
  endfor

  % sort the themes by similarity in descending order
  [sorted_similarities, sorted_indices] = sort(similarities, 'descend');

  % return the indices of the recommended themes,
  % excluding the liked theme itself
  recoms = sorted_indices(2:num_recoms + 1);
end
