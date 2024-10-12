function [x, y] = parse_data(filename)
    % file input format:
    % n
    % x0 x1 ... xn
    % y0 y1 ... yn

    % open the file for reading
    fopen(filename, 'rt');

    % read n from the file
    n = fscanf(filename, '%d', 1);

    % read the x vector from the file, which has n + 1 elements
    x = fscanf(filename, '%d', n + 1);

    % read the y vector from the file, which has n + 1 elements
    y = fscanf(filename, '%d', n + 1);

    % close the file
    fclose(filename);
end