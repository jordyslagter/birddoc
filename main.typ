#import "birddoc.typ": *

#show: birddoc.with(
  title: "Test",
  subtitle: "Test subtitle",
  author: "Voornaam Achternaam (Studentnummer)",
  publisher: "Publisher",
  groupname: none,
  client: "Achternaam, Voornaam, Titulatuur",
  professor: "Achternaam, Voornaam, Titulatuur",
  place: "Plaats",
  date: "dd-mm-yyyy",
)


#frontmatter[
  #include "frontmatter/00-voorwoord.typ"
  #include "frontmatter/01-samenvatting.typ"
  #outline()
]

#mainmatter[
  #include "mainmatter/00-inleiding.typ"
  #include "mainmatter/01-methode.typ"
]

#appendix[
  #include "appendix/00-bijlage1.typ"
]

