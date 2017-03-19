# Mgjson

This gem read the json file specified in the command line as the first argument and output the Item Discrimination number for each question in ascending order. You need to place the json data file in the project root folder so the program can find it.

## Installation

As this gem is not meant to be installed from its Rubygem repository, you should install it by running the following command and install it locally in your machine. To install locally, change direcory to the project root folder, then type:
**gem install ./mgjson-0.1.0.gem**
```
Example: /media/sf_pj/mgjson$ gem install mgjson-0.1.0.gem
```

## Usage

To run the the application on this gem, change direcory to the project root folder, then type:
**./bin/mgjson file.json**, where file.json is the data file that you place in the project root.
```
Example: /media/sf_pj/mgjson$./bin/mgjson answers.json
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To rebuild the gem, type:
**gem build mgjson.gemspec**


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

