function [Xout, Yout, Zout]=gplot3(A, xyz, linespec)
%GPLOT Plot graph, as in "graph theory".
%   GPLOT(A, xyz) plots the graph specified by the adjacency matrix,
%   A, and the n-by-3 coordinates array, xyz.
%   
%   GPLOT(A, xyz, linespec) uses line type and color specified in the
%   string LineSpec. See PLOT for possibilities.
%
%   [X,Y,Z] = GPLOT(A, xyz) returns the vectors X, Y, and Z without 
%   actually generating a plot.

[i,j] = find(A);
[~, p] = sort(max(i,j));
i = i(p);
j = j(p);

X = [ xyz(i,1) xyz(j,1)]';
Y = [ xyz(i,2) xyz(j,2)]';
Z = [ xyz(i,3) xyz(j,3)]';

if isfloat(xyz) || nargout ~= 0
    X = [X; NaN(size(i))'];
    Y = [Y; NaN(size(i))'];
    Z = [Z; NaN(size(i))'];
end

if nargout == 0
    if ~isfloat(xyz)
        if nargin < 3
            lc = '';
        end
        [lsty, csty, msty] = gplotGetRightLineStyle(gca, linestyle);    
        plot3(X, Y, Z, linestyle);
    else
        if nargin < 3
            plot3(X(:), Y(:), Z(:));
        else
            plot3(X(:), Y(:), Z(:), linestyle);
        end
    end
else
    Xout = X(:);
    Yout = Y(:);
    Zout = Z(:);
end

end
