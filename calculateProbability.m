function y = calculateProbability(matrix)

%function for calculating the probabilities for the discrete values or means
%and variances for the continouns values

mean_grade_secondary_education = mean(matrix(:,2)); %calculated mean of grade_secondary_education
variance_grade_secondary_education = var(matrix(:,2)); %calculated variance of grade_secondary_education

unique = [0,1,2]; % unique values for calculating frequencies 
if isempty(matrix(matrix(:,3)==0,3)) || isempty(matrix(matrix(:,3)==1,3))
    probability_secondary_education_type = (histcounts(matrix(:,3), unique)+(1*1/2))/(length(matrix(:,3)) + 1); %applying laplacian smoothing
else
    probability_secondary_education_type = histcounts(matrix(:,3), unique)/length(matrix(:,3)); %probabilities without laplacian smootihng
end

mean_grade_first_year = mean(matrix(:,4)); %calculated mean of grade_first_year
variance_grade_first_year = var(matrix(:,4)); %calculated variance of grade_first_year

unique = [0,1,2,3,4];
if isempty(matrix(matrix(:,5)==0,5)) || isempty(matrix(matrix(:,5)==1,5)) || isempty(matrix(matrix(:,5)==2,5)) || isempty(matrix(matrix(:,5)==3,5))
    probability_number_failed_courses = (histcounts(matrix(:,5), unique)+(1*1/4))/(length(matrix(:,5)) + 1); %applying laplacian smoothing
else
    probability_number_failed_courses = histcounts(matrix(:,5), unique)/length(matrix(:,5)); %probabilities without laplacian smootihng
end

y = [ {} [mean_grade_secondary_education variance_grade_secondary_education] probability_secondary_education_type [mean_grade_first_year variance_grade_first_year] probability_number_failed_courses];

end