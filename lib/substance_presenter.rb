# frozen_string_literal: true

$:.push File.expand_path("..", __FILE__)

require 'delegate'

module Substance
  # Wraps the object in a presenter, mainly for adding presentation methods,
  # that does not belong in the main object model
  class Presenter < ::SimpleDelegator
    attr_reader :view

    class << self
      # Returns true if object has been wrapped in a Presenter
      def decorated?(object)
        object.is_a?(Presenter)
      end

      # Wrap object in presenter with access to a view context
      def present(object, view)
        return object if decorated?(object)
        new(object, view)
      end

      # Wrap each object in presenter with access to a view context
      def present_collection(collection, view)
        collection.map do |item|
          present(item, view)
        end
      end
    end

    def initialize(object, view)
      super(object)
      @view = view
    end

    def object
      undecorated(__getobj__)
    end

    private

    def decorated?(object)
      self.class.decorated?(object)
    end

    def present_collection(collection, presenter)
      presenter.present_collection(collection, view)
    end

    def undecorated(potentially_decorated_object)
      if decorated?(potentially_decorated_object)
        potentially_decorated_object.object
      else
        potentially_decorated_object
      end
    end
  end
end
