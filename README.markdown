## VersionedTemplates ##

Ever need to keep multiple versions of templates around? Maybe for A/B testing? Or perhaps a fickle product
manager keeps flip-flopping on the layout of a page? This plugin allows you to "replace" a template with
another template programatically. An example will explain it best.

### Example ###

    class YourController < ApplicationController

      versioned_templates :index => :index_extra_wide

      def index
      end

      def new
      end
    end

Requests for `new` will render `new.html.erb` (or similar), while requests for `index` will ignore
`index.html.erb` and instead look for `index_extra_wide.html.erb`.

Copyright (c) 2009 Jonathan Julian, released under the MIT license
