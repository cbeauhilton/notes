# Reading status

```dataview
TABLE 
without ID link(file.link, aliases) as Article,
priority as Priority,
status as Status,
date-created as Created
FROM "reference" AND -#MOC
SORT priority DESC
```

# Literature tasks

```dataview
task
from "reference" and #literature_note
group by meta(section).subpath
```

# Analysis annotations

```dataview
TABLE without ID link(file.link, aliases) as Article,
L.text AS "Sections"
FROM "reference"
FLATTEN file.lists AS L
WHERE contains(L.tags, "#analysis")
```

## Inspiration

```dataview
TABLE without ID link(file.link, aliases) as Article,
L.text AS "Sections"
FROM "reference"
FLATTEN file.lists AS L
WHERE contains(L.tags, "#inspiration")
```
