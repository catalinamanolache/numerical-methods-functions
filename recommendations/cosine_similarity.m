function similarity = cosine_similarity(A, B)
  % normalize the vectors
  A_normalised = norm(A);
  B_normalised = norm(B);

  % compute the cosine similarity between the two vectors 
  similarity = dot(A, B) / (A_normalised * B_normalised);
end
