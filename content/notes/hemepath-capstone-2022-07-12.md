---
title: "hemepath-capstone-2022-07-12"
tags:
- inbox
---

# hematopathology capstone

- >20% other == high concern for malig, but no guaranteed results (e.g. mono can have tons of "other" cells)
- with karyotype reporting: are all results reported out, or only sig results? E.g. is the # cells always reported, are all translocations reported, are the q reported always or only for known important loci?
- [[data science opportunities]]: FISH reports do not have a standardized order for reporting (e.g. the one in the example happened to be in the order of the panels). Do current scraping efforts go line-by-line and do specific selection? It would be nice to structure this stuff automatically, easier to load into proper db for analysis.
- in clinical settings, outside of cell harvesting for SCT, once a cell has been through a flow cytometer it is no longer used for anything. (in research settings, cells are recovered on the other side of the flow cytometer all the time)
- if not in CR, occ still send PCR to see if the targeted therapy has knocked down the clone in particular and another clone has arisen (as of yet, unlikely to change mgmt). I could imagine, if multiple targeted agents for a certain class of mutation exist, PCR could help fine tune things (but it seems we're a while off from not needing cytotoxic therapies - I wonder about the whole agricultural analogy w targeted suppression of goofy mutants and wildtype)
- VAF vs AR
	- allelic ratio == number of mutants against number of wild type (a bit older tech)
	- variant allele frequency == number of mutants against total runs, validate against 4% typically (certain targets can validate down to 1%)
	- not clear if one approach is superior, guidelines are in flux
- [[EHR design]]: linking meds and labs (e.g. if ATRA is ordered, should have an aggressive prompt to order the proper FISH study)
- why do infections cause monotypy/monoclonality?
	- monotypic/monoclonal populations of white cells may arise in infections or other stressors bc of selection for most effective tools (I don't know about any data for this, but sounds reasonable)
- for stat cases, talk w the hemepath fellows