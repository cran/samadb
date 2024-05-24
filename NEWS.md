# samadb 0.3.0

- The database has been moved, and the connection changed accordingly. All users should update the package. 

- The package now displays a startup message reminding users that the main data provider, [EconData](https://econdata.co.za/), provides free datasets only for non-commercial users. Other users must obtain a license at https://econdata.co.za/support/.  

- `sm_pivot_wider()` has become faster by internally replacing `data.table::dcast()` by `collapse::pivot()`. 

# samadb 0.2.6

- Minor changes demanded by CRAN

# samadb 0.2.5

- Change host to EconData database server located in South Africa. 

# samadb 0.2.4

- First private release of the package to interested stakeholders. API's for Python and Julia have also been completed. 

# samadb 0.2.3.9000

- Minor changes to database model, providing some additional information about the number of series per dataset and the dataset-id from the data source (e.g. release code from STATSSA). Also columns counting observations are prepended with `n_`. 

# samadb 0.2.2.9000

- Removing discontinued *EconData* series from the database, allowing simpler 'dsid' and 'series' codes without version numbers.

# samadb 0.2.1.9000

- Adding `series = NULL` argument to `sm_series()`, allowing retrieval of information for individual series from the SERIES table. 

# samadb 0.2.0.9000

- Revision of the database model and API's to have unique series code, with 'series' the sole primary key of the SERIES table.

# samadb 0.1.0.9000

- Stable version for database with composite primary key in the SERIES table ('dsid', 'series').

# samadb 0.0.0.9000

- First development version of the package, mid-March 2023
