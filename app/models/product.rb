class Product < ApplicationRecord
    searchkick text_middle: %i[name description]
end
