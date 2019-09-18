Reveal.js-Title-Footer
======================

Footer showing title for Reveal.js HTML presentations

# Description

## What is Reveal.js-Title-Footer?

Reveal.js-Title-Footer is a plugin for the Reveal.js framework for HTML presentations (https://github.com/hakimel/reveal.js).

## What does Reveal.js-Title-Footer do?

Reveal.js-Title-Footer includes a footer in all the slides of a Reveal.js presentation (with optional exclusion of some slides) that will show the title of the presentation.

## Configurable options

The title to show on the footer is configurable.

The background color of the footer is also configurable.

# Installation

## Necessary files

The ```title-footer``` folder of the ```plugin``` folder has to be copied to the ```plugin``` folder of the Reveal.js presentation.

## CSS

The CSS of the Reveal.js-Title-Footer plugin is included dynamically when it is initialized. However, if we configure the presentation not to include the Reveal.js-Title-Footer footer in the first page, this will be shown until the CSS is loaded dynamically, causing an ugly effect. To avoid it, include the CSS in the header of the Reveal.js presentation, with this line:

```<link rel="stylesheet" href="plugin/title-footer/title-footer.css">```

## Plugin initialization

Include Reveal.js-Title-Footer among the Reveal.js plugin initializations, like this:

```javascript
Reveal.initialize
(
	{
		...
		dependencies:
		[
			...
			{ src: 'plugin/title-footer/title-footer.js', async: true, callback: function() { title_footer.initialize(); } }
		]
	}
);
```

## Customization

The ```title_footer.initialize``` function can take two parameters:

- ```title```: the title to show in the footer; if ```null```, it will take the ```h1```, ```h2``` and ```h3``` elements of the first slide.
- ```background```: a string of the form ```'rgba(0,255,0,0.1)'```, for the background colour of the footer.

For further customization (like making the footer a header, for example), arrange the ```plugin/title-footer/title-footer.css``` file accordingly.

# Use

## Title

The Reveal.js-Title-Footer plugin takes the first ```h1```, ```h2``` and ```h3``` tags from the first slide as the title, if another title is not explicitly passed as parameter in the initialization.

## Exclusion from slides

The Reveal.js-Title-Footer footer will not be shown in a slide if the corresponding section has a ```data-state``` attribute with a value of ```no-title-footer```.

## Compatibility with Reveal.js-TOC-Progress

If the Reveal.js-TOC-Progress is also used, the Reveal.js-Title-Footer footer is shown just above it. For not showing any of them in a slide, include a ```data-state``` attribute with a value of ```no-toc-progress``` in the corresponding section.

# Links

- Source code on GitHub: https://github.com/e-gor/Reveal.js-Title-Footer
- Demo presentation with Reveal.js-Title-Footer: http://e-gor.github.io/Reveal.js-Title-Footer/demo

# License

GPL v3 (http://www.gnu.org/copyleft/gpl.html).
