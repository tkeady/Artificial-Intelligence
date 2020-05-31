;;Domain for cleaning floor tiles
;; A domain file for CMP2020M assignment 2018/2019

;; Define the name for this domain (needs to match the domain definition
;;   in the problem files)

(define (domain floor-tile)

	;; We only require some typing to make this plan faster. We can do without!
	(:requirements :typing)

	;; We have two types: robots and the tiles, both are objects
	(:types robot tile - object)

	;; define all the predicates as they are used in the probem files
	(:predicates  

    ;; described what tile a robot is at
    (robot-at ?r - robot ?x - tile)

    ;; indicates that tile ?x is above tile ?y
    (up ?x - tile ?y - tile)

    ;; indicates that tile ?x is below tile ?y
    (down ?x - tile ?y - tile)

    ;; indicates that tile ?x is right of tile ?y
    (right ?x - tile ?y - tile)

    ;; indicates that tile ?x is left of tile ?y
    (left ?x - tile ?y - tile)
    
    ;; indicates that a tile is clear (robot can move there)
    (clear ?x - tile)

    ;; indicates that a tile is cleaned
    (cleaned ?x - tile)
 	)

(:action clean-up
;; base parameters for robot
:parameters (?r - robot ?y - tile ?x - tile)
;; preconditions for clean up
;; the location of robot is found
;; the tile above is checked if robot in way or if is clear
;; same tile is checked if is already clean
:precondition (and 
               (robot-at ?r ?y)
               (up ?x ?y)
               (clear ?x)
               (not(cleaned ?x))
               )
;; if parameters are met the state is set to true, 
;; if state is false then it checks over and over
:effect (and 
         (cleaned ?x)
         )
)
  
(:action clean-down 
;; same as clean-up but checks below tile
;; base parameters for robot
:parameters (?r - robot ?y - tile ?x - tile)
;; preconditions for clean down
;; the location of robot is found
;; the tile above is checked if robot in way or if is clear
;; same tile is checked if is already clean
:precondition (and 
               (robot-at ?r ?y)
               (down ?x ?y)
               (clear ?x)
               (not(cleaned ?x))
               )
;; if parameters are met the state is set to true, 
;; if state is false then it checks over and over
:effect (and 
         (cleaned ?x)
         )
)

;; ACTIONS that need to be defined: for movement
;; upwards movement
(:action up 
         :parameters (?r - robot ?y - tile ?x - tile)
         :precondition (and
                        ;; check if robot is in the way
                         (robot-at ?r ?y)
                            ;; checks above
                            (up ?x ?y)
                            (clear ?x)
                        (not(cleaned ?x))
                            ;; check if tile is clean then moves
                           
                        )
         :effect (and
                  (robot-at ?r ?x)
                  (not(robot-at ?r ?y))
                  (not(clear ?x))
                  (clear ?y)
                  ;; sets old tile as clear
                  )
         )
  
;; left movement
(:action left 
         :parameters (?r - robot ?y - tile ?x - tile)
         :precondition (and
                        ;; check if robot is in the way
                        (robot-at ?r ?y)
                            ;; checks left
                            (left ?x ?y)
                            (clear ?x)
                        (not(cleaned ?x))
                            ;; check if tile is clean then moves
                            
                        )
         :effect (and
                  (robot-at ?r ?x)
                  (not(robot-at ?r ?y))
                  (not(clear ?x))
                  (clear ?y)
                  ;; sets old tile as clear
                  )
         )
  
;; down movement
(:action down 
         :parameters (?r - robot ?y - tile ?x - tile)
         :precondition (and
                        ;; check if robot is in the way
                        (robot-at ?r ?y)
                            ;; checks below 
                            (down ?x ?y)
                            (clear ?x)
                        (not(cleaned ?x))
                            ;; check if tile is clean then moves
                            
                        )
         :effect (and
                  (robot-at ?r ?x)
                  (not(robot-at ?r ?y))
                  (not(clear ?x))
                  (clear ?y)
                  ;; sets old tile as clear
                  )
         )
  
;; right movement
(:action right 
         :parameters (?r - robot ?y - tile ?x - tile)
         :precondition (and
                        ;; check if robot is in the way
                         (robot-at ?r ?y)
                            ;; checks right
                            (right ?x ?y)
                            (clear ?x)
                        (not(cleaned ?x))
                            ;; check if tile is clean then moves
                           
                        )
         :effect (and
                  (robot-at ?r ?x)
                  (not(robot-at ?r ?y))
                  (not(clear ?x))
                  (clear ?y)
                  ;; sets old tile as clear
                  )
         )
)

;; Thomas Keady 16608272

;; References

;; Helmert, M. (2019). An Introduction to PDDL. [online] Cs.toronto.edu. 
;; Available at: http://www.cs.toronto.edu/~sheila/2542/w09/A1/introtopddl2.pdf 
;; [Accessed 19 Apr. 2019].

;; Hrncir, J. (2019). PDDL (Planning Domain Definition Language). [online] cw.felk.cvut.cz. 
;; Available at: https://cw.felk.cvut.cz/w/_media/courses/a4m33pah/pddl.pdf
;; [Accessed 16 Apr. 2019].