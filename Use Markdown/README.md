# *[data-markdown]

## I just put some markdown in ur HTML

In prototypes and HTML-based slide decks, it's pleasant to write in markdown sometimes and avoid all those angle brackets.

So the idea is you're operating in an HTML environment but a few shortcuts would help so use markdown here and there.

### To use:

1. Add the following script into your HTML after the content, before other scripts
  * It automatically adds [github flavored markdown's](https://raw.github.com/github/github-flavored-markdown/gh-pages/scripts/showdown.js) if it's not already in.
1. Add `data-markdown` attributes to any tags where you're gonna use markdown within. (see example)


#### Userscript or script-script
This script works fine in your page and can also be used as a userscript. Just click the `raw` link right below to install.


_(As this requires some clientside js and can trigger FOUC, this is not for production use)_
