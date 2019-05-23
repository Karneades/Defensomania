require 'squib'

layouts = 'layout-back.yml'

Squib::Deck.new cards: 1, layout: layouts do

  rect layout: 'cut', fill_color: 'white'

  text str: "Activity", layout: 'illustration', color: 'black'
  text str: "Cyber Against Humanity", layout: 'credits', color: 'black'

  build :png do
      save_png prefix: 'back_activity_', dir: '../PNGs-to-print/'
  end

  pdf_name = 'CyberAgainstHumanity-1-card-per-sheet-activity-back.pdf'
  build :pdf do
      save_pdf file: pdf_name, dir: '../PDFs-to-print/' , sprue: 'drivethrucards_1up.yml'
  end

  build :test do
      save_png range: 0, sprue: 'drivethrucards_1up.yml'
  end

end
