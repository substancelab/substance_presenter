# frozen_string_literal: true

require "substance/presenter"
require "substance/rails/view_helper"
require "spec_helper"

RSpec.describe Substance::Presenter::Rails::ViewHelper do
  describe "present" do
    class TestObject
      def greeting
        "Hello from the object"
      end
    end

    class TestObjectPresenter < Substance::Presenter
      def decorated_greeting
        "Hello from the presenter"
      end
    end

    class TestHelperClass
      include Substance::Presenter::Rails::ViewHelper
    end

    module TestHelperModule
      include Substance::Presenter::Rails::ViewHelper
      module_function :present
    end

    it "can be included in another class" do
      expect(TestHelperClass.new).to respond_to(:present)
    end

    it "can be included in another module" do
      expect(TestHelperModule).to respond_to(:present)
    end

    describe "#present" do
      subject { TestHelperModule.new }

      it "can present a collection" do
        presented_collection = TestHelperModule.present(
          [TestObject.new, TestObject.new],
          TestObjectPresenter
        )

        expect(
          presented_collection.all?(&:decorated_greeting)
        ).to be_truthy
      end

      it "can present a single object" do
        expect(
          TestHelperModule.present(
            TestObject.new,
            TestObjectPresenter
          )
        ).to respond_to(:decorated_greeting)
      end
    end
  end
end
