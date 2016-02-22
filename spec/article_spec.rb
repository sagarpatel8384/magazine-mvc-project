require_relative 'spec_helper'
require 'pry'

describe Article do

  let(:greta) {Journalist.new(name: "Greta")}
  let(:saied) {Journalist.new(name: "Saied")}
  let(:article1) {Article.new(title: "How To Garden", body: "Gardening is best done outdoors in the sun.", magazine_id: nil)}
  let(:article2) {Article.new(title: "Ruby on Rails", body: "Ruby is an Object Oriented Language - super fun.", magazine_id: 2)}
  let(:time) {Magazine.new(name: "Time")}
  let(:nylon) {Magazine.new(name: "Nylon")}
  let(:wired) {Magazine.new(name: "Wired")}


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
    it 'assigns a magazine to the article and tests publish method' do
      nylon
      nylon.save
      article1
      article1.save

      x = JournalistsController.new
      x.publish(greta, article1, nylon)
      expect(article1.magazine_id).to eq(nylon.id)
    end


    # it 'test that an article has a Journalist' do
    #   saied
    #   article2
    #   saied.save
    #   article2.save
    #   journalist = article2.journalist

    #   expect(journalist.id).to eq(saied.id)
    # end
  end


end