# Proyecto de fin de módulo: Kaggle Titanic Challenge

![Github language](https://img.shields.io/badge/language-r-blue)
![Github contributors](https://img.shields.io/github/contributors/nobaluis/bedu-r-project)

## Descripción

Este repositorio contiene los archivos referentes al proyecto del Módulo 02 (`R`) del curso de Santander Data Science de BEDU del **equipo 22**. Adicional a este repositorio se creó un [notebook](https://nobaluis.github.io/bedu-r-project/) donde se encuentran todos los detalles de la implementación.

## Requerimientos

El primer requisito es tener instalado `R` y `R Studio`.

Además es necesario instalar algunas dependencias:

    install.packages(c("dplyr","rsample","ggplot2","visdat","e1071","caret","kernlab","mlbench"))

Y otras dependencias es necesario compilarlas. Esto porque trabajamos con las versión de desarrollo:

    require("devtools")
    install_github("tidymodels/recipes")

## Estructura del proyecto

-   El directorio `data` contiene los datasets del reto.

-   El directorio `images` contiene las imágenes para el notebook.

-   El archivo `project.R` contiene el código para la resolución del problema.

-   El archivo `notebook.rmd` es un notebook escrito en Rmarkdown y contiene las explicacion paso a paso del desarrollo de la solución.

## Integrantes

-   [Luis Castillo](https://github.com/nobaluis) - [luis.castillo\@cinvestav.mx](mailto:luis.castillo@cinvestav.mx)
-   [Paulo Hernández](https://github.com/PauloHJ) - [A01207531\@itesm.mx](mailto:A01207531@itesm.mx)
-   [Omar Martínez](https://github.com/omarmglz89) - [omarmglz\@hotmail.com](mailto:omarmglz@hotmail.com)
-   [Emiliano Padilla](https://github.com/ephetpv) - [emilianopadilla03\@gmail.com](mailto:emilianopadilla03@gmail.com)
