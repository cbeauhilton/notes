# doc_formatting
:rmarkdown:

# Bibliography formatting
CSL files specify the format for bibliographies, and also in-text citations.
In order to switch the citation style for a given project, just switch the CSL file.
This can be done in two main ways in RMarkdown: download the CSL file to your machine and tell the YAML header where it is (`csl: path/to/nejm.csl`) or specify a url (`csl: https://raw.githubusercontent.com/citation-style-language/styles/61b34393eb1b7db87603b537ebd61e0936565e99/the-new-england-journal-of-medicine.csl ).
Both have advantages: the first means you don't have to be online for your doc to compile, and the second means you don't have to clutter up your directory or worry as much about the format changing without you knowing it.
In my experience, most journals actually aren't as particular as they tend to claim, so as long as the changes aren't major nobody is likely to notice you aren't using the very newest version of their citation requirements.

# Bibliography location
If left to its own devices, RMD files will throw the references section at the very end.
For most journals, you will want the figures and tables after the references.
The easiest way to change the location of the references section is to add in this html tag:
`<div id="refs"></div>`
This will pull in the references section wherever you put the tag. Easy-peasy.
I also love that RMD/MD accepts arbitrary pieces of html (though I do not know the limits of this approach).

Sun 17 Nov 2019 10:23:05 AM CST
