set(0,'DefaultFigureWindowStyle','docked')

% Parameters
nx=100; % Number of grid points in x
ny=100; % Number of grid points in y
V = zeros(nx,ny);% Initialize the potential matrix
maxIter = 1000; % Maximum number of iterations


% Iteration loop
for iter = 1:maxIter
        for i = 1:nx
             for j = 1:ny
                 if i  == 1
                     V(i,j) = 1;
                 elseif  i == nx
                     V(i,j) = 1;
                 elseif j == 1
                     V(i,j) = V(i,j+1);
                 elseif j == ny
                     V(i,j) = V(i,j-1); %DIfferent BCs
                 else
                     V(i,j) = (V(i+1,j) + V(i-1,j) + V(i,j+1) + V(i,j-1)) * 0.25 ;
                 end
             end
        end

        if mod(iter,50) == 0
            surf(V);
            xlabel('x');
            ylabel('y');
            title('Potential distribution');
            pause(0.1)
        end

end

% [Ex,Ey] = gradient(V);
% 
% figure
% quiver(-Ey',-Ex',10);