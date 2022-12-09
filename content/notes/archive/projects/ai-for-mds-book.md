# AI for MDs

## Intro

### Why?

- It's happening
- Data availability
-

---

### What is AI/ML?


AI

Tools for doing an intelligent thing (we're not going to get into AGI: while very cool, it's not super practical, and tends to obfuscate the useful stuff --> lead to debates on the nature of humanity, etc.)

Examples of simple AI: thermostats and cruise control.
A human who would like to maintain a constant speed would
A) pick the desired speed,
B) note whether they were currently above or below that speed,
and C) accelerate up or down to match the desired speed.
This is an example of a simple rules-based system,
a series of if-then statements (if above speed X, let off the gas. If below speed X, give it more gas).
These are very useful, and you can get a lot of mileage out of them,
but if decision-making is complex, then the series of interconnected rules become more complex,
and increased complexity leads to brittle systems with limited functionality and a high maintenance burden.

ML

Tools for training a machine to do a thing by giving it examples from which it can learn. We will get into the major categories later, but in brief they are

    - Classification: learn from example whether a thing is an X or a Y. E.g. is this a picture of a hotdog or a shoe? Based on labs, genes, and demographics, does this patient have disease X or disease Y?
    - Regression: learn from example the quantitative value of a thing based on other data. E.g. based on local property values, square footage, amenities, for how much will this house sell? Based on lab values that are easy to obtain, can we predict another lab value that is difficult to obtain (e.g. bone marrow cellularity, blast percentage).
    - Unsupervised: from a set of data, find clusters of similar data points. E.g. from a number of whole genome sequences, find patterns of similarity that can be further explored and correlated with phenotype. In an image, locate areas likely to be of interest.

---

### Why you?

Data is king, queen, and jester

- [Breast cancer labels cheating](https://www.cs.princeton.edu/picasso/mats/KDDCup08Expl.pdf), [copy of PDF](http://beauhilton.com/assets/npj-dm-readmit.pdf)

The goal of this competition, organized by Siemens and available on the Kaggle platform
(which hosts various data science competitions that individuals or teams can freely compete in, often for a cash prize),
was to predict the likelihood of cancer from numeric variables derived from preprocessed images.
Anonymized patient identification numbers were left in the dataset,
and the winning competitors noticed that these numbers fell in certain ranges in a nonrandom way:
if a patient ID fell between 100,000 and 500,000, or above 4,000,000, the likelihood of cancer was very low (1-2%),
but if the ID was between 0 and 20,000 the likelihood of cancer was much higher (36%).

The competitors used this knowledge to build a model that performed very well in predicting which patients had cancer,
but would not generalize at all to the real world.
However, because the model was a "black box" model,
the problematic nature of their model would not be readily apparent,
and serves as a warning that machine learning practitioners
(and consumers of such technology)
should be wary of the data upon which models were built.

They wrote a lovely paper detailing their findings and warnings.
We can imagine much less scrupulous technologists letting their apparent success ride unchallenged.

- [Luke Oakden-Rayner predicting CT manufacturer from scans](https://www.nature.com/articles/s41746-019-0105-1), [copy of PDF](http://beauhilton.com/assets/predict-ct-scanner.pdf)

In a similar vein, Oakden-Rayner and colleagues used a deep learning model to predict various clinical entities from CT scans.
Particularly with deep learning models used for image analysis,
in which there may be millions or billions of parameters used to make the final prediction,
it can be very difficult to know exactly which features the model is pulling out of the image to make its predictions,
and in what ways those features interact.
The authors of this paper chose to turn things around a bit,
and give the model the task of predicting the manufacturer of the CT machine,
whether the order was stat or not, and other relatively non-clinical curiosities.

- [How to Ask an Actionable Question](https://www.thetalkingmachines.com/episodes/how-ask-actionable-question)

<relisten to this episode>

- [Missing weights](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7125114/), [copy of PDF](http://beauhilton.com/assets/npj-dm-readmit.pdf)

One of our projects sought to predict readmission risk and risk of increased length of stay,
from a number of hospital, demographic, laboratory, and other variables.
I chose to use a model that was amenable to explanation,
and could also handle missing values by allowing missingness itself to be a signal
(this is a confusing statement, but will be more clear with the following example).
In both predictive tasks, patients with extreme BMIs had higher predicted likelihood of the adverse outcome,
and, more unexpectedly, so did patients with *missing* BMIs.

I puzzled on this for some time,
wondering what a missing BMI could be signalling,
and then took care of a patient transferred from an outside hospital with a C1-C2 infection with high concern for instability.
He was never weighed out of concern that standing him up could precipitate a catastrophic event.
While this particular case is undoubtedly rare,
perhaps it is not so rare to have patients who are sick enough to never be stood up and put on a scale
(and I do not trust bed weights enough to include them in any predictive model).

I considered throwing this variable out several times because the results seemed, frankly, weird,
but time on the wards rescued it,
and now I find it emblematic of the communication between data science and clinical work.
Any hospital administrator looking to improve their prediction of which patients are high-risk
should consider looking for oddities such as this,
especially if the oddity is readily apparent in the hospital database,
and exploring anything that seems nonrandom, even if the connection is unclear at first.

- [Labelling heme-path images is hard](https://pubmed.ncbi.nlm.nih.gov/29656215/), [copy of PDF](http://beauhilton.com/assets/heme-path-is-hard.pdf)

I tried to build a deep learning model to predict hematologic malignancy phenotype from ultra-high-resolution scans of bone marrow biopsies.
I failed miserably.

It turns out this is a very hard problem.
Apart from considerable technical hurdles
(most deep learning models are trained on images 255x255 or 512x512 pixels, while these images are on the order of 80,000x90,000 pixels, requiring many decisions regarding pre- and post-processing to make the computation tractable),
we quickly realized that our data source was not rich enough and would need an enormous amount of work.
Many important findings are made on a cell-by-cell basis,
so we would need to label each cell to build a rich ground truth.
But labeling cells is no easy task, and requires experienced hematopathologists,
who are busy and expensive.

After some time I found I was not alone in realizing these difficulties,
and a group in Japan was way ahead of me and my team in tackling this problem.
This paper explicitly states their end goal,
to build an automated system to perform diagnoses on hematopathological images,
and then goes on to explain that they realized they needed more data,
and that collecting that data would require hematopathologists,
and that hematopathologists are busy and expensive,
so they would build a system to make the task of labelling easy and fast.
As a part of this, they wanted to evaluate the quality of the labels they were going to obtain,
and so performed a study to quantify agreement between hematopathologists for a select number of cellular entities and quantities.
They found consensus in some things, when they were obvious,
but nonconsensus in non-obvious things.

How, then, to build a model to automate part of a hematopathologist's job
(and hence to make advanced hematopathology available in less resource-rich settings),
if ground truth is so difficult to obtain, and shaky?
This basic problem is repeated throughout machine learning in medicine,
from improperly or incompletely labeled radiographs
to chart-based diagnoses based on billing concerns more than clinical realities.
We need experienced clinicians to generate, evaluate, and mobilize data,
and there is not (and, I argue, will never be) a substitute for direct experience with real patients
(or, in the cases of pathology and radiology, the tissues and images of real patients, and consultation with the clinicians who ordered the studies).

---

### How to learn

There is an ever-growing number of learning resources available for the would-be data scientist.
These range from in-person degrees at prestigious institutions,
to online courses and certifications,
to books,
blog posts,
and code examples that themselves range from the
line-by-line hands-on approach
to the highly cerebral and theoretic.

Which resources you choose to use will depend largely on your goals.

If you want to be a theoretician,
you may start from the ground up
and study the core mathematics and computer science.

If you want to be an engineer,
that is, one who applies the tools to real world problems,
you may prefer a hands-on approach at first,
and dip into the theory as needed to troubleshoot deeper issues.

You may want to be neither of these,
but instead your goal is to be a responsible citizen
within your medical field,
with enough understanding to critique the
academic articles and,
perhaps more importantly,
software tools employed within your practice and institution.
This may be analogous to the way and reasons we learn
statistics in medical school,
not to become statisticians,
but to know how to speak with statisticians,
how to collaborate,
how to understand what we read,
and spot poor practice
or misleading claims.
