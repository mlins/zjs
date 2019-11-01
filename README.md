# Zendesk JSON Search (zjs)

`zjs` is a tool for searching JSON files. Currently, it will only search the first nesting and it only deals with strings.

## Dependencies

You should have `ruby` installed. It was only tested against `2.5`, but it should work with older versions.

## How to install it

1. Clone this repository
2. Change into the directory where you cloned the project
3. Run `bundle` to install dependecies
4. (optional) Run `rake test` to run the test suite

## How to use it

Assuming you're in the repository directory, there are a couple example files, but any JSON file should work:

`./zjs examples/users.json`

This will bring up a UI within the shell to help you search the JSON.
