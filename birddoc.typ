#let birddoc(
  title: "Title",
  subtitle: "Subtitle",
  groupname: none,
  academicyear: none,
  author: "Author",
  publisher: none,
  client: none,
  professor: none,
  background: none,
  place: none,
  date: none,
  accentcolor: blue,
  whitetextonaccentcolor: false,
  body,
) = {
  let textonaccentcolor = if whitetextonaccentcolor {
    white
  } else {
    black
  }

  set text(
    lang: "nl",
    font: "Fira Sans",
    size: 11pt,
  )

  set page(
    paper: "a4",
    margin: 2.5cm,
    // based on the physical page, so counter resets don't matter:
    // left-hand (even) pages show the author, right-hand (odd) pages the title
    header: context {
      let left-page = calc.even(here().page())
      align(center, if left-page { author } else { title })
    },
    footer: context align(center, counter(page).display()),
  )

  set par(
    justify: true,
  )

  show heading.where(level: 1): it => {
    // always start top-level headings on a new page
    pagebreak(weak: true)

    set text(
      size: 32pt,
    )

    v(2em)
    align(right, it)
    v(2em)
  }

  // Title page
  page(
    fill: accentcolor,
    numbering: none,
    header: none,
    footer: none,
  )[
    #set text(fill: textonaccentcolor)

    #align(top + center)[
      #v(5cm)
      #text(size: 32pt, weight: "bold")[#title]
      #v(2cm)
      #text(size: 18pt)[#subtitle]
    ]

    #align(bottom + center)[
      #text(size: 14pt)[#publisher]
    ]

    #counter(page).update(0)
  ]

  page(header: none, footer: none)[]

  page(header: none, footer: none)[
    #align(top + center)[
      #v(5cm)
      #text(size: 32pt, weight: "bold")[#title]
      #v(2cm)
      #text(size: 18pt)[#subtitle]
    ]

    #align(bottom + left)[
      #academicyear

      #groupname

      #author

      #client

      #professor

      #background

      #if place != none [
        #place, #date
      ] else [
        #date
      ]
    ]
  ]

  body
}

#let frontmatter(body) = {
  // start on a fresh page so the counter reset applies to this section
  pagebreak(weak: true)
  counter(heading).update(0)
  set heading(numbering: none)
  counter(page).update(1)
  set page(numbering: "I")
  body
}

#let mainmatter(body) = {
  // start on a fresh page so the counter reset applies to this section
  pagebreak(weak: true)
  counter(heading).update(0)
  set heading(numbering: "1.1")
  counter(page).update(1)
  set page(numbering: "1")
  body
}

#let appendix(body) = {
  // start on a fresh page so the counter reset applies to this section
  pagebreak(weak: true)
  counter(heading).update(0)
  set heading(numbering: "A.1")
  set page(numbering: "1")
  body
}
