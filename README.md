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
or **ruby -Ilib ./bin/mgjson file.json**, where file.json is the data file that you place in the project root.
```
Example: /media/sf_pj/mgjson$./bin/mgjson answers.json
or
/media/sf_pj/mgjson$ ruby -Ilib ./bin/mgjson answers.json
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

### Rebuild the gem

_Things to watch out for while rebuilding the gem with same version:_

You must remove the previously built gem file from your project folder
```
**Example: /media/sf_pj/mgjson$ rm mgjson-0.1.0.gem**
```

You must check in all your changes to Git

Then you can rebuild with the following command:
**gem build mgjson.gemspec**


To rebuild gem with native extensions for your local machine, type:
**bundle exec gem pristine mgjson-0.1.0.gem**



## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

