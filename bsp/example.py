#!/usr/bin/python

import requests, sys

def get_homology(gene): 
  server = "http://parasite.wormbase.org"
  ext = "/rest-10/homology/id/%s"%gene
   
  r = requests.get(server+ext, headers={ "Content-Type" : "application/json", "Accept" : ""})
   
  if not r.ok:
    r.raise_for_status()
    sys.exit()
   
  return r.json()["data"][0]["homologies"]

def get_homologous_species(gene):
  return [homology["target"]["species"] for homology in get_homology(gene)]

genes= [ "Smp_000090",
  "Smp_000120",
  "Smp_000180",
  "Smp_000210",
  "Smp_000220",
  "Smp_000250",
  "Smp_000330",
  "Smp_000380",
  "Smp_000400",
  "Smp_000520",
  "Smp_000030",
  "Smp_000040",
  "Smp_000050",
  "Smp_000070",
  "Smp_000080",
  "Smp_000130",
  "Smp_000140",
  "Smp_000150",
  "Smp_000160",
  "Smp_000170",
  "Smp_000320",
  "Smp_001085",
  "Smp_002080",
  "Smp_002180",
  "Smp_002550",
  "Smp_000020",
  "Smp_000075",
  "Smp_000100",
  "Smp_000110",
  "Smp_000370"]

for gene in genes:
  homologous_species=get_homologous_species(gene)
  if "caenorhabditis_japonica_prjna12591" in homologous_species and "schistosoma_haematobium_prjna78265" in homologous_species:
    print gene

 


