function y = classifier(x1,x2,x3,x4)
    data = csvread('data.csv', 1, 0); %read training set from file data.csv
    graduated_ontime = data(data(:,1)==0,:); %samples from class graduated_ontime
    graduated_late = data(data(:,1)==1,:); %samples from class graduated_late
    not_graduated = data(data(:,1)==2,:); %samples from class not_graduated
    probability_graduated_ontime = [{},{},{},{}];
    
    p1=;
    p2=;
    px
    y = 'novo';
end