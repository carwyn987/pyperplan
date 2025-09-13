;; logistics domain Typed version.
;;

(define (domain logistics)
  (:requirements :strips :typing) 
  (:types truck
          semi
          airplane - vehicle
          package
          vehicle - physobj
          airport
          depot
          location - place
          city
          place 
          physobj - object)
  
  (:predicates 	(in-city ?loc - place ?city - city)
		(at ?obj - physobj ?loc - place)
		(in ?pkg - package ?veh - vehicle)
    (highway ?d1 ?d2 - depot))
  
(:action LOAD-TRUCK
   :parameters    (?pkg - package ?truck - truck ?loc - place)
   :precondition  (and (at ?truck ?loc) (at ?pkg ?loc))
   :effect        (and (not (at ?pkg ?loc)) (in ?pkg ?truck)))

(:action LOAD-AIRPLANE
  :parameters   (?pkg - package ?airplane - airplane ?loc - place)
  :precondition (and (at ?pkg ?loc) (at ?airplane ?loc))
  :effect       (and (not (at ?pkg ?loc)) (in ?pkg ?airplane)))

(:action UNLOAD-TRUCK
  :parameters   (?pkg - package ?truck - truck ?loc - place)
  :precondition (and (at ?truck ?loc) (in ?pkg ?truck))
  :effect       (and (not (in ?pkg ?truck)) (at ?pkg ?loc)))

(:action UNLOAD-AIRPLANE
  :parameters    (?pkg - package ?airplane - airplane ?loc - place)
  :precondition  (and (in ?pkg ?airplane) (at ?airplane ?loc))
  :effect        (and (not (in ?pkg ?airplane)) (at ?pkg ?loc)))

(:action DRIVE-TRUCK
  :parameters (?truck - truck ?loc-from - place ?loc-to - place ?city - city)
  :precondition
   (and (at ?truck ?loc-from) (in-city ?loc-from ?city) (in-city ?loc-to ?city))
  :effect
   (and (not (at ?truck ?loc-from)) (at ?truck ?loc-to)))

; ADDED DRIVE-SEMI
(:action DRIVE-SEMI
  :parameters (?semi - semi ?dep-from ?dep-to - depot)
  :precondition (and (at ?semi ?dep-from) (highway ?dep-from ?dep-to))
  :effect (and (not (at ?semi ?dep-from)) (at ?semi ?dep-to)))

; ADDED LOAD-SEMI
(:action LOAD-SEMI
  :parameters (?semi - semi ?dep - depot ?pkg - package)
  :precondition (and (at ?semi ?dep) (at ?pkg ?dep))
  :effect (and (not (at ?pkg ?dep)) (in ?pkg ?semi))
)

; ADDED UNLOAD-SEMI
(:action UNLOAD-SEMI
  :parameters (?semi - semi ?dep - depot ?pkg - package)
  :precondition (and (at ?semi ?dep) (in ?pkg ?semi))
  :effect (and (not (in ?pkg ?semi)) (at ?pkg ?dep)))

(:action FLY-AIRPLANE
  :parameters (?airplane - airplane ?loc-from - airport ?loc-to - airport)
  :precondition
   (at ?airplane ?loc-from)
  :effect
   (and (not (at ?airplane ?loc-from)) (at ?airplane ?loc-to)))
)
