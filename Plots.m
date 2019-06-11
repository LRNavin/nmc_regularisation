% Question - 5
for i=1:2
    
    lambda = [0 2 4 6 8 10];    

    figure();
    hold on
    if i == 1
        title('Apparent & True Error - N=10')
    else
        title('Apparent & True Error - N=1000')
    end
    xlabel('λ - Regularization Parameter')
    ylabel('Error')
    plot(lambda,apparent_error,lambda,true_error);
    xticks([0 2 4 6 8 10])
    xticklabels({'λ = 0','λ = 1','λ = 10','λ = 100','λ = 1000','λ = 10000'})
    legend({'Apparent Error','True Error'},'Location','northeast')
    hold off

    figure();
    hold on
    if i == 1
        title('Optimal Objective Function Cost - N=10')
    else
        title('Optimal Objective Function Cost - N=1000')
    end
    xlabel('λ - Regularization Parameter')
    ylabel('Objective Function - Optimal Value')
    plot(lambda,optimal_cost);
    xticks([0 2 4 6 8 10])
    xticklabels({'λ = 0','λ = 1','λ = 10','λ = 100','λ = 1000','λ = 10000'})
    legend({'Optimal Objective Value'},'Location','northeast')
    hold off


end

% Question - 6

for i=1:1
    figure();
    hold on
    if i == 1
        title('Average Medians & Deviation - N=10, λ = 10000')
    elseif i == 2
        title('Average Medians & Deviation - N=10, λ = 10000')
    elseif i == 3
        title('Average Medians & Deviation - N=1000, λ = 0')
    else
        title('Average Medians & Deviation - N=1000, λ = 10000')
    end
    xlabel('Dimensions')
    ylabel('Average & Deviation Value')
    
    x=1:1:21;
    y=[transpose(mean_array_1) ; transpose(mean_array_2)];
    err=[transpose(std_array_1) ; transpose(std_array_2)];
    
    errorbar(x,y(1,:),err(1,:),'o','MarkerSize',6,'MarkerEdgeColor','blue','MarkerFaceColor','blue', 'LineStyle','-')
    errorbar(x,y(2,:),err(2,:),'o','MarkerSize',6,'MarkerEdgeColor','red','MarkerFaceColor','red', 'LineStyle','-')
    xticks(x)
    xticklabels({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21'})
    legend({'m+','m-'},'Location','northeast')
    hold off
    
end
		
		
		
		
		
				
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		