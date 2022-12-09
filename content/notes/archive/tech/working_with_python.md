# working_with_python
:rmarkdown:

# Enabling Python in RMD
Install the reticulate package.
Enable it as below.
It's the bee's knees.

# Conda environments
Call an R command `use_condaenv("env_name")` like so:

```{r, echo=FALSE}
library(reticulate)
use_condaenv("lgb_shap")
```

# Matplotlib plots
They work. Make sure to call `plt.tight_layout()` so the formatting is pretty.


Sun 17 Nov 2019 10:23:05 AM CST
