# deck.search.js #

Simple extension for [deck.js][] HTML Presentations jQuery-plugin, to search content from the slides.

## Features

* Search by text
* Search by slide number
* Navigate search results by mouse or keyboard

## Requirements ##

* Well, [deck.js][]

## How to install ##

1. Download the files.

2. Copy the `search` folder to your deck.js `extensions` folder.

3. Insert the following line at the end of your HTML `body`.

		<script src="../extensions/search/deck.search.js"></script>

### Advanced use
You can include additional script to alter default settings. Simple example below:

	<script>
		$.extend(true, $.deck.defaults.search.input, {id : 'search_input'});
	</script>

[deck.js]: https://github.com/imakewebthings/deck.js