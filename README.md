# gplot3: draw a graph in three dimensions

[![MATLAB tests](https://github.com/cmccomb/gplot3/actions/workflows/tests.yml/badge.svg)](https://github.com/cmccomb/gplot3/actions/workflows/tests.yml)

`gplot3` plots the nonzero entries of an adjacency matrix as 3D line segments.
It accepts a line specification or line properties and returns a line handle.

```matlab
A = [0 1 0; 1 0 1; 0 1 0];
xyz = [0 0 0; 1 0 1; 1 1 0];
h = gplot3(A, xyz, 'LineWidth', 2);
axis equal
```

Place `gplot3.m` on your MATLAB path. `A` must be square, and `xyz` must have
one row and three coordinates per node. Every nonzero matrix entry is drawn;
a symmetric adjacency matrix therefore draws each undirected edge twice.
Call `gplot3` without arguments for MATLAB's built-in buckyball example.

Run `test_gplot3` from this folder to check basic plotting and input handling.
The GitHub Actions workflow runs it on pushes and pull requests.

Also available on [MATLAB File Exchange](https://www.mathworks.com/matlabcentral/fileexchange/49762-gplot3-plotting-simple-graphs-in-3d).
Licensed under BSD 3-Clause; see [LICENSE](LICENSE).
