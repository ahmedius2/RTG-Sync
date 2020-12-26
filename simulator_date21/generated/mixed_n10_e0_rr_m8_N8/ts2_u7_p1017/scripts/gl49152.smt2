; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 3, c = 200, r = 46
(declare-const m2 Int) ; h = 3, c = 162, r = 37
(declare-const m3 Int) ; h = 3, c = 133, r = 60
(declare-const m4 Int) ; h = 4, c = 131, r = 78
(declare-const m5 Int) ; h = 5, c = 103, r = 74
(declare-const m6 Int) ; h = 2, c =   5, r = 81

(declare-const s1 Int)
(declare-const s2 Int)
(declare-const s3 Int)
(declare-const s4 Int)
(declare-const s5 Int)

(declare-const l1 Int)
(declare-const l2 Int)
(declare-const l3 Int)
(declare-const l4 Int)
(declare-const l5 Int)

(assert (and (<= 1 m1) (<= m1 5))) ; 1 <= m1 <= 5
(assert (and (<= 1 m2) (<= m2 5))) ; 1 <= m2 <= 5
(assert (and (<= 1 m3) (<= m3 5))) ; 1 <= m3 <= 5
(assert (and (<= 1 m4) (<= m4 5))) ; 1 <= m4 <= 5
(assert (and (<= 1 m5) (<= m5 5))) ; 1 <= m5 <= 5
(assert (and (<= 1 m6) (<= m6 5))) ; 1 <= m6 <= 5

(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 1) 3 0) (ite (= m2 1) 3 0)) (ite (= m3 1) 3 0)) (ite (= m4 1) 4 0)) (ite (= m5 1) 5 0)) (ite (= m6 1) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 2) 3 0) (ite (= m2 2) 3 0)) (ite (= m3 2) 3 0)) (ite (= m4 2) 4 0)) (ite (= m5 2) 5 0)) (ite (= m6 2) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 3) 3 0) (ite (= m2 3) 3 0)) (ite (= m3 3) 3 0)) (ite (= m4 3) 4 0)) (ite (= m5 3) 5 0)) (ite (= m6 3) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 4) 3 0) (ite (= m2 4) 3 0)) (ite (= m3 4) 3 0)) (ite (= m4 4) 4 0)) (ite (= m5 4) 5 0)) (ite (= m6 4) 2 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 5) 3 0) (ite (= m2 5) 3 0)) (ite (= m3 5) 3 0)) (ite (= m4 5) 4 0)) (ite (= m5 5) 5 0)) (ite (= m6 5) 2 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (ite (= m1 1) 46 0) (ite (= m2 1) 37 0)) (ite (= m3 1) 60 0)) (ite (= m4 1) 78 0)) (ite (= m5 1) 74 0)) (ite (= m6 1) 81 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (ite (= m1 2) 46 0) (ite (= m2 2) 37 0)) (ite (= m3 2) 60 0)) (ite (= m4 2) 78 0)) (ite (= m5 2) 74 0)) (ite (= m6 2) 81 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (ite (= m1 3) 46 0) (ite (= m2 3) 37 0)) (ite (= m3 3) 60 0)) (ite (= m4 3) 78 0)) (ite (= m5 3) 74 0)) (ite (= m6 3) 81 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (ite (= m1 4) 46 0) (ite (= m2 4) 37 0)) (ite (= m3 4) 60 0)) (ite (= m4 4) 78 0)) (ite (= m5 4) 74 0)) (ite (= m6 4) 81 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (ite (= m1 5) 46 0) (ite (= m2 5) 37 0)) (ite (= m3 5) 60 0)) (ite (= m4 5) 78 0)) (ite (= m5 5) 74 0)) (ite (= m6 5) 81 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 200 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 162 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 133 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 131 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 103 s1))))
(assert (or (not (= m6 1)) (>= l1 (*   5 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 200 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 162 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 133 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 131 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 103 s2))))
(assert (or (not (= m6 2)) (>= l2 (*   5 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 200 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 162 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 133 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 131 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 103 s3))))
(assert (or (not (= m6 3)) (>= l3 (*   5 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 200 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 162 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 133 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 131 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 103 s4))))
(assert (or (not (= m6 4)) (>= l4 (*   5 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 200 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 162 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 133 s5))))
(assert (or (not (= m4 5)) (>= l5 (* 131 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 103 s5))))
(assert (or (not (= m6 5)) (>= l5 (*   5 s5))))

(assert (= (+ (+ (+ (+ l1 l2) l3) l4) l5) 49152 ))

(check-sat)
(get-model)
