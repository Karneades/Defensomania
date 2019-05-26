require 'squib'

activities = Squib.csv file: '../cards/activities.tsv', col_sep: "\t"
layouts = 'layout-front.yml'

Squib::Deck.new cards: activities['Phase'].size, layout: layouts do

  background color: :white

  text_color = :black

  text str: activities['Phase'], layout: 'title', color: text_color
  text str: activities['Activity'], layout: 'description', color: text_color
  text str: "Cyber Against Humanity", layout: 'credits', color: text_color

  svg file: activities['Phase'].map { |t|
      "icons/#{t.downcase}.svg"
  }, layout: 'illustration'

  build :png do
    save_png dir: '../PNGs-to-print/'
  end

  build :pdf1 do
      pdf_name = 'CyberAgainstHumanity-1-card-per-sheet-activity-front-with-bleed.pdf'
      save_pdf file: pdf_name, dir: '../PDFs-to-print', \
          sprue: 'sprue-1up-with-bleed.yml', trim_radius: 0
  end

  build :pdf6 do
    pdf_name = 'CyberAgainstHumanity-6-cards-per-sheet-activity-front-with-croplines-bleed.pdf'
    rect layout: 'cut', stroke_color: :black, radius: 0
    save_pdf file: pdf_name, dir: '../PDFs-to-print'
  end

  build :pdf9 do
    pdf_name = 'CyberAgainstHumanity-9-cards-per-sheet-activity-front-without-bleed.pdf'
    rect layout: 'cut', stroke_color: :black, radius: 0
    save_pdf file: pdf_name, dir: '../PDFs-to-print', \
        sprue: 'letter_poker_card_9up.yml', trim: '0.125in', trim_radius: 0
  end

  pdf_name = 'activity-front-test.pdf'
  build :pdf1test do
      rect layout: 'safe', stroke_color: :red
      rect layout: 'cut', stroke_color: :black, radius: 0
      save_pdf file: pdf_name, trim_radius: 0, sprue: 'sprue-1up-with-bleed.yml'
  end

  build :pngtest do
      rect layout: 'cut', stroke_color: :black, radius: 0
      rect layout: 'safe', stroke_color: :red
      save_png range: 0, sprue: 'sprue-1up-with-bleed.yml', trim_radius: 0
  end
end
