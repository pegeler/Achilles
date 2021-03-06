/******************************************************************

# @file ACHILLES_indices.SQL
#
# Copyright 2018 Observational Health Data Sciences and Informatics
#
# This file is part of ACHILLES
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# @author Observational Health Data Sciences and Informatics
*******************************************************************/


/*******************************************************************

Achilles - indices for tables

*******************************************************************/
{DEFAULT @is_pdw = FALSE}

/**************************************************/
/***** Add indexes to Achilles results tables *****/
/**************************************************/


{@is_pdw}?{
CREATE CLUSTERED COLUMNSTORE INDEX ClusteredIndex_Achilles_results 
  ON @resultsDatabaseSchema.ACHILLES_results;
}


DROP INDEX IF EXISTS idx_ar_aid on @resultsDatabaseSchema.ACHILLES_results (analysis_id);
CREATE INDEX idx_ar_aid
  ON @resultsDatabaseSchema.ACHILLES_results (analysis_id);
  
DROP INDEX IF EXISTS idx_ar_s1 on @resultsDatabaseSchema.ACHILLES_results (stratum_1);
CREATE INDEX idx_ar_s1
  ON @resultsDatabaseSchema.ACHILLES_results (stratum_1);
  
CREATE INDEX idx_ar_s2
  ON @resultsDatabaseSchema.ACHILLES_results (stratum_2);
CREATE INDEX idx_ar_aid_s1
  ON @resultsDatabaseSchema.ACHILLES_results (analysis_id, stratum_1);
CREATE INDEX idx_ar_aid_s1234
  ON @resultsDatabaseSchema.ACHILLES_results (analysis_id, stratum_1, stratum_2, stratum_3, stratum_4);

CREATE INDEX idx_ard_aid
  ON @resultsDatabaseSchema.ACHILLES_results_dist (analysis_id);
CREATE INDEX idx_ard_s1
  ON @resultsDatabaseSchema.ACHILLES_results_dist (stratum_1);
CREATE INDEX idx_ard_s2
  ON @resultsDatabaseSchema.ACHILLES_results_dist (stratum_2);

/*********************************************/
/***** Index the hierarchy lookup table  *****/
/*********************************************/
CREATE INDEX idx_ch_cid
  ON @resultsDatabaseSchema.concept_hierarchy (concept_id);

CREATE INDEX idx_ch_tmap
  ON @resultsDatabaseSchema.concept_hierarchy (treemap);
