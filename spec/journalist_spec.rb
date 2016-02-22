require_relative 'spec_helper'
require 'pry'

describe Journalist do 

  let!(:greta) {Journalist.new("Greta")}
  let!(:saied) {Journalist.new("Saied")}
  let(:article1) {Article.new("How To Garden", "Gardening is best done outdoors in the sun.")}
  let(:article2) {Article.new("Ruby on Rails", "Ruby is an Object Oriented Language - super fun.")}
  let(:time) {Magazine.new("Time")}
  let(:nylon) {Magazine.new("Nylon")}
  let(:wired) {Magazine.new("Wired")}
  

  describe '#find_journalist_by_name' do

    it 'return an instance of jouranlist based on name given' do
      expect(Journalist.find_journalist_by_name("Saied")).to eq(saied)
    end

  end

  describe '#write_article_by_title' do

    it 'new article appears in the journalists articles array' do
      test = saied.write_article_by_title("Building a House", "Heres how to build a house")
      expect(saied.articles).to include(test)
    end

  end






    
end