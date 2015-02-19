function [X, Y, Z] = gplot3(A, xyz, linespec)
%GPLOT Plot graph, as in "graph theory".
%   GPLOT(A, xyz) plots the graph specified by the adjacency matrix,
%   A, and the n-by-3 coordinate array, xyz.
%   
%   GPLOT(A, xyz, linespec) uses line type and color specified in the
%   string LineSpec. See PLOT for possibilities.
%
%   [X, Y, Z] = GPLOT(A, xyz) returns the vectors X, Y, and Z without 
%   actually generating a plot.

% If no arguments given, then run buckminster sphere example
if nargin == 0
    [A, xyz] = bucky;
    nargin = 2;
end

% If only one argument given, throw error.
if nargin == 1
    error('Please provide an adjacency matrix and coordinate array');
end

% Returns i and j, lists of connected nodes
[i,j] = find(A);

% Extact 
X = [ xyz(i,1) xyz(j,1)]';
Y = [ xyz(i,2) xyz(j,2)]';
Z = [ xyz(i,3) xyz(j,3)]';

% Add NaN values to break between line segments
X = [X; NaN(size(i))'];
Y = [Y; NaN(size(i))'];
Z = [Z; NaN(size(i))'];

% Serialize the x and y data
X = X(:);
Y = Y(:);
Z = Z(:);

% If no linespec given, then plot with default
if nargout == 0 && nargin == 2
    plot3(X, Y, Z);
end

% If linespec given, use it for plotting
if nargout == 0 && nargin == 3 
    plot3(X, Y, Z, linespec);
end

end
