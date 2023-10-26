# scSpatialSIM: an R package for simulating biologically informed spatial point patterns

## Presenter: [Alex Soupir](mailto:Alex.Soupir@moffitt.org) and [Jordan Creed](mailto:Jordan.H.Creed@moffitt.org)

Location: **VIRTUAL MEETING** 

Day and Time: Thursday September 21, 2023 @ 3pm

### Details

In the past, characteristics of tissues and tumors such as cell abundance were
associated with clinical outcomes from technologies like multiplex
immunofluorescence (mIF). In recent years mIF has begun to be leveraged for
analyzing the spatial context of immune cells in tissues, with higher
resolution coming from technologies like spatially resolved transcriptomics.
Along with the increased use of spatial data has come an increase in metrics
that are used to describe the spatial relationships between cells. To allow
for benchmarking these metrics, we developed ‘scSpatialSIM’, an R package for
the simulation of spatial point patterns with biological context. The
‘scSpatialSIM’ package uses Gaussian kernels to create clusters of tissue,
cells, or holes in simulated spatial data which can be fine-tuned for
abundance and clustering control. Both single and multi-cell types can be
simulated with clustering or segregation of the cell types. Giving users the
ability to simulate holes provides scenarios where the spatial stationarity
assumption is violated to determine robustness of their methods. We will
demonstrate using the ‘scSpatialSIM’ package to simulate realistic biological
data of high grade serous ovarian cancer and use ‘spatialTIME’ to assess the
impact of holes on derived metrics where adjusting for complete spatial
randomness measures is critical.


###  Files

