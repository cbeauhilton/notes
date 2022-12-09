# Convert Many PDFs Into JPG
:image_processing:

    for f in *.pdf; do convert -verbose -density 150 -trim "$f" -quality 100 -flatten -sharpen 0x1.0 "${f%pdf}jpg" ; done

This gives pretty nice rendering of text and images, though it isn't perfect. It's the best solution I've found so far.
Sun 17 Nov 2019 10:23:05 AM CST
