# Coding Challenge itemis

This is a coding challenge for itemis. It is part of the application process and I put it online, because that is part of the challenge too.

## Remarks

It was suggested to solve one of the challenges following practices like full documentation, test driven development, and so on.

I solved (or tried to solve) all three of the challenges, because it was quite fun. I did not use any outside help, even though Github copilot obviously knows some of the challenges, because I'm probably not the only one who tried to solve them. :-)

But I have to admit that I was too lazy to follow all good practices in challenge #2. I did not use any test driven development. I did a better job in challenges #1 and #3.

## How to run my solutions

All main routines (entry points) are in the /bin directory. They are named itemis1.dart, items1.dart and itemis3.dart. Obviously they are written in Dart (no Flutter because no GUI). Furthermore, I compiled all of them. Therefore, you can run them directly from the command line.

```
bin/itemis1.exe
bin/itemis2.exe
bin/itemis3.exe
```

## Project structure

The /bin directory contains all entry points and the compiled exes.

The /lib directory contains three subfolders names no1, no2 and no3. Each one of them contains its own files for one of the challenges each.

The /test directory follows the same logic.

## Task specific remarks

### Challenge #1

There is some inconsistencies in the task assignment. The output of my solution is different from the output in the task. I do think my solution is more correct. I guess that sometimes (not always) the sales taxes were added onto the product price, even though the task text says that VAT is already included in the shelf price.

In general, I followed test driven development practices to the best of my knowledge. In general my solution is a little bit more complicated than it would have been necessary. I included three VAT rates (and a flexible system to add more). The same is true for the import duties. And my data model differentiates between products and sales cart items. Sales cart items can have a quantity too. The task itself does not have any item with a quantity other than 1.

### Challenge #2

Again, the system is a bit more complex than necessary. But, there are also some additional features. For example, my solution allows to define contraints, like "this talk can only be held in the morning".

Regarding the automatic scheduling, my algorithm is good enough to solve this task, but there is still a lot of room for improvement. My algorithm in principle works quite simple. It simply 
always places the longest remaining talk in the track with the most free time. To be a bit more 
optimized, it also searches for combinations of two talks that neatly fit in the remaining time of a track. But, that's it. Furthermore, the algorithm does not check for the minimum track time. Therefore, edge cases are thinkable where the algorithm would not be able to arrange all talks, even if there is enough time.

But ... well, I did not have the time to implement a better algorithm.

### Challenge 3

The interpreter is a bit specific, meaning it really needs input to be exactly as specified. It will not understand if you forget a question mark or put the question mark directly after the last word and such. This is probably okay, because it handles the example inputs provided in the task assignment and of course all inputs that follow the same syntax. But it could be improved.

Anyhow, it works:
![Screenshot of user interaction](/no3.PNG)
