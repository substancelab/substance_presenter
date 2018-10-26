module Substance
  class Presenter
    module Rails
      module ViewHelper
        # Returns object wrapped in presenter.
        # If object is a collection each member
        # of the collection is wrapped and the collection is returned.
        #
        # Example
        #
        #    <%- @foo = present(@foo, FooPresenter) -%>
        #
        def present(object, presenter)
          if object.is_a?(Enumerable)
            presenter.present_collection(object, self)
          else
            presenter.present(object, self)
          end
        end
      end
    end
  end
end
