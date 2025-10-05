# TP2 – Programmation des éléments finis P1 en 1D

**Auteur :** Loubna Taleb  
**Date :** 03 Décembre 2023  

## 🎯 Objectif
Ce TP prolonge le **TP1** en introduisant deux types de conditions aux limites :  
- **Problème de Neumann** (conditions sur les dérivées aux bords)  
- **Problème de Dirichlet** (conditions sur les valeurs aux bords)  

L’objectif est de comparer la formulation variationnelle, l’implémentation numérique et les résultats obtenus pour différents maillages.

---

## 📐 Étapes principales

### 1. Problème de Neumann
- Équation considérée :  
  

\[
  -u''(x) + u(x) = f(x), \quad u'(0) = u_0, \; u'(1) = u_1
  \]


- Formulation variationnelle adaptée avec prise en compte des termes de bord.  
- Implémentation en **MATLAB** avec ajout des conditions limites :  
  ```matlab
  F(n+1) = F(n+1) + u1;
  F(1)   = F(1) - u0;
