function [R, Z, T, PolFlux] = read_Poincare(filename)

% Verfiy input
if (nargin == 0)
    disp('K==== read_Poincare requires filename.');
    return
end

fid=fopen(filename, 'r');

% First pass gets matrix size
disp('<---- Getting Matrix Size.');

% while ~feof(fid);
%     line = fgetl(fid);
%     if ~(strncmpi(strtrim(line), '#', 1))
%         num_lines = 1;
%         break;
%     end
% end
% 
% while ~feof(fid);
%     line = fgetl(fid);
%     num_lines =num_lines + 1;
% end
num_lines = 0;
num_comments = 0;
while ~feof(fid);
    line = fgetl(fid);
    if ~(strncmpi(strtrim(line), '#', 1))
        num_lines = num_lines + 1;
    else
        num_comments = num_comments+1;
    end
end

fclose(fid);

num_surfaces = (num_comments-1) / 5;  % this works as of January 2022.
num_points_per_surface = num_lines / num_surfaces;

R = zeros(num_surfaces, num_points_per_surface);
Z = zeros(num_surfaces, num_points_per_surface);
T = zeros(num_surfaces, num_points_per_surface);
PolFlux = zeros(num_surfaces, num_points_per_surface);

% Second pass gets the data
disp(' - Reading Poincare Data');
fid = fopen(filename,'r');
counter_1 = 1;
counter_2 = 0;

while ~feof(fid)
    line = fgetl(fid);
    if ~(strncmpi(strtrim(line), '#', 1))
        counter_2 = counter_2 + 1;
        if (counter_2 > num_points_per_surface)
            counter_1 = counter_1 + 1;
            counter_2 = 1;
        end
        vals_line = sscanf(line, '%e', 4)';
        R(counter_1, counter_2) = vals_line(1); % cm -> m
        Z(counter_1, counter_2) = vals_line(2); % cm ->
        T(counter_1, counter_2) = vals_line(3)*pi/180; % degrees -> radians
        PolFlux(counter_1, counter_2) = vals_line(4);  % unchecked
    end
end

fclose(fid);




