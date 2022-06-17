#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/comparison'

diff = EveryPoliticianScraper::DecoratedComparison.new('wikidata.csv', 'scraped.csv').diff
puts diff.sort_by { |r| [r.first, r.last.to_s] }.reverse.map(&:to_csv)
