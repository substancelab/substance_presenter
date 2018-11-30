SubstancePresenter
==================

An easy to use presenter implementation


[![Build Status](https://travis-ci.com/substancelab/substance_presenter.svg?branch=master)](https://travis-ci.com/substancelab/substance_presenter)


Usage examples
--------------

Presenting a single model:

    presented_model = Substance::Presenter.present(model, view_context)

Presenting a collection:

    presented_collection = Substance::Presenter.present_collection(collection, view_context)

Note: a view context can be nil, if not needed

Writing your own presenter is really just a matter of subclassing:

    class MyOwnPresenter < Substance::Presenter
    end

Then you are ready to fill your presenter with methods!

License
-------

SubstancePresenter is licensed under the MIT license. See LICENSE for details.
