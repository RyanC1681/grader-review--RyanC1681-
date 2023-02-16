CPATH=".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar"

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

# run command:
#bash grade.sh https://github.com/some-username/some-repo-name
cd student-submission
#echo 'Finished cd'

if [ -f ListExamples.java ]
then
    echo "ListExamples file submission found"
else
    echo "ListExamples file not found. Please name your submitted file correctly"
    exit
fi

cp ../TestListExamples.java ./student-submission;
#cp ../ ./student-submission/TestListExamples.java;


javac -cp $CPATH *.java

if [ $? -eq 1 ]
then
    echo "Compile error"
    exit
else
    echo "Compile successful"
fi

java -cp ".;../lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples >results.txt 2>&1

if [ $? -eq 0 ]
then 
   echo "Passed all tests, full credit"
else
   cat results.txt | grep -E -w  "Failures:"
fi













