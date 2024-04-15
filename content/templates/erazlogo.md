---
cssclass: research-note
type: "{{itemType}}"{% for type, creators in creators | groupby("creatorType") -%}{% if loop.first %}
{% endif %}{{type | replace("interviewee", "author") | replace("director", "author") | replace("presenter", "author") | replace("podcaster", "author") | replace("programmer", "author") | replace("cartographer", "author") | replace("inventor", "author") | replace("sponsor", "author")  | replace("performer", "author") | replace("artist", "author")}}: "{%- for creator in creators -%}{%- if creator.name %}{{creator.name}}{%- else %}{{creator.lastName}}, {{creator.firstName}}{%- endif %}{% if not loop.last %}; {% endif %}{% endfor %}"{% if not loop.last %}
{% endif %}{%- endfor %}{% if title %}
publication: "{{publicationTitle}}"{% endif %}{% if date %}
date: {{date | format("YYYY-MM-DD")}}{% endif %}{% if archive %}
archive: "{{archive}}"{% endif %}{% if archiveLocation %}
archive-location: "{{archiveLocation}}"{% endif %}
citekey: {{citekey}}
---

{{bibliography}}
[online]({{uri}}) [local]({{desktopURI}}) {%- for attachment in attachments | filterby("path", "endswith", ".pdf") %} [pdf](file://{{attachment.path | replace(" ", "%20")}})
{% if loop.last %} 
{% endif %}{%- endfor %}
 
{% if tags.length > 0 -%}{% for t in tags -%}#{% if t.tag == "secondary" %}source/secondary{% if not loop.last %}{% endif %}{% elif t.tag == "primary" %}source/primary{% if not loop.last %}{% endif %}{% elif "-project" in t.tag %}project/{{t.tag | lower | replace(" ", "-") | replace("-project", "")}}{% else %}subject/{{t.tag | lower | replace(" ", "-")}}{% endif %}{% if not loop.last %}
{% endif %}{%- endfor %}{%- endif %}

### Index

start-date:: {% if date %}{{date | format("YYYY-MM-DD")}}{% endif %}
end-date::
page-no:: {% for annotation in annotations %}{% if loop.first %}{{annotation.pageLabel}}{% endif %}{% endfor %}

### Connections

comment:: 

### Note

[[pdf highlight colors and comment strings]]

-   🔴️ `red` --> disagree with author
-   🟠️ `orange` --> important point by author
-   🟡️ `yellow` --> interesting point
-   🟢️ `green` --> important to me
-   🔵️ `blue` --> notes after initial iteration
-   🟣️ `magenta` --> literary note to look up later

{% macro calloutHeader(color) -%}
{%- if color == "#ff6666" -%}
Disagree - Red
{%- endif -%}
{%- if color == "#5fb236" -%}
Important to me - Green
{%- endif -%}
{%- if color == "#2ea8e5" -%}
Subsequent notes - Blue
{%- endif -%}
{%- if color == "#a28ae5" -%}
Reference to look up later - Purple
{%- endif -%}
{%- endmacro -%}

{% persist "annotations" %}
{% set annotations = annotations | filterby("date", "dateafter", lastImportDate) -%}
{% if annotations.length > 0 %}
### Imported on {{importDate | format("YYYY-MM-DD h:mm a")}}

{%- for annotation in annotations %}
>{% if annotation.color %} {{calloutHeader(annotation.color)}} {% endif %}
>{% if annotation.imageRelativePath %}
![[{{annotation.imageRelativePath}}]] 
{% endif %}
{% if annotation.annotatedText %}
>{{annotation.annotatedText}} 
[(p. {{annotation.pageLabel}})](zotero://open-pdf/library/items/{{annotation.attachment.itemKey}}?page={{annotation.pageLabel}}&annotation={{annotation.id}})
{%- endif %}
{%- if annotation.comment %}
>{{annotation.comment | nl2br}}
 {%- endif %}

{%- endfor %}
{%- endif %}
{%- endpersist %}
