function main
%start of input
    %amount of elements:
    n = input('Enter the number of elements: ');
    while ~isnumeric(n) || ~isscalar(n) || n <= 0 || mod(n, 1) ~= 0
        disp('Invalid input. Please enter a positive integer.');
        n = input('Enter the number of elements: ');
    end
%end of input

%initialize the equations matrix and then fill it with B (ei, ej) values
    equations_left = zeros(n+1,n+1);
    for i=0:n-1
        for j=0:n
            %count B(ei, ej) values
            equations_left(i+1,j+1) = B_ei_ej(i, j, n);
        end
    end

%Dirichlet boundary condition 
    equations_left(n+1,n+1) = 1;

%initiate right side of equation array 
    equations_right = zeros(n+1,1);

%Dirichlet boundary non-zero value
    equations_right(n+1) = 3;

%count l(v) for each element besides last one
    equations_right(1:n) = arrayfun(@(i) l_ei(i, n) - B_ei_ej(n+1, i, n) , 0:n-1);

%show equation system
    disp([equations_left equations_right]);
 
%solve equations
    solution = linsolve(equations_left,equations_right);
    disp(solution);

%initiate arrays for printing the results
    a = 0;
    b = 2;
    h = (b-a) / n;
    X = (a:h:b);
    Y = zeros(1, length(X));

%for each x in X increment coresponding Y by each element e(x) * result 
        for i=0:length(X)-1
            for j=0:length(solution)-1
                Y(i+1) = Y(i+1) + solution(j+1) .* ( element(j, n, X(i+1) ) );
            end
        end

%graph the solution 
    plot(X,Y);
end
