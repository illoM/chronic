module Chronic
  module Locales
    EN = {
      :numerizer => {
        :direct_nums => [
          ['eleven', '11'],
          ['twelve', '12'],
          ['thirteen', '13'],
          ['fourteen', '14'],
          ['fifteen', '15'],
          ['sixteen', '16'],
          ['seventeen', '17'],
          ['eighteen', '18'],
          ['nineteen', '19'],
          ['ninteen', '19'], # Common mis-spelling
          ['zero', '0'],
          ['one', '1'],
          ['two', '2'],
          ['three', '3'],
          ['four(\W|$)', '4\1'],  # The weird regex is so that it matches four but not fourty
          ['five', '5'],
          ['six(\W|$)', '6\1'],
          ['seven(\W|$)', '7\1'],
          ['eight(\W|$)', '8\1'],
          ['nine(\W|$)', '9\1'],
          ['ten', '10'],
          ['\ba[\b^$]', '1'] # doesn't make sense for an 'a' at the end to be a 1
        ],
        :ordinals => [
          ['first', '1'],
          ['third', '3'],
          ['fourth', '4'],
          ['fifth', '5'],
          ['sixth', '6'],
          ['seventh', '7'],
          ['eighth', '8'],
          ['ninth', '9'],
          ['tenth', '10']
        ],
        :ten_prefixes => [
          ['twenty', 20],
          ['thirty', 30],
          ['forty', 40],
          ['fourty', 40], # Common mis-spelling
          ['fifty', 50],
          ['sixty', 60],
          ['seventy', 70],
          ['eighty', 80],
          ['ninety', 90]
        ],
        :big_prefixes => [
          ['hundred', 100],
          ['thousand', 1000],
          ['million', 1_000_000],
          ['billion', 1_000_000_000],
          ['trillion', 1_000_000_000_000],
        ],
      },

      :repeater => {
        :season_names => {
          /^springs?$/ => :spring,
          /^summers?$/ => :summer,
          /^(autumn)|(fall)s?$/ => :autumn,
          /^winters?$/ => :winter
        },
        :month_names => {
          /^jan\.?(uary)?$/ => :january,
          /^feb\.?(ruary)?$/ => :february,
          /^mar\.?(ch)?$/ => :march,
          /^apr\.?(il)?$/ => :april,
          /^may$/ => :may,
          /^jun\.?e?$/ => :june,
          /^jul\.?y?$/ => :july,
          /^aug\.?(ust)?$/ => :august,
          /^sep\.?(t\.?|tember)?$/ => :september,
          /^oct\.?(ober)?$/ => :october,
          /^nov\.?(ember)?$/ => :november,
          /^dec\.?(ember)?$/ => :december
        },
        :day_names => {
          /^m[ou]n(day)?$/ => :monday,
          /^t(ue|eu|oo|u|)s?(day)?$/ => :tuesday,
          /^we(d|dnes|nds|nns)(day)?$/ => :wednesday,
          /^th(u|ur|urs|ers)(day)?$/ => :thursday,
          /^fr[iy](day)?$/ => :friday,
          /^sat(t?[ue]rday)?$/ => :saturday,
          /^su[nm](day)?$/ => :sunday
        },
        :day_portions => {
          /^ams?$/ => :am,
          /^pms?$/ => :pm,
          /^mornings?$/ => :morning,
          /^afternoons?$/ => :afternoon,
          /^evenings?$/ => :evening,
          /^(night|nite)s?$/ => :night
        },
        :units => {
          /^years?$/ => :year,
          /^seasons?$/ => :season,
          /^months?$/ => :month,
          /^fortnights?$/ => :fortnight,
          /^weeks?$/ => :week,
          /^weekends?$/ => :weekend,
          /^(week|business)days?$/ => :weekday,
          /^days?$/ => :day,
          /^hrs?$/ => :hour,
          /^hours?$/ => :hour,
          /^mins?$/ => :minute,
          /^minutes?$/ => :minute,
          /^secs?$/ => :second,
          /^seconds?$/ => :second
        }
      },

      :pre_normalize => {
        :pre_numerize => [
          [/\./, ':'],
          [/['"]/, ''],
          [/,/, ' '],
          [/^second /, '2nd '],
          [/\bsecond (of|day|month|hour|minute|second)\b/, '2nd \1']
        ],
        :pos_numerize => [
          [/ \-(\d{4})\b/, ' tzminus\1'],
          [/([\/\-\,\@])/, ' \1 '],
          [/(?:^|\s)0(\d+:\d+\s*pm?\b)/, ' \1'],
          [/\btoday\b/, 'this day'],
          [/\btomm?orr?ow\b/, 'next day'],
          [/\byesterday\b/, 'last day'],
          [/\bnoon\b/, '12:00pm'],
          [/\bmidnight\b/, '24:00'],
          [/\bnow\b/, 'this second'],
          [/\b(?:ago|before(?: now)?)\b/, 'past'],
          [/\bthis (?:last|past)\b/, 'last'],
          [/\b(?:in|during) the (morning)\b/, '\1'],
          [/\b(?:in the|during the|at) (afternoon|evening|night)\b/, '\1'],
          [/\btonight\b/, 'this night'],
          [/\b\d+:?\d*[ap]\b/,'\0m'],
          [/(\d)([ap]m|oclock)\b/, '\1 \2'],
          [/\b(hence|after|from)\b/, 'future'],
          [/^\s?an? /i, '1 ']
        ]
      },

      :grabber => {
        /last/ => :last,
        /this/ => :this,
        /next/ => :next
      },

      :token => {
        :comma => /^,$/,
        :at => /^(at|@)$/,
        :in => /^in$/,
        :on => /^on$/
      }
    }
  end
end