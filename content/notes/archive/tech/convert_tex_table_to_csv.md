# Convert TeX table into csv(ish)
:latex:

    cat table2detex.tex | sed 's/\\%/percent/g' | detex | sed 's/&/;/g' | sed 's/percent/%/g' > tab2file.txt

I copy the table into a new file, then convert the % symbols so detex doesn't get rid of them, then detex to get rid of the LaTeX markup, then convert the & into whichever delimiter you want (;, pipe, tab, etc.), then reconvert the percents back into symbols, and output to a .txt file. It's important to NOT use a csv if you are going to open in Excel, because it will assume commas are the delimiter. If you use a text file, it will ask you what you want the delimiter to be.

The next step here would be to insert a special commented-out sequence before and after all the LaTeX tables so you can select that portion with a sed/grep/awk command and not have to make a new TeX file.
Sun 17 Nov 2019 10:23:05 AM CST
