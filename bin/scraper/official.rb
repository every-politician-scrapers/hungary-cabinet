#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'open-uri/cached'
require 'pry'

class MemberList
  # details for an individual member
  class Member < Scraped::HTML
    field :name do
      noko.css('.name').text.tidy
    end

    field :position do
      noko.css('.position').text.tidy
    end
  end

  # The page listing all the members
  class Members < Scraped::HTML
    field :members do
      member_container.map { |member| fragment(member => Member).to_h }
    end

    private

    def member_container
      noko.css('.minister')
    end
  end
end

url = 'https://kormany.hu/a-kormany-tagjai'
puts EveryPoliticianScraper::ScraperData.new(url).csv
