# March Cycle Predictor

This project is created as a task for [March](https://march.health/)
## Description
This was quite a small project, however I used clean architecture and tried to create a scalable and reliable app using the right architecture and BLoC state management. for example, I tried to write the codes as dynamic as I can so the algorithms will work for more than 3 cycle inputs as well.
Another case is naming classes, for example I named the only Bloc class PeriodClass and created a whole feature folder for the app's only page, assuming it is a part of a greater project to implement the correct structure.

It is clear that writing an algorithm to predict the menstrual cycles precisely is almost impossible and there are many different real-world factors that are not implemented in this project. but I tried to reach the optimal outcome using the limited data.

## Questions
1)At first, I tried to calculate an average of last cycles by using the start dates of each cycle, but using weighted average seemed like a better solution. I used higher weight for more recent cycles.
Then I used an average of the weighted average and the user's input length to involve that variable as well. and then the three next dates wil be calculated by simply adding the calculated value to the last cycle's start date.
I also wanted to try the exponential weighting method but I didn't have enough time to implement it.

2)It was an easy project and nothing seemed to be a real challenge, but the state management and UI update were a bit difficult to implement correctly and I had to merge some of the states to make the app more reliable.

3)I used different emulators and phones for testing the UI and the overal functionality of the app. I wrote unit tests for the cycle prediction functions and used some rational data and collected some data from similiar apps to write tests. I also changed the weights and implemented new methods after testing. 
