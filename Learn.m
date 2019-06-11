
main_M1 = [];%zeros(21,3);
main_M2 = [];%zeros(21,3);


iteraction_count = 0;
save('counter','iteraction_count');
for i=1:5
    disp("i -");
    disp(i);
    % Data Make - %%%%%
    trainset_size = 1000 ;

    data = load('digit_data','X');
    data = data.X;

    % Train set / Test set split-up
    rand_count = trainset_size/2; 

    class_1 = data(:,1:10000);
    class_2 = data(:,10001:size(data,2));

    c1=randperm(size(class_1,2),rand_count);
    c2=randperm(size(class_2,2),rand_count);

    % ---  Train Set ---
    train_c1 = class_1(:,c1);
    train_c2 = class_2(:,c2);

    trainset = [train_c1 train_c2];

    % ---  Test Set ---
    test_c1 = class_1;test_c1(:,c1) = [];
    test_c2 = class_2;test_c2(:,c2) = [];

    testset = [test_c1 test_c2];

    save('train_data','trainset','testset');

    % Initial medians
%     m0 = rand(21,1);
%     m1 = rand(21,1);
%     a  = zeros(21,1);

    m = rand(1,43);

    options = optimset('TolFun',1.0e-02,'TolX',1.0e-02); % Explain Stop Condition using this

    M = fminunc(@nmc_objectivefn, m, options);
    M = [transpose(M(1:21)) , transpose(M(22:42))];
    disp("Trained Medians ---- ");
    disp(M);

    save('trained_m','M');
    
    main_M1 = [main_M1  M(:,1)]; 
    main_M2 = [main_M2  M(:,2)]; 

end


mean_array_1 = zeros(21,1);
std_array_1 = zeros(21,1);
mean_array_2 = zeros(21,1);
std_array_2 = zeros(21,1);

for j=1:2
    for i=1:21
        if j==1
            row = main_M1(i,:);
            mean_array_1(i,1) = mean(row);
            std_array_1(i,1) = std(row);
        else
            row = main_M2(i,:);
            mean_array_2(i,1) = mean(row);
            std_array_2(i,1) = std(row);
        end        
    end

end

