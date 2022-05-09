
__[IrisToolbox] for Macroeconomic Modeling__

# Functional areas of Iris Toolbox

`jaromir.benes@iris-toolbox.com`

---

## Four main functional areas

<br/>

![[../assets/functional-areas.png]]


---

## Structural modeling

Developing and operating systems of structured equations

* Model source language, model source preparser

* Structural models: `Model`

* Systems of explanatory equations: `Explanatory`

* Simulation plans: `Plan`

* General state space: `LinearSystem`, `iris.mixin.Kalman`

* Bayesian estimation: `+distribution`, `Posterior`, `SystemProperty`, `SystemPrior`

---


## Time series modeling

Explore shorter-term empirical correlations, deal with the overfitting problem in high-dimensional models

* Reduced-form vector autoregressions: `VAR`, `+dummy`

* Structural vector autoregressions: `SVAR`

* Dynamic factor models: `Dynafit`

* Interface to `X13-Arima-Tramo-Seats`

* Univariate filters for time series objects

---

## Data management

Preprocess and postprocess time series and databanks (structs)

* Dates: `Dater`, `+dater`

* Time series: `Series`

* Databanks: structs or `Dictionary`, `+databank`

* Interface to public APIs: IMF, ECB, Fred


---

## Visualization and reporting

Chart data and create HTML reports

* On-screen charts: `databank.Chartpack`

* HTML reports: `+rephrase`

* Visualization utilities: `+visual`

