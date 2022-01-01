## ExtModel

The full explanation about motivation/objective should be coming up soon as a medium post so I'll keep it straightforward here.

At work, I encountered a situation that was fairly interesting.

I need to interact with an external source of data in a fashion that's similar to how one usually interacts with a model.

I need to use it in views, forms and have a bunch of traditional model methods. All interacting with the external source.

During my research of how could I accomplish that, I came across [ActiveResource](https://github.com/rails/activeresource) which is cool but works with the REST functionality in mind and my specific use-case API is 100% not REST.

Eventually I ended up reading [ActiveModel](https://guides.rubyonrails.org/active_model_basics.html) documentation (that has just became such it's own thing with Rails 7) and it serves the use case perfectly.

This was a quick example just to understand if it would work as I wished, and it did (the [minimal](https://github.com/pCosta99/extmodel/tree/minimal) branch has the original point that I stopped at), that grew a bit more when I tried to create ActiveModel::Enum. I tried copying most of the logic from ActiveRecord::Enum but it's not trivial to go that way since there's a big difference between these two.

I managed to implement a half-decent working version that doesn't support some of the original functionality (eg. defaults and as good error handling) but it's gonna fit my needs.

Overall it was a success, and this left me with an interesting idea coming to mind. At a certain level, one could probably have ActiveRecord for an external source of data. Most of the concepts there *could* apply and bring something interesting to the table.

Something to explore eventually...
