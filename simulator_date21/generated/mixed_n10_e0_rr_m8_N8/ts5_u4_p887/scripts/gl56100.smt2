; GENERATED FILE: DO NOT EDIT
(set-logic ALL)
(set-option :produce-models true)

(declare-const m1 Int) ; h = 6, c = 106, r = 37
(declare-const m2 Int) ; h = 8, c = 171, r = 52
(declare-const m3 Int) ; h = 6, c = 146, r = 81
(declare-const m4 Int) ; h = 1, c = 175, r = 37
(declare-const m5 Int) ; h = 3, c = 142, r = 59
(declare-const m6 Int) ; h = 8, c =   8, r = 53

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

(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 1) 6 0) (ite (= m2 1) 8 0)) (ite (= m3 1) 6 0)) (ite (= m4 1) 1 0)) (ite (= m5 1) 3 0)) (ite (= m6 1) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 2) 6 0) (ite (= m2 2) 8 0)) (ite (= m3 2) 6 0)) (ite (= m4 2) 1 0)) (ite (= m5 2) 3 0)) (ite (= m6 2) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 3) 6 0) (ite (= m2 3) 8 0)) (ite (= m3 3) 6 0)) (ite (= m4 3) 1 0)) (ite (= m5 3) 3 0)) (ite (= m6 3) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 4) 6 0) (ite (= m2 4) 8 0)) (ite (= m3 4) 6 0)) (ite (= m4 4) 1 0)) (ite (= m5 4) 3 0)) (ite (= m6 4) 8 0)) 8 ))
(assert ( <= (+ (+ (+ (+ (+ (ite (= m1 5) 6 0) (ite (= m2 5) 8 0)) (ite (= m3 5) 6 0)) (ite (= m4 5) 1 0)) (ite (= m5 5) 3 0)) (ite (= m6 5) 8 0)) 8 ))


(assert (>= s1 100))
(assert (>= s1 (+ (+ (+ (+ (+ (ite (= m1 1) 37 0) (ite (= m2 1) 52 0)) (ite (= m3 1) 81 0)) (ite (= m4 1) 37 0)) (ite (= m5 1) 59 0)) (ite (= m6 1) 53 0)) ))
(assert (>= s2 100))
(assert (>= s2 (+ (+ (+ (+ (+ (ite (= m1 2) 37 0) (ite (= m2 2) 52 0)) (ite (= m3 2) 81 0)) (ite (= m4 2) 37 0)) (ite (= m5 2) 59 0)) (ite (= m6 2) 53 0)) ))
(assert (>= s3 100))
(assert (>= s3 (+ (+ (+ (+ (+ (ite (= m1 3) 37 0) (ite (= m2 3) 52 0)) (ite (= m3 3) 81 0)) (ite (= m4 3) 37 0)) (ite (= m5 3) 59 0)) (ite (= m6 3) 53 0)) ))
(assert (>= s4 100))
(assert (>= s4 (+ (+ (+ (+ (+ (ite (= m1 4) 37 0) (ite (= m2 4) 52 0)) (ite (= m3 4) 81 0)) (ite (= m4 4) 37 0)) (ite (= m5 4) 59 0)) (ite (= m6 4) 53 0)) ))
(assert (>= s5 100))
(assert (>= s5 (+ (+ (+ (+ (+ (ite (= m1 5) 37 0) (ite (= m2 5) 52 0)) (ite (= m3 5) 81 0)) (ite (= m4 5) 37 0)) (ite (= m5 5) 59 0)) (ite (= m6 5) 53 0)) ))

(assert (>= l1 0))
(assert (or (not (= m1 1)) (>= l1 (* 106 s1))))
(assert (or (not (= m2 1)) (>= l1 (* 171 s1))))
(assert (or (not (= m3 1)) (>= l1 (* 146 s1))))
(assert (or (not (= m4 1)) (>= l1 (* 175 s1))))
(assert (or (not (= m5 1)) (>= l1 (* 142 s1))))
(assert (or (not (= m6 1)) (>= l1 (*   8 s1))))
(assert (>= l2 0))
(assert (or (not (= m1 2)) (>= l2 (* 106 s2))))
(assert (or (not (= m2 2)) (>= l2 (* 171 s2))))
(assert (or (not (= m3 2)) (>= l2 (* 146 s2))))
(assert (or (not (= m4 2)) (>= l2 (* 175 s2))))
(assert (or (not (= m5 2)) (>= l2 (* 142 s2))))
(assert (or (not (= m6 2)) (>= l2 (*   8 s2))))
(assert (>= l3 0))
(assert (or (not (= m1 3)) (>= l3 (* 106 s3))))
(assert (or (not (= m2 3)) (>= l3 (* 171 s3))))
(assert (or (not (= m3 3)) (>= l3 (* 146 s3))))
(assert (or (not (= m4 3)) (>= l3 (* 175 s3))))
(assert (or (not (= m5 3)) (>= l3 (* 142 s3))))
(assert (or (not (= m6 3)) (>= l3 (*   8 s3))))
(assert (>= l4 0))
(assert (or (not (= m1 4)) (>= l4 (* 106 s4))))
(assert (or (not (= m2 4)) (>= l4 (* 171 s4))))
(assert (or (not (= m3 4)) (>= l4 (* 146 s4))))
(assert (or (not (= m4 4)) (>= l4 (* 175 s4))))
(assert (or (not (= m5 4)) (>= l4 (* 142 s4))))
(assert (or (not (= m6 4)) (>= l4 (*   8 s4))))
(assert (>= l5 0))
(assert (or (not (= m1 5)) (>= l5 (* 106 s5))))
(assert (or (not (= m2 5)) (>= l5 (* 171 s5))))
(assert (or (not (= m3 5)) (>= l5 (* 146 s5))))
(assert (or (not (= m4 5)) (>= l5 (* 175 s5))))
(assert (or (not (= m5 5)) (>= l5 (* 142 s5))))
(assert (or (not (= m6 5)) (>= l5 (*   8 s5))))

(assert (= (+ (+ (+ (+ l1 l2) l3) l4) l5) 56100 ))

(check-sat)
(get-model)
