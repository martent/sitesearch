# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

recommendations = [
  ["Hrutan", "https://minasidor.malmo.se/", "hrutan, inloggning, logga, hr"],
  ["Epost", "http://epost.malmo.se", "epost, outlook, inloggning, logga"],
  ["Vikariebanken", "https://malmo.vikariebanken.se/", "vikariebank"],
  ["Lediga jobb", "http://www.malmo.se/Medborgare/Jobb--praktik/Lediga-jobb.html", "lediga, jobb"],
  ["Karta", "http://www.malmo.se/karta", "karta, stadsatlas"],
  ["Boendeparkering", "http://www.malmo.se/boendeparkering", "boendeparkering"],
  ["Ansökan om boendeparkering", "http://www.malmo.se/Medborgare/Stadsplanering--trafik/Parkering/Boendeparkering.html", "boendeparkering"],
  ["Gatukontoret", "http://www.malmo.se/Kommun--politik/Om-oss/Forvaltningar--bolag/Gatukontoret.htm", "gatukontoret"],
  ["Felanmäla något i staden", "http://www.malmo.se/Medborgare/Stadsplanering--trafik/Skotsel--underhall/Felanmalan.html", "gatukontoret, felanmäla"],
  ["Ung i sommar", "http://www.malmo.se/Medborgare/Jobb--praktik/Lediga-jobb/Jobb-for-unga/Sommarjobb/Ung-i-Sommar.html", "ung, sommarjobb, sommarpraktik"],
  ["Komvux", "http://www.malmo.se/Medborgare/Forskola--utbildning/Utbildning-for-vuxna.html", "komvux, vuxenutbildning"],
  ["Skolmat", "http://www.malmo.se/Medborgare/Forskola--utbildning/Grundskola/Skolmat.html", "skolmat"],
  ["Stadsområde", "http://www.malmo.se/Kommun--politik/Stadsomraden.html", "stadsområde"],
  ["Loppmarknader", "http://www.malmo.se/Medborgare/Kultur--noje/Festivaler--utomhusnojen/Loppmarknader.html", "loppis, loppmarknad"],
  ["Boka loppisplats", "https://webapps03.malmo.se/loppmarknader/", "loppis, loppmarknad"],
  ["Sociala resursförvaltningen", "http://www.malmo.se/Kommun--politik/Om-oss/Forvaltningar--bolag/Sociala-resursforvaltningen/", "sociala resunrsförvaltningen, srf"],
  ["Kulturproceduren", "http://www.malmo.se/kulturproceduren?url=-1341821184%2Fkp%2F&sv.url=12.4ecfe75e1245d916760800028240", "kulturproceduren"],
  ["Detaljplaner", "http://www.malmo.se/Medborgare/Stadsplanering--trafik/Stadsplanering--visioner/Detaljplaner.html", "detaljplaner"],
  ["Blanketter", "http://www.malmo.se/Blanketter--tjanster.html", "blanketter"],
  ["Värnhemsskolan", "http://www.malmo.se/Medborgare/Forskola--utbildning/Gymnasieskola/Kommunala-gymnasieskolor/Varnhemsskolan.html", "värnhemsskolan"],
  ["Vägledningscentrum", "http://www.malmo.se/vagledningscentrum", "vägledningscentrum"],
  ["Bbliotek", "http://www.malmo.se/Medborgare/Biblioteken/Vara-bibliotek.html", "stadsbiblioteket, huvudbiblioteket, bibliotek, bibblan"],
  ["Cykelkarta", "http://www.malmo.se/Medborgare/Stadsplanering--trafik/Trafik--hallbart-resande/Nar-du-cyklar/Rundturer--kartor.html", "cykelkarta"],
  ["Uphandling", "http://www.malmo.se/Foretagare/Offentliga-upphandlingar/Aktuella-upphandlingar.html", "upphandling"],
  ["Temalekplatser", "http://www.malmo.se/Medborgare/Idrott--fritid/Ung-Fritid/Lekplatser.html", "temalekplatser, lekplatser"],
  ["Stadsbyggnadskontoret", "http://www.malmo.se/stadsbyggnadskontoret", "sbk, stadsbyggnadskontoret"],
  ["Bygglov", "http://www.malmo.se/Medborgare/Bo--bygga/Bygga-nytt---bygga-till/Bygglov-marklov--rivningslov.html", "bygglov"],
  ["Översiktsplan", "http://www.malmo.se/Medborgare/Stadsplanering--trafik/Stadsplanering--visioner/Oversiktsplaner--strategier.html", "översiktsplan, öp"],
  ["Västra hamnen", "http://www.malmo.se/Medborgare/Stadsplanering--trafik/Stadsplanering--visioner/Utbyggnadsomraden/Vastra-Hamnen-.html", "västra hamnen, bo01"],
  ["Malmöfestivalen", "http://www.malmo.se/Medborgare/Kultur--noje/Festivaler--utomhusnojen/Malmofestivalen.html", "malmö festivalen"],
  ["Rosengård", "http://www.malmo.se/Kommun--politik/Stadsomraden/Oster.html", "rosengård"],
  ["Selma", "http://www.malmo.se/Kommun--politik/Sa-arbetar-vi-med.../Forskola-och-utbildning/Skolutveckling--Forskning/Centrum-for-Pedagogisk-Inspiration-CPI/Utlaning-SELMA.html", "selma"],
  ["Sofielundsskola", "http://www.malmo.se/Medborgare/Forskola--utbildning/Grundskola/Grundskolor/Sofielundsskolan.html", "sofielundsskolan"],
  ["Boka kulturbussen", "http://www.malmo.se/Medborgare/Kultur--noje/Barn--unga/Kultur-till-forskolor-och-skolor/Kulturbussen.html", "kulturbussen"],
  ["Serviceförvaltningen", "http://www.malmo.se/serviceforvaltningen", "serviceförvaltningen"],
  ["Förskola", "http://www.malmo.se/Medborgare/Forskola--utbildning/Forskola.html", "förskola, dagis"],
  ["Statistik", "http://www.malmo.se/statistik", "statistik"],
  ["Folkets park", "http://www.malmo.se/Medborgare/Kultur--noje/Festivaler--utomhusnojen/Folkets-park.html", "folkets park"],
  ["JobbMalmö", "http://www.malmo.se/Medborgare/Jobb--praktik/Lediga-jobb/Svart-att-fa-jobb/JobbMalmo.html", "jobbmalmö"],
  ["Miljöförvaltningen", "http://www.malmo.se/miljoforvaltningen", "miljöförvaltningen, mf"],
  ["Odlingslotter", "http://www.malmo.se/Medborgare/Idrott--fritid/Natur--friluftsliv/Kolonier/Odlingslotter.html", "odlingslotter"],
  ["Debiteringsenheten", "http://www.malmo.se/Kommun--politik/Om-oss/Forvaltningar--bolag/Serviceforvaltningen/Kommuntjanster.html", "debiteringsenheten"],
  ["Färdtjänst", "http://www.malmo.se/Medborgare/Omsorg-vard--stod/Fardtjanst--resor.html", "färdtjänst"],
  ["Överförmyndaren", "http://www.malmo.se/Medborgare/Social---familjefragor/Overformyndare.html", "överförmyndarförvaltningen, god man, gode man"],
  ["Förskoleförvaltningen", "http://www.malmo.se/Kommun--politik/Om-oss/Forvaltningar--bolag/Forskoleforvaltningen/", "förskoleförvaltningen"]
]
recommendations.each do |r|
  Recommendation.create!({
    name: r[0].strip,
    link: r[1].strip,
    terms: r[2].split(",").map do |t|
      Term.new(name: t)
    end
  })
end
