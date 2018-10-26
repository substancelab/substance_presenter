require 'substance_presenter'
require "spec_helper"

RSpec.describe Substance::Presenter do
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

  let(:object) do
    TestObject.new
  end

  let(:view_context) do
    Object.new
  end

  subject(:presented_object) do
    TestObjectPresenter.new(object, view_context)
  end

  it "decorates the object" do
    expect(subject.decorated_greeting).to eq("Hello from the presenter")
  end

  it "delegates unknown methods to the original object" do
    expect(subject.greeting).to eq("Hello from the object")
  end

  it "exposes the original object" do
    expect(subject.object).to eq(object)
  end

  it "exposes the original object even if decorating a presenter" do
    doubly_presented_object = TestObjectPresenter.new(
      presented_object,
      view_context
    )
    expect(doubly_presented_object.object).to_not be_a(Substance::Presenter)
  end

  it "exposes the view context" do
    expect(subject.view).to eq(view_context)
  end

  it "decorates all objects in a collection" do
    collection = [TestObject.new, TestObject.new]
    presented_collection = TestObjectPresenter.present_collection(
      collection,
      view_context
    )
    expect(
      presented_collection.map(&:decorated_greeting)
    ).to eq(
      ["Hello from the presenter", "Hello from the presenter"]
    )
  end

  describe ".present" do
    it "decorates the object" do
      presented = TestObjectPresenter.present(object, view_context)
      expect(presented).to be_a(TestObjectPresenter)
    end

    context "when called with a presented object" do
      it "doesn't redecorate" do
        doubly_presented = TestObjectPresenter.present(
          presented_object,
          view_context
        )
        expect(doubly_presented).to be_a(TestObjectPresenter)
        expect(doubly_presented.__getobj__).to_not be_a(TestObjectPresenter)
      end
    end
  end
end
