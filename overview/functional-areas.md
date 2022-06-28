
__[IrisToolbox] for Macroeconomic Modeling__

# Key functional areas 

`jaromir.benes@iris-toolbox.com`

---

![[../assets/functional-areas.png]]


---

## Structural modeling

Developing and operating systems of structured equations

* Model source language, model source preparser

* Structural models: `Model`

* Systems of explanatory equations: `Explanatory`

* Simulation plans: `Plan`

* General state space: `LinearSystem`

* Bayesian estimation: `+distribution`, `Posterior`, `SystemProperty`, `SystemPrior`

---


## Time series modeling

Explore shorter-term empirical correlations, deal with the overfitting problem in high-dimensional models

* Reduced-form vector autoregressions: `VAR`

* Structural vector autoregressions: `SVAR`

* Prior dummy observations for "bayesian" VARs: `+dummy`

* Dynamic factor models: `Dynafit`

* Interface to `X13-Arima-Tramo-Seats`: `x13.season`

* Univariate filters for time series objects

---

## Data management

Preprocess and postprocess time series and databanks (structs)

* Dates: `Dater`, `+dater`

* Time series: `Series`

* Databanks: `+databank`

* Interface to public database APIs: IMF, ECB, Fred


---

## Visualization and reporting

Chart data and create HTML reports

* On-screen charts: `databank.Chartpack`

* HTML reports: `+rephrase`

* Visualization utilities: `+visual`

