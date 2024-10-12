**Nume:** Manolache Maria-Catalina
**Grupă:** 313CAb

**Metode numerice pentru functii:**
Un proiect de metode numerice pentru functii care include conversia semnalelor
stereo in mono, generarea spectogramelor, crearea oscilatoarelor, aplicarea
filtrelor trece-jos, adaugarea reverberatiei, rezolvarea sistemelor Vandermonde,
calcularea similaritatii cosinus si recomandari bazate pe analiza datelor.

## Task 1: Numerical Music

* fisierul `stereo_to_mono.m` contine rezolvarea subtaskului
`"Storing signals. From stereo to mono"`. Se calculeaza media semnalului
stereo pentru a-l converti in mono, folosind functia `mean`. In continuare, se
normalizeaza semnalul mono prin impartirea la valoarea maxima in modul a
semnalului. Daca valoarea maxima este 0, semnalul este lasat neschimbat
pentru a evita impartirea la zero.

* fisierul `spectogram.m` contine rezolvarea subtaskului `"Spectogram"`.
In primul rand, se calculeaza numarul de ferestre prin impartirea
lungimii semnalului la dimensiunea ferestrei. Apoi, pentru fiecare fereastra,
se aplica functia Hann pentru a atenua marginile ferestrei, se calculeaza
Transformata Fourier a ferestrei si se stocheaza valoarea absoluta a partii
reale a rezultatului in matricea spectrogramei. In final, functia calculeaza
vectorii de frecventa si timp.

* fisierul `oscillator.m` contine rezolvarea subtaskului `"Oscillator"`.
Se creeaza un vector de timp si un semnal sinusoidal cu frecventa specificata.
Se calculeaza numarul total de esantioane si numarul de esantioane pentru
fazele de atac, decadere, sustinere si eliberare. Pentru fiecare faza, se
genereaza un envelope corespunzator. Se creeaza envelope-ul total prin
concatenarea celorlaltor envelope-uri, apoi se aplica produsul Hadamard intre
acest envelope si semnalul sinusoidal.

* fisierul `low_pass.m` contine rezolvarea subtaskului `"Low Pass Filter"`.
Se calculeaza Transformata Fourier a semnalului. Dupa, se genereaza un vector
de frecvente corespunzator semnalului. Se creeaza un vector masca, ce are
valoarea 1 pentru frecventele mai mici decat frecventa de cutoff si 0 pentru
frecventele mai mari. Aceasta masca este aplicata Transformatei Fourier a
semnalului prin aplicarea produsului Hadamard. Apoi, se calculeaza Transformata
Fourier inversa pentru a obtine semnalul filtrat. In final, semnalul filtrat
este normalizat prin impartirea la valoarea maxima absoluta a semnalului.

* fisierul `apply_reverb.m` contine rezolvarea subtaskului `"Reverb"`.
Mai intai, programul se asigura ca raspunsul impulsului este in mono prin
apelarea functiei stereo_to_mono. Apoi, se calculeaza convolutia intre semnal
si raspunsul impulsului folosind functia `fftconv`. In final, semnalul rezultat
este normalizat prin impartirea la valoarea maxima absoluta a semnalului.

## Task 2: Robotzii

* fisierul `parse_data.m` realizeaza parsarea unui fiser de intrare cu numele
dat ca parametru. Se deschide fisierul sursa pentru citirea datelor, apoi se
citesc n si vectorii x si y. Apoi, se inchide fisierul.

* fisierul `vandermonde.m` rezolva sistemul de ecuatii Vandermonde pentru
a afla vectorul de coeficienti coef.  Mai intai, programul calculeaza lungimea
vectorului x si initializeaza matricea Vandermonde A cu zero. Dupa, pentru
fiecare linie a matricei, seteaza primul element la 1 si calculeaza restul
elementelor ca puteri ale elementului corespunzator din vectorul x. In final,
se rezolva sistemul de ecuatii liniare A * coef = y pentru a obtine
vectorul de coeficienti coef.

* fisierul `P_vandermonde.m` calculeaza valorile polinomului Vandermonde
intr-un anumit numar de puncte. Functia initializeaza vectorul y_interp cu
zero, apoi pentru fiecare punct din x_interp, calculeaza valoarea polinomului.
Daca un coeficient nu exista, este considerat a fi zero. Rezultatul este
vectorul y_interp de valori ale polinomului la punctele din x_interp.

## Task 3: Recommendations

* fisierul `cosine_similarity.m` contine rezolvarea subtaskului
`"Cosine Similarity"`. In primul rand, se normalizeaza vectorii.
In continuare, se calculeaza produsul scalar al celor doua vectori
si se imparte la produsul normelor lor pentru a obtine similaritatea cosinus.
Similaritatea cosinus este o masura a unghiului dintre cei doi vectori, cu
valori intre -1 si 1. O valoare de 1 indica faptul ca vectorii sunt similari,
o valoare de -1 indica faptul ca vectorii sunt exact opusi, iar o valoare de 0
indica faptul ca vectorii sunt ortogonali.

* fisierul `preprocess.m` contine rezolvarea subtaskului `"Preprocessing"`.
Mai intai, se calculeaza dimensiunile matricei si se numara liniile care au cel
putin min_reviews recenzii. Dupa, se initializeaza o noua matrice cu numarul de
linii calculat si se umple aceasta matrice cu liniile din matricea originala
care indeplinesc criteriul. Daca un utilizator (reprezentat de o linie din
matrice) are cel putin min_reviews recenzii (reprezentate de valori mai mari
decat 0 in matrice), linia respectiva este adaugata in noua matrice.
Rezultatul este matricea redusa reduced_mat.

* fisierul `read_mat.m` parseaza fisierul .csv dat si returneaza o matrice.

* fisierul `recommendations.m` contine rezolvarea subtaskului `"Recommendations"`
Mai intai, se incarca matricea din fisierul .csv. Apoi, se preproceseaza
matricea pentru a elimina liniile cu mai putin de min_reviews recenzii.
Se calculeaza SVD redus al matricei si se initializeaza vectorul de similaritati.
Se calculeaza similaritatea cosinus intre tema apreciata si toate celelalte teme.
Se sorteaza temele in functie de similaritate in ordine descrescatoare. In final,
se returneaza indicii temelor recomandate, excluzand tema data.
