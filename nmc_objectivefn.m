function f = nmc_objectivefn(x)
a = x(43);
x = [transpose(x(1:21)) , transpose(x(22:42))];
f = 0;
lambda = 0;
class_median = zeros(21,1);

%Training Dataset
data = load('train_data');
data = data.trainset;

for i = 1:size(data,2)

    if i <= size(data,2)/2
        class_median = x(:,1);
    else
        class_median = x(:,2);
    end
    
    x_i = data(:,i);
    f = f + norm(x_i - class_median, 1);
end

% disp('first');
% disp(f);

f = f + ( lambda * norm(x(:,1) - x(:,2) + a, 1) ); %(a -> scalar??)

count = load('counter','iteraction_count');
iteraction_count = count.iteraction_count;
iteraction_count = iteraction_count + 1;
save('counter','iteraction_count');

disp('iterations cost');
disp(f);
disp(iteraction_count);