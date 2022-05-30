#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

# Hungarian dates
class Hungarian < WikipediaDate
  REMAP = {
    'hivatalban' => 'Incumbent',
    'január'     => 'January',
    'február'    => 'February',
    'március'    => 'March',
    'április'    => 'April',
    'május'      => 'May',
    'június'     => 'June',
    'július'     => 'July',
    'augusztus'  => 'August',
    'szeptember' => 'September',
    'október'    => 'October',
    'november'   => 'November',
    'december'   => 'December',
  }.freeze

  def date_str
    super.gsub(/(\d{4})\. (\D+) (\d{1,2})\./, '\3 \2 \1')
  end

  def remap
    REMAP.merge(super)
  end
end

class OfficeholderList < OfficeholderListBase
  decorator RemoveReferences
  decorator UnspanAllTables
  decorator WikidataIdsDecorator::Links

  def header_column
    'hivatal'
  end

  class Officeholder < OfficeholderBase
    def columns
      %w[name start end].freeze
    end

    def date_class
      Hungarian
    end
  end
end

url = ARGV.first
puts EveryPoliticianScraper::ScraperData.new(url, klass: OfficeholderList).csv
