function y = classifier(grade_secondary_education,secondary_education_type,grade_first_year,number_failed_courses)
    %function that classifies a sample with variables: grade_secondary
    %(number between 2.00 and 5.00), secondary_education_type (0 for vocational or
    %1 for general), grade_fist_year (number between 6.00 and 10.00),
    %number_failed_courses (0 for 0, 1 for 1-2, 2 for 3-5, or 3 for 5),
    %into one of the classes 'gratuated_ontime', 'graduated_late',
    %'not_graduated'.

    data = csvread('data.csv', 1, 0); %read training set from file data.csv
    graduated_ontime = data(data(:,1)==0,:); %samples from class graduated_ontime
    graduated_late = data(data(:,1)==1,:); %samples from class graduated_late
    not_graduated = data(data(:,1)==2,:); %samples from class not_graduated
    
    %calculating probabilities or means and variances from samples for
    %every class
    probabilities_graduated_ontime = calculateProbability(graduated_ontime); 
    probabilities_graduated_late = calculateProbability(graduated_late);
    probabilities_not_graduated = calculateProbability(not_graduated);
    
    %calculate probabilities of each class for the sample from P(x|C)
    probability_graduated_ontime = normpdf(grade_secondary_education, probabilities_graduated_ontime{1,1}(1), sqrt(probabilities_graduated_ontime{1,1}(2))); %normal probability distribution
    probability_graduated_ontime = probability_graduated_ontime * probabilities_graduated_ontime{1,2}(secondary_education_type+1); %probability for specific type of secondary education
    probability_graduated_ontime = probability_graduated_ontime * normpdf(grade_first_year, probabilities_graduated_ontime{1,3}(1), sqrt(probabilities_graduated_ontime{1,3}(2))); %normal probability distribution
    probability_graduated_ontime = probability_graduated_ontime * probabilities_graduated_ontime{1,4}(number_failed_courses+1); %probability for specific num of 
    
    probability_graduated_late = normpdf(grade_secondary_education, probabilities_graduated_late{1,1}(1), sqrt(probabilities_graduated_late{1,1}(2)));
    probability_graduated_late = probability_graduated_late * probabilities_graduated_late{1,2}(secondary_education_type+1);
    probability_graduated_late = probability_graduated_late * normpdf(grade_first_year, probabilities_graduated_late{1,3}(1), sqrt(probabilities_graduated_late{1,3}(2)));
    probability_graduated_late = probability_graduated_late * probabilities_graduated_late{1,4}(number_failed_courses+1);
    
    probability_not_graduated = normpdf(grade_secondary_education, probabilities_not_graduated{1,1}(1), sqrt(probabilities_not_graduated{1,1}(2)));
    probability_not_graduated = probability_not_graduated * probabilities_not_graduated{1,2}(secondary_education_type+1);
    probability_not_graduated = probability_not_graduated * normpdf(grade_first_year, probabilities_not_graduated{1,3}(1), sqrt(probabilities_not_graduated{1,3}(2)));
    probability_not_graduated = probability_not_graduated * probabilities_not_graduated{1,4}(number_failed_courses+1);
    
    
    %the class with maximum probability is the class for the output of the
    %sample
    if probability_graduated_ontime > probability_graduated_late && probability_graduated_ontime > probability_not_graduated
        y = 'gratuated_ontime';
    elseif probability_graduated_late > probability_graduated_ontime && probability_graduated_late > probability_not_graduated
        y = 'graduated_late';
    elseif probability_not_graduated > probability_graduated_ontime && probability_not_graduated > probability_graduated_late
        y = 'not_graduated';
    end
    
end