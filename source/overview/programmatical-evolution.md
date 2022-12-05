
__Iris Toolbox for Macroeconomic Modeling__

# Programmatical evolution

`jaromir.benes@iris-toolbox.com`

---

## Branching model

#### `bleeding`

* Default branch
* Works with R2019b and later (uses `arguments` validation syntax)
* Bleeding edge development
* Tested but not guaranteed


#### `stable`

* Explicitly select when cloning or downloading
* Works with R2018a and later
* Bleeding edge development
* Tested but not guaranteed


---

## Everything is an object or namespace

* Avoid name conflicts (with other toolboxes in particular)
* Enable cleaner and maintainable (production) code
* Class names capitalized
* Class methods verbalized
* Namespaces (packages) lowercase 


---

## Time series evolution

<br/>

#### `tseries` → `Series`

* Introduced in 2014–2015 
* Main reason for `Series`: Matlab HG2 graphics and `datetime`
* Parallel existence until 2022
* `tseries` no longer exists as a useable class, only an abstract class to enable the loading of `tseries` from mat files as `Series`

---

## Model and Plan evolution

#### `model` → `Model`

* Introduced 2018, parallel existence ever since
* Main reason for `Model`: reimplements the nonlinear solution methods
* `model` strongly discouraged and scheduled for removal

<br/>

#### `plan` → `Plan`

* Consistently with `Model`, a new simulation `Plan` object reimplements the simulation of combined anticipated-unanticipated events (shocks, exogenized variables)


---

## Reporting to explanatory equations evolution

#### `rpteq` → `Explanatory`

* Introduced 2018–2020

* Multipurpose single-equation model, or a collection of sequential (non-simultaneous) equations

* Linear regression with ARMA errors

* Nonlinear regression

* Non-simultaneous simulation

* Can be included as `!preprocessor` and/or `!postprocessor` in `Model` objects but not part of the model itself

---

## Databank namespace (package)

#### `dbxxx` → `+databank`

* Create namespace
* Reimplement batch processing
* New import-export functions

---

## Reporting revolution 

#### `+report` → `+rephrase`

* LaTeX hopelessly outdated in separating content vs visual

* HTML-CSS-JS implements the idea the right way, and provides infinite flexibility

* Ready for use outside Matlab

![[rephrase.png]]

---

## Static constructors

* Best practice to construct objects in different contexts

* Examples

> ```
> Model.fromFile(...)
> Model.fromString(...)
> Model.fromExplanatory(...)
>
> Plan.forModel(...)
> Plan.forExplanatory(...)
> Plan.forVAR(...)
>
> Series.fromData(...)
> Series.empty(...)
> ```

