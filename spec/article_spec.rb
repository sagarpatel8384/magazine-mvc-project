require_relative 'spec_helper'
require 'pry'

describe Article do 

  let(:greta) {Journalist.new("Greta")}
  let(:saied) {Journalist.new("Saied")}
  let(:article1) {Article.new("How To Garden", "Gardening is best done outdoors in the sun.")}
  let(:article2) {Article.new("Ruby on Rails", "Ruby is an Object Oriented Language - super fun.")}
  let(:time) {Magazine.new("Time")}
  let(:nylon) {Magazine.new("Nylon")}
  let(:wired) {Magazine.new("Wired")}
  
    before do
      Magazine.all.clear
      time
    end

  describe '#initialize' do


    it 'initializes article with title and body' do
      expect(article1.title).to eq("How To Garden")
      expect(article2.body).to eq("Ruby is an Object Oriented Language - super fun.")
    end
  end

  describe '#assign_to_magazine' do

    it 'assigns a magazine to the article' do
      article1.assign_to_magazine("Time")
      expect(article1.magazine).to eq(time)
    end

    it 'assigns an array of articles to a magazine' do
      article1.assign_to_magazine("Time")
      expect(time.articles).to include(article1)
    end
  end


end