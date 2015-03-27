Sass Style Guide
=====
### Formatting
* Use the Sass syntax.
* Use hyphens when naming mixins, extends, classes & variables: `span-columns` not `span_columns` or `spanColumns`.
* Use space between property and value: `width: 20px` not `width:20px`.
* Use a blank line above selector that has styles.
* Prefer hex color codes `#000`.
* Use `//` for comment blocks not `/* */`.
* Use single or double quotes consistently. Preference is for double quotes, e.g., `content: ""`.
* Use only lowercase, including colors.
* Don't add a unit specification after `0` values, unless required by a mixin.

### Order
* Place scoped variables, @extends and @includes (excluding media query stuff) at the top of your declaration list, in that order.
* Use alphabetical order for declarations.
* Place media queries directly after the declaration list.
* Place concatenated selectors second.
* Place pseudo states and elements third.
* Place nested selectors last.

### Selectors
* Don't use ID's for style.
* Use meaningful names: `$visual-grid-color` not `$color` or `$vslgrd-clr`.
* Use ID and class names that are as short as possible but as long as necessary.
* Use one selector per line.
* If :hover pseudo class is styled, :focus should also be styled for accessibility. Focus styles should never be removed.
* Avoid using the direct descendant selector `>`.
* Avoid nesting more than 3 selectors deep.
* Don't nest more than 6 selectors deep.
* Avoid using the HTML tag in the class name: `/*section*/.news` not `/*section*/.news-section`.
* Avoid using HTML tags on classes with specific class names like `.featured-articles`.
* Don't qualify selectors: `.widgets` not `div.widgets`.
* Avoid nesting within a media query.

### Organization
* Use Compass or Bourbon for a Sass library.
* Use Normalize as a browser reset.
* Use HTML structure for ordering of selectors. Don't just put styles at the
  bottom of the Sass file.
* Avoid having files longer than 100 lines.
