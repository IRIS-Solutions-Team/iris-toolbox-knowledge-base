---
title: Iris model source language
---

__[IrisToolbox] for Macroeconomic Modeling__

# Main keywords in the model source language

`jaromir.benes@iris-toolbox.com`

---

## Structure of model source code

* Model source code consists of any number of files with any number of any sections in any order

* At least one transition equation and one transition variable

* Although possible, refrain from hardcoding parameter values

* Model source code is meant to describe the model 

* ...but not its numerical values (parameters, steady state, simulated) 


---

## Declare quantities

`!transition-variables`

`!transition-shocks`

`!measurement-variables`

`!measurement-shocks`

`!parameters`



---

## Define equations

`!transition-equations`

`!measurement-equations`


---

## Control log-status

`!log-variables`

`!log-variables !all-but`


---

## Extras

`!exogenous-variables`

`!measurement-trends`

`!links`

`!preprocessor`

`!postprocessor`


---

## Dynamic and steady state equations

`dynamic !! steady;`

