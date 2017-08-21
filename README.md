# Renuo Office Finder

It's hard to find the perfect office for an already existing company.
Here we're using the open transport API to find out the stations which
could make an alternative location for Renuo.

## Setup

    git clone git@github.com:renuo/renuo-office-finder.git
    cd renuo-office-finder
    bundle install

## Play around

The following script asks the open transportation API twice a second
(because of quota) for the distances from all homes of employees to a
potential new office location using a radius of about 55km around Wallisellen.

    ruby filter.rb

This takes a very long time and writes the results to `out.csv`

## Results

First results are available for Renuoees [here][1]. It's taking into account:
St. Gallen, Sternen Oerlikon and Jona. Amazingly the best result right now
is Wallisellen.

## Improvements

Yes, definitely possible. Please don't hesitate to come up with better
algorithms so that we don't have to use brute force anymore.

[1]: https://docs.google.com/spreadsheets/d/1wSQ7ASwvxV_guKk3Fyu2ewXOT68uN0jCngcmQpfP4C4/#gid=724542744
