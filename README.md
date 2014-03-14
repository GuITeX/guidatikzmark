guidatikzmark
=============

Contiene i sorgenti LaTeX della Guida Tematica Introduzione all'uso della macro tikzmark.
Per compilare il documento è necessaria la classe `guidatematica.cls`, il relativo stile
bibliografico `guidatematica.bst` ed i loghi `LogoGuITtondo.pdf` e `LogoGuITlineare.pdf`
disponibili all'indirizzo https://github.com/GuITeX/guidetematiche.

Questa guida è rilasciata con licenza CC BY-NC-SA 3.0 (si veda come
riferimento: http://creativecommons.org/licenses/by-nc-sa/3.0/) o versioni
successive.

Per compilare il documento si usi:
````
$ make IntroTikZmark
````
da terminale. Per rimuovere i file ausiliari:
````
$ make clean
````
o in alternativa:
````
$ make distclean
````
che rimuove anche i file PDF ausiliari fatta eccezione per il file PDF della guida. Invece:
````
$ make cleanall
````
rimuove anche il file della guida