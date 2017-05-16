CREATE TABLESPACE ceph LOCATION '/tmp/ceph';

CREATE TABLE metadata (
    md_hash UUID PRIMARY KEY,
    md_json JSONB
);

CREATE TABLE paths (
    pa_hash UUID PRIMARY KEY,
    pa_path TEXT
);

CREATE VIEW test_metadata AS 
    SELECT 
        md_hash
      , md_json 
    FROM metadata 
    WHERE md_json->'attributes'->>'project_id' = 'CMIP5' 
    LIMIT 5;

CREATE VIEW test_paths AS 
    SELECT 
        pa_hash
      , pa_path 
    FROM paths 
    INNER JOIN test_metadata 
    ON (pa_hash = md_hash);

INSERT INTO paths VALUES
    ('a41084c5-1d6a-155b-4830-cab2734af43e', '/g/data1/ua6/authoritative/IPCC/CMIP5/CSIRO-QCCCE/CSIRO-Mk3-6-0/historical/mon/atmos/Amon/r7i1p1/v20110518/hfls/hfls_Amon_CSIRO-Mk3-6-0_historical_r7i1p1_185001-200512.nc'),
     ('da3e9e6a-78bc-9c35-ecd5-d4382a288866', '/g/data1/ua6/authoritative/IPCC/CMIP5/CSIRO-QCCCE/CSIRO-Mk3-6-0/historical/mon/ocean/Omon/r10i1p1/v20110518/so/so_Omon_CSIRO-Mk3-6-0_historical_r10i1p1_194001-194912.nc'),
     ('52cdd497-6b50-de71-ee5c-51d67d9d01fd', '/g/data1/ua6/authoritative/IPCC/CMIP5/CSIRO-QCCCE/CSIRO-Mk3-6-0/historical/mon/ocean/Omon/r7i1p1/v20110518/rhopoto/rhopoto_Omon_CSIRO-Mk3-6-0_historical_r7i1p1_197001-197912.nc'),
     ('c38706a6-ff03-001d-cd31-1282cf079967', '/g/data1/ua6/authoritative/IPCC/CMIP5/CSIRO-QCCCE/CSIRO-Mk3-6-0/historicalNat/day/atmos/day/r2i1p1/v20110518/vas/vas_day_CSIRO-Mk3-6-0_historicalNat_r2i1p1_19500101-19691231.nc'),
     ('718d7868-2bb1-6640-3044-0d6de94339f1', '/g/data1/ua6/authoritative/IPCC/CMIP5/CSIRO-QCCCE/CSIRO-Mk3-6-0/historicalNat/mon/aerosol/aero/r8i1p1/v20110518/concso4/concso4_aero_CSIRO-Mk3-6-0_historicalNat_r8i1p1_195001-195012.nc');

INSERT INTO metadata VALUES
    ('a41084c5-1d6a-155b-4830-cab2734af43e', '{"format": "NC_FORMAT_CLASSIC", "variables": {"lat": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0], "storage": "NC_CONTIGUOUS"}, "attributes": {"axis": "Y", "units": "degrees_north", "bounds": "lat_bnds", "long_name": "latitude", "standard_name": "latitude"}, "dimensions": ["lat"], "endianness": "NC_ENDIAN_NATIVE"}, "lon": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0], "storage": "NC_CONTIGUOUS"}, "attributes": {"axis": "X", "units": "degrees_east", "bounds": "lon_bnds", "long_name": "longitude", "standard_name": "longitude"}, "dimensions": ["lon"], "endianness": "NC_ENDIAN_NATIVE"}, "hfls": {"type": "NC_FLOAT", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0, 0, 0], "storage": "NC_CONTIGUOUS"}, "attributes": {"units": "W m-2", "comment": "Heat flux only due to evaporation: flux due to sublimation is not included (Please ignore the CMIP5_table_comment), CMIP5_table_comment: includes both evaporation and sublimation", "history": "Data converted from mm/day (evaporation) to W/m2 (heat flux) by multiplying by 28.9 (assumes a latent heat of vaporization of 2.5 MJ/kg)", "long_name": "Surface Upward Latent Heat Flux", "_FillValue": 100000000000000000000, "cell_methods": "time: mean", "cell_measures": "area: areacella", "missing_value": 100000000000000000000, "original_name": "evp", "standard_name": "surface_upward_latent_heat_flux", "associated_files": "baseURL: http://cmip-pcmdi.llnl.gov/CMIP5/dataLocation gridspecFile: gridspec_atmos_fx_CSIRO-Mk3-6-0_historical_r0i0p0.nc areacella: areacella_fx_CSIRO-Mk3-6-0_historical_r0i0p0.nc"}, "dimensions": ["time", "lat", "lon"], "endianness": "NC_ENDIAN_NATIVE"}, "time": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0], "storage": "NC_CONTIGUOUS"}, "attributes": {"axis": "T", "units": "days since 1850-01-01 00:00:00", "bounds": "time_bnds", "calendar": "noleap", "long_name": "time", "standard_name": "time"}, "dimensions": ["time"], "endianness": "NC_ENDIAN_NATIVE"}, "lat_bnds": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0, 0], "storage": "NC_CONTIGUOUS"}, "attributes": {}, "dimensions": ["lat", "bnds"], "endianness": "NC_ENDIAN_NATIVE"}, "lon_bnds": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0, 0], "storage": "NC_CONTIGUOUS"}, "attributes": {}, "dimensions": ["lon", "bnds"], "endianness": "NC_ENDIAN_NATIVE"}, "time_bnds": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0, 0], "storage": "NC_CONTIGUOUS"}, "attributes": {}, "dimensions": ["time", "bnds"], "endianness": "NC_ENDIAN_NATIVE"}}, "attributes": {"title": "CSIRO-Mk3-6-0 model output prepared for CMIP5 historical", "source": "CSIRO-Mk3-6-0 2010 atmosphere: AGCM v7.3.8 (T63 spectral, 1.875 degrees EW x approx. 1.875 degrees NS, 18 levels); ocean: GFDL MOM2.2 (1.875 degrees EW x approx. 0.9375 degrees NS, 31 levels)", "comment": "Model output post-processed by the CSIRO-QCCCE CMIP5 Data post-processor for the IPCC Fifth Assessment.", "contact": "Project leaders: Stephen Jeffrey (Stephen.Jeffrey@qld.gov.au) & Leon Rotstayn (Leon.Rotstayn@csiro.au). Project team: Mark Collier (Mark.Collier@csiro.au: diagnostics & post-processing), Stacey Dravitzki (Stacey.Dravitzki@csiro.au: post-processing), Carlo Hamalainen (Carlo.Hamalainen@qld.gov.au: post-processing), Steve Jeffrey (Stephen.Jeffrey@qld.gov.au: modeling & post-processing), Chris Moeseneder (Chris.Moeseneder@csiro.au: post-processing), Leon Rotstayn (Leon.Rotstayn@csiro.au: modeling & atmos. physics), Jozef Syktus (Jozef.Syktus@qld.gov.au: model evaluation), Kenneth Wong (Kenneth.Wong@qld.gov.au: data management), Contributors: Martin Dix (Martin.Dix@csiro.au: tech. support), Hal Gordon (Hal.Gordon@csiro.au: atmos. dynamics), Eva Kowalczyk (Eva.Kowalczyk@csiro.au: land-surface), Siobhan O'Farrell (Siobhan.OFarrell@csiro.au: ocean & sea-ice)", "forcing": "Ant,Nat (all forcings)", "history": "2011-08-02T23:08:49Z CMOR rewrote data to comply with CF standards and CMIP5 requirements.", "product": "output", "model_id": "CSIRO-Mk3-6-0", "table_id": "Table Amon (27 April 2011) 36bda60a55c2e1a01b1b1782daf91fea", "frequency": "mon", "experiment": "historical", "project_id": "CMIP5", "references": "a) Rotstayn, L., Collier, M., Dix, M., Feng, Y., Gordon, H., OFarrell, S., Smith, I. and Syktus, J. 2010. Improved simulation of Australian climate and ENSO-related climate variability in a GCM with an interactive aerosol treatment. Int. J. Climatology, vol 30(7), pp1067-1088, DOI 10.1002/joc.1952 b) Please refer to online documentation at: http://cmip-pcmdi.llnl.gov/cmip5/", "Conventions": "CF-1.4", "branch_time": 55480.00, "institution": "Australian Commonwealth Scientific and Industrial Research Organization (CSIRO) Marine and Atmospheric Research (Melbourne, Australia) in collaboration with the Queensland Climate Change Centre of Excellence (QCCCE) (Brisbane, Australia)", "realization": 7, "tracking_id": "d7b6000f-9c35-417f-a251-09b5d31efaba", "cmor_version": "2.6.0", "institute_id": "CSIRO-QCCCE", "creation_date": "2011-08-02T23:08:49Z", "experiment_id": "historical", "modeling_realm": "atmos", "version_number": "v20110518", "physics_version": 1, "parent_experiment": "piControl", "parent_experiment_id": "piControl", "initialization_method": 1, "parent_experiment_rip": "r1i1p1"}, "dimensions": {"lat": {"length": 96, "unlimited": false}, "lon": {"length": 192, "unlimited": false}, "bnds": {"length": 2, "unlimited": false}, "time": {"length": 1872, "unlimited": true}}}'::jsonb),
     ('da3e9e6a-78bc-9c35-ecd5-d4382a288866', '{"format": "NC_FORMAT_CLASSIC", "variables": {"so": {"type": "NC_FLOAT", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0, 0, 0, 0], "storage": "NC_CONTIGUOUS"}, "attributes": {"units": "psu", "comment": "Data is stored on the native ocean T-grid on which the data was generated. (MOM2 uses a rectangular staggered grid with T cells and U cells.)", "history": "2011-07-28T11:05:31Z altered by CMOR: replaced missing value flag (-7.77778e+06) with standard missing value (1e+20).", "long_name": "Sea Water Salinity", "_FillValue": 100000000000000000000, "cell_methods": "time: mean", "cell_measures": "area: areacello volume: volcello", "missing_value": 100000000000000000000, "original_name": "Salt", "standard_name": "sea_water_salinity", "associated_files": "baseURL: http://cmip-pcmdi.llnl.gov/CMIP5/dataLocation gridspecFile: gridspec_ocean_fx_CSIRO-Mk3-6-0_historical_r0i0p0.nc areacello: areacello_fx_CSIRO-Mk3-6-0_historical_r0i0p0.nc volcello: volcello_fx_CSIRO-Mk3-6-0_historical_r0i0p0.nc"}, "dimensions": ["time", "lev", "lat", "lon"], "endianness": "NC_ENDIAN_NATIVE"}, "lat": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0], "storage": "NC_CONTIGUOUS"}, "attributes": {"axis": "Y", "units": "degrees_north", "bounds": "lat_bnds", "long_name": "latitude", "standard_name": "latitude"}, "dimensions": ["lat"], "endianness": "NC_ENDIAN_NATIVE"}, "lev": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0], "storage": "NC_CONTIGUOUS"}, "attributes": {"axis": "Z", "units": "m", "bounds": "lev_bnds", "positive": "down", "long_name": "ocean depth coordinate", "standard_name": "depth"}, "dimensions": ["lev"], "endianness": "NC_ENDIAN_NATIVE"}, "lon": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0], "storage": "NC_CONTIGUOUS"}, "attributes": {"axis": "X", "units": "degrees_east", "bounds": "lon_bnds", "long_name": "longitude", "standard_name": "longitude"}, "dimensions": ["lon"], "endianness": "NC_ENDIAN_NATIVE"}, "time": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0], "storage": "NC_CONTIGUOUS"}, "attributes": {"axis": "T", "units": "days since 1850-01-01 00:00:00", "bounds": "time_bnds", "calendar": "noleap", "long_name": "time", "standard_name": "time"}, "dimensions": ["time"], "endianness": "NC_ENDIAN_NATIVE"}, "lat_bnds": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0, 0], "storage": "NC_CONTIGUOUS"}, "attributes": {}, "dimensions": ["lat", "bnds"], "endianness": "NC_ENDIAN_NATIVE"}, "lev_bnds": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0, 0], "storage": "NC_CONTIGUOUS"}, "attributes": {}, "dimensions": ["lev", "bnds"], "endianness": "NC_ENDIAN_NATIVE"}, "lon_bnds": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0, 0], "storage": "NC_CONTIGUOUS"}, "attributes": {}, "dimensions": ["lon", "bnds"], "endianness": "NC_ENDIAN_NATIVE"}, "time_bnds": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0, 0], "storage": "NC_CONTIGUOUS"}, "attributes": {}, "dimensions": ["time", "bnds"], "endianness": "NC_ENDIAN_NATIVE"}}, "attributes": {"title": "CSIRO-Mk3-6-0 model output prepared for CMIP5 historical", "source": "CSIRO-Mk3-6-0 2010 atmosphere: AGCM v7.3.8 (T63 spectral, 1.875 degrees EW x approx. 1.875 degrees NS, 18 levels); ocean: GFDL MOM2.2 (1.875 degrees EW x approx. 0.9375 degrees NS, 31 levels)", "comment": "Model output post-processed by the CSIRO-QCCCE CMIP5 Data post-processor for the IPCC Fifth Assessment.", "contact": "Project leaders: Stephen Jeffrey (Stephen.Jeffrey@qld.gov.au) & Leon Rotstayn (Leon.Rotstayn@csiro.au). Project team: Mark Collier (Mark.Collier@csiro.au: diagnostics & post-processing), Stacey Dravitze}, "chunking": {"sizes": [0], "storage": "NC_CONTIGUOUS"}, "attributes": {"axis": "Y", "units": "degrees_north", "bounds": "lat_bnds", "long_name": "latitude", "standard_name": "latitude"}, "dimensions": ["lat"], "endianness": "NC_ENDIAN_NATIVE"}, "lev": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0], "storage": "NC_CONTIGUOUS"}, "attributes": {"axis": "Z", "units": "1", "bounds": "lev_bnds", "formula": "p = a*p0 + b*ps", "positive": "down", "long_name": "hybrid sigma pressure coordinate", "formula_terms": "p0: p0 a: a b: b ps: ps", "standard_name": "atmosphere_hybrid_sigma_pressure_coordinate"}, "dimensions": ["lev"], "endianness": "NC_ENDIAN_NATIVE"}, "lon": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0], "storage": "NC_CONTIGUOUS"}, "attributes": {"axis": "X", "units": "degrees_east", "bounds": "lon_bnds", "long_name": "longitude", "standard_name": "longitude"}, "dimensions": ["lon"], "endianness": "NC_ENDIAN_NATIVE"}, "time": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0], "storage": "NC_CONTIGUOUS"}, "attributes": {"axis": "T", "units": "days since 1850-01-01 00:00:00", "bounds": "time_bnds", "calendar": "noleap", "long_name": "time", "standard_name": "time"}, "dimensions": ["time"], "endianness": "NC_ENDIAN_NATIVE"}, "a_bnds": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0, 0], "storage": "NC_CONTIGUOUS"}, "attributes": {"long_name": "vertical coordinate formula term: a(k+1/2)"}, "dimensions": ["lev", "bnds"], "endianness": "NC_ENDIAN_NATIVE"}, "b_bnds": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0, 0], "storage": "NC_CONTIGUOUS"}, "attributes": {"long_name": "vertical coordinate formula term: b(k+1/2)"}, "dimensions": ["lev", "bnds"], "endianness": "NC_ENDIAN_NATIVE"}, "concso4": {"type": "NC_FLOAT", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0, 0, 0, 0], "storage": "NC_CONTIGUOUS"}, "attributes": {"units": "kg m-3", "history": "2012-06-14T03:54:13Z altered by CMOR: Inverted axis: lev.", "long_name": "Concentration of SO4", "_FillValue": 100000000000000000000, "cell_methods": "time: mean", "cell_measures": "area: areacella", "missing_value": 100000000000000000000, "original_name": "s01_s18", "standard_name": "mass_concentration_of_sulfate_dry_aerosol_in_air", "associated_files": "baseURL: http://cmip-pcmdi.llnl.gov/CMIP5/dataLocation gridspecFile: gridspec_aerosol_fx_CSIRO-Mk3-6-0_historicalNat_r0i0p0.nc areacella: areacella_fx_CSIRO-Mk3-6-0_historicalNat_r0i0p0.nc"}, "dimensions": ["time", "lev", "lat", "lon"], "endianness": "NC_ENDIAN_NATIVE"}, "lat_bnds": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0, 0], "storage": "NC_CONTIGUOUS"}, "attributes": {}, "dimensions": ["lat", "bnds"], "endianness": "NC_ENDIAN_NATIVE"}, "lev_bnds": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0, 0], "storage": "NC_CONTIGUOUS"}, "attributes": {"units": "1", "formula": "p = a*p0 + b*ps", "formula_terms": "p0: p0 a: a_bnds b: b_bnds ps: ps", "standard_name": "atmosphere_hybrid_sigma_pressure_coordinate"}, "dimensions": ["lev", "bnds"], "endianness": "NC_ENDIAN_NATIVE"}, "lon_bnds": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0, 0], "storage": "NC_CONTIGUOUS"}, "attributes": {}, "dimensions": ["lon", "bnds"], "endianness": "NC_ENDIAN_NATIVE"}, "time_bnds": {"type": "NC_DOUBLE", "deflate": {"level": 0, "state": false, "shuffle": false}, "chunking": {"sizes": [0, 0], "storage": "NC_CONTIGUOUS"}, "attributes": {}, "dimensions": ["time", "bnds"], "endianness": "NC_ENDIAN_NATIVE"}}, "attributes": {"title": "CSIRO-Mk3-6-0 model output prepared for CMIP5 natural-only", "source": "CSIRO-Mk3-6-0 2010 atmosphere: AGCM v7.3.8 (T63 spectral, 1.875 degrees EW x approx. 1.875 degrees NS, 18 levels); ocean: GFDL MOM2.2 (1.875 degrees EW x approx. 0.9375 degrees NS, 31 levels)", "comment": "Model output post-processed by the CSIRO-QCCCE CMIP5 Data post-processor for the IPCC Fifth Assessment.", "contact": "Project leaders: Stephen Jeffrey (Stephen.Jeffrey@qld.gov.au) & Leon Rotstayn (Leon.Rotstayn@csiro.au). Project team: Mark Collier (Mark.Collier@csiro.au: diagnostics & post-processing), Stacey Dravitzki (Stacey.Dravitzki@csiro.au: post-processing), Carlo Hamalainen (Carlo.Hamalainen@qld.gov.au: post-processing), Steve Jeffrey (Stephen.Jeffrey@qld.gov.au: modeling & post-processing), Chris Moeseneder (Chris.Moeseneder@csiro.au: post-processing), Leon Rotstayn (Leon.Rotstayn@csiro.au: modeling & atmos. physics), Jozef Syktus (Jozef.Syktus@qld.gov.au: model evaluation), Kenneth Wong (Kenneth.Wong@qld.gov.au: data management), Contributors: Martin Dix (Martin.Dix@csiro.au: tech. support), Hal Gordon (Hal.Gordon@csiro.au: atmos. dynamics), Eva Kowalczyk (Eva.Kowalczyk@csiro.au: land-surface), Siobhan O'Farrell (Siobhan.OFarrell@csiro.au: ocean & sea-ice)", "forcing": "Nat", "history": "Historical period was extended to Dec 2012 using RCP 4.5 forcing data. 2012-06-14T03:54:13Z CMOR rewrote data to comply with CF standards and CMIP5 requirements.", "product": "output", "model_id": "CSIRO-Mk3-6-0", "table_id": "Table aero (27 April 2011) ed6200860c3e8edd3aae46859c8efc50", "frequency": "mon", "experiment": "natural-only", "project_id": "CMIP5", "references": "a) Rotstayn, L., Collier, M., Dix, M., Feng, Y., Gordon, H., OFarrell, S., Smith, I. and Syktus, J. 2010. Improved simulation of Australian climate and ENSO-related climate variability in a GCM with an interactive aerosol treatment. Int. J. Climatology, vol 30(7), pp1067-1088, DOI 10.1002/joc.1952 b) Please refer to online documentation at: http://cmip-pcmdi.llnl.gov/cmip5/", "Conventions": "CF-1.4", "branch_time": 61320.00, "institution": "Australian Commonwealth Scientific and Industrial Research Organization (CSIRO) Marine and Atmospheric Research (Melbourne, Australia) in collaboration with the Queensland Climate Change Centre of Excellence (QCCCE) (Brisbane, Australia)", "realization": 8, "tracking_id": "8d701d47-369c-4a53-a3d0-1f004e268967", "cmor_version": "2.6.0", "institute_id": "CSIRO-QCCCE", "creation_date": "2012-06-14T03:54:13Z", "experiment_id": "historicalNat", "modeling_realm": "aerosol", "version_number": "v20110518", "physics_version": 1, "parent_experiment": "piControl", "parent_experiment_id": "piControl", "initialization_method": 1, "parent_experiment_rip": "r8i1p1"}, "dimensions": {"lat": {"length": 96, "unlimited": false}, "lev": {"length": 18, "unlimited": false}, "lon": {"length": 192, "unlimited": false}, "bnds": {"length": 2, "unlimited": false}, "time": {"length": 12, "unlimited": true}}}'::jsonb);

