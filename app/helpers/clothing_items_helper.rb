module ClothingItemsHelper

  def purchase_date_estimate_options
    [
      ['This month', 0],
      ['Last month', 1],
      ['A few months ago', 3],
      ['About half a year ago', 6],
      ['Maybe a year ago?', 12],
      ['Who knows... it\'s been a while', 24]
    ]
  end
end
