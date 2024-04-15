---
cssclass: literature-note
aliases: 
- {{title}}
- "@{{citekey}}"
year: {{date | format("YYYY")}}
tags: ["#literature_note", {%- for t in tags %}"{{t.tag}}"{% if not loop.last %}, {% endif %}{%- endfor %}]
date-created: {{importDate | format("YYYY-MM-DD")}}
priority:
- 3-medium
status:
- 3-in-progress
---
{#- This is the order in which the annotations are ordered -#}
{%-
   set categoryHeading = {
        "yellow":  "Summary, Definitions, Concepts",
        "red":     "Purpose, Hypothesis, Aim, Conclusion",
        "green":   "Methodology",
        "blue":    "Results",
        "purple":  "Connections, Agree, Disagree",
        "magenta": "Future Implications & Research Ideas",
		"orange":  "Misc Thoughts & Info to Follow Up",
		"gray":    "References to Follow Up"
   }
-%}
{%-
    set zoteroColors = {
        "#ffd400": "yellow",
        "#ff6666": "red",
        "#5fb236": "green",
        "#2ea8e5": "blue",
        "#a28ae5": "purple",
        "#e56eee": "magenta",
        "#f19837": "orange",
        "#aaaaaa": "gray"
    }
-%}
{%-
    set zoteroStrings = {
        "sm": "& sm",
        "df": "& df",
        "pr": "! pr",
        "am": "! am",
        "hp": "! hp",
        "cg": "! cg",
        "cb": "! cb",
        "sb": "$ sb",
        "pt": "$ pt",
        "in": "$ in",
        "ms": "$ ms",
        "sa": "$ sa",
        "ot": "$ ot",
        "rs": "@ rs",
        "lc": "~ lc",
        "la": "~ la",
        "ld": "~ ld",
        "pc": "~ pc",
        "pa": "~ pa",
        "pd": "~ pd",
        "fi": "; fi",
        "ri": "; ri",
        "mt": "? mt",
        "fu": "? fu",
        "rf": "% rf"
    }
-%}
{#- handle | characters in zotero strings used in MD -#}
{%- macro formatCell(cellText) -%}
	{{ cellText | replace("|","❕")}}
{%- endmacro -%}

{#- Macros for handling annotations -#}
{%- macro formatAnnotation(annotation, calloutString) -%}
	{%- if annotation.imageRelativePath -%}
- {calloutString}} ![[{{annotation.imageRelativePath}}]] [Zotero, p. {{annotation.pageLabel}}](zotero://open-pdf/library/items/{{annotation.attachment.itemKey}}?page={{annotation.page}}&annotation={{annotation.id}}){% if annotation.hashTags %} {{annotation.hashTags}}{% endif %} ^{{annotation.id-}}
{% if annotation.comment.substring(2) | trim | length > 0 %}
	- {{annotation.comment.substring(2) | trim}}
{% else %}
{% endif -%}
	{%- elif annotation.comment.substring(2, 3) === "-" -%}
- {calloutString}} {{annotation.annotatedText}} 
	{%- elif annotation.comment.substring(2, 3) === "+" %} {{annotation.annotatedText}} [Zotero, p. {{annotation.pageLabel}}](zotero://open-pdf/library/items/{{annotation.attachment.itemKey}}?page={{annotation.page}}&annotation={{annotation.id}}){% if annotation.hashTags %} {{annotation.hashTags}}{% endif %} ^{{annotation.id-}}
{% if annotation.comment.substring(3) | trim | length > 0 %}
	- {{annotation.comment.substring(3) | trim}}
{% else %}
{% endif -%}
	{%- elif annotation.annotatedText -%}
- {{calloutString}} {{annotation.annotatedText}} [Zotero, p. {{annotation.pageLabel}}](zotero://open-pdf/library/items/{{annotation.attachment.itemKey}}?page={{annotation.page}}&annotation={{annotation.id}}){% if annotation.hashTags %} {{annotation.hashTags}}{% endif %} ^{{annotation.id-}}
{% if annotation.comment.substring(2) | trim | length > 0 %}
	- {{annotation.comment.substring(2) | trim}}
{% else %}
{% endif -%}
	{%- endif -%}
{%- endmacro %}

# {{title}}

> [!info]+ Info [Zotero]({{desktopURI}}) | {%- for attachment in attachments | filterby("path", "endswith", ".pdf") %} [PDF](zotero://open-pdf/library/items/{{attachment.itemKey}}){%- endfor %}{% if DOI %} | [DOI:{{DOI}}](http://doi.org/{{DOI}}){% elif ISBN %} | ISBN: {{ISBN}}{% endif %}{%if url %} | [URL]({{url}}){% endif %}
> 
> **Bibiography:** {{bibliography}}
> 
> **Authors::** {% for a in creators %} [[{{a.firstName}} {{a.lastName}}]]{% if not loop.last %}, {% endif %}{% endfor %}
> 
> **Journal::** {{publicationTitle}}
> 
> **Ztags::**{% for t in tags %} [[{{t.tag}}]]{% if not loop.last %}, {% endif %}{% endfor %}
> 
> **First-page**: {% for annotation in annotations %}{% if loop.first %}{{annotation.pageLabel}}{% endif %}{% endfor %}

{%- if relations.length > 0 %}
{{ "" }}
> [!summary]+ Related Zotero items ({{ relations.length}}):  
>
> | title | Literature Note | Links |
> | --- | --- | --- |
{%- for r in relations %}
> | {{formatCell(r.title)}} | [[@{{r.citekey}}]] | [Zotero]({{r.desktopURI}}){%- for rAttachment in r.attachments | filterby("path", "endswith", ".pdf") %} [PDF](zotero://open-pdf/library/items/{{rAttachment.itemKey}}){% endfor %} |
{%- endfor -%}
{{ "" }}
{%- endif %}

> [!tldr]+ Non-Zotero Links to This Note
> ```dataview
> TABLE tags as Tags
> FROM [[@{{citekey}}]]
> WHERE !contains(file.path, "reference")
> ```

> [!abstract]-{% if abstractNote %}
> {{abstractNote | striptags(true) | replace("BACKGROUND:","**BACKGROUND:**") | replace("CONCLUSIONS:","**CONCLUSIONS:**") | replace("CONCLUSION:","**CONCLUSION:**") | replace("DESIGN:", "**DESIGN:**") | replace("EXPOSURES:","**EXPOSURES:**") | replace("IMPORTANCE:","**IMPORTANCE:**") | replace("INTERVENTIONS:","**INTERVENTIONS:**") | replace("INTRODUCTION:","**INTRODUCTION:**") | replace("METHODS:","**METHODS:**") | replace("OBJECTIVE:", "**OBJECTIVE:**") | replace("PARTICIPANTS:","**PARTICIPANTS:**") | replace("PURPOSE:","**PURPOSE:**") | replace("RECOMMENDATIONS:","**RECOMMENDATIONS:**") | replace("RESULTS:","**RESULTS**:") | replace("SETTING:","**SETTING:**") | replace("CONCLUSIONS AND RELEVANCE:","**CONCLUSIONS AND RELEVANCE:**") | replace("DATA SOURCES:","**DATA SOURCES:**") | replace("DESIGN, SETTING, AND PARTICIPANTS:","**DESIGN, SETTING, AND PARTICIPANTS:**") | replace("ELIGIBILITY CRITERIA:","**ELIGIBILITY CRITERIA:**") | replace("ELIGIBILITY CRITERIA FOR SELECTING STUDIES:","**ELIGIBILITY CRITERIA FOR SELECTING STUDIES:**") | replace("MAIN OUTCOME MEASURES:","**MAIN OUTCOME MEASURES:**") | replace("MAIN OUTCOMES AND MEASURES:","**MAIN OUTCOMES AND MEASURES:**") | replace("PROCESS AND EVIDENCE SYNTHESIS:","**PROCESS AND EVIDENCE SYNTHESIS:**") | replace("RESEARCH DESIGN AND METHODS:","**RESEARCH DESIGN AND METHODS:**") | replace("STUDY DESIGN AND SETTING:","**STUDY DESIGN AND SETTING:**")}}{% endif %}

# Persistent Notes
{% persist "notes" %}


{% endpersist %}
# Annotations
#### Imported on [[{{exportDate | format("YYYY-MM-DD")}}]] {{exportDate | format("h:mm a")}}
{% for colorHex, colorCategory in zoteroColors %}
## {{categoryHeading[colorCategory]}}

{% for beginString, calloutString in zoteroStrings %}
{%- for annotation in annotations | filterby("color", "startswith", colorHex) | filterby("comment", "startswith", beginString) %}
{%- if annotation -%}
{{formatAnnotation(annotation, calloutString)}}
{%- endif -%}
{%- endfor -%}
{%- endfor -%}
{%- endfor -%}
