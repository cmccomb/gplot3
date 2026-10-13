% Make an arbitrary connectivity matrix
a = [0 1 0 1;
     1 0 1 0;
     0 1 0 1;
     1 0 1 0];
 
 % Make an arbitrary set of coordinates
coord = [0 1 0; 1 0 0; 0 -1 0; -1 0 0];

% Check the returned line and forwarded line properties
fig = figure('Visible', 'off');
h = gplot3(a, coord, 'LineWidth', 2);
assert(ishandle(h));
assert(get(h, 'LineWidth') == 2);
assert(numel(get(h, 'XData')) == 3 * nnz(a));
close(fig);

% Reject incompatible coordinate arrays
try
    gplot3(a, coord(:, 1:2));
    error('Expected an error for 2D coordinates.');
catch err
    assert(~isempty(strfind(err.message, 'one 3D row per node')));
end
