require_relative 'spec_helper'
require 'pry'

describe Journalist do

  let(:greta) {Journalist.new(name: "Greta")}
  let(:saied) {Journalist.new(name: "Saied")}
  let(:article1) {Article.new(title: "How To Garden", body: "Gardening is best done outdoors in the sun.", magazine_id: 1, journalist_id: 1)}
  let(:article2) {Article.new(title: "Ruby on Rails", body: "Ruby is an Object Oriented Language - super fun.", magazine_id: 2, journalist_id: 2)}
  let(:time) {Magazine.new(name: "Time")}
  let(:nylon) {Magazine.new(name: "Nylon")}
  let(:wired) {Magazine.new(name: "Wired")}


  describe '#find_journalist_by_name' do

    it 'return an instance of jouranlist based on name given' do
      greta


      expect(article1.journalist_id).to eq(greta.save.id)
    end

  end

  describe '#write_article_by_title' do

    it 'new article appears in the journalists articles array' do
      test = saied.write_article_by_title("Building a House", "Heres how to build a house")
      expect(saied.articles).to include(test)
    end

  end







end