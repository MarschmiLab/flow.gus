# fun.gus

An R package with functions Gus has written to help analyze flow data.

# To install:

```         
if (!requireNamespace("devtools", quietly=TRUE))
    install.packages("devtools")
devtools::install_github("MarschmiLab/flow.gus")
```

# Flow Cytometry Functions

As our lab uses more and more flow cytometry, there are some basic tasks that I prefer to do with previously defined convenience functions, which almost exclusively wrap functions from the flowCore function.

# `MakeInteractiveGates`

## Usage

This takes a flowSet as an argument and launches a Shiny app where you can interactively draw polygon, and interval gates and save them as .RData files.

``` r
MakeInteractiveGates(flo_set)
```

## Tips

If your flowsSet includes many samples, I would subset it (e.g. \`flo_set[c(1,2,3)]) before launching MakeInteractiveGates.

Your gate should be saved as a .RData object. You can alter the object name it will be saved as by providing new text in the "Gate Name" field (instead of new_gate). If you are creating a GatingSet hierarchy, this will also be the `filterId` which defines the gate.

# `rename_flowset_samples`

## Usage

Often, your flowset sample names are simply the file paths of each fcs file. This is a pain, as when you plot these samples using a package like ggcyto, you get the uninformative file name, instead of a useful sample name. This function lets you easily rename the samples using a character vector.

## Arguments

| Argument | Description |
|-------------------|-----------------------------------------------------|
| `flo_set` | a flowSet created by flowCore |
| `` `new_names` `` | a character vector of new names for each flowFrame in the flowSet. Length must match the number of frames in your flowSet. |

# `count_gated_events`

## Usage

Given a flowSet and a gate (whose parameters match those in the flowSet), this will return a dataframe for each frame of the flowSet giving the original event counts, the gated events counts (i.e., those which fall inside the gate), and the percentage of events within the gate.

## Arguments

| Argument | Description |
|-------------------|-----------------------------------------------------|
| `flo_set` | a flowSet created by flowCore |
| `gate` | a gate created by flowCore, whose parameters are found within the provided flowSet |
