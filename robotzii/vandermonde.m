function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'

    % compute the length of the input vector x
    len = length(x);

    % initialize the Vandermonde matrix A
    A = zeros(len, len);

    % go over each row of the new matrix
    for i = 1:len
        % set the first element of each line to 1
        A(i, 1) = 1;

        % compute the rest of the elements
        % save the current element of the vector x to compute its powers
        aux = x(i);
        % loop over the remaining elements, starting from the second element
        for j = 2:len
            % set the current element in the row to the auxiliary variable
            A(i, j) = aux;
            % multiply the auxiliary variable with the current element from
            % the vector x, to raise the power
            aux *= x(i);
        endfor
    endfor

    % compute the coef vector solving the system A * coef = y
    coef = A \ y;
endfunction
