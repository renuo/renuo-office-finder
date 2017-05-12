# Renuo Office Finder

It's hard to find the perfect office for an already existing company. Here we're using the open transport API to find out the stations which could make an alternative location for Renuo.

## Setup

    git clone git@github.com:renuo/renuo-office-finder.git
    cd renuo-office-finder
    bundle install
    
## Play around

The following script asks the open transportation every half second (because of quota) for the distances from all homes of employees to a potential new office location using a radius of about 55km around Wallisellen.

    ruby filter.rb
    
This takes a very long time and writes the results to `out.csv`

## Results

First results are available for Renuoees [here](https://docs.google.com/spreadsheets/d/1wSQ7ASwvxV_guKk3Fyu2ewXOT68uN0jCngcmQpfP4C4/edit#gid=724542744). It's taking into account: St. Gallen, Sternen Oerlikon and Jona. Amazingly the best result right now is Wallisellen.
