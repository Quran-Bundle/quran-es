# The quran-es package
Copyright © 2024

The [`quran-es`](https://ctan.org/pkg/quran-es) package extends the [`quran`](https://ctan.org/pkg/quran) LaTeX package, enhancing the typesetting of the Holy Quran with integrated Spanish translations. It includes translations by renowned scholars such as [`Raúl González Bórnez`](https://tanzil.net/#trans/es.bornez/1:1), [`Julio Cortes`](https://tanzil.net/#trans/es.cortes/1:1), and [`Muhammad Isa García`](https://tanzil.net/#trans/es.garcia/1:1).


### Sample

```
\documentclass{article}

\usepackage{arabxetex}
\usepackage{quran-es}

\begin{document}

    \begin{arab}[utf]
        \quransurah[112]
    \end{arab}
    {\quransurahes[112]}

\end{document}
```

### Documentation
For more details, please refer to [this link](http://mirrors.ctan.org/macros/unicodetex/latex/quran-es/doc/quran-es-doc.pdf).

## License

[The LaTeX project public license (LPPL), version 1.3c](https://www.latex-project.org/lppl/lppl-1-3c/)

## Citation

```tex
@misc{quran,
  title={{quran}: An easy way to typeset any part of The Holy Quran},
  url={https://ctan.org/pkg/quran},
  note={Software available from https://github.com/javadr/quran},
  author={Javad Razavian},
  year={2015},
}
```
