function plot_Poincare(filename, surfaces, fig_num, pcolor, plot_all)

if nargin < 5
    plot_all = 0;
end
if nargin <2
    surfaces = [];
end
if nargin < 3
    figure;
else
    if isempty(fig_num)
        figure;
    else
    figure(fig_num);hold on;
    end
end
if nargin < 4
    pcolor = 'r';
end

[R, Z, T, PolFlux] = read_Poincare(filename);

if isempty(surfaces)
    [pts, num_surfaces] = size(R)
    [num_surfaces, pts] = size(R)
    surfaces = 1:num_surfaces;
end
try
    plot(R(surfaces,:)', Z(surfaces,:)', '.', 'Color', pcolor);
    %plot(R(:,surfaces)', Z(:,surfaces)', '.', 'Color', pcolor);
catch
    disp('<---What?');
    %plot(R(:,:)', Z(:,:)', '.', 'Color', pcolor);
end
axis equal
title(filename);

if plot_all % regardless of what else the user wants, print out the whole data set
     [pts, num_surfaces] = size(R)
    [num_surfaces, pts] = size(R)
    surfaces = 1:num_surfaces;
    figure;box on;hold on;grid on; axis equal
    for ii= surfaces
        
    plot(R(ii,:)', Z(ii,:)', '.');
    end
end
axis tight


