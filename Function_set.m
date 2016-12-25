
% load data
for i = 1:11
    if (i == 1)
        load classify_d3_k2_saved1.mat;
        elseif (i == 2)
        load classify_d3_k2_saved2.mat;
        elseif (i == 3)
        load classify_d3_k2_saved3.mat;
        elseif (i == 4)
        load classify_d4_k3_saved1.mat;
        elseif (i == 5)
        load classify_d4_k3_saved2.mat;
        elseif (i == 6)
        load classify_d5_k3_saved1.mat;
        elseif (i == 7)
        load classify_d5_k3_saved2.mat;
        elseif (i == 8)
        load classify_d99_k50_saved1.mat;
        elseif (i == 9)
        load classify_d99_k50_saved2.mat;
        elseif(i == 10)
        load classify_d99_k60_saved1.mat;
        else
        load classify_d99_k60_saved2.mat;
    end
    
%splitting dataset
[U, V] = size(class_1);
data_set1 = class_1(1:U, 1:0.8*V);
data_set2 = class_2(1:U, 1:0.8*V);

for j1=1:(0.8*V)
    data_set1(1+U,j1) = 1;
end
for k1=1:(0.8*V)
    data_set2(1+U,k1) = 2;
end
training_set = [data_set1,data_set2];
training_set = training_set';

data_set3 = class_1(1:U,((0.8*V)+1):V);
data_set4 = class_2(1:U,((0.8*V)+1):V);

for j2=1:(0.2*V)
    data_set3(1+U,j2) = 1;
end
for k2=1:(0.2*V)
    data_set4(1+U,k2) = 2;
end
testing_set = [data_set3, data_set4];
testing_set = testing_set';

%patterns to be trained
train_patterns = training_set(:,1:(size(training_set,2)-1));  
train_targets = training_set(:,size(training_set,2))';

test_patterns=testing_set(:,1:(size(testing_set,2)-1));  
test_targets=testing_set(:,size(testing_set,2))';  
test_targets_predict = classifier(train_patterns', train_targets, test_patterns', 5, 10);
 
%calculating the accuracy of the model
temp_count=0;  
for i1=1:size(test_targets_predict,2)  
    if test_targets(:,i1)==test_targets_predict(:,i1)  
        temp_count=temp_count+1;  
    end  
end  
accuracy=temp_count/size(test_targets,2);  
disp(accuracy);
end

