(define (problem logistics-10-0)
(:domain logistics)
(:objects
  apn1 apn2 apn3 apn4 - airplane
  smi1 smi2 smi3 smi4 - semi
  dep1 dep2 dep3 dep4 - depot
  apt1 apt4 apt3 apt2 - airport
  pos4 pos3  pos2  pos1 - location
  cit4 cit3 cit2 cit1 - city 
  tru4 tru3 tru2 tru1 - truck 
  obj43 obj42 obj41 obj33 obj32 obj31 obj23 obj22 obj21 obj13 obj12 obj11 - package)

(:init 
 (at tru1 pos1)
 (at obj11 pos1) (at obj12 pos1) (at obj13 pos1) (at tru2 pos2) (at obj21 pos2)
 (at obj22 pos2) (at obj23 pos2) (at tru3 pos3) (at obj31 pos3) (at obj32 pos3)
 (at obj33 pos3) (at tru4 pos4) (at obj41 pos4) (at obj42 pos4) (at obj43 pos4)
 (in-city pos1 cit1) (in-city apt1 cit1) (in-city pos2 cit2) (in-city apt2 cit2)
 (in-city pos3 cit3) (in-city apt3 cit3) (in-city pos4 cit4) (in-city apt4 cit4)

; HIGHWAYS 
 (highway dep1 dep2) (highway dep2 dep1)
 (highway dep1 dep3) (highway dep3 dep1)
 (highway dep3 dep4) (highway dep4 dep3)

; (highway dep2 dep3) (highway dep3 dep2)
; (highway dep2 dep4) (highway dep4 dep2)
; (highway dep1 dep4) (highway dep4 dep1)

; AIRPLANES
 (at apn1 apt1)
; (at apn2 apt2)
; (at apn3 apt3)
; (at apn4 apt4)

; SEMI'S
 (at smi1 dep1)
 (at smi2 dep2)
 (at smi3 dep3)
 (at smi4 dep4) 

; DEPOTS 
 (in-city dep1 cit1)
 (in-city dep2 cit2)
 (in-city dep3 cit3)
 (in-city dep4 cit4)
)

(:goal (and (at obj31 pos3) (at obj33 apt3) (at obj41 apt3) (at obj23 pos4)
            (at obj11 pos3) (at obj22 apt2) (at obj12 apt1) (at obj21 pos4)
            (at obj42 pos4) (at obj32 pos1)))
)