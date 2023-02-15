CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

if[-e GradeServer]
    then
    echo "GradeServer file submission found"

    else
    "Gradeserver file not found. Please name your submitted file correctly"
    exit(3);

cp ../TestListExamples.java ./;



