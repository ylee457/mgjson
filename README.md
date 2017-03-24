# Mgjson

## Description:
Give a 1000 questions to 100 students and ask them to answer these questions(students can skip some of the questions if they do not wish to answer), how well do we know these questions evaluate the students' ability.

One way to solve this is to use the Item Discrimination algorithm. An Item Discrimination, which has a range of -1.0 to 1.0, can roughly indicate how well the question evaluates student ability. Values above 0.3 are generally good questions, values between 0.0 and 0.3 are mediocre, and values under 0.0 usually have errors in their grading.

This project demonstrates how we can find the item discrimination for each question given an input file in JSON format(see sample answers.json in this project root directory). This project was done in Ruby language and I used gem to package up all the source code files. The program reads the json file specified in the command line as the first argument and output the Item Discrimination number for each question in ascending order. You need to place the json data file in the project's root folder so the program can find it.


## Usage

To run the the application on this gem, change direcory to the project root folder, then type:
**ruby -Ilib ./bin/mgjson answers.json**, where answers.json is the sample data file that I placed in the project's root direcory.
```
Example: /media/sf_pj/mgjson$ ruby -Ilib ./bin/mgjson answers.json
or
/media/sf_pj/mgjson$./bin/mgjson answers.json
```


## Development

If you want to experiment with this project, you may modify its source and rebuild the gem. 

### Rebuild the gem

_Things to watch out for while rebuilding the gem with same version:_

You must remove the previously built gem file from your project folder
```
Example: /media/sf_pj/mgjson$ rm mgjson-0.1.0.gem
```

You must check in all your changes to Git

Then you can rebuild with the following command:
**gem build mgjson.gemspec**


To rebuild gem with native extensions for your local machine, type:
**bundle exec gem pristine mgjson-0.1.0.gem**



### Installation
Because this project is only an exercise and is not meant to be published to the Rubygem repository, you should install it by running the following command and install it locally in your machine. To install locally, change direcory to the project root folder, then type:
gem install ./mgjson-0.1.0.gem
```
Example: /media/sf_pj/mgjson$ gem install mgjson-0.1.0.gem
```

### Steps to get an item discription number for the questions

* Separate test-takers into three equal-sized cohorts (top, middle, bottom) by their overall percent correct on the test, excluding skipped questions

* For each question, calculate the fraction of answers by the top cohort which were correct (excluding those who skipped the question) and subtract the fraction of correct answers by the bottom cohort (also excluding those who skipped the question)


Here's an example. Let's say there are 21 students and 100 unique questions that those students have answered.. Each cohort would contain 7 students separated by their % correct. However, their percent correct would be calculated only based on the questions they answered, not based on all 100 questions.

Let's take an example question and call it question #50. Of the top cohort of 7 students, you would look at those who answered question #50. Let's say only 5 students in top cohort answered question #50 and 4 got it correct. Then the % correct of the top cohort would be 80% (4/5). We would ignore the 2 students from the top cohort who did not answer question #50. 

We'd repeat that process for the bottom cohort (let's say is 50% correct). The item discrimination would then be percent correct of top cohort minus percent correct of bottom cohort (80% - 50% = 30%). Item discrimination = 30% or 0.3
 

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

