# BayesianClassifier

The file *classifier.m* holds a function that represents **Naïve Bayes classifier** for classifying students of the second year of Faculty of Computer Science and Engineering - Skopje, in the categories of "will graduate on time", "will graduate with a delay", "will not graduate".

The classification should be made based on the following parameters: secondary education grade (real number in the range [2-5]), type of secondary education (high school or vocational), first year grade (real number in the range [5- 10]) and the number of courses untaken first year (0, 1-2 items 3-5 items or more than 5).

Training Set is composed of information that is contained in the file **data.csv**.

Example of calling the function:

`y = classifier(4.7,1,9,1);`

and y in this case will have value 'gratuated_ontime', so this sample of data with secondary education grade = 4.7, type of secondary education = general, first year grade = 9 and number of failed courses = 1-2, is classified in the category of "will graduate on time".

The correct way to enter iputs is given in the file *inputValuesDefinitions.txt*.