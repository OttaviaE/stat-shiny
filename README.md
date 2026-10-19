# stat-shiny

Materials for a short course on [Shiny](https://shiny.posit.co/r/) (6 academic hours, 2 days): the logic of Shiny, input widgets, outputs, reactivity, `eventReactive()`, and the deploy of your own app on Posit Connect Cloud.

**Website:** <https://ottaviae.github.io/stat-shiny/>

## Structure

```text
├── index.qmd            home page and course plan
├── day1/                Day 1 · the logic of Shiny (lessons 1–7)
├── day2/                Day 2 · GitHub and deploy (lessons 8–9)
├── extras/              Going further (layouts, update inputs, interactive plots, downloads)
├── apps/                every app of the course, as a folder with ui.R + server.R
├── data/                example CSV files for the upload
└── _extensions/         Quarto shinylive extension (live apps in the browser)
```

The live apps in the pages are **included from the `apps/` folder** (`{{< include ../apps/.../ui.R >}}`): edit an app there, and both the downloadable app and the page change.

## Render the website

The live examples use [shinylive](https://posit-dev.github.io/r-shinylive/) (Shiny running in the browser with webR), so no Shiny server is needed and GitHub Pages is enough.

1. Once: `install.packages("shinylive")`
2. In RStudio, *Build* → *Render Website* (or `quarto render` in the terminal)
3. The site is written to `docs/`: commit and push it
4. On GitHub: *Settings* → *Pages* → *Deploy from a branch* → `main` / `/docs`

To rebuild the zip with all the apps (after changing them):

```r
zip("apps.zip", list.files("apps", recursive = TRUE, full.names = TRUE))
```
