function y_interp = P_vandermonde (coef, x_interp)
	% P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
	% coef = [a0, a1, a2, ..., an]'
	% y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1
	
	% compute the length of x_interp
	n = length(x_interp);

	% compute the length of coef
	m = length(coef);

	% initialize the y_interp vector
	y_interp = zeros(n, 1);

	% compute the value of y_interp
	for i = 1:n
		% add the coeficient for the x^0 term
		y_interp(i) += coef(1);
		% initialize an auxiliary variable to compute the powers of x_interp(i)
		aux = x_interp(i);
		% loop over the remaining coeficients
		for j = 2:n
		% add the coeficient for the x^j term, if the coeficient exists
			if j <= m
				y_interp(i) += coef(j) * aux;
				aux *= x_interp(i);
			else
				% the coeficient is 0 (doesn't exist)
				y_interp(i) += 0;
			endif
		endfor
	endfor
end
