%NmC Classifier Test

trained_param = load('trained_m','M');
trained_param = trained_param.M;

m_1 = trained_param(:,1);
m_2 = trained_param(:,2);
% a   = trained_param(:,3);

apparent_right_ans = 0;

% Apparent Error
data = load('train_data');
data = data.trainset;
class = [];
for i = 1:size(data,2)
    x_i = data(:,i);
    given_class = 0;
    if norm(m_1 - x_i , 1) <= norm(m_2 - x_i, 1) 
        given_class = 0;
    else
        given_class = 1;
    end
    
    if (given_class == 0 && i<=size(data,2)/2) || (given_class == 1 && i>size(data,2)/2)
        apparent_right_ans = apparent_right_ans + 1;
    end
    class = [class given_class];
end

apparent_wrong_ans = size(data,2) - apparent_right_ans;

apparent_error_per = (apparent_wrong_ans/size(data,2)) * 100;

true_right_ans = 0;

% Test Error
data = load('train_data');
data = data.testset;

class = [];

for i = 1:size(data,2)
    x_i = data(:,i);
    given_class = 0;
    if norm(m_1 - x_i , 1) <= norm(m_2 - x_i, 1) 
        given_class = 0;
    else
        given_class = 1;
    end
    
    if (given_class == 0 && i<=size(data,2)/2) || (given_class == 1 && i>size(data,2)/2)
        true_right_ans = true_right_ans + 1;
    end
    class = [class given_class];

end

true_wrong_ans = size(data,2) - true_right_ans;

true_error_per = (true_wrong_ans/size(data,2)) * 100;