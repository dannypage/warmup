# Hello!

*Name:* Danny Page

*Email:* [daniel.w.page@gmail.com](mailto:daniel.w.page@gmail.com)

I made some things. Hope you like them!

![Have a gif](http://i.imgur.com/CBZf07H.gif)

## Changes Made

### Features Implemented

 - GIF added.
 - Charting an individual's history of loads.
 - Charting an individual's soreness, both obvious and non-obvious.
   - This can be seen by clicking on the "Soreness" tab on the person's dashboard.
   - I felt that the line did not give any extra information that couldn't be obtained by looking at the shape of the bars.
   Also, from experience from running and soccer, I know that you can feel a large amount of soreness the day after a workout,
   but sometimes may feel the exhaustion from over the last few days as well. So I denoted this by using a stacked column chart.
   It shows the immediate soreness one might feel while running the day after a tough practice, but the hidden exhaustion as well.
   This gives a better approximation at how a person might truly feel on the day of running, and when they have high yellow and red bars,
   it might mean it's a good time to take a rest.

### Fixes:
 - Typo in README.md concerning dates and training load data
 - Moved the Training Loads per date call to the model and made sure it gave all the trainings, not just one.
 - Fixed the shape of the sparkline. Fixed the values in the sparkline.
 - Days to recovery filled in.
 - Made some tweaks to the configuration file to help speed up the runtime. Compiles assets on restart too.
   - Basically development isn't "development" anymore, but since I wanted to have the profiler and speed boosts, there we are.
   - SQL queries are being replicated in a few spots, but it's not taking a large amount of the time. Would be something to look at later though.
 - Removed Turbolinks, as it causes javascript to not load correctly.

## TODO List

 0. Feature: An animated GIF in your hello file -- *done*
 1. Fix: Fill in the "Days to Recovery" column of the overview table in the dashboard with the number of days it'll take for the players perceived load to return to zero.
  - Calculate This Number -- *done*
  - Populate it in the table -- *done*
 2. Feature: Individual Player History Charts
  - Create route `/players/:player_id/training_loads` -- *done*
  - Chart the actual training loads for each date as bars against the perceived loads for each date as a line. -- *done*
  - Be sure to chart the perceived load far enough into the future to include their recovery dates (i.e. to each players zero point.) -- *done*
  - Link to each players chart page from the overview table in the dashboard. -- *done*
 3. Feature: The method used to determine the residuals above with respect to the training load is piecewise.
  - Devise a better strategy to determine the residual value for a given training load based on the provided table. -- *done*
  - Devise a way to easily toggle between these strategies from within your code. -- *done*
  - Document how to make that change in your hello file. -- *done*
 4. Fix: The sparkline charts on the dashboard are very, very wrong. Fix 'em. -- *Fixed heights. Values fixed.*
 5. Fix: The dashboard can load much faster. Use the profiler (top left corner) to diagnose the problem. -- *done*
 6. Fix: `player.training_loads.where(date: date).first.value` in `app/views/dashboard/index.html.erb` -- *done*
