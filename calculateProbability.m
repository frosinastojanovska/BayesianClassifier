function y = calculateProbability(matrix)

%function for calculating the probabilities for the discrete values or means
%and variances for the continouns values

mean_grade_secondary_year = mean(matrix(:,2)); %calculated mean of grade_secondary_year
variance_grade_secondary_year = var(matrix(:,2)); %calculated variance of grade_secondary_year

if isempty(matrix(matrix(:,3)==0,3)) || isempty(matrix(matrix(:,3)==1,3))
    probability_secondary_education_type = histcounts(matrix(:,3))+(1*1/2)/(length(matrix(:,3)) + 1); %applying laplacian smoothing
else
    probability_secondary_education_type = histcounts(matrix(:,3))/length(matrix(:,3)); %probabilities without laplacian smootihng
end

mean_grade_first_year = mean(matrix(:,4));
variance_grade_first_year = var(matrix(:,4));

if isempty(matrix(matrix(:,5)==0,5)) || isempty(matrix(matrix(:,5)==1,5)) || isempty(matrix(matrix(:,5)==2,5)) || isempty(matrix(matrix(:,5)==3,5))
    probability_number_failed_courses = histcounts(matrix(:,5))+(1*1/4)/(length(matrix(:,5)) + 1); %applying laplacian smoothing
else
    probability_number_failed_courses = histcounts(matrix(:,5))/length(matrix(:,5)); %probabilities without laplacian smootihng
end

y = [ {} [mean_grade_secondary_year variance_grade_secondary_year] probability_secondary_education_type [mean_grade_first_year variance_grade_first_year] probability_number_failed_courses];

end