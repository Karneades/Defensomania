require 'squib'

worst = Squib.csv file: '../cards/worst.tsv', col_sep: "\t"
scenarios = Squib.csv file: '../cards/scenarios.tsv', col_sep: "\t"

all_cards_worst = worst
all_cards_worst['Phase'] += scenarios['Phase']
all_cards_worst['Activity'] += scenarios['Activity']

layouts = 'layout.yml'

# Calculate location in cards for each phase for showcase
cnt = 0
nr_prepare,nr_detect,nr_respond,nr_recover = -1, -1, -1, -1
nr_lessonslearned,nr_communication,nr_scenario = -1, -1, -1
all_cards_worst['Phase'].each do |phase|
    case phase
    when 'Prepare'
        unless nr_prepare > -1
            nr_prepare = cnt
        end
    when 'Detect'
        unless nr_detect > -1
            nr_detect = cnt
        end
    when 'Respond'
        unless nr_respond > -1
            nr_respond = cnt
        end
    when 'Recover'
        unless nr_recover > -1
            nr_recover = cnt
        end
    when 'Lessons Learned'
        unless nr_lessonslearned > -1
            nr_lessonslearned = cnt
        end
    when 'Communication'
        unless nr_communication > -1
            nr_communication = cnt
        end
    when 'Scenario'
        unless nr_scenario > -1
            nr_scenario = cnt
        end
    end
    cnt += 1
end
position_each_category = [nr_prepare,nr_detect,nr_respond,nr_recover,nr_lessonslearned,nr_communication,nr_scenario]

# generate card deck
Squib::Deck.new cards: all_cards_worst['Phase'].size, layout: layouts do

  ##
  ## Scenario Color Configuration
  ## Switch between black and white scenario cards.
  ##
  #scenario_color = 'white'
  scenario_color = 'black'

  background_color = all_cards_worst['Phase'].map { |t|
      if scenario_color == 'black' && t == "Scenario" then
          "black"
      else
          "white"
      end
  }
  background color: background_color

  text_color = all_cards_worst['Phase'].map { |t|
      if scenario_color == 'black' && t == "Scenario" then
          "white"
      else
          "black"
      end
  }
  text str: all_cards_worst['Phase'], layout: 'title', color: text_color
  text str: all_cards_worst['Activity'], layout: 'description', color: text_color
  text str: "Cyber Against Humanity", layout: 'credits', color: text_color

  svg file: all_cards_worst['Phase'].map { |t|
      if scenario_color == 'black' && t == "Scenario" then
          "icons/#{t.downcase}-white.svg"
      else
          "icons/#{t.downcase}.svg"
      end
  }, layout: 'illustration'

  build :png do
    save_png
  end

  pdf_name = 'CyberAgainstWorstHumanity.pdf'
  build :pdf do
    rect layout: 'cut'
    save_pdf file: pdf_name, dir: '../' #, sprue: 'a4_poker_card_8up.yml'
  end

  build :test do
    rect layout: 'cut'
    save_png range: 0
  end
end
