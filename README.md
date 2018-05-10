SubstancePresenter
==================

An easy to use presenter implementation


[![Build Status](https://travis-ci.org/substancelab/substance_presenter.svg?branch=master)](https://travis-ci.org/substancelab/substance_presenter)


Usage examples
--------------

Presenting a single model:

    presented_model = Substance::Presenter.present(model, view_context)

Presenting a collection:

    presented_collection = Substance::Presenter.present_collection(collection, view_context)

Note: a view context can be nil, if not needed

License
-------

SubstancePresenter is licensed under the MIT license. See LICENSE for details.
