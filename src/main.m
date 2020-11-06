clear, close all;

number_iterations = 50;
number_of_perceptrons = 4;
max_number_of_inputs =3;

initial_weights = rand(1, max_number_of_inputs);
w = repmat(initial_weights, number_of_perceptrons, 1);

bias =1;

class = ['x','o'];
c =[0 1 1 0];

figure, hold on
plot([1 0], [1 0],'x')
plot([0 1], [1 0],'o')

for i=1: number_iterations
    
    x =generate_input(bias);
    
    % AND
    [so1, w(1,:)] = perceptron(x,w(1,:),@AND_function,@hardlims);
    
    % OR
    [so2, w(2,:)] = perceptron(x,w(2,:),@OR_function,@hardlims);
    
    % NOT(AND)
    [so3, w(3,2:end)] = perceptron([bias,so1],w(3,2:end),@NOT_function,@hardlims);
    
    % AND(NOT,OR)
    [so4, w(4,:)] = perceptron([bias,so2, so3],w(4,:),@AND_function,@hardlims);
    
end

xx = linspace(-0.5,1.5,100);

slope_or = -(w(1,3)/w(1,2))
intercept_or = -w(1,1)/w(1,2)
y_or = (slope_or * xx) + intercept_or 

slope_and = -(w(2,3)/w(2,2))
intercept_and = -w(2,1)/w(2,2)
y_and = (slope_and * xx) + intercept_and

plot(xx, y_or);hold on
plot(xx, y_and);

hold off

title(XOR)



    








