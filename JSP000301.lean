import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Tactic

namespace JSP000301

/-- A natural number is powerful when the square of each prime divisor divides it. -/
def Powerful (n : ℕ) : Prop := ∀ p : ℕ, p.Prime → p ∣ n → p ^ 2 ∣ n

theorem powerful_12167 : Powerful 12167 := by
  intro p hp hd
  have hpow : p ∣ (23 : ℕ) ^ 3 := by norm_num at hd ⊢; exact hd
  have heq : p = 23 := Nat.prime_eq_prime_of_dvd_pow hp (by norm_num) hpow
  subst p
  norm_num

theorem powerful_12168 : Powerful 12168 := by
  intro p hp hd
  have hprod : p ∣ (2 : ℕ) ^ 3 * 3 ^ 2 * 13 ^ 2 := by
    norm_num at hd ⊢
    exact hd
  rcases hp.dvd_mul.mp hprod with hab | hc
  · rcases hp.dvd_mul.mp hab with ha | hb
    · have heq : p = 2 := Nat.prime_eq_prime_of_dvd_pow hp (by norm_num) ha
      subst p
      norm_num
    · have heq : p = 3 := Nat.prime_eq_prime_of_dvd_pow hp (by norm_num) hb
      subst p
      norm_num
  · have heq : p = 13 := Nat.prime_eq_prime_of_dvd_pow hp (by norm_num) hc
    subst p
    norm_num

theorem nonsquare_between (n : ℕ) (hlo : 12100 < n) (hhi : n < 12321) :
    ¬ IsSquare n := by
  rintro ⟨r, hr⟩
  have hrlo : 110 < r := by nlinarith
  have hrhi : r < 111 := by nlinarith
  omega

theorem conjecture_false :
    ¬ ∀ n : ℕ, 0 < n → Powerful n → Powerful (n + 1) →
      IsSquare n ∨ IsSquare (n + 1) := by
  intro h
  rcases h 12167 (by norm_num) powerful_12167 powerful_12168 with hs | hs
  · exact nonsquare_between 12167 (by norm_num) (by norm_num) hs
  · exact nonsquare_between 12168 (by norm_num) (by norm_num) hs

#print axioms conjecture_false

end JSP000301
