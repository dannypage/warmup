# Hello!

*Name:* Danny Page
*Email:* [daniel.w.page@gmail.com](mailto:daniel.w.page@gmail.com)

I made some things. Hope you like them!

![Have a gif](http://i.imgur.com/CBZf07H.gif)

## Changes Made

### Features Implemented

 - GIF added.

### Fixes:
 - Typo in README.md concerning dates and training load data

## TODO List

 0. Feature: An animated GIF in your hello file -- *done*
 1. Fix: Fill in the "Days to Recovery" column of the overview table in the dashboard with the number of days it'll take for the players perceived load to return to zero.
  - Calculate This Number
  - Populate it in the table
 2. Feature: Individual Player History Charts
  - Create route `/players/:player_id/training_loads` charts the actual training loads for each date as bars against the perceived loads for each date as a line.
  - Be sure to chart the perceived load far enough into the future to include their recovery dates (i.e. to each players zero point.)
  - Link to each players chart page from the overview table in the dashboard.
 3. Feature: The method used to determine the residuals above with respect to the training load is piecewise.
  - Devise a better strategy to determine the residual value for a given training load based on the provided table.- Devise a way to easily toggle between these strategies from within your code
  - document how to make that change in your hello file.
 4. Fix: The sparkline charts on the dashboard are very, very wrong. Fix 'em.
 5. Fix: The dashboard can load much faster. Use the profiler (top left corner) to diagnose the problem.
 6. Fix: `player.training_loads.where(date: date).first.value` in `app/views/dashboard/index.html.erb`?
