
__[IrisToolbox] for Macroeconomic Modeling__

# Practical tricks for nonlinear models

`jaromir.benes@iris-toolbox.com`

---

## Practical problems operating (larger) nonlinear models

* Difficult to tell if the problem is imperfection of the numerical algorithm, or
  the simulation reaching out of the corridor of stability
	
* Use auxiliary devices to make convergence happen, and to measure the
  extent of the pressures

---

## False slope 

* Occasionally binding constraints, e.g. zero interest floor

$$
r_t = \max\left\{ 0, \, r_t^\mathrm{unc} \right\}
$$

* The discontinuity at the edge pose relatively little difficulties

* The zero slope of the `max` or `min` functions in the binding regions is a more serious problem

---

## Pressure relief valves (PRVs)


* Augment structural ("behavioral") equations with terms that relieve the equations of the pressures created by nonlinearities

* Control the PRV through a knob parameter 

Examples

* Zero interest floor and aggregate demand: $\alpha \left( r_t - r^\mathrm{unc} \right)$

* Recapitalization when capital adequacy is damaged across the entire sector
