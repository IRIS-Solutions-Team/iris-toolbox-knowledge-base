---
title: Preparser commands
---

__[IrisToolbox] for Macroeconomic Modeling__

# Main commands of the preparser

`jaromir.benes@iris-toolbox.com`

---

## Split into multiple source files

* Extremely useful and simple technique to flexibly create slightly different versions of a model

* Use "bypass" files to exclude a certain sector


---

## Code creation/branching commands

```
!if xxx
	a = a{-1} + shock_a;
!else
    a = b;
!end
```


```
!for y, c, g !do
    roc_? = ? / ?{-1};
!end
```


```
!for ?v = y, c, g !do
    !for ?n = 1, 2 !do
        roc_?v_?n = ?v_?n / ?v_?n{-1};
    !end
!end
```

```
x = !for <1:A> !do + x_? !end;
x = !for <list> !do + x_? !end;
```

<br/>

Values of `xxx`, `A` and `list` need to be supplied when creating the model object using the option `Assign=`.

---

## Substitutions

```
!substitutions

	adj := xi*(log(roc_cpi) - log(roc_cpi{-1}));
```


---

## Matlab expression evaluation

```
<expression>
```

* The `expression` is evaluated in the context of values assigned through the `Assign=` option at the time of creating the model object

* The resulting value is attempted to be translated to a string or a list of strings


---

### Pseudofunctions

```
diff(x+y{-1})
diff(x+y{-1}, -4)
roc(x+y{-1})
roc(x+y{-1}, -12)
pct(x+y{-1})
pct(x+y{-1}, +1)
movavg(x+y{-1}, -4)
movsum(x+y{-1}, -10)
movprod(x+y{-1}, +4)
```
